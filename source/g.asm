; *************************************************************************************
;
; Imogen disassembly
; by SteveF and TobyLobster, 2023
;
; *************************************************************************************

; *************************************************************************************
;
; Notes:
; ------
; The game has a core engine (file 'g') that deals with drawing sprites, running the toolbar,
; updating objects (including the player animations/state), object collision, loading levels,
; moving between rooms, the collision map, etc.
;
; Each level is loaded as a separate file from disk (or cassette) as needed, and unusually is mostly
; code with some sprite data tacked on the end. The level code takes over control from the engine
; while it is running. (See 'initialise_level_and_room' for the flow control details).
;
; Because there are 16 levels, each with about 4K of code plus data, Imogen is a big game with a
; total of around 58K of code plus 26K of compressed sprites.
;
; The levels are stored in files dataA to dataP, and an epilogue (dataQ) played when the game is
; completed. Each level holds 4 rooms, although this is not a restriction imposed by the engine.
; More or fewer rooms would equally be possible so long as they fit in memory.
;
; Sprite drawing:
;
; The sprite drawing is particularly feature rich and therefore complex. It can draw sprites with
; any pixel width and any height (1-255 pixels) at any pixel position on screen, which is clipped
; properly to the edges of the screen. It draws optionally with a mask. Sprites can also be
; drawn left-right reflected. They can have an offset whenever drawn, to aid with animations.
;
; Sprite data is stored in a compressed format, and drawn directly from the compressed data (not
; decompressed). See 'sprite_op' for details of the compression etc.
;
; While plotting the sprite, the code can also optionally remember the previous contents of the
; screen behind the masked sprite that's being drawn, into a masked compressed sprite area in
; memory. This is so the screen background can be restored later by drawing that sprite.
;
; Objects:
;
; There is support in the core game code for objects. Objects have a current sprite, a position,
; optionally a sprite area for erasing itself, a left-right direction, and a z-order. The game code
; can deal with redrawing multiple overlapping sprites by erasing the sprites on top of a moving
; sprite and redrawing just the sprites that need to be redrawn.
;
; Objects do not store animation data, nor have any physics associated. The individual levels are
; responsible for any animations required. The state machine for an object is usually based around
; the animations the object requires. There is no physics in the game. Gravity for example is
; simulated via animations.
;
; Cheat codes
; -----------
; As well as entering level passwords, there are other codes available:
;
; 'REVIEW-MODE':
;       Enables two more cheat codes:
;           'DUMP' to screen dump to an EPSON printer
;           'EPILOGUE' to show the game's ending
;
; 'TEST-MODE':
;       As above, but also enables:
;           * 'GIMME' to set all levels complete and adds the completion spell to the toolbar
;                     ready to complete the game.
;           * If the menu pointer is on one of the first four items, then SHIFT advances the
;             game one tick (for debugging animations?)
;           * ESCAPE returns to BASIC, but this only works if the appropriate bit is set in ICODATA
;             at startup and bank 12 has sideways RAM active and banked in at startup.
;           * Can enter one letter to skip to that level
;           * Can enter zero characters to restart the game
;           * On the EPILOGUE, holding the up arrow speeds up the scrolling of the text.
;             (noticeable when not much text is on-screen)
;
; 'DEBUG-MODE':
;        As all of the above, but also enables:
;           * The toolbar changes to a magenta background
;           * Entering each level automatically collects the objects required to complete the level
;           * In dataN ('PAVLOV-WAS-HERE'), pressing 'O' starts the dog salivating
;           * In dataK ('DRIPPING-STUFF'), pressing 'G' grows the plant and 'P' poisons it once grown
;
; 'MONO':
;           * Selects a colour scheme suitable for monochrome monitors
;
; 'COLOUR':
;           * Selects a colour scheme suitable for colour monitors (the default)
;
; 'QUIT':
;           * Restarts the game
;
; Memory Map (after the memory gets relocated at initialisation):
; ---------------------------------------------------------------
;
;   0100-012e: object data (object extents etc)
;   0131-0160: code to print transformations left
;   0400-0527: dialog box code
;   0530-07ff: cache of screen memory under the dialog box
;   0950-0ab5: data
;   0ab7-0aff: level utils code
;   0b11-0bec: special 'erase' sprite data (sprites 197, 198, 199: the contents of screen behind sprites)
;   0c00-0c60: collision map
;   1103-3ad4: main code
;   3ad5-4ad3: 'data*' file (level code/data) (it starts as initialisation code before being overwritten by a level)
;   4ad8-5bbf: SPRDATA file (main sprites) OR
;   53c0-578a: AUXCODE file (for password / cheat codes support)
;   5bc0-61ff: screen memory: toolbar
;   6200-7fff: screen memory: main game area
;
; Only during initialisation:
;
;   3c06-4225: initialisation code (which will get overwritten after initialisation by level data)
;   40ff-4318: ICODATA file (contains toolbar sprites only used once to render the toolbar)
;
; The AUXCODE Overlay
; -------------------
; When the user submits a password, the sprite memory is temporarily overwritten by the AUXCODE
; file which contains code to handle password and cheat code recognition (including a screendump
; facility for Epsom printers). Once finished, the SPRDATA is reloaded back into memory so the
; game can continue. Both sets of code/data don't need to reside in memory at the same time,
; so this is a memory saving system known as an overlay.
;
; *************************************************************************************

; Constants
buffer_sound_channel_0                          = 4
bytes_per_cell                                  = 8
bytes_per_character_row                         = 320
caps_mask                                       = 223
cells_per_character_row                         = 40
collision_map_length                            = 240
collision_map_none                              = 0
collision_map_out_of_bounds                     = 255
collision_map_rope                              = 2
collision_map_solid_rock                        = 3
collision_map_unknown                           = 1
colour_black                                    = 0
colour_blue                                     = 4
colour_cyan                                     = 6
colour_green                                    = 2
colour_magenta                                  = 5
colour_red                                      = 1
colour_white                                    = 7
colour_yellow                                   = 3
copy_mode_2x2                                   = 0
copy_mode_random16                              = 16
copy_mode_random2                               = 2
copy_mode_random32                              = 32
copy_mode_random4                               = 4
copy_mode_random64                              = 64
copy_mode_random8                               = 8
copy_mode_simple                                = 1
crtc_cursor_start                               = 10
crtc_interlace_delay                            = 8
crtc_screen_start_high                          = 12
crtc_screen_start_low                           = 13
crtc_vert_displayed                             = 6
crtc_vert_sync_pos                              = 7
exit_room_bottom                                = 2
exit_room_left                                  = 1
exit_room_right                                 = 4
exit_room_top                                   = 8
first_level_letter                              = 65
game_area_height_cells                          = 24
game_area_width_cells                           = 40
inkey_key_escape                                = 143
inkey_key_left                                  = 230
inkey_key_return                                = 182
inkey_key_right                                 = 134
inkey_key_shift                                 = 255
inkey_key_space                                 = 157
inkey_key_x                                     = 189
inkey_key_z                                     = 158
last_level_letter                               = 81
max_filename_len                                = 7
max_objects                                     = 11
menu_slot_count                                 = 17
num_levels                                      = 16
object_collided_ceiling                         = 8
object_collided_floor                           = 2
object_collided_left_wall                       = 1
object_collided_right_wall                      = 4
objectid_old_player                             = 11
objectid_old_player_accessory                   = 12
objectid_player                                 = 0
objectid_player_accessory                       = 1
opcode_clc                                      = 24
opcode_jmp                                      = 76
opcode_lda_imm                                  = 169
opcode_sec                                      = 56
osbyte_close_spool_exec                         = 119
osbyte_flush_buffer                             = 21
osbyte_flush_buffer_class                       = 15
osbyte_inkey                                    = 129
osbyte_opt                                      = 139
osbyte_read_vdu_status                          = 117
osbyte_read_write_escape_break_effect           = 200
osbyte_read_write_first_byte_break_intercept    = 247
osbyte_read_write_second_byte_break_intercept   = 248
osbyte_read_write_third_byte_break_intercept    = 249
osbyte_reset_soft_keys                          = 18
osbyte_select_adc_channels                      = 16
osbyte_set_cursor_editing                       = 4
osbyte_set_printer_ignore                       = 6
osbyte_tv                                       = 144
osbyte_vsync                                    = 19
osfile_load                                     = 255
osfile_read_catalogue_info                      = 5
osfile_save                                     = 0
osword_envelope                                 = 8
osword_read_char                                = 10
osword_sound                                    = 7
rows_per_cell                                   = 8
screen_width_in_pixels                          = 320
screen_width_minus_one                          = 39
sprite_op_flags_copy_screen                     = 1
sprite_op_flags_erase_to_bg_colour              = 2
sprite_op_flags_erase_to_fg_colour              = 4
sprite_op_flags_normal                          = 0
spriteid_ball                                   = 59
spriteid_brazier                                = 58
spriteid_cat1                                   = 27
spriteid_cat2                                   = 28
spriteid_cat_jump                               = 26
spriteid_cat_tail1                              = 18
spriteid_cat_tail2                              = 19
spriteid_cat_tail3                              = 20
spriteid_cat_tail4                              = 21
spriteid_cat_tail5                              = 22
spriteid_cat_tail6                              = 23
spriteid_cat_tail7                              = 24
spriteid_cat_tail8                              = 25
spriteid_cat_transform1                         = 16
spriteid_cat_transform2                         = 17
spriteid_cat_walk1                              = 12
spriteid_cat_walk2                              = 13
spriteid_cat_walk3                              = 14
spriteid_cat_walk4                              = 15
spriteid_circle                                 = 32
spriteid_corner_bottom_left                     = 45
spriteid_corner_bottom_right                    = 46
spriteid_corner_top_left                        = 44
spriteid_corner_top_right                       = 47
spriteid_diamond1                               = 39
spriteid_diamond2                               = 40
spriteid_diamond3                               = 41
spriteid_diamond4                               = 42
spriteid_diamond5                               = 43
spriteid_erase_player                           = 199
spriteid_erase_player_accessory                 = 198
spriteid_erase_sparkles                         = 197
spriteid_fingertip_tile_restoration             = 30
spriteid_fire1                                  = 60
spriteid_fire2                                  = 61
spriteid_fire3                                  = 62
spriteid_fire4                                  = 63
spriteid_fire5                                  = 64
spriteid_fire6                                  = 65
spriteid_fire7                                  = 66
spriteid_fire8                                  = 67
spriteid_icodata_box                            = 9
spriteid_icodata_cat                            = 5
spriteid_icodata_disc                           = 3
spriteid_icodata_info                           = 7
spriteid_icodata_monkey                         = 6
spriteid_icodata_password                       = 8
spriteid_icodata_sound                          = 2
spriteid_icodata_wizard                         = 4
spriteid_icon_background                        = 1
spriteid_menu_item_completion_spell             = 33
spriteid_monkey1                                = 78
spriteid_monkey2                                = 79
spriteid_monkey3                                = 80
spriteid_monkey4                                = 81
spriteid_monkey5                                = 82
spriteid_monkey_climb1                          = 83
spriteid_monkey_climb2                          = 84
spriteid_monkey_tail1                           = 70
spriteid_monkey_tail2                           = 71
spriteid_monkey_tail3                           = 72
spriteid_monkey_tail4                           = 73
spriteid_monkey_tail5                           = 74
spriteid_monkey_tail6                           = 75
spriteid_monkey_tail7                           = 76
spriteid_monkey_tail8                           = 77
spriteid_monkey_transform1                      = 68
spriteid_monkey_transform2                      = 69
spriteid_one_pixel_masked_out                   = 0
spriteid_one_pixel_set                          = 31
spriteid_pointer_hand                           = 29
spriteid_rope1                                  = 85
spriteid_rope2                                  = 86
spriteid_rope3                                  = 87
spriteid_rope4                                  = 88
spriteid_rope_end                               = 10
spriteid_rope_hook                              = 11
spriteid_sparkles1                              = 34
spriteid_sparkles2                              = 35
spriteid_sparkles3                              = 36
spriteid_sparkles4                              = 37
spriteid_sparkles5                              = 38
spriteid_wizard1                                = 48
spriteid_wizard2                                = 49
spriteid_wizard3                                = 50
spriteid_wizard4                                = 51
spriteid_wizard5                                = 52
spriteid_wizard7                                = 54
spriteid_wizard_hand                            = 55
spriteid_wizard_transform1                      = 56
spriteid_wizard_transform2                      = 57
spriteid_wizard_using_object                    = 53
vdu_bell                                        = 7
vdu_cr                                          = 13
vdu_define_character                            = 23
vdu_define_text_window                          = 28
vdu_delete                                      = 127
vdu_enable                                      = 6
vdu_goto_xy                                     = 31
vdu_left                                        = 8
vdu_lf                                          = 10
vdu_printer_off                                 = 3
vdu_set_graphics_colour                         = 18
vdu_set_mode                                    = 22
vdu_set_text_colour                             = 17

; Memory locations
error_code_on_brk                                   = $02
remember_stack_pointer                              = $03
which_dialog_is_active                              = $04
characters_entered                                  = $05
rnd0                                                = $06
rnd1                                                = $07
rnd2                                                = $08
rnd3                                                = $09
rnd4                                                = $0a
dest_sprite_id                                      = $14
sprite_op_flags                                     = $15
sprite_id                                           = $16
sprite_x_base_low                                   = $18
sprite_x_base_high                                  = $19
sprite_y_base_low                                   = $1a
sprite_y_base_high                                  = $1b
sprite_reflect_flag                                 = $1d
valid_direction_pending                             = $20
old_menu_index                                      = $25
auto_repeat_counter                                 = $26
left_right_repeat_direction                         = $27
left_right_direction                                = $28
new_menu_index                                      = $29
space_bar_press_pending                             = $2a
space_bar_pressed                                   = $2b
z_key_pressed_pending                               = $2c
x_key_pressed_pending                               = $2d
current_menu_index                                  = $2e
desired_room_index                                  = $30
current_level                                       = $31
currently_loaded_level                              = $37
bit_mask_for_random_number_limit                    = $39
temp_sprite_x_offset                                = $3a
temp_sprite_y_offset                                = $3b
width_in_cells                                      = $3c
height_in_cells                                     = $3d
value_to_write_to_collision_map                     = $3e
only_ever_written_to_with_zero                      = $3f
source_sprite_memory_low                            = $40
source_sprite_memory_high                           = $41
copy_mode                                           = $42
print_in_italics_flag                               = $43
default_collision_map_option                        = $44
eor_key                                             = $45
return_key_pressed_pending                          = $46
current_player_character                            = $48
temp_value                                          = $49
saved_x                                             = $4a
temp_coordinate                                     = $4a
height_counter                                      = $4b
l004b                                               = $4b
saved_y                                             = $4b
screen_base_address_high                            = $4c
new_player_character                                = $4d
previous_room_index                                 = $50
level_before_latest_level_and_room_initialisation   = $51
player_held_object_spriteid                         = $52
objectid_to_test                                    = $53
sprdata_ptr                                         = $54
temp_rope_length                                    = $56
temp_sprite_address_low                             = $58
temp_sprite_address_high                            = $59
temp_sprite_offset                                  = $5a
developer_mode_sideways_ram_is_set_up_flag          = $5b
displayed_transformations_remaining                 = $5c
initial_level_number_div4                           = $5f
backmost_object_index                               = $60
osword_read_character_block                         = $60
backmost_object_z_order                             = $61
num_active_objects                                  = $62
temp_active_object_index                            = $63
temp_object_index                                   = $64
remember_player_accessory_object_index              = $65
l0066                                               = $66
l0067                                               = $67
l0068                                               = $68
address1_low                                        = $70
animation_address_low                               = $70
cell_x                                              = $70
level_data_ptr_low                                  = $70
menu_item_to_use                                    = $70
object_left_low                                     = $70
object_y_delta                                      = $70
osfile_block_filename_low                           = $70
screen_address_low                                  = $70
src_sprite_address_low                              = $70
address1_high                                       = $71
animation_address_high                              = $71
cell_y                                              = $71
level_data_ptr_high                                 = $71
menu_has_changed_flag                               = $71
object_left_high                                    = $71
osfile_block_filename_high                          = $71
screen_address_high                                 = $71
src_sprite_address_high                             = $71
destination_address_low                             = $72
l0072                                               = $72
object_right_low                                    = $72
object_rope_low                                     = $72
osfile_block_load_address_low                       = $72
sprite_screen_address_low                           = $72
temp_sprite_list_low                                = $72
width_in_cells_to_write                             = $72
destination_address_high                            = $73
height_in_cells_to_write                            = $73
l0073                                               = $73
object_right_high                                   = $73
object_rope_high                                    = $73
osfile_block_load_address_mid1                      = $73
sprite_screen_address_high                          = $73
temp_sprite_list_high                               = $73
first_cell_in_row_screen_address_low                = $74
l0074                                               = $74
object_top_low                                      = $74
offset_within_byte                                  = $74
osfile_block_load_address_mid2                      = $74
sprite_x_pos_low                                    = $74
temp_spriteid                                       = $74
first_cell_in_row_screen_address_high               = $75
l0075                                               = $75
object_top_high                                     = $75
offset_within_collision_map                         = $75
osfile_block_load_address_high                      = $75
sprite_x_pos_high                                   = $75
cell_screen_address_low                             = $76
l0076                                               = $76
object_bottom_low                                   = $76
osfile_block_exec_address_low                       = $76
sprite_y_pos_low                                    = $76
cell_screen_address_high                            = $77
l0077                                               = $77
object_bottom_high                                  = $77
osfile_block_exec_address_mid1                      = $77
sprite_y_pos_high                                   = $77
l0078                                               = $78
object_left_cell_x                                  = $78
original_off_screen_address_low                     = $78
osfile_block_exec_address_mid2                      = $78
sprite_x_offset_within_byte                         = $78
byte_offset_within_sprite                           = $79
l0079                                               = $79
object_right_cell_x                                 = $79
original_off_screen_address_high                    = $79
osfile_block_exec_address_high                      = $79
l007a                                               = $7a
object_top_cell_y                                   = $7a
off_screen_address_low                              = $7a
osfile_block_start_address_low                      = $7a
temp_y                                              = $7a
l007b                                               = $7b
object_bottom_cell_y                                = $7b
off_screen_address_high                             = $7b
osfile_block_start_address_mid1                     = $7b
sprite_screen_address_for_column_low                = $7b
cell_x_plus_current_cell_within_row                 = $7c
l007c                                               = $7c
object_hit_wall_on_left_result_flag                 = $7c
osfile_block_start_address_mid2                     = $7c
sprite_screen_address_for_column_high               = $7c
current_row                                         = $7d
l007d                                               = $7d
object_hit_wall_on_right_result_flag                = $7d
osfile_block_start_address_high                     = $7d
sprite_data_byte                                    = $7d
dest_sprite_address_low                             = $7e
l007e                                               = $7e
object_hit_ceiling_result_flag                      = $7e
osfile_block_end_address_low                        = $7e
pattern_length_cycle_counter                        = $7e
dest_sprite_address_high                            = $7f
l007f                                               = $7f
object_hit_floor_result_flag                        = $7f
osfile_block_end_address_mid1                       = $7f
adjustment                                          = $80
cell_based_loop_counter                             = $80
erase_sprite_byte                                   = $80
l0080                                               = $80
object_height_in_cells                              = $80
object_width_in_cells                               = $80
osfile_block_end_address_mid2                       = $80
sprite_addr_low                                     = $80
l0081                                               = $81
osfile_block_end_address_high                       = $81
sprite_addr_high                                    = $81
sprite_width                                        = $81
sprite_bit                                          = $82
sprite_bit_mask                                     = $83
sprite_y_offset_within_character_row                = $84
sprite_cell_x_pos                                   = $85
amount_sprite_is_offscreen_x                        = $86
num_two_bit_offsets_within_byte                     = $87
vertical_sprite_position_is_valid_flag              = $88
romsel_copy                                         = $f4
interrupt_accumulator                               = $fc
brk_address_low                                     = $fd
active_objects_table                                = $0100
frontmost_objects_table                             = $010b
object_dealt_with_flag                              = $0116
l0121                                               = $0121
temp_object_left_cell                               = $0121
x_object_left_low                                   = $0121
l0122                                               = $0122
temp_object_right_cell                              = $0122
x_object_left_high                                  = $0122
x_object_right_low                                  = $0123
x_object_right_high                                 = $0124
x_object_top_low                                    = $0125
x_object_top_high                                   = $0126
x_object_bottom_low                                 = $0127
x_object_bottom_high                                = $0128
old_object_left_low                                 = $0129
old_object_left_high                                = $012a
old_object_right_low                                = $012b
old_object_right_high                               = $012c
old_object_left_cell                                = $012d
old_object_right_cell                               = $012e
brkv                                                = $0202
irq1v                                               = $0204
first_byte_break_intercept                          = $0287
cache_of_screen_memory_under_dialog                 = $0530
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
object_current_index_in_animation                   = $09d4
current_player_animation                            = $09df
save_game                                           = $09ea
save_game_checksum                                  = $09eb
current_transformations_remaining                   = $09ec
level_progress_table                                = $09ef
level_workspace                                     = $0a6f
level_ordering_table                                = $0a7f
string_input_buffer                                 = $0a90
tile_all_clear_pixels                               = $0aa1
tile_all_set_pixels                                 = $0aa9
old_brkv1                                           = $0ab1
old_brkv2                                           = $0ab3
old_irq1v                                           = $0ab5
area_to_copy_to_or_from_sideways_ram                = $0b00
sprite_erase_player                                 = $0b11
sprite_erase_player_accessory                       = $0b93
sprite_197                                          = $0bc5
level_specific_initialisation_ptr                   = $3ad7
level_specific_update_ptr                           = $3ad9
level_specific_password_ptr                         = $3adb
initial_room_index                                  = $3add
initial_room_index_cheat                            = $3ade
level_room_data_table                               = $3adf
auxcode                                             = $53c0
check_password                                      = $53c0
toolbar_screen_address                              = $58c0
start_of_screen_memory                              = $5bc0
game_area_screen_address                            = $6200
sideways_ram_be00                                   = $be00
sideways_ram_bf00                                   = $bf00
crtc_address_register                               = $fe00
crtc_address_write                                  = $fe01
video_ula_palette                                   = $fe21
romsel                                              = $fe30
system_via_t1c_l                                    = $fe44
system_via_t1c_h                                    = $fe45
system_via_t1l_l                                    = $fe46
system_via_t1l_h                                    = $fe47
system_via_t2c_l                                    = $fe48
system_via_t2c_h                                    = $fe49
system_via_acr                                      = $fe4b
system_via_ifr                                      = $fe4d
system_via_ier                                      = $fe4e
user_via_t1c_l                                      = $fe64
user_via_t1c_h                                      = $fe65
user_via_t2c_l                                      = $fe68
user_via_t2c_h                                      = $fe69
user_via_ier                                        = $fe6e
osfile                                              = $ffdd
oswrch                                              = $ffee
osword                                              = $fff1
osbyte                                              = $fff4
oscli                                               = $fff7

    * = $1234

pydis_start

!pseudopc $1103 {
; developer_flags
; 
; The 'developer flags byte' lives in the ICODATA file. When loaded, if bit 6 is set
; then the variable 'developer_flags' is set to this value (after clearing bit 6).
; 
; bit 0: (set in 'TEST-MODE' and 'DEBUG-MODE')
;   Enables:
;   * 'GIMME' to set all levels complete and adds the completion spell to the toolbar
;     ready to complete the game.
;   * If the menu pointer is on one of the first four items, then SHIFT advances the
;     game one tick (for debugging animations?)
;   * ESCAPE returns to BASIC, but this only works if the appropriate bit is set in
;     ICODATA at startup and bank 12 has sideways RAM active and banked in at startup.
;   * Can enter one letter to skip to that level
;   * Can enter zero characters to restart the game
;   * On the EPILOGUE, holding the up arrow speeds up the scrolling of the text.
;     (noticeable when not much text is on-screen)
; 
; bit 1: (set in 'REVIEW-MODE' and 'TEST-MODE' and 'DEBUG-MODE')
;   Enables two more cheat codes:
;   * 'DUMP' to screen dump to an EPSON printer
;   * 'EPILOGUE' to show the game's ending
; 
; bit 2: load ICODATA directly from track 39 on the disc, rather than a regular file.
;   (An option for copy protection presumably)
; bit 3: load game data from drive 2, not drive 0
; bit 4: unused
; bit 5: unused
; bit 6: load value from in ICODATA into developer_flags variable
; bit 7: (set in 'DEBUG-MODE')
;   Enables:
;   * The toolbar changes to a magenta background
;   * Entering a level automatically collects all objects needed to complete it
;   * In dataN ('PAVLOV-WAS-HERE'), pressing 'O' starts the dog salivating
;   * In dataK ('DRIPPING-STUFF'), pressing 'G' grows the plant, 'P' poisons once grown
developer_flags
    !byte 0                                                           ; 1234: 00          .   :1103[1]
timingA_counter_low
    !byte $47                                                         ; 1235: 47          G   :1104[1]
timingA_counter_high
    !byte $11                                                         ; 1236: 11          .   :1105[1]
timingB_counter_low
    !byte $0b                                                         ; 1237: 0b          .   :1106[1]
timingB_counter_high
    !byte $1d                                                         ; 1238: 1d          .   :1107[1]
timing_latch_low
    !byte $10                                                         ; 1239: 10          .   :1108[1]
timing_latch_high
    !byte $27                                                         ; 123a: 27          '   :1109[1]
display_initialised_flag
    !byte 0                                                           ; 123b: 00          .   :110a[1]
vertical_sync_amount_for_crtc_register
    !byte 0                                                           ; 123c: 00          .   :110b[1]

start_game
    jsr clear_most_of_save_game                                       ; 123d: 20 b7 0a     .. :110c[1]
    lda #$ff                                                          ; 1240: a9 ff       ..  :110f[1]
    sta current_level                                                 ; 1242: 85 31       .1  :1111[1]
    lda #osbyte_flush_buffer_class                                    ; 1244: a9 0f       ..  :1113[1]
    ldx #0                                                            ; 1246: a2 00       ..  :1115[1]
    jsr osbyte                                                        ; 1248: 20 f4 ff     .. :1117[1]   ; Flush all buffers (X=0)
; Initialise the number of remaining transformations to 150.
    lda #'0'                                                          ; 124b: a9 30       .0  :111a[1]
    sta current_transformations_remaining                             ; 124d: 8d ec 09    ... :111c[1]
    lda #'5'                                                          ; 1250: a9 35       .5  :111f[1]
    sta current_transformations_remaining+1                           ; 1252: 8d ed 09    ... :1121[1]
    lda #'1'                                                          ; 1255: a9 31       .1  :1124[1]
    sta current_transformations_remaining+2                           ; 1257: 8d ee 09    ... :1126[1]
    ldx #0                                                            ; 125a: a2 00       ..  :1129[1]
    ldy level_ordering_table                                          ; 125c: ac 7f 0a    ... :112b[1]
    cpy #'R'                                                          ; 125f: c0 52       .R  :112e[1]
    bne initialise_level_and_room                                     ; 1261: d0 0e       ..  :1130[1]
; choose a new starting level
    inc initial_level_number_div4                                     ; 1263: e6 5f       ._  :1132[1]
    lda initial_level_number_div4                                     ; 1265: a5 5f       ._  :1134[1]
    and #3                                                            ; 1267: 29 03       ).  :1136[1]
    asl                                                               ; 1269: 0a          .   :1138[1]
    asl                                                               ; 126a: 0a          .   :1139[1]
    adc #first_level_letter                                           ; 126b: 69 41       iA  :113a[1]
    tay                                                               ; 126d: a8          .   :113c[1]
    jsr convert_section_letter_to_level_filename_letter               ; 126e: 20 ef 0a     .. :113d[1]
; TODO: this is used by e.g. dataA
; *************************************************************************************
; 
; Initialise level and room
; 
; Loads the new level if needed, resets objects and other related variables, and jumps
; to level specific code to execute the room.
; 
; On Entry:
;     X is the room index
;     Y is the level number
; 
; The control flow during gameplay is as follows:
; 
; - 'initialise_level_and_room' performs common setup tasks, including:
;     - loading the level if needed
;     - calling level specific initialisation code ('level_specific_initialisation', as
;       found in the level header) - which is called on every room change.
;     - It finally transfers control to a room-specific subroutine within the
;       loaded level (at address 'level_room_data_table[room]+2' as found in the level
;       header). Let's call this the level room handler.
; 
; - The level room handler does the following:
;     - Room specific initialisation (including drawing the room).
;     - Calls the common 'start_room' routine. 'start_room' calls the
;       'level_specific_update' handler once. This update handler will be called
;       every game tick while in the level. On this specific call, a flag is set to
;       indicate it's being called for the first time in this room
;       ('update_room_first_update_flag').
;       Note the update handler is not room specific.
;     - Runs a game loop until the player leaves the current room. The game loop calls
;       the common 'game_update' routine to keep the game ticking. 'game_update'
;       (among other things) calls the 'level_specific_update' handler, allowing the
;       level to perform custom actions each tick.
;     - When the player leaves the current room, 'initialise_level_and_room' is called
;       to select the new room.
; 
; *************************************************************************************
initialise_level_and_room
    lda desired_room_index                                            ; 1271: a5 30       .0  :1140[1]
    sta previous_room_index                                           ; 1273: 85 50       .P  :1142[1]
    lda current_level                                                 ; 1275: a5 31       .1  :1144[1]
    sta level_before_latest_level_and_room_initialisation             ; 1277: 85 51       .Q  :1146[1]
    stx desired_room_index                                            ; 1279: 86 30       .0  :1148[1]
    sty current_level                                                 ; 127b: 84 31       .1  :114a[1]
    sty save_game                                                     ; 127d: 8c ea 09    ... :114c[1]
level_load_loop
    lda current_level                                                 ; 1280: a5 31       .1  :114f[1]
    cmp currently_loaded_level                                        ; 1282: c5 37       .7  :1151[1]
    beq level_already_loaded                                          ; 1284: f0 20       .   :1153[1]   ; if desired level is already loaded, skip forward
; load level in A
    sta data_filename_variable_letter                                 ; 1286: 8d 76 12    .v. :1155[1]
    lda #<data_filename                                               ; 1289: a9 72       .r  :1158[1]
    sta osfile_block_filename_low                                     ; 128b: 85 70       .p  :115a[1]
    lda #>data_filename                                               ; 128d: a9 12       ..  :115c[1]
    sta osfile_block_filename_high                                    ; 128f: 85 71       .q  :115e[1]
    ldx #<level_data                                                  ; 1291: a2 d5       ..  :1160[1]
    ldy #>level_data                                                  ; 1293: a0 3a       .:  :1162[1]
    lda #osfile_load                                                  ; 1295: a9 ff       ..  :1164[1]
    jsr osfile_wrapper                                                ; 1297: 20 dc 16     .. :1166[1]
    beq level_load_successful                                         ; 129a: f0 06       ..  :1169[1]   ; if load successful, then skip forward
    jsr prompt_user_to_insert_correct_disc                            ; 129c: 20 17 36     .6 :116b[1]
    jmp level_load_loop                                               ; 129f: 4c 4f 11    LO. :116e[1]

level_load_successful
    lda current_level                                                 ; 12a2: a5 31       .1  :1171[1]
    sta currently_loaded_level                                        ; 12a4: 85 37       .7  :1173[1]
level_already_loaded
    lda #osbyte_flush_buffer_class                                    ; 12a6: a9 0f       ..  :1175[1]
    ldx #0                                                            ; 12a8: a2 00       ..  :1177[1]
    jsr osbyte                                                        ; 12aa: 20 f4 ff     .. :1179[1]   ; Flush all buffers (X=0)
    lda #0                                                            ; 12ad: a9 00       ..  :117c[1]
    sta object_spriteid_old                                           ; 12af: 8d b3 09    ... :117e[1]
    sta object_spriteid_old + objectid_player_accessory               ; 12b2: 8d b4 09    ... :1181[1]
    ldy #2                                                            ; 12b5: a0 02       ..  :1184[1]
object_reset_loop
    lda #0                                                            ; 12b7: a9 00       ..  :1186[1]
    sta object_spriteid,y                                             ; 12b9: 99 a8 09    ... :1188[1]
    sta object_spriteid_old,y                                         ; 12bc: 99 b3 09    ... :118b[1]
    sta object_x_low,y                                                ; 12bf: 99 50 09    .P. :118e[1]
    sta object_x_high,y                                               ; 12c2: 99 66 09    .f. :1191[1]
    sta object_y_low,y                                                ; 12c5: 99 7c 09    .|. :1194[1]
    sta object_y_high,y                                               ; 12c8: 99 92 09    ... :1197[1]
    lda #1                                                            ; 12cb: a9 01       ..  :119a[1]
    sta object_direction,y                                            ; 12cd: 99 be 09    ... :119c[1]
    lda #$ff                                                          ; 12d0: a9 ff       ..  :119f[1]
    sta object_erase_type,y                                           ; 12d2: 99 ac 38    ..8 :11a1[1]
    sta object_z_order,y                                              ; 12d5: 99 c2 38    ..8 :11a4[1]
    iny                                                               ; 12d8: c8          .   :11a7[1]
    cpy #max_objects                                                  ; 12d9: c0 0b       ..  :11a8[1]
    bcc object_reset_loop                                             ; 12db: 90 da       ..  :11aa[1]
    lda current_level                                                 ; 12dd: a5 31       .1  :11ac[1]
    cmp level_before_latest_level_and_room_initialisation             ; 12df: c5 51       .Q  :11ae[1]
    beq same_level                                                    ; 12e1: f0 57       .W  :11b0[1]
    lda #0                                                            ; 12e3: a9 00       ..  :11b2[1]
    sta player_wall_collision_reaction_speed                          ; 12e5: 8d 33 24    .3$ :11b4[1]
    sta current_player_character                                      ; 12e8: 85 48       .H  :11b7[1]
    sta new_player_character                                          ; 12ea: 85 4d       .M  :11b9[1]
    sta object_spriteid                                               ; 12ec: 8d a8 09    ... :11bb[1]
    sta player_held_object_spriteid                                   ; 12ef: 85 52       .R  :11be[1]
    sta player_using_object_spriteid                                  ; 12f1: 8d b6 2e    ... :11c0[1]
    sta previous_player_using_object_spriteid                         ; 12f4: 8d b7 2e    ... :11c3[1]
    sta object_current_index_in_animation+1                           ; 12f7: 8d d5 09    ... :11c6[1]
    sta object_spriteid + objectid_player_accessory                   ; 12fa: 8d a9 09    ... :11c9[1]
    lda #4                                                            ; 12fd: a9 04       ..  :11cc[1]
    sta current_player_animation                                      ; 12ff: 8d df 09    ... :11ce[1]
    sta object_current_index_in_animation                             ; 1302: 8d d4 09    ... :11d1[1]
    lda #1                                                            ; 1305: a9 01       ..  :11d4[1]
    sta object_direction                                              ; 1307: 8d be 09    ... :11d6[1]
    lda #0                                                            ; 130a: a9 00       ..  :11d9[1]
    ldy #$0f                                                          ; 130c: a0 0f       ..  :11db[1]
clear_level_workspace_loop
    sta level_workspace,y                                             ; 130e: 99 6f 0a    .o. :11dd[1]
    dey                                                               ; 1311: 88          .   :11e0[1]
    bpl clear_level_workspace_loop                                    ; 1312: 10 fa       ..  :11e1[1]
    jsr set_player_position_for_new_room                              ; 1314: 20 78 12     x. :11e3[1]
    lda #<brk_handler                                                 ; 1317: a9 d3       ..  :11e6[1]
    sta old_brkv2                                                     ; 1319: 8d b3 0a    ... :11e8[1]
    lda #>brk_handler                                                 ; 131c: a9 16       ..  :11eb[1]
    sta old_brkv2+1                                                   ; 131e: 8d b4 0a    ... :11ed[1]
    lda display_initialised_flag                                      ; 1321: ad 0a 11    ... :11f0[1]
    bne display_initialised                                           ; 1324: d0 03       ..  :11f3[1]
    jsr initialise_display                                            ; 1326: 20 00 0c     .. :11f5[1]
; Blank the whole screen temporarily. The toolbar is blanked out here since we are
; moving to a different level (we need to redraw it to remove any level specific
; objects obtained). When moving between rooms on the same level the toolbar doesn't
; change, so remains visible.
display_initialised
    lda #colour_black                                                 ; 1329: a9 00       ..  :11f8[1]
    sta toolbar_colour                                                ; 132b: 8d 5e 17    .^. :11fa[1]
    sta gameplay_area_colour                                          ; 132e: 8d 60 17    .`. :11fd[1]
    jsr reset_menu_items                                              ; 1331: 20 80 29     .) :1200[1]
    jsr draw_toolbar                                                  ; 1334: 20 a1 29     .) :1203[1]
    jsr update_displayed_transformations_remaining                    ; 1337: 20 31 01     1. :1206[1]
same_level
    jsr set_toolbar_and_gameplay_area_colours                         ; 133a: 20 66 17     f. :1209[1]
    lda #0                                                            ; 133d: a9 00       ..  :120c[1]
    sta inhibit_monkey_climb_flag                                     ; 133f: 8d d7 31    ..1 :120e[1]
    ldx #3                                                            ; 1342: a2 03       ..  :1211[1]
clear_sound_priorities_loop1
    sta sound_priority_per_channel_table,x                            ; 1344: 9d 6f 39    .o9 :1213[1]
    dex                                                               ; 1347: ca          .   :1216[1]
    bpl clear_sound_priorities_loop1                                  ; 1348: 10 fa       ..  :1217[1]
    ldx level_specific_initialisation_ptr                             ; 134a: ae d7 3a    ..: :1219[1]
    ldy level_specific_initialisation_ptr + 1                         ; 134d: ac d8 3a    ..: :121c[1]
    jsr jmp_yx                                                        ; 1350: 20 66 19     f. :121f[1]
    lda current_level                                                 ; 1353: a5 31       .1  :1222[1]
    sec                                                               ; 1355: 38          8   :1224[1]
    sbc #first_level_letter                                           ; 1356: e9 41       .A  :1225[1]
    tax                                                               ; 1358: aa          .   :1227[1]
; level_progress_table has one entry per level:
; 
;     bits 0-2: current room number
;     bit 6: if clear then override regular room number with a cheat room number (there
; are two cheat room numbers!)
;     bit 7: set when the completion spell is obtained
; 
    lda level_progress_table,x                                        ; 1359: bd ef 09    ... :1228[1]
    and #$80                                                          ; 135c: 29 80       ).  :122b[1]
    beq skip_adding_completion_spell_to_toolbar                       ; 135e: f0 05       ..  :122d[1]
    lda #spriteid_menu_item_completion_spell                          ; 1360: a9 21       .!  :122f[1]
    jsr find_or_create_menu_slot_for_A                                ; 1362: 20 bd 2b     .+ :1231[1]
skip_adding_completion_spell_to_toolbar
    lda #collision_map_solid_rock                                     ; 1365: a9 03       ..  :1234[1]
    sta value_to_write_to_collision_map                               ; 1367: 85 3e       .>  :1236[1]
    lda #colour_black                                                 ; 1369: a9 00       ..  :1238[1]
    sta copy_mode                                                     ; 136b: 85 42       .B  :123a[1]
    sta gameplay_area_colour                                          ; 136d: 8d 60 17    .`. :123c[1]
    jsr draw_toolbar                                                  ; 1370: 20 a1 29     .) :123f[1]
    jsr clear_game_area                                               ; 1373: 20 f4 1d     .. :1242[1]
; which_dialog_is_active is non-zero when a dialog is active:
; 
;     1: save or load dialog, or section information dialog
;     2: choose filename dialog, or level letters dialog
;     3: which drive dialog
;     4: insert save disk dialog
;   255: blank dialog shown (to be overwritten by one of the above)
; 
    lda #0                                                            ; 1376: a9 00       ..  :1245[1]
    sta which_dialog_is_active                                        ; 1378: 85 04       ..  :1247[1]
    lda current_level                                                 ; 137a: a5 31       .1  :1249[1]
    sec                                                               ; 137c: 38          8   :124b[1]
    sbc #first_level_letter                                           ; 137d: e9 41       .A  :124c[1]
    tax                                                               ; 137f: aa          .   :124e[1]
; set current room number in level progress table
    lda level_progress_table,x                                        ; 1380: bd ef 09    ... :124f[1]
    and #%11111000                                                    ; 1383: 29 f8       ).  :1252[1]
    ora desired_room_index                                            ; 1385: 05 30       .0  :1254[1]
    ora #%01000000                                                    ; 1387: 09 40       .@  :1256[1]
    sta level_progress_table,x                                        ; 1389: 9d ef 09    ... :1258[1]
; set YX to the address of the room initialisation code, an address found in a table at
; start of the level data offset by twice the room number
    lda desired_room_index                                            ; 138c: a5 30       .0  :125b[1]
    asl                                                               ; 138e: 0a          .   :125d[1]
    tay                                                               ; 138f: a8          .   :125e[1]
    ldx level_room_data_table,y                                       ; 1390: be df 3a    ..: :125f[1]
    lda level_room_data_table + 1,y                                   ; 1393: b9 e0 3a    ..: :1262[1]
    tay                                                               ; 1396: a8          .   :1265[1]
; add two to the address in YX, to get past the two initial player position bytes
    txa                                                               ; 1397: 8a          .   :1266[1]
    clc                                                               ; 1398: 18          .   :1267[1]
    adc #2                                                            ; 1399: 69 02       i.  :1268[1]
    tax                                                               ; 139b: aa          .   :126a[1]
    tya                                                               ; 139c: 98          .   :126b[1]
    adc #0                                                            ; 139d: 69 00       i.  :126c[1]
    tay                                                               ; 139f: a8          .   :126e[1]
; jump to the level specific room handler
    jmp jmp_yx                                                        ; 13a0: 4c 66 19    Lf. :126f[1]

data_filename
    !text "data"                                                      ; 13a3: 64 61 74... dat :1272[1]
data_filename_variable_letter
    !text "A", $0d                                                    ; 13a7: 41 0d       A.  :1276[1]

set_player_position_for_new_room
    lda current_level                                                 ; 13a9: a5 31       .1  :1278[1]
    sec                                                               ; 13ab: 38          8   :127a[1]
    sbc #first_level_letter                                           ; 13ac: e9 41       .A  :127b[1]
    tax                                                               ; 13ae: aa          .   :127d[1]
    lda level_progress_table,x                                        ; 13af: bd ef 09    ... :127e[1]
    and #7                                                            ; 13b2: 29 07       ).  :1281[1]
    sta desired_room_index                                            ; 13b4: 85 30       .0  :1283[1]
; the level_progress_table doesn't ever set bit 6, so in reality the following branch
; is never taken.
    lda level_progress_table,x                                        ; 13b6: bd ef 09    ... :1285[1]
    and #$40 ; '@'                                                    ; 13b9: 29 40       )@  :1288[1]
    bne skip_developer_mode_code1                                     ; 13bb: d0 0f       ..  :128a[1]
; set initial room based on the value in the level header
    lda initial_room_index                                            ; 13bd: ad dd 3a    ..: :128c[1]
    sta desired_room_index                                            ; 13c0: 85 30       .0  :128f[1]
    lda developer_flags                                               ; 13c2: ad 03 11    ... :1291[1]
    bpl skip_developer_mode_code1                                     ; 13c5: 10 05       ..  :1294[1]
; this is a debugging aid, allowing the level header to temporarily set a different
; start room, as a particular room is being developed/debugged.
    lda initial_room_index_cheat                                      ; 13c7: ad de 3a    ..: :1296[1]
    sta desired_room_index                                            ; 13ca: 85 30       .0  :1299[1]
; get room data address
skip_developer_mode_code1
    lda desired_room_index                                            ; 13cc: a5 30       .0  :129b[1]
    asl                                                               ; 13ce: 0a          .   :129d[1]
    tay                                                               ; 13cf: a8          .   :129e[1]
    lda level_room_data_table,y                                       ; 13d0: b9 df 3a    ..: :129f[1]
    sta level_data_ptr_low                                            ; 13d3: 85 70       .p  :12a2[1]
    lda level_room_data_table + 1,y                                   ; 13d5: b9 e0 3a    ..: :12a4[1]
    sta level_data_ptr_high                                           ; 13d8: 85 71       .q  :12a7[1]
; read first byte into X and the second byte into Y. This is the player start position
; in cells
    ldy #0                                                            ; 13da: a0 00       ..  :12a9[1]
    lda (level_data_ptr_low),y                                        ; 13dc: b1 70       .p  :12ab[1]
    tax                                                               ; 13de: aa          .   :12ad[1]
    iny                                                               ; 13df: c8          .   :12ae[1]
    lda (level_data_ptr_low),y                                        ; 13e0: b1 70       .p  :12af[1]
    tay                                                               ; 13e2: a8          .   :12b1[1]
    lda #0                                                            ; 13e3: a9 00       ..  :12b2[1]
    sta temp_sprite_y_offset                                          ; 13e5: 85 3b       .;  :12b4[1]
; set player position
    lda #0                                                            ; 13e7: a9 00       ..  :12b6[1]
    jmp set_object_position_from_cell_xy                              ; 13e9: 4c 5d 1f    L]. :12b8[1]

; *************************************************************************************
; 
; Start room
; 
; *************************************************************************************
; TODO: This is called from level-specific machine code, e.g. see dataA.asm
start_room
    lda #$ff                                                          ; 13ec: a9 ff       ..  :12bb[1]
    sta update_room_first_update_flag                                 ; 13ee: 8d 2b 13    .+. :12bd[1]
; call room update for the first time
    ldx level_specific_update_ptr                                     ; 13f1: ae d9 3a    ..: :12c0[1]
    ldy level_specific_update_ptr + 1                                 ; 13f4: ac da 3a    ..: :12c3[1]
    jsr jmp_yx                                                        ; 13f7: 20 66 19     f. :12c6[1]
    lda #0                                                            ; 13fa: a9 00       ..  :12c9[1]
    sta update_room_first_update_flag                                 ; 13fc: 8d 2b 13    .+. :12cb[1]
    lda current_level                                                 ; 13ff: a5 31       .1  :12ce[1]
    cmp level_before_latest_level_and_room_initialisation             ; 1401: c5 51       .Q  :12d0[1]
    beq return1                                                       ; 1403: f0 05       ..  :12d2[1]
; start transformation to the wizard if it's a new level
    lda #spriteid_icodata_wizard                                      ; 1405: a9 04       ..  :12d4[1]
    jsr transform                                                     ; 1407: 20 37 23     7# :12d6[1]
return1
    rts                                                               ; 140a: 60          `   :12d9[1]

; TODO: This is called from level-specific machine code, e.g. see dataA.asm
; *************************************************************************************
; 
; Game Update
; 
; On Exit:
;     A: 0=player is still within game area
;        1=exit room left
;        2=exit room bottom
;        4=exit room right
;        8=exit room top
; 
; *************************************************************************************
game_update
    jsr update_objects                                                ; 140b: 20 d7 1f     .. :12da[1]
; set screen colours (if not already set)
    lda gameplay_area_colour                                          ; 140e: ad 60 17    .`. :12dd[1]
    bne wait_for_vsync_if_we_have_time                                ; 1411: d0 1a       ..  :12e0[1]
    lda pending_toolbar_colour                                        ; 1413: ad 5d 17    .]. :12e2[1]
    sta toolbar_colour                                                ; 1416: 8d 5e 17    .^. :12e5[1]
    lda pending_gameplay_area_colour                                  ; 1419: ad 5f 17    ._. :12e8[1]
    sta gameplay_area_colour                                          ; 141c: 8d 60 17    .`. :12eb[1]
; reset vsync counter
    jsr wait_for_vsync                                                ; 141f: 20 8c 17     .. :12ee[1]
    lda #0                                                            ; 1422: a9 00       ..  :12f1[1]
    sta vsync_counter                                                 ; 1424: 8d 8b 17    ... :12f3[1]
    jsr check_menu_keys                                               ; 1427: 20 8f 3a     .: :12f6[1]
    jsr read_player_movement_keys                                     ; 142a: 20 a2 3a     .: :12f9[1]
; wait for vsync (if we can) before making any changes to the menu, to avoid flicker
wait_for_vsync_if_we_have_time
    lda vsync_counter                                                 ; 142d: ad 8b 17    ... :12fc[1]
    cmp #4                                                            ; 1430: c9 04       ..  :12ff[1]
    bcs no_time_to_wait                                               ; 1432: b0 03       ..  :1301[1]
    jsr wait_for_vsync                                                ; 1434: 20 8c 17     .. :1303[1]
no_time_to_wait
    jsr update_menus                                                  ; 1437: 20 38 2a     8* :1306[1]
    jsr regulate_time_loop                                            ; 143a: 20 1e 13     .. :1309[1]
    jsr read_player_movement_keys                                     ; 143d: 20 a2 3a     .: :130c[1]
    jsr update_player                                                 ; 1440: 20 cd 22     ." :130f[1]
; update room
    ldx level_specific_update_ptr                                     ; 1443: ae d9 3a    ..: :1312[1]
    ldy level_specific_update_ptr + 1                                 ; 1446: ac da 3a    ..: :1315[1]
    jsr jmp_yx                                                        ; 1449: 20 66 19     f. :1318[1]
    jmp check_for_player_leaving_room                                 ; 144c: 4c c3 18    L.. :131b[1]

; wait until five vsyncs have elapsed before continuing
regulate_time_loop
    lda vsync_counter                                                 ; 144f: ad 8b 17    ... :131e[1]
    cmp #5                                                            ; 1452: c9 05       ..  :1321[1]
    bcc regulate_time_loop                                            ; 1454: 90 f9       ..  :1323[1]
    lda #0                                                            ; 1456: a9 00       ..  :1325[1]
    sta vsync_counter                                                 ; 1458: 8d 8b 17    ... :1327[1]
    rts                                                               ; 145b: 60          `   :132a[1]

update_room_first_update_flag
    !byte 0                                                           ; 145c: 00          .   :132b[1]

; *************************************************************************************
; 
; Get sprite address for sprite A
; 
;     Sprites 0-196: are stored in SPRDATA (or ICODATA if loaded (*))
;     Sprite 197: is stored at $0bc5
;     Sprite 198: is stored at $0b93
;     Sprite 199: is stored at $0b11
;     Sprites 200+: are stored in level data
; 
; (*) The first entry in the ICODATA file is actually not a sprite. It contains:
; 
;       1 byte: developer_flags
;       1 byte: 'R' indicating a random initial level
;     16 bytes: the order of level letters
; 
; See sprite_op for the format of sprites.
; 
; On Entry:
;     A: sprite id
; 
; On Exit:
;     YX: address of sprite
; 
; *************************************************************************************
get_address_of_sprite_a
    ldx #<sprite_erase_player                                         ; 145d: a2 11       ..  :132c[1]
    ldy #>sprite_erase_player                                         ; 145f: a0 0b       ..  :132e[1]
    cmp #spriteid_erase_player                                        ; 1461: c9 c7       ..  :1330[1]
    beq return2                                                       ; 1463: f0 42       .B  :1332[1]
    ldx #<sprite_erase_player_accessory                               ; 1465: a2 93       ..  :1334[1]
    ldy #>sprite_erase_player_accessory                               ; 1467: a0 0b       ..  :1336[1]
    cmp #spriteid_erase_player_accessory                              ; 1469: c9 c6       ..  :1338[1]
    beq return2                                                       ; 146b: f0 3a       .:  :133a[1]
    ldx #<sprite_197                                                  ; 146d: a2 c5       ..  :133c[1]
    ldy #>sprite_197                                                  ; 146f: a0 0b       ..  :133e[1]
    cmp #spriteid_erase_sparkles                                      ; 1471: c9 c5       ..  :1340[1]
    beq return2                                                       ; 1473: f0 32       .2  :1342[1]
    ldx sprdata_ptr                                                   ; 1475: a6 54       .T  :1344[1]
    ldy sprdata_ptr + 1                                               ; 1477: a4 55       .U  :1346[1]
    cmp #200                                                          ; 1479: c9 c8       ..  :1348[1]
    bcc get_sprite_address_from_sprite_table                          ; 147b: 90 11       ..  :134a[1]
    sbc #200                                                          ; 147d: e9 c8       ..  :134c[1]
; The first two bytes of the level data is the offset to the sprite table
    pha                                                               ; 147f: 48          H   :134e[1]   ; remember sprite number
    lda #<level_data                                                  ; 1480: a9 d5       ..  :134f[1]
    clc                                                               ; 1482: 18          .   :1351[1]
    adc level_data                                                    ; 1483: 6d d5 3a    m.: :1352[1]   ; add offset to sprite table (low)
    tax                                                               ; 1486: aa          .   :1355[1]
    lda #>level_data                                                  ; 1487: a9 3a       .:  :1356[1]
    adc level_data + 1                                                ; 1489: 6d d6 3a    m.: :1358[1]   ; add offset to sprite table (high)
    tay                                                               ; 148c: a8          .   :135b[1]
    pla                                                               ; 148d: 68          h   :135c[1]   ; recall sprite number
; The sprite table starts with a table of 16 bit addresses, one for each sprite.
; Look up the address of the sprite by reading this table.
; Set YX to point to the base of the sprite.
get_sprite_address_from_sprite_table
    stx temp_sprite_address_low                                       ; 148e: 86 58       .X  :135d[1]
    sty temp_sprite_address_high                                      ; 1490: 84 59       .Y  :135f[1]
    asl                                                               ; 1492: 0a          .   :1361[1]
    tay                                                               ; 1493: a8          .   :1362[1]
    lda temp_sprite_address_high                                      ; 1494: a5 59       .Y  :1363[1]
    sta temp_sprite_offset                                            ; 1496: 85 5a       .Z  :1365[1]
    adc #0                                                            ; 1498: 69 00       i.  :1367[1]
    sta temp_sprite_address_high                                      ; 149a: 85 59       .Y  :1369[1]
    lda (temp_sprite_address_low),y                                   ; 149c: b1 58       .X  :136b[1]
    adc temp_sprite_address_low                                       ; 149e: 65 58       eX  :136d[1]
    tax                                                               ; 14a0: aa          .   :136f[1]
    iny                                                               ; 14a1: c8          .   :1370[1]
    lda (temp_sprite_address_low),y                                   ; 14a2: b1 58       .X  :1371[1]
    adc temp_sprite_offset                                            ; 14a4: 65 5a       eZ  :1373[1]
    tay                                                               ; 14a6: a8          .   :1375[1]
return2
    rts                                                               ; 14a7: 60          `   :1376[1]

power_of_2_table
    !byte $01, $02, $04, $08, $10, $20, $40, $80                      ; 14a8: 01 02 04... ... :1377[1]

reset_sprite_flags_and_exit
    lda #sprite_op_flags_normal                                       ; 14b0: a9 00       ..  :137f[1]
    sta sprite_op_flags                                               ; 14b2: 85 15       ..  :1381[1]
    lda #1                                                            ; 14b4: a9 01       ..  :1383[1]
    sta sprite_reflect_flag                                           ; 14b6: 85 1d       ..  :1385[1]
    pla                                                               ; 14b8: 68          h   :1387[1]   ; recall A,X,Y
    tay                                                               ; 14b9: a8          .   :1388[1]
    pla                                                               ; 14ba: 68          h   :1389[1]
    tax                                                               ; 14bb: aa          .   :138a[1]
    pla                                                               ; 14bc: 68          h   :138b[1]
    rts                                                               ; 14bd: 60          `   :138c[1]

; *************************************************************************************
; 
; Sprite Plotting
; 
; Plots or erases a sprite, optionally with a mask, optionally reflected about a
; vertical axis. Sprites can be any pixel width and height, can be drawn at any pixel
; position (including partially offscreen), and have an offset in X and Y pixels
; whenever drawn, to help run animations.
; 
; Sprites are stored in a compressed format, as detailed below.
; 
; While plotting the sprite, the code can also optionally remember the previous
; contents of the screen behind the sprite that's being drawn into a compressed sprite
; area in memory (the 'destination sprite'). This is so the screen background can be
; restored later by drawing the destination sprite.
; 
; Conventionally, sprite characters are authored looking to the right.
; 
; On Entry:
;                  sprite_id: id of the sprite to plot
;     sprite_x_base_low/high: X coordinate of sprite to plot (pixels)
;     sprite_y_base_low/high: Y coordinate of sprite to plot (pixels)
; 
;            sprite_op_flags: These bits are mutually exclusive. If bit is set:
; 
;                             bit 0: also copy the screen into sprite 'dest_sprite_id'
;                             bit 1: erase the sprite from the screen (using mask)
;                             bit 2: write to the screen without a mask
;                             bits 3-7: unused
; 
;        sprite_reflect_flag: bit 7: draw sprite reflected ('looking left')
; 
; On Exit:
;     Preserves A,X,Y
; 
; Notes:
; 
; Sprites are stored after a sprite table that hold the two byte offset to the sprite
; data itself.
; Each sprite stores a four byte header, containing:
; 
;     <signed byte>   offset x to start drawing the sprite relative to sprite_x_base
;     <signed byte>   offset y to start drawing the sprite relative to sprite_y_base
;     <unsigned byte> width of sprite in pixels
;     <unsigned byte> height of sprite in pixels
; 
; Sprite pixels are then stored in the following bytes, starting with the bottom left
; pixel and moving up the sprite. Columns are stored from left to right.
; 
; Each pixel is encoded in two bits:
; 
;     00 - draw the background colour (colour 0)
;     01 - draw the foreground colour (colour 1)
;     10 - don't draw a pixel (it is a masked pixel)
;     11 - finish the current column and start the next column
; 
; The behaviour of '11' shows that this is a compression scheme, where columns can
; finish early if they have no set pixels at the top of the sprite.
; 
; *************************************************************************************
sprite_op
    pha                                                               ; 14be: 48          H   :138d[1]   ; remember A,X,Y
    txa                                                               ; 14bf: 8a          .   :138e[1]
    pha                                                               ; 14c0: 48          H   :138f[1]
    tya                                                               ; 14c1: 98          .   :1390[1]
    pha                                                               ; 14c2: 48          H   :1391[1]
    lda sprite_id                                                     ; 14c3: a5 16       ..  :1392[1]
    jsr get_address_of_sprite_a                                       ; 14c5: 20 2c 13     ,. :1394[1]
    stx src_sprite_address_low                                        ; 14c8: 86 70       .p  :1397[1]
    sty src_sprite_address_high                                       ; 14ca: 84 71       .q  :1399[1]
    lda sprite_op_flags                                               ; 14cc: a5 15       ..  :139b[1]
    and #sprite_op_flags_copy_screen                                  ; 14ce: 29 01       ).  :139d[1]
    beq skip_copying_sprite_header_to_destination_sprite              ; 14d0: f0 14       ..  :139f[1]   ; check flags to see if we are copying to another sprite
; get destination sprite address
    lda dest_sprite_id                                                ; 14d2: a5 14       ..  :13a1[1]
    jsr get_address_of_sprite_a                                       ; 14d4: 20 2c 13     ,. :13a3[1]
    stx dest_sprite_address_low                                       ; 14d7: 86 7e       .~  :13a6[1]
    sty dest_sprite_address_high                                      ; 14d9: 84 7f       ..  :13a8[1]
; copy the first four bytes from source sprite to destination sprite (the header)
    ldy #3                                                            ; 14db: a0 03       ..  :13aa[1]
copy_sprite_header_loop
    lda (src_sprite_address_low),y                                    ; 14dd: b1 70       .p  :13ac[1]
    sta (dest_sprite_address_low),y                                   ; 14df: 91 7e       .~  :13ae[1]
    dey                                                               ; 14e1: 88          .   :13b0[1]
    bpl copy_sprite_header_loop                                       ; 14e2: 10 f9       ..  :13b1[1]
    sty erase_sprite_byte                                             ; 14e4: 84 80       ..  :13b3[1]   ; Y=255
; add the x and y offset in the sprite header to the sprite position
skip_copying_sprite_header_to_destination_sprite
    ldy #0                                                            ; 14e6: a0 00       ..  :13b5[1]
    lda (src_sprite_address_low),y                                    ; 14e8: b1 70       .p  :13b7[1]   ; read byte 0 of sprite, a start x offset
    ldx sprite_reflect_flag                                           ; 14ea: a6 1d       ..  :13b9[1]
    bpl skip_inverting_x_offset                                       ; 14ec: 10 02       ..  :13bb[1]
    eor #$ff                                                          ; 14ee: 49 ff       I.  :13bd[1]
skip_inverting_x_offset
    ldx #0                                                            ; 14f0: a2 00       ..  :13bf[1]
    ora #0                                                            ; 14f2: 09 00       ..  :13c1[1]   ; set flags based on A
    bpl non_negative_offset_in_x                                      ; 14f4: 10 01       ..  :13c3[1]
    dex                                                               ; 14f6: ca          .   :13c5[1]
non_negative_offset_in_x
    clc                                                               ; 14f7: 18          .   :13c6[1]
    adc sprite_x_base_low                                             ; 14f8: 65 18       e.  :13c7[1]
    sta sprite_x_pos_low                                              ; 14fa: 85 74       .t  :13c9[1]
    txa                                                               ; 14fc: 8a          .   :13cb[1]
    adc sprite_x_base_high                                            ; 14fd: 65 19       e.  :13cc[1]
    sta sprite_x_pos_high                                             ; 14ff: 85 75       .u  :13ce[1]
    ldx #0                                                            ; 1501: a2 00       ..  :13d0[1]
    iny                                                               ; 1503: c8          .   :13d2[1]   ; Y=1
    lda (src_sprite_address_low),y                                    ; 1504: b1 70       .p  :13d3[1]   ; read byte 1 of sprite, a start y offset
    bpl non_negative_offset_in_y                                      ; 1506: 10 01       ..  :13d5[1]
    dex                                                               ; 1508: ca          .   :13d7[1]
non_negative_offset_in_y
    clc                                                               ; 1509: 18          .   :13d8[1]
    adc sprite_y_base_low                                             ; 150a: 65 1a       e.  :13d9[1]
    sta sprite_y_pos_low                                              ; 150c: 85 76       .v  :13db[1]
    txa                                                               ; 150e: 8a          .   :13dd[1]
    adc sprite_y_base_high                                            ; 150f: 65 1b       e.  :13de[1]
    sta sprite_y_pos_high                                             ; 1511: 85 77       .w  :13e0[1]
    iny                                                               ; 1513: c8          .   :13e2[1]   ; Y=2
    lda (src_sprite_address_low),y                                    ; 1514: b1 70       .p  :13e3[1]   ; read sprite width in pixels - 1
    sta sprite_width                                                  ; 1516: 85 81       ..  :13e5[1]
    ldy #4                                                            ; 1518: a0 04       ..  :13e7[1]
    lda (src_sprite_address_low),y                                    ; 151a: b1 70       .p  :13e9[1]   ; read the first byte of sprite data
    sta sprite_data_byte                                              ; 151c: 85 7d       .}  :13eb[1]
    sty byte_offset_within_sprite                                     ; 151e: 84 79       .y  :13ed[1]
    lda #4                                                            ; 1520: a9 04       ..  :13ef[1]
    sta num_two_bit_offsets_within_byte                               ; 1522: 85 87       ..  :13f1[1]
    jsr clamp_and_clip_x                                              ; 1524: 20 2f 16     /. :13f3[1]
; Take the Y position and round down to the previous character row
    lda sprite_y_pos_high                                             ; 1527: a5 77       .w  :13f6[1]
    sta sprite_screen_address_high                                    ; 1529: 85 73       .s  :13f8[1]
    lda sprite_y_pos_low                                              ; 152b: a5 76       .v  :13fa[1]
    and #$f8                                                          ; 152d: 29 f8       ).  :13fc[1]
; Then multiply by eight and store in ($72)
    asl                                                               ; 152f: 0a          .   :13fe[1]
    rol sprite_screen_address_high                                    ; 1530: 26 73       &s  :13ff[1]
    asl                                                               ; 1532: 0a          .   :1401[1]
    rol sprite_screen_address_high                                    ; 1533: 26 73       &s  :1402[1]
    asl                                                               ; 1535: 0a          .   :1404[1]
    rol sprite_screen_address_high                                    ; 1536: 26 73       &s  :1405[1]
    sta sprite_screen_address_low                                     ; 1538: 85 72       .r  :1407[1]
; Multiply by four
    ldx sprite_screen_address_high                                    ; 153a: a6 73       .s  :1409[1]
    asl                                                               ; 153c: 0a          .   :140b[1]
    rol sprite_screen_address_high                                    ; 153d: 26 73       &s  :140c[1]
    asl                                                               ; 153f: 0a          .   :140e[1]
    rol sprite_screen_address_high                                    ; 1540: 26 73       &s  :140f[1]
; Add eight times the x position as a character row
    lda sprite_x_pos_low                                              ; 1542: a5 74       .t  :1411[1]
    and #$f8                                                          ; 1544: 29 f8       ).  :1413[1]
    clc                                                               ; 1546: 18          .   :1415[1]
    adc sprite_screen_address_low                                     ; 1547: 65 72       er  :1416[1]
    sta sprite_screen_address_low                                     ; 1549: 85 72       .r  :1418[1]
; Add high byte including X
    sta sprite_screen_address_for_column_low                          ; 154b: 85 7b       .{  :141a[1]
    txa                                                               ; 154d: 8a          .   :141c[1]
    adc sprite_screen_address_high                                    ; 154e: 65 73       es  :141d[1]
    clc                                                               ; 1550: 18          .   :141f[1]
    adc sprite_x_pos_high                                             ; 1551: 65 75       eu  :1420[1]
    bpl not_out_of_range                                              ; 1553: 10 03       ..  :1422[1]
    jmp reset_sprite_flags_and_exit                                   ; 1555: 4c 7f 13    L.. :1424[1]

not_out_of_range
    clc                                                               ; 1558: 18          .   :1427[1]
    adc screen_base_address_high                                      ; 1559: 65 4c       eL  :1428[1]
    sta sprite_screen_address_high                                    ; 155b: 85 73       .s  :142a[1]
    sta sprite_screen_address_for_column_high                         ; 155d: 85 7c       .|  :142c[1]
; set Y to the horizontal offset within byte (0-7) of the sprite X position
    lda sprite_x_pos_low                                              ; 155f: a5 74       .t  :142e[1]
    and #7                                                            ; 1561: 29 07       ).  :1430[1]
    eor #7                                                            ; 1563: 49 07       I.  :1432[1]
    tay                                                               ; 1565: a8          .   :1434[1]
; set the vertical offset within a character row (0-7) of the sprite Y position
    lda sprite_y_pos_low                                              ; 1566: a5 76       .v  :1435[1]
    and #7                                                            ; 1568: 29 07       ).  :1437[1]
    sta sprite_y_offset_within_character_row                          ; 156a: 85 84       ..  :1439[1]
; load X and check flags to see if we are copying the mask to a destination sprite
    ldx num_two_bit_offsets_within_byte                               ; 156c: a6 87       ..  :143b[1]
    lda sprite_op_flags                                               ; 156e: a5 15       ..  :143d[1]
    and #sprite_op_flags_copy_screen                                  ; 1570: 29 01       ).  :143f[1]
    beq sprite_op_without_copying_mask                                ; 1572: f0 03       ..  :1441[1]
    jmp draw_sprite                                                   ; 1574: 4c 0c 16    L.. :1443[1]

sprite_op_without_copying_mask
    lda sprite_op_flags                                               ; 1577: a5 15       ..  :1446[1]
    and #sprite_op_flags_erase_to_fg_colour | sprite_op_flags_erase_to_bg_colour; 1579: 29 06       ).  :1448[1]
    beq skip3                                                         ; 157b: f0 22       ."  :144a[1]
    and #sprite_op_flags_erase_to_fg_colour                           ; 157d: 29 04       ).  :144c[1]
    bne erase_sprite_to_fg_colour                                     ; 157f: d0 16       ..  :144e[1]
; Bit 1 of sprite_op_flags is set (but not bit 2).
; This erases the sprite from the screen, setting pixels to the background colour.
; This self-modifies code
    lda #opcode_clc                                                   ; 1581: a9 18       ..  :1450[1]
    sta smc_sprite_opcode                                             ; 1583: 8d 86 14    ... :1452[1]
; Write JMP and_byte_with_mask_and_write_to_screen2
    lda #opcode_jmp                                                   ; 1586: a9 4c       .L  :1455[1]
    sta smc_sprite_opcode+1                                           ; 1588: 8d 87 14    ... :1457[1]
    lda #<and_byte_with_mask_and_write_to_screen2                     ; 158b: a9 98       ..  :145a[1]
    sta smc_sprite_opcode+2                                           ; 158d: 8d 88 14    ... :145c[1]
    lda #>and_byte_with_mask_and_write_to_screen2                     ; 1590: a9 14       ..  :145f[1]
    sta smc_sprite_opcode+3                                           ; 1592: 8d 89 14    ... :1461[1]
    bne skip3                                                         ; 1595: d0 08       ..  :1464[1]   ; ALWAYS branch

; Write 'SEC; SEC'
erase_sprite_to_fg_colour
    lda #opcode_sec                                                   ; 1597: a9 38       .8  :1466[1]
    sta smc_sprite_opcode                                             ; 1599: 8d 86 14    ... :1468[1]
    sta smc_sprite_opcode+1                                           ; 159c: 8d 87 14    ... :146b[1]
skip3
    jmp draw_sprite2                                                  ; 159f: 4c 17 15    L.. :146e[1]

; *************************************************************************************
; 
; Regular sprite routines
; 
; *************************************************************************************
out_of_bounds_vertically2
    asl sprite_data_byte                                              ; 15a2: 06 7d       .}  :1471[1]
    clc                                                               ; 15a4: 18          .   :1473[1]
    jmp move_up_to_next_pixel_row2                                    ; 15a5: 4c 9c 14    L.. :1474[1]

record_that_we_are_out_of_screen_range_vertically2
    lda #0                                                            ; 15a8: a9 00       ..  :1477[1]
    sta vertical_sprite_position_is_valid_flag                        ; 15aa: 85 88       ..  :1479[1]
    jmp y_coordinate_is_within_character_row2                         ; 15ac: 4c b7 14    L.. :147b[1]

write_one_pixel_to_the_screen2
    lda vertical_sprite_position_is_valid_flag                        ; 15af: a5 88       ..  :147e[1]
    beq out_of_bounds_vertically2                                     ; 15b1: f0 ef       ..  :1480[1]
    lda (sprite_screen_address_low),y                                 ; 15b3: b1 72       .r  :1482[1]
    asl sprite_data_byte                                              ; 15b5: 06 7d       .}  :1484[1]
smc_sprite_opcode
    bcc and_byte_with_mask_and_write_to_screen2                       ; 15b7: 90 10       ..  :1486[1]
    ora sprite_bit                                                    ; 15b9: 05 82       ..  :1488[1]
    sta (sprite_screen_address_low),y                                 ; 15bb: 91 72       .r  :148a[1]
    dey                                                               ; 15bd: 88          .   :148c[1]
    bpl y_coordinate_is_within_character_row2                         ; 15be: 10 28       .(  :148d[1]
    ldy #7                                                            ; 15c0: a0 07       ..  :148f[1]
    lda sprite_screen_address_low                                     ; 15c2: a5 72       .r  :1491[1]
    sbc #$40 ; '@'                                                    ; 15c4: e9 40       .@  :1493[1]
    jmp move_up_to_previous_character_row2                            ; 15c6: 4c a5 14    L.. :1495[1]

and_byte_with_mask_and_write_to_screen2
    and sprite_bit_mask                                               ; 15c9: 25 83       %.  :1498[1]
    sta (sprite_screen_address_low),y                                 ; 15cb: 91 72       .r  :149a[1]
move_up_to_next_pixel_row2
    dey                                                               ; 15cd: 88          .   :149c[1]
    bpl y_coordinate_is_within_character_row2                         ; 15ce: 10 18       ..  :149d[1]
    ldy #7                                                            ; 15d0: a0 07       ..  :149f[1]
    lda sprite_screen_address_low                                     ; 15d2: a5 72       .r  :14a1[1]
    sbc #$3f ; '?'                                                    ; 15d4: e9 3f       .?  :14a3[1]
move_up_to_previous_character_row2
    sta sprite_screen_address_low                                     ; 15d6: 85 72       .r  :14a5[1]
    lda sprite_screen_address_high                                    ; 15d8: a5 73       .s  :14a7[1]
    sbc #1                                                            ; 15da: e9 01       ..  :14a9[1]
    sta sprite_screen_address_high                                    ; 15dc: 85 73       .s  :14ab[1]
check_within_vertical_range2
    sta vertical_sprite_position_is_valid_flag                        ; 15de: 85 88       ..  :14ad[1]
    cmp #$80                                                          ; 15e0: c9 80       ..  :14af[1]
    bcs record_that_we_are_out_of_screen_range_vertically2            ; 15e2: b0 c4       ..  :14b1[1]
    cmp screen_base_address_high                                      ; 15e4: c5 4c       .L  :14b3[1]
    bcc record_that_we_are_out_of_screen_range_vertically2            ; 15e6: 90 c0       ..  :14b5[1]
y_coordinate_is_within_character_row2
    dex                                                               ; 15e8: ca          .   :14b7[1]
    bpl byte_not_finished_yet2                                        ; 15e9: 10 0e       ..  :14b8[1]
    sty temp_y                                                        ; 15eb: 84 7a       .z  :14ba[1]
    inc byte_offset_within_sprite                                     ; 15ed: e6 79       .y  :14bc[1]
    ldy byte_offset_within_sprite                                     ; 15ef: a4 79       .y  :14be[1]
    lda (src_sprite_address_low),y                                    ; 15f1: b1 70       .p  :14c0[1]
    sta sprite_data_byte                                              ; 15f3: 85 7d       .}  :14c2[1]
    ldx #3                                                            ; 15f5: a2 03       ..  :14c4[1]
    ldy temp_y                                                        ; 15f7: a4 7a       .z  :14c6[1]
byte_not_finished_yet2
    asl sprite_data_byte                                              ; 15f9: 06 7d       .}  :14c8[1]
    bcc write_one_pixel_to_the_screen2                                ; 15fb: 90 b2       ..  :14ca[1]
    asl sprite_data_byte                                              ; 15fd: 06 7d       .}  :14cc[1]
    bcc move_up_to_next_pixel_row2                                    ; 15ff: 90 cc       ..  :14ce[1]
    dec sprite_width                                                  ; 1601: c6 81       ..  :14d0[1]
    beq finish_off_sprite2                                            ; 1603: f0 55       .U  :14d2[1]
    lda sprite_screen_address_for_column_high                         ; 1605: a5 7c       .|  :14d4[1]
    sta sprite_screen_address_high                                    ; 1607: 85 73       .s  :14d6[1]
    lda sprite_screen_address_for_column_low                          ; 1609: a5 7b       .{  :14d8[1]
    sta sprite_screen_address_low                                     ; 160b: 85 72       .r  :14da[1]
    ldy sprite_reflect_flag                                           ; 160d: a4 1d       ..  :14dc[1]
    bmi move_to_next_column_while_rendering_reflected_about_y_axis2   ; 160f: 30 1e       0.  :14de[1]
    ldy sprite_x_offset_within_byte                                   ; 1611: a4 78       .x  :14e0[1]
    dey                                                               ; 1613: 88          .   :14e2[1]
    bpl draw_sprite2                                                  ; 1614: 10 32       .2  :14e3[1]
    inc sprite_cell_x_pos                                             ; 1616: e6 85       ..  :14e5[1]
    ldy sprite_cell_x_pos                                             ; 1618: a4 85       ..  :14e7[1]
    cpy #cells_per_character_row                                      ; 161a: c0 28       .(  :14e9[1]
    bcs finish_off_sprite2                                            ; 161c: b0 3c       .<  :14eb[1]
    ldy #7                                                            ; 161e: a0 07       ..  :14ed[1]
    adc #8                                                            ; 1620: 69 08       i.  :14ef[1]
    sta sprite_screen_address_for_column_low                          ; 1622: 85 7b       .{  :14f1[1]
    sta sprite_screen_address_low                                     ; 1624: 85 72       .r  :14f3[1]
    bcc draw_sprite2                                                  ; 1626: 90 20       .   :14f5[1]
    inc sprite_screen_address_for_column_high                         ; 1628: e6 7c       .|  :14f7[1]
    inc sprite_screen_address_high                                    ; 162a: e6 73       .s  :14f9[1]
    jmp draw_sprite2                                                  ; 162c: 4c 17 15    L.. :14fb[1]

move_to_next_column_while_rendering_reflected_about_y_axis2
    ldy sprite_x_offset_within_byte                                   ; 162f: a4 78       .x  :14fe[1]
    iny                                                               ; 1631: c8          .   :1500[1]
    cpy #8                                                            ; 1632: c0 08       ..  :1501[1]
    bcc draw_sprite2                                                  ; 1634: 90 12       ..  :1503[1]
    dec sprite_cell_x_pos                                             ; 1636: c6 85       ..  :1505[1]
    bmi finish_off_sprite2                                            ; 1638: 30 20       0   :1507[1]
    ldy #0                                                            ; 163a: a0 00       ..  :1509[1]
    sbc #8                                                            ; 163c: e9 08       ..  :150b[1]
    sta sprite_screen_address_for_column_low                          ; 163e: 85 7b       .{  :150d[1]
    sta sprite_screen_address_low                                     ; 1640: 85 72       .r  :150f[1]
    bcs draw_sprite2                                                  ; 1642: b0 04       ..  :1511[1]
    dec sprite_screen_address_for_column_high                         ; 1644: c6 7c       .|  :1513[1]
    dec sprite_screen_address_high                                    ; 1646: c6 73       .s  :1515[1]
draw_sprite2
    sty sprite_x_offset_within_byte                                   ; 1648: 84 78       .x  :1517[1]
    lda power_of_2_table,y                                            ; 164a: b9 77 13    .w. :1519[1]
    sta sprite_bit                                                    ; 164d: 85 82       ..  :151c[1]
    eor #$ff                                                          ; 164f: 49 ff       I.  :151e[1]
    sta sprite_bit_mask                                               ; 1651: 85 83       ..  :1520[1]
    ldy sprite_y_offset_within_character_row                          ; 1653: a4 84       ..  :1522[1]
    lda sprite_screen_address_high                                    ; 1655: a5 73       .s  :1524[1]
    jmp check_within_vertical_range2                                  ; 1657: 4c ad 14    L.. :1526[1]

finish_off_sprite2
    lda #$90                                                          ; 165a: a9 90       ..  :1529[1]   ; restore the original three bytes of code (self-modifying)
    sta smc_sprite_opcode                                             ; 165c: 8d 86 14    ... :152b[1]   ; 90 10='bcc and_byte_with_mask_and_write_to_screen2'
    lda #$10                                                          ; 165f: a9 10       ..  :152e[1]
    sta smc_sprite_opcode+1                                           ; 1661: 8d 87 14    ... :1530[1]
    lda #5                                                            ; 1664: a9 05       ..  :1533[1]   ; 05 82='ora sprite_bit'
    sta smc_sprite_opcode+2                                           ; 1666: 8d 88 14    ... :1535[1]
    lda #$82                                                          ; 1669: a9 82       ..  :1538[1]
    sta smc_sprite_opcode+3                                           ; 166b: 8d 89 14    ... :153a[1]
    jmp reset_sprite_flags_and_exit                                   ; 166e: 4c 7f 13    L.. :153d[1]

; *************************************************************************************
; 
; Sprite routines that also copy the mask to a destination sprite (similar to code
; above)
; 
; *************************************************************************************
out_of_bounds_vertically
    asl sprite_data_byte                                              ; 1671: 06 7d       .}  :1540[1]
; shift '10' pair of bits into the 'erase' byte, which means 'don't draw' the pixel
; when erasing
    sec                                                               ; 1673: 38          8   :1542[1]
    rol erase_sprite_byte                                             ; 1674: 26 80       &.  :1543[1]
    asl erase_sprite_byte                                             ; 1676: 06 80       ..  :1545[1]
    jmp move_up_to_next_pixel_row                                     ; 1678: 4c 68 15    Lh. :1547[1]

record_that_we_are_out_of_screen_range_vertically
    lda #0                                                            ; 167b: a9 00       ..  :154a[1]
    sta vertical_sprite_position_is_valid_flag                        ; 167d: 85 88       ..  :154c[1]
    jmp y_coordinate_is_within_character_row                          ; 167f: 4c 93 15    L.. :154e[1]

write_one_pixel_to_the_screen
    lda vertical_sprite_position_is_valid_flag                        ; 1682: a5 88       ..  :1551[1]
    beq out_of_bounds_vertically                                      ; 1684: f0 eb       ..  :1553[1]
; shift a 0 bit into the 'erase' byte, the first of a pair of bits: 00=draw bg colour,
; 01=draw fg colour. This is used to erase the sprite. Carry is set, since the initial
; value of the 'erase' byte is $ff
    asl erase_sprite_byte                                             ; 1686: 06 80       ..  :1555[1]
; read byte from screen
    lda (sprite_screen_address_low),y                                 ; 1688: b1 72       .r  :1557[1]
    bit sprite_bit                                                    ; 168a: 24 82       $.  :1559[1]   ; read the screen pixel into Z
    bne skip1                                                         ; 168c: d0 01       ..  :155b[1]   ; if (screen pixel is set) then branch.
    clc                                                               ; 168e: 18          .   :155d[1]
; at this point carry holds the screen pixel value, which we write to the 'erase' byte
; so we can restore the screen contents later
skip1
    rol erase_sprite_byte                                             ; 168f: 26 80       &.  :155e[1]
    asl sprite_data_byte                                              ; 1691: 06 7d       .}  :1560[1]
    bcc and_byte_with_mask_and_write_to_screen                        ; 1693: 90 10       ..  :1562[1]
; OR in (set) the appropriate bit and write back to screen memory
    ora sprite_bit                                                    ; 1695: 05 82       ..  :1564[1]
    sta (sprite_screen_address_low),y                                 ; 1697: 91 72       .r  :1566[1]   ; write byte to screen
move_up_to_next_pixel_row
    dey                                                               ; 1699: 88          .   :1568[1]
    bpl y_coordinate_is_within_character_row                          ; 169a: 10 28       .(  :1569[1]
    ldy #7                                                            ; 169c: a0 07       ..  :156b[1]
    lda sprite_screen_address_low                                     ; 169e: a5 72       .r  :156d[1]
    sbc #<screen_width_in_pixels                                      ; 16a0: e9 40       .@  :156f[1]
    jmp move_up_to_previous_character_row                             ; 16a2: 4c 81 15    L.. :1571[1]

; AND with the mask to clear the appropriate bit and write the byte back to screen
; memory
and_byte_with_mask_and_write_to_screen
    and sprite_bit_mask                                               ; 16a5: 25 83       %.  :1574[1]
    sta (sprite_screen_address_low),y                                 ; 16a7: 91 72       .r  :1576[1]   ; write byte to screen
    dey                                                               ; 16a9: 88          .   :1578[1]
    bpl y_coordinate_is_within_character_row                          ; 16aa: 10 18       ..  :1579[1]
    ldy #7                                                            ; 16ac: a0 07       ..  :157b[1]
    lda sprite_screen_address_low                                     ; 16ae: a5 72       .r  :157d[1]
    sbc #<(screen_width_in_pixels-1)                                  ; 16b0: e9 3f       .?  :157f[1]
move_up_to_previous_character_row
    sta sprite_screen_address_low                                     ; 16b2: 85 72       .r  :1581[1]
    lda sprite_screen_address_high                                    ; 16b4: a5 73       .s  :1583[1]
    sbc #>(screen_width_in_pixels-1)                                  ; 16b6: e9 01       ..  :1585[1]
    sta sprite_screen_address_high                                    ; 16b8: 85 73       .s  :1587[1]
check_within_vertical_range
    sta vertical_sprite_position_is_valid_flag                        ; 16ba: 85 88       ..  :1589[1]   ; check if Y coordinate is above or below the screen area
    cmp #$80                                                          ; 16bc: c9 80       ..  :158b[1]   ; $8000 is end of screen memory
    bcs record_that_we_are_out_of_screen_range_vertically             ; 16be: b0 bb       ..  :158d[1]
    cmp screen_base_address_high                                      ; 16c0: c5 4c       .L  :158f[1]
    bcc record_that_we_are_out_of_screen_range_vertically             ; 16c2: 90 b7       ..  :1591[1]
y_coordinate_is_within_character_row
    dex                                                               ; 16c4: ca          .   :1593[1]
    bpl byte_not_finished_yet                                         ; 16c5: 10 15       ..  :1594[1]
    sty temp_y                                                        ; 16c7: 84 7a       .z  :1596[1]
; copy 'erase' byte to destination
    ldy byte_offset_within_sprite                                     ; 16c9: a4 79       .y  :1598[1]
    lda erase_sprite_byte                                             ; 16cb: a5 80       ..  :159a[1]
    sta (dest_sprite_address_low),y                                   ; 16cd: 91 7e       .~  :159c[1]
    iny                                                               ; 16cf: c8          .   :159e[1]
    sty byte_offset_within_sprite                                     ; 16d0: 84 79       .y  :159f[1]
; load next source byte from sprite
    lda (src_sprite_address_low),y                                    ; 16d2: b1 70       .p  :15a1[1]
    sta sprite_data_byte                                              ; 16d4: 85 7d       .}  :15a3[1]
; set 'erase' byte to 255
    stx erase_sprite_byte                                             ; 16d6: 86 80       ..  :15a5[1]
    ldx #3                                                            ; 16d8: a2 03       ..  :15a7[1]   ; reset loop counter
    ldy temp_y                                                        ; 16da: a4 7a       .z  :15a9[1]
byte_not_finished_yet
    asl sprite_data_byte                                              ; 16dc: 06 7d       .}  :15ab[1]   ; check top bit
    bcc write_one_pixel_to_the_screen                                 ; 16de: 90 a2       ..  :15ad[1]   ; if (sprite bit is clear) then branch (to write pixel to screen)
    rol erase_sprite_byte                                             ; 16e0: 26 80       &.  :15af[1]   ; add set bit to 'erase' byte
    asl sprite_data_byte                                              ; 16e2: 06 7d       .}  :15b1[1]   ; get next bit
    bcs found_second_bit_set                                          ; 16e4: b0 0e       ..  :15b3[1]   ; if bit set then branch
; 'rol'-in a clear bit to the 'erase' byte. Now the 'erase' byte has a 10 pair of bits,
; which is the code for 'don't draw'. This makes sense as this is a pixel we didn't
; draw.
    rol erase_sprite_byte                                             ; 16e6: 26 80       &.  :15b5[1]
    dey                                                               ; 16e8: 88          .   :15b7[1]
; if still in same character row, then branch back
    bpl y_coordinate_is_within_character_row                          ; 16e9: 10 d9       ..  :15b8[1]
    ldy #7                                                            ; 16eb: a0 07       ..  :15ba[1]
; move up to previous character row
    lda sprite_screen_address_low                                     ; 16ed: a5 72       .r  :15bc[1]
    sbc #<screen_width_in_pixels                                      ; 16ef: e9 40       .@  :15be[1]
    jmp move_up_to_previous_character_row                             ; 16f1: 4c 81 15    L.. :15c0[1]

; add set bit to 'erase' byte. Now the 'erase' byte has a 11 pair of bits, meaning the
; end of the column.
found_second_bit_set
    rol erase_sprite_byte                                             ; 16f4: 26 80       &.  :15c3[1]
    dec sprite_width                                                  ; 16f6: c6 81       ..  :15c5[1]   ; check if we are done
    beq finish_off_sprite                                             ; 16f8: f0 55       .U  :15c7[1]
; reset sprite address
    lda sprite_screen_address_for_column_high                         ; 16fa: a5 7c       .|  :15c9[1]
    sta sprite_screen_address_high                                    ; 16fc: 85 73       .s  :15cb[1]
    lda sprite_screen_address_for_column_low                          ; 16fe: a5 7b       .{  :15cd[1]
    sta sprite_screen_address_low                                     ; 1700: 85 72       .r  :15cf[1]
    ldy sprite_reflect_flag                                           ; 1702: a4 1d       ..  :15d1[1]
    bmi move_to_next_column_while_rendering_reflected_about_y_axis    ; 1704: 30 1e       0.  :15d3[1]
; move to next column
    ldy sprite_x_offset_within_byte                                   ; 1706: a4 78       .x  :15d5[1]
    dey                                                               ; 1708: 88          .   :15d7[1]
    bpl draw_sprite                                                   ; 1709: 10 32       .2  :15d8[1]
    inc sprite_cell_x_pos                                             ; 170b: e6 85       ..  :15da[1]
    ldy sprite_cell_x_pos                                             ; 170d: a4 85       ..  :15dc[1]
; if we reach the right hand edge of the screen then we are done
    cpy #cells_per_character_row                                      ; 170f: c0 28       .(  :15de[1]
    bcs finish_off_sprite                                             ; 1711: b0 3c       .<  :15e0[1]
; move sprite addresses on by eight to get to next cell column
    ldy #7                                                            ; 1713: a0 07       ..  :15e2[1]   ; reset to start of (i.e. bit 7 of) next byte
    adc #8                                                            ; 1715: 69 08       i.  :15e4[1]
    sta sprite_screen_address_for_column_low                          ; 1717: 85 7b       .{  :15e6[1]
    sta sprite_screen_address_low                                     ; 1719: 85 72       .r  :15e8[1]
    bcc draw_sprite                                                   ; 171b: 90 20       .   :15ea[1]
    inc sprite_screen_address_for_column_high                         ; 171d: e6 7c       .|  :15ec[1]
    inc sprite_screen_address_high                                    ; 171f: e6 73       .s  :15ee[1]
    jmp draw_sprite                                                   ; 1721: 4c 0c 16    L.. :15f0[1]

move_to_next_column_while_rendering_reflected_about_y_axis
    ldy sprite_x_offset_within_byte                                   ; 1724: a4 78       .x  :15f3[1]   ; move within byte to next bit
    iny                                                               ; 1726: c8          .   :15f5[1]
    cpy #8                                                            ; 1727: c0 08       ..  :15f6[1]
    bcc draw_sprite                                                   ; 1729: 90 12       ..  :15f8[1]
    dec sprite_cell_x_pos                                             ; 172b: c6 85       ..  :15fa[1]
    bmi finish_off_sprite                                             ; 172d: 30 20       0   :15fc[1]
    ldy #0                                                            ; 172f: a0 00       ..  :15fe[1]
    sbc #8                                                            ; 1731: e9 08       ..  :1600[1]
    sta sprite_screen_address_for_column_low                          ; 1733: 85 7b       .{  :1602[1]
    sta sprite_screen_address_low                                     ; 1735: 85 72       .r  :1604[1]
    bcs draw_sprite                                                   ; 1737: b0 04       ..  :1606[1]
    dec sprite_screen_address_for_column_high                         ; 1739: c6 7c       .|  :1608[1]
    dec sprite_screen_address_high                                    ; 173b: c6 73       .s  :160a[1]
draw_sprite
    sty sprite_x_offset_within_byte                                   ; 173d: 84 78       .x  :160c[1]
    lda power_of_2_table,y                                            ; 173f: b9 77 13    .w. :160e[1]
    sta sprite_bit                                                    ; 1742: 85 82       ..  :1611[1]   ; store the single bit within a byte we are interested in
    eor #$ff                                                          ; 1744: 49 ff       I.  :1613[1]
    sta sprite_bit_mask                                               ; 1746: 85 83       ..  :1615[1]   ; store every other bit in the byte other than the one we are interested in (it's a mask)
    ldy sprite_y_offset_within_character_row                          ; 1748: a4 84       ..  :1617[1]
    lda sprite_screen_address_high                                    ; 174a: a5 73       .s  :1619[1]
    jmp check_within_vertical_range                                   ; 174c: 4c 89 15    L.. :161b[1]

finish_off_sprite
    lda erase_sprite_byte                                             ; 174f: a5 80       ..  :161e[1]
    dex                                                               ; 1751: ca          .   :1620[1]
    bmi write_last_byte_to_destination_sprite                         ; 1752: 30 05       0.  :1621[1]
shift_mask_byte_loop
    asl                                                               ; 1754: 0a          .   :1623[1]
    asl                                                               ; 1755: 0a          .   :1624[1]
    dex                                                               ; 1756: ca          .   :1625[1]
    bpl shift_mask_byte_loop                                          ; 1757: 10 fb       ..  :1626[1]
write_last_byte_to_destination_sprite
    ldy byte_offset_within_sprite                                     ; 1759: a4 79       .y  :1628[1]
    sta (dest_sprite_address_low),y                                   ; 175b: 91 7e       .~  :162a[1]
    jmp reset_sprite_flags_and_exit                                   ; 175d: 4c 7f 13    L.. :162c[1]

clamp_and_clip_x
    ldy sprite_x_pos_high                                             ; 1760: a4 75       .u  :162f[1]   ; exit if X position is 512 or more
    iny                                                               ; 1762: c8          .   :1631[1]
    cpy #3                                                            ; 1763: c0 03       ..  :1632[1]
    bcs pull_values_and_exit_sprite_op_local                          ; 1765: b0 07       ..  :1634[1]
    ldy sprite_y_pos_high                                             ; 1767: a4 77       .w  :1636[1]   ; exit if Y position is 512 or more
    iny                                                               ; 1769: c8          .   :1638[1]
    cpy #3                                                            ; 176a: c0 03       ..  :1639[1]
    bcc clamp_x                                                       ; 176c: 90 03       ..  :163b[1]
pull_values_and_exit_sprite_op_local
    jmp pull_values_and_exit_sprite_op                                ; 176e: 4c ce 16    L.. :163d[1]

clamp_x
    lda sprite_x_pos_low                                              ; 1771: a5 74       .t  :1640[1]
; calculate cell x position by dividing pixel position by eight
    sta sprite_cell_x_pos                                             ; 1773: 85 85       ..  :1642[1]
    lda sprite_x_pos_high                                             ; 1775: a5 75       .u  :1644[1]
    lsr                                                               ; 1777: 4a          J   :1646[1]
    ror sprite_cell_x_pos                                             ; 1778: 66 85       f.  :1647[1]
    lsr                                                               ; 177a: 4a          J   :1649[1]
    ror sprite_cell_x_pos                                             ; 177b: 66 85       f.  :164a[1]
    lsr                                                               ; 177d: 4a          J   :164c[1]
    ror sprite_cell_x_pos                                             ; 177e: 66 85       f.  :164d[1]
; check flags2 (top bit) to see if we should clamp to the right edge
    lda sprite_reflect_flag                                           ; 1780: a5 1d       ..  :164f[1]
    bmi sprite_clamp_x_right                                          ; 1782: 30 1d       0.  :1651[1]
; clamp to left edge
    lda sprite_cell_x_pos                                             ; 1784: a5 85       ..  :1653[1]
    bmi sprite_clamp_x_left                                           ; 1786: 30 07       0.  :1655[1]
; if fully off screen to the right, then pull values and return else just return
    cmp #cells_per_character_row                                      ; 1788: c9 28       .(  :1657[1]
    bcc return3                                                       ; 178a: 90 72       .r  :1659[1]
    jmp pull_values_and_exit_sprite_op                                ; 178c: 4c ce 16    L.. :165b[1]

sprite_clamp_x_left
    lda #0                                                            ; 178f: a9 00       ..  :165e[1]
    sec                                                               ; 1791: 38          8   :1660[1]
    sbc sprite_x_pos_low                                              ; 1792: e5 74       .t  :1661[1]
    sta amount_sprite_is_offscreen_x                                  ; 1794: 85 86       ..  :1663[1]
    lda #0                                                            ; 1796: a9 00       ..  :1665[1]
    sta sprite_x_pos_low                                              ; 1798: 85 74       .t  :1667[1]
    sta sprite_x_pos_high                                             ; 179a: 85 75       .u  :1669[1]
    sta sprite_cell_x_pos                                             ; 179c: 85 85       ..  :166b[1]
    jmp sprite_clip_x                                                 ; 179e: 4c 8a 16    L.. :166d[1]

sprite_clamp_x_right
    lda sprite_cell_x_pos                                             ; 17a1: a5 85       ..  :1670[1]
    bmi pull_values_and_exit_sprite_op                                ; 17a3: 30 5a       0Z  :1672[1]
    cmp #cells_per_character_row                                      ; 17a5: c9 28       .(  :1674[1]
    bcc return3                                                       ; 17a7: 90 55       .U  :1676[1]
    lda sprite_x_pos_low                                              ; 17a9: a5 74       .t  :1678[1]
    sbc #<(screen_width_in_pixels-1)                                  ; 17ab: e9 3f       .?  :167a[1]
    sta amount_sprite_is_offscreen_x                                  ; 17ad: 85 86       ..  :167c[1]
; set x position to the right edge (319)
    lda #<(screen_width_in_pixels-1)                                  ; 17af: a9 3f       .?  :167e[1]
    sta sprite_x_pos_low                                              ; 17b1: 85 74       .t  :1680[1]
    lda #>(screen_width_in_pixels-1)                                  ; 17b3: a9 01       ..  :1682[1]
    sta sprite_x_pos_high                                             ; 17b5: 85 75       .u  :1684[1]
    lda #cells_per_character_row-1                                    ; 17b7: a9 27       .'  :1686[1]
    sta sprite_cell_x_pos                                             ; 17b9: 85 85       ..  :1688[1]
sprite_clip_x
    lda amount_sprite_is_offscreen_x                                  ; 17bb: a5 86       ..  :168a[1]
    cmp sprite_width                                                  ; 17bd: c5 81       ..  :168c[1]
    bcs pull_values_and_exit_sprite_op                                ; 17bf: b0 3e       .>  :168e[1]   ; exit if fully offscreen
    lda sprite_data_byte                                              ; 17c1: a5 7d       .}  :1690[1]
    ldx num_two_bit_offsets_within_byte                               ; 17c3: a6 87       ..  :1692[1]
    ldy byte_offset_within_sprite                                     ; 17c5: a4 79       .y  :1694[1]
sprite_clip_x_loop
    dex                                                               ; 17c7: ca          .   :1696[1]
    bpl read_next_source_pixel                                        ; 17c8: 10 11       ..  :1697[1]
    lda sprite_op_flags                                               ; 17ca: a5 15       ..  :1699[1]
    and #sprite_op_flags_copy_screen                                  ; 17cc: 29 01       ).  :169b[1]
    beq not_copying_to_destination_sprite                             ; 17ce: f0 06       ..  :169d[1]
    lda erase_sprite_byte                                             ; 17d0: a5 80       ..  :169f[1]
    sta (dest_sprite_address_low),y                                   ; 17d2: 91 7e       .~  :16a1[1]
    stx erase_sprite_byte                                             ; 17d4: 86 80       ..  :16a3[1]   ; set dest sprite byte to 255
not_copying_to_destination_sprite
    iny                                                               ; 17d6: c8          .   :16a5[1]
    lda (src_sprite_address_low),y                                    ; 17d7: b1 70       .p  :16a6[1]
    ldx #3                                                            ; 17d9: a2 03       ..  :16a8[1]
read_next_source_pixel
    asl                                                               ; 17db: 0a          .   :16aa[1]   ; get top bit
    bcs found_set_bit                                                 ; 17dc: b0 08       ..  :16ab[1]   ; if set then branch
    rol erase_sprite_byte                                             ; 17de: 26 80       &.  :16ad[1]   ; put clear bit into mask
    asl                                                               ; 17e0: 0a          .   :16af[1]   ; read next bit
    rol erase_sprite_byte                                             ; 17e1: 26 80       &.  :16b0[1]   ; put next bit into mask
    jmp sprite_clip_x_loop                                            ; 17e3: 4c 96 16    L.. :16b2[1]   ; loop back

found_set_bit
    rol erase_sprite_byte                                             ; 17e6: 26 80       &.  :16b5[1]   ; put set bit into mask
    asl                                                               ; 17e8: 0a          .   :16b7[1]   ; get next bit
    bcs found_second_set_bit                                          ; 17e9: b0 05       ..  :16b8[1]   ; if set then branch
    rol erase_sprite_byte                                             ; 17eb: 26 80       &.  :16ba[1]   ; put zero bit into mask
    jmp sprite_clip_x_loop                                            ; 17ed: 4c 96 16    L.. :16bc[1]   ; loop back

found_second_set_bit
    rol erase_sprite_byte                                             ; 17f0: 26 80       &.  :16bf[1]   ; put another set bit into mask
    dec sprite_width                                                  ; 17f2: c6 81       ..  :16c1[1]   ; decrement loop counters
    dec amount_sprite_is_offscreen_x                                  ; 17f4: c6 86       ..  :16c3[1]
    bne sprite_clip_x_loop                                            ; 17f6: d0 cf       ..  :16c5[1]   ; jump back if not done
    sta sprite_data_byte                                              ; 17f8: 85 7d       .}  :16c7[1]
    stx num_two_bit_offsets_within_byte                               ; 17fa: 86 87       ..  :16c9[1]
    sty byte_offset_within_sprite                                     ; 17fc: 84 79       .y  :16cb[1]
return3
    rts                                                               ; 17fe: 60          `   :16cd[1]

pull_values_and_exit_sprite_op
    pla                                                               ; 17ff: 68          h   :16ce[1]
    pla                                                               ; 1800: 68          h   :16cf[1]
    jmp reset_sprite_flags_and_exit                                   ; 1801: 4c 7f 13    L.. :16d0[1]

; Record the brk error code, but otherwise do nothing - don't return from interrupt,
; just restore the stack pointer and continue (!)
brk_handler
    ldy #0                                                            ; 1804: a0 00       ..  :16d3[1]
    lda (brk_address_low),y                                           ; 1806: b1 fd       ..  :16d5[1]
    sta error_code_on_brk                                             ; 1808: 85 02       ..  :16d7[1]
    jmp restore_brk_handler_since_osfile_is_finished                  ; 180a: 4c 13 17    L.. :16d9[1]

; *************************************************************************************
; 
; OSFILE wrapper
; 
; On Entry:
;      A: OSFILE action:
;         $00 = save
;         $05 = read catalogue
;         $ff = load
;     YX: address of filename
; 
; *************************************************************************************
osfile_wrapper
    stx osfile_block_load_address_low                                 ; 180d: 86 72       .r  :16dc[1]
    sty osfile_block_load_address_mid1                                ; 180f: 84 73       .s  :16de[1]
    ldx #0                                                            ; 1811: a2 00       ..  :16e0[1]
    stx osfile_block_load_address_mid2                                ; 1813: 86 74       .t  :16e2[1]
    stx osfile_block_load_address_high                                ; 1815: 86 75       .u  :16e4[1]
    stx osfile_block_exec_address_mid2                                ; 1817: 86 78       .x  :16e6[1]
    stx osfile_block_exec_address_high                                ; 1819: 86 79       .y  :16e8[1]
    stx osfile_block_start_address_mid2                               ; 181b: 86 7c       .|  :16ea[1]
    stx osfile_block_start_address_high                               ; 181d: 86 7d       .}  :16ec[1]
    stx osfile_block_end_address_mid2                                 ; 181f: 86 80       ..  :16ee[1]
    stx osfile_block_end_address_high                                 ; 1821: 86 81       ..  :16f0[1]
    tay                                                               ; 1823: a8          .   :16f2[1]
    beq skip_if_saving                                                ; 1824: f0 02       ..  :16f3[1]
    stx osfile_block_exec_address_low                                 ; 1826: 86 76       .v  :16f5[1]
skip_if_saving
    ldx #0                                                            ; 1828: a2 00       ..  :16f7[1]
    stx error_code_on_brk                                             ; 182a: 86 02       ..  :16f9[1]
    tsx                                                               ; 182c: ba          .   :16fb[1]
    stx remember_stack_pointer                                        ; 182d: 86 03       ..  :16fc[1]
    sei                                                               ; 182f: 78          x   :16fe[1]
; use our brk_handler (to trap disk errors)
    ldx old_brkv2                                                     ; 1830: ae b3 0a    ... :16ff[1]
    stx brkv                                                          ; 1833: 8e 02 02    ... :1702[1]
    ldx old_brkv2+1                                                   ; 1836: ae b4 0a    ... :1705[1]
    stx brkv+1                                                        ; 1839: 8e 03 02    ... :1708[1]
    cli                                                               ; 183c: 58          X   :170b[1]
    ldx #<(osfile_block_filename_low)                                 ; 183d: a2 70       .p  :170c[1]
    ldy #>(osfile_block_filename_low)                                 ; 183f: a0 00       ..  :170e[1]
    jsr osfile                                                        ; 1841: 20 dd ff     .. :1710[1]
restore_brk_handler_since_osfile_is_finished
    sei                                                               ; 1844: 78          x   :1713[1]
; reset brk handler to standard one (after disk access finished)
    ldx old_brkv1                                                     ; 1845: ae b1 0a    ... :1714[1]
    stx brkv                                                          ; 1848: 8e 02 02    ... :1717[1]
    ldx old_brkv1+1                                                   ; 184b: ae b2 0a    ... :171a[1]
    stx brkv+1                                                        ; 184e: 8e 03 02    ... :171d[1]
    cli                                                               ; 1851: 58          X   :1720[1]
; restore stack pointer, since it may have been disrupted by a BRK during OSFILE
    ldx remember_stack_pointer                                        ; 1852: a6 03       ..  :1721[1]
    txs                                                               ; 1854: 9a          .   :1723[1]
    lda error_code_on_brk                                             ; 1855: a5 02       ..  :1724[1]
    beq no_disk_error                                                 ; 1857: f0 24       .$  :1726[1]
show_disk_error_dialog_if_display_is_initialised
    lda display_initialised_flag                                      ; 1859: ad 0a 11    ... :1728[1]
    beq no_disk_error                                                 ; 185c: f0 1f       ..  :172b[1]
; beep and show disk error dialog
    lda #vdu_bell                                                     ; 185e: a9 07       ..  :172d[1]
    jsr oswrch                                                        ; 1860: 20 ee ff     .. :172f[1]   ; Write character 7
    lda #$12                                                          ; 1863: a9 12       ..  :1732[1]
    sta current_text_width                                            ; 1865: 8d 09 04    ... :1734[1]
    jsr show_dialog_box                                               ; 1868: 20 0a 04     .. :1737[1]
    lda #$0a                                                          ; 186b: a9 0a       ..  :173a[1]
    jsr oswrch                                                        ; 186d: 20 ee ff     .. :173c[1]   ; Write character 10
    ldx #<disk_error_encrypted_string                                 ; 1870: a2 52       .R  :173f[1]
    ldy #>disk_error_encrypted_string                                 ; 1872: a0 17       ..  :1741[1]
    jsr print_encrypted_string_at_yx_centred                          ; 1874: 20 f3 37     .7 :1743[1]
    jsr wait_one_second_then_check_keys                               ; 1877: 20 8d 38     .8 :1746[1]
    jsr wait_one_second_then_check_keys                               ; 187a: 20 8d 38     .8 :1749[1]
no_disk_error
    jsr check_menu_keys                                               ; 187d: 20 8f 3a     .: :174c[1]
    lda error_code_on_brk                                             ; 1880: a5 02       ..  :174f[1]
    rts                                                               ; 1882: 60          `   :1751[1]

; 'Disk error[0d]' EOR-encrypted with $cb
disk_error_encrypted_string
    !byte $8f, $a2, $b8, $a0, $eb, $ae, $b9, $b9, $a4, $b9, $c6       ; 1883: 8f a2 b8... ... :1752[1]
pending_toolbar_colour
    !byte 0                                                           ; 188e: 00          .   :175d[1]
toolbar_colour
    !byte 0                                                           ; 188f: 00          .   :175e[1]
pending_gameplay_area_colour
    !byte 0                                                           ; 1890: 00          .   :175f[1]
gameplay_area_colour
    !byte 0                                                           ; 1891: 00          .   :1760[1]
toolbar_colour_choices
    !byte colour_yellow,  colour_green,  colour_white,    colour_red  ; 1892: 03 02 07... ... :1761[1]
use_colour_flag
    !byte $ff                                                         ; 1896: ff          .   :1765[1]

; Set the toolbar and gameplay area colours. In mono mode both are white. In colour
; mode the gameplay area is cyan and the toolbar colour is
; toolbar_colour_choices[(level_letter - 'A') & 3].
set_toolbar_and_gameplay_area_colours
    lda #colour_white                                                 ; 1897: a9 07       ..  :1766[1]
    sta pending_toolbar_colour                                        ; 1899: 8d 5d 17    .]. :1768[1]
    sta pending_gameplay_area_colour                                  ; 189c: 8d 5f 17    ._. :176b[1]
    lda use_colour_flag                                               ; 189f: ad 65 17    .e. :176e[1]
    beq return4                                                       ; 18a2: f0 17       ..  :1771[1]
    ldy current_level                                                 ; 18a4: a4 31       .1  :1773[1]
    jsr convert_level_filename_letter_into_section_letter             ; 18a6: 20 d4 0a     .. :1775[1]
    tya                                                               ; 18a9: 98          .   :1778[1]
    sec                                                               ; 18aa: 38          8   :1779[1]
    sbc #first_level_letter                                           ; 18ab: e9 41       .A  :177a[1]
    and #3                                                            ; 18ad: 29 03       ).  :177c[1]
    tax                                                               ; 18af: aa          .   :177e[1]
    lda toolbar_colour_choices,x                                      ; 18b0: bd 61 17    .a. :177f[1]
    sta pending_toolbar_colour                                        ; 18b3: 8d 5d 17    .]. :1782[1]
    lda #colour_cyan                                                  ; 18b6: a9 06       ..  :1785[1]
    sta pending_gameplay_area_colour                                  ; 18b8: 8d 5f 17    ._. :1787[1]
return4
    rts                                                               ; 18bb: 60          `   :178a[1]

vsync_counter
    !byte 0                                                           ; 18bc: 00          .   :178b[1]

wait_for_vsync
    lda #osbyte_vsync                                                 ; 18bd: a9 13       ..  :178c[1]
    jmp osbyte                                                        ; 18bf: 4c f4 ff    L.. :178e[1]   ; Wait for vertical sync

; wait for vsync timer to help avoid flicker
wait_for_timer_2_using_yx
    txa                                                               ; 18c2: 8a          .   :1791[1]
    clc                                                               ; 18c3: 18          .   :1792[1]
    adc #$ff                                                          ; 18c4: 69 ff       i.  :1793[1]
    tya                                                               ; 18c6: 98          .   :1795[1]
    adc #0                                                            ; 18c7: 69 00       i.  :1796[1]
    eor #$ff                                                          ; 18c9: 49 ff       I.  :1798[1]
delay_loop
    cmp system_via_t2c_h                                              ; 18cb: cd 49 fe    .I. :179a[1]
    bcc delay_loop                                                    ; 18ce: 90 fb       ..  :179d[1]
    rts                                                               ; 18d0: 60          `   :179f[1]

irq1_routine
    pha                                                               ; 18d1: 48          H   :17a0[1]
    lda interrupt_accumulator                                         ; 18d2: a5 fc       ..  :17a1[1]
    pha                                                               ; 18d4: 48          H   :17a3[1]   ; remember A,X,Y
    txa                                                               ; 18d5: 8a          .   :17a4[1]
    pha                                                               ; 18d6: 48          H   :17a5[1]
    tya                                                               ; 18d7: 98          .   :17a6[1]
    pha                                                               ; 18d8: 48          H   :17a7[1]
    jsr if_vsync_elapsed_then_set_toolbar_area_palette                ; 18d9: 20 b9 17     .. :17a8[1]
    jsr if_timer1_elapsed_then_set_main_area_palette                  ; 18dc: 20 fa 17     .. :17ab[1]
    pla                                                               ; 18df: 68          h   :17ae[1]   ; recall A,X,Y
    tay                                                               ; 18e0: a8          .   :17af[1]
    pla                                                               ; 18e1: 68          h   :17b0[1]
    tax                                                               ; 18e2: aa          .   :17b1[1]
    pla                                                               ; 18e3: 68          h   :17b2[1]
    sta interrupt_accumulator                                         ; 18e4: 85 fc       ..  :17b3[1]
    pla                                                               ; 18e6: 68          h   :17b5[1]
    jmp (old_irq1v)                                                   ; 18e7: 6c b5 0a    l.. :17b6[1]

if_vsync_elapsed_then_set_toolbar_area_palette
    lda #2                                                            ; 18ea: a9 02       ..  :17b9[1]
    bit system_via_ifr                                                ; 18ec: 2c 4d fe    ,M. :17bb[1]   ; check for vsync interrupt
    beq return5                                                       ; 18ef: f0 39       .9  :17be[1]
; reset timers
    lda timingA_counter_low                                           ; 18f1: ad 04 11    ... :17c0[1]
    sta system_via_t1c_l                                              ; 18f4: 8d 44 fe    .D. :17c3[1]
    lda timingA_counter_high                                          ; 18f7: ad 05 11    ... :17c6[1]
    sta system_via_t1c_h                                              ; 18fa: 8d 45 fe    .E. :17c9[1]
    lda timing_latch_low                                              ; 18fd: ad 08 11    ... :17cc[1]
    sta system_via_t1l_l                                              ; 1900: 8d 46 fe    .F. :17cf[1]
    lda timing_latch_high                                             ; 1903: ad 09 11    ... :17d2[1]
    sta system_via_t1l_h                                              ; 1906: 8d 47 fe    .G. :17d5[1]
    lda #$ff                                                          ; 1909: a9 ff       ..  :17d8[1]
    sta system_via_t2c_h                                              ; 190b: 8d 49 fe    .I. :17da[1]
    ldx #1                                                            ; 190e: a2 01       ..  :17dd[1]
    ldy toolbar_colour                                                ; 1910: ac 5e 17    .^. :17df[1]
    jsr change_palette_logical_colour_x_to_y                          ; 1913: 20 25 18     %. :17e2[1]
    lda developer_flags                                               ; 1916: ad 03 11    ... :17e5[1]
    bpl skip_developer_mode_code2                                     ; 1919: 10 07       ..  :17e8[1]
    ldx #0                                                            ; 191b: a2 00       ..  :17ea[1]
    ldy #colour_magenta                                               ; 191d: a0 05       ..  :17ec[1]
    jsr change_palette_logical_colour_x_to_y                          ; 191f: 20 25 18     %. :17ee[1]
skip_developer_mode_code2
    lda #0                                                            ; 1922: a9 00       ..  :17f1[1]
    sta gameplay_area_palette_set                                     ; 1924: 8d 24 18    .$. :17f3[1]
    inc vsync_counter                                                 ; 1927: ee 8b 17    ... :17f6[1]
return5
    rts                                                               ; 192a: 60          `   :17f9[1]

if_timer1_elapsed_then_set_main_area_palette
    lda #$40 ; '@'                                                    ; 192b: a9 40       .@  :17fa[1]
    bit system_via_ifr                                                ; 192d: 2c 4d fe    ,M. :17fc[1]   ; check for timer1 elapsed
    beq return6                                                       ; 1930: f0 22       ."  :17ff[1]
    lda gameplay_area_palette_set                                     ; 1932: ad 24 18    .$. :1801[1]
    bne return6                                                       ; 1935: d0 1d       ..  :1804[1]
    ldx #1                                                            ; 1937: a2 01       ..  :1806[1]
    ldy gameplay_area_colour                                          ; 1939: ac 60 17    .`. :1808[1]
    jsr change_palette_logical_colour_x_to_y                          ; 193c: 20 25 18     %. :180b[1]
    lda developer_flags                                               ; 193f: ad 03 11    ... :180e[1]
    bpl skip_developer_mode_code3                                     ; 1942: 10 07       ..  :1811[1]
    ldx #0                                                            ; 1944: a2 00       ..  :1813[1]
    ldy #colour_black                                                 ; 1946: a0 00       ..  :1815[1]
    jsr change_palette_logical_colour_x_to_y                          ; 1948: 20 25 18     %. :1817[1]
skip_developer_mode_code3
    inc gameplay_area_palette_set                                     ; 194b: ee 24 18    .$. :181a[1]
    jsr update_main_keys                                              ; 194e: 20 12 3a     .: :181d[1]
    jsr update_space_etc_keys                                         ; 1951: 20 47 3a     G: :1820[1]
return6
    rts                                                               ; 1954: 60          `   :1823[1]

gameplay_area_palette_set
    !byte 0                                                           ; 1955: 00          .   :1824[1]

change_palette_logical_colour_x_to_y
    txa                                                               ; 1956: 8a          .   :1825[1]
    lsr                                                               ; 1957: 4a          J   :1826[1]
    php                                                               ; 1958: 08          .   :1827[1]
    tya                                                               ; 1959: 98          .   :1828[1]
    eor #7                                                            ; 195a: 49 07       I.  :1829[1]
    asl                                                               ; 195c: 0a          .   :182b[1]
    plp                                                               ; 195d: 28          (   :182c[1]
    ror                                                               ; 195e: 6a          j   :182d[1]
    ldx #7                                                            ; 195f: a2 07       ..  :182e[1]
change_palette_loop
    sta video_ula_palette                                             ; 1961: 8d 21 fe    .!. :1830[1]
    adc #$10                                                          ; 1964: 69 10       i.  :1833[1]
    dex                                                               ; 1966: ca          .   :1835[1]
    bpl change_palette_loop                                           ; 1967: 10 f8       ..  :1836[1]
    rts                                                               ; 1969: 60          `   :1838[1]

reset_game_because_escape_pressed
    jsr wait_for_vsync                                                ; 196a: 20 8c 17     .. :1839[1]
    jsr wait_for_timingB_counter                                      ; 196d: 20 00 04     .. :183c[1]
    jsr reset_code                                                    ; 1970: 20 45 18     E. :183f[1]
    jmp initialise_display                                            ; 1973: 4c 00 0c    L.. :1842[1]

; If there is sideways RAM mapped into ROM slot 12, this copies data that had been
; previously saved to sideways RAM: 256 bytes from $be00 to $0c00, and 256 bytes from
; $bf00 to $0b00. This is code to help reset the game during development.
reset_code
    sei                                                               ; 1976: 78          x   :1845[1]
    lda #$0c                                                          ; 1977: a9 0c       ..  :1846[1]
    sta romsel                                                        ; 1979: 8d 30 fe    .0. :1848[1]   ; select ROM in slot 13
    ldy #0                                                            ; 197c: a0 00       ..  :184b[1]
copy_from_rom_c_loop
    lda sideways_ram_be00,y                                           ; 197e: b9 00 be    ... :184d[1]
    sta initialise_display,y                                          ; 1981: 99 00 0c    ... :1850[1]
    lda sideways_ram_bf00,y                                           ; 1984: b9 00 bf    ... :1853[1]
    sta area_to_copy_to_or_from_sideways_ram,y                        ; 1987: 99 00 0b    ... :1856[1]
    iny                                                               ; 198a: c8          .   :1859[1]
    bne copy_from_rom_c_loop                                          ; 198b: d0 f1       ..  :185a[1]
    lda romsel_copy                                                   ; 198d: a5 f4       ..  :185c[1]
    sta romsel                                                        ; 198f: 8d 30 fe    .0. :185e[1]
    cli                                                               ; 1992: 58          X   :1861[1]
; clear the reset vector
    sty first_byte_break_intercept                                    ; 1993: 8c 87 02    ... :1862[1]
    rts                                                               ; 1996: 60          `   :1865[1]

print_italic
    cmp #'!'                                                          ; 1997: c9 21       .!  :1866[1]
    bcc print_italic_rts                                              ; 1999: 90 39       .9  :1868[1]
    cmp #$7f                                                          ; 199b: c9 7f       ..  :186a[1]
    bcs print_italic_rts                                              ; 199d: b0 35       .5  :186c[1]
    sta osword_read_character_block                                   ; 199f: 85 60       .`  :186e[1]
    txa                                                               ; 19a1: 8a          .   :1870[1]   ; remember X,Y
    pha                                                               ; 19a2: 48          H   :1871[1]
    tya                                                               ; 19a3: 98          .   :1872[1]
    pha                                                               ; 19a4: 48          H   :1873[1]
    lda #osword_read_char                                             ; 19a5: a9 0a       ..  :1874[1]
    ldx #<(osword_read_character_block)                               ; 19a7: a2 60       .`  :1876[1]
    ldy #>(osword_read_character_block)                               ; 19a9: a0 00       ..  :1878[1]
    jsr osword                                                        ; 19ab: 20 f1 ff     .. :187a[1]   ; Read character definition
    lsr osword_read_character_block+1                                 ; 19ae: 46 61       Fa  :187d[1]
    lsr osword_read_character_block+2                                 ; 19b0: 46 62       Fb  :187f[1]
    asl osword_read_character_block+6                                 ; 19b2: 06 66       .f  :1881[1]
    asl osword_read_character_block+7                                 ; 19b4: 06 67       .g  :1883[1]
    asl osword_read_character_block+8                                 ; 19b6: 06 68       .h  :1885[1]
    lda #vdu_define_character                                         ; 19b8: a9 17       ..  :1887[1]
    jsr oswrch                                                        ; 19ba: 20 ee ff     .. :1889[1]   ; Write character 23
    lda #$ff                                                          ; 19bd: a9 ff       ..  :188c[1]
    jsr oswrch                                                        ; 19bf: 20 ee ff     .. :188e[1]   ; Write character 255
    ldx #0                                                            ; 19c2: a2 00       ..  :1891[1]
define_character_ff_loop
    lda osword_read_character_block+1,x                               ; 19c4: b5 61       .a  :1893[1]
    jsr oswrch                                                        ; 19c6: 20 ee ff     .. :1895[1]   ; Write character
    inx                                                               ; 19c9: e8          .   :1898[1]
    cpx #8                                                            ; 19ca: e0 08       ..  :1899[1]
    bcc define_character_ff_loop                                      ; 19cc: 90 f6       ..  :189b[1]
    pla                                                               ; 19ce: 68          h   :189d[1]   ; recall X,Y
    tay                                                               ; 19cf: a8          .   :189e[1]
    pla                                                               ; 19d0: 68          h   :189f[1]
    tax                                                               ; 19d1: aa          .   :18a0[1]
    lda #$ff                                                          ; 19d2: a9 ff       ..  :18a1[1]
print_italic_rts
    jmp oswrch                                                        ; 19d4: 4c ee ff    L.. :18a3[1]   ; Write character 255

; *************************************************************************************
; 
; Random Number Generator
; 
; On Entry:
;     A must be one less than a power of two, a mask to fill in with random bits
; 
; On Exit:
;     A holds a random number up to the value of A on entry
; 
; *************************************************************************************
get_random_number_up_to_a
    sta bit_mask_for_random_number_limit                              ; 19d7: 85 39       .9  :18a6[1]   ; store loop variable, all 1s in the lowest bits
    pha                                                               ; 19d9: 48          H   :18a8[1]   ; remember mask
generate_random_bits_loop
    lda rnd2                                                          ; 19da: a5 08       ..  :18a9[1]
    lsr                                                               ; 19dc: 4a          J   :18ab[1]
    lsr                                                               ; 19dd: 4a          J   :18ac[1]
    lsr                                                               ; 19de: 4a          J   :18ad[1]
    eor rnd4                                                          ; 19df: 45 0a       E.  :18ae[1]
    ror                                                               ; 19e1: 6a          j   :18b0[1]
    rol rnd0                                                          ; 19e2: 26 06       &.  :18b1[1]
    rol rnd1                                                          ; 19e4: 26 07       &.  :18b3[1]
    rol rnd2                                                          ; 19e6: 26 08       &.  :18b5[1]
    rol rnd3                                                          ; 19e8: 26 09       &.  :18b7[1]
    rol rnd4                                                          ; 19ea: 26 0a       &.  :18b9[1]
    lsr bit_mask_for_random_number_limit                              ; 19ec: 46 39       F9  :18bb[1]   ; update loop variable by shifting right
    bne generate_random_bits_loop                                     ; 19ee: d0 ea       ..  :18bd[1]   ; loop back until enough random bits are generated
    pla                                                               ; 19f0: 68          h   :18bf[1]   ; recall mask
    and rnd0                                                          ; 19f1: 25 06       %.  :18c0[1]   ; AND the mask with the random bits
    rts                                                               ; 19f3: 60          `   :18c2[1]

; *************************************************************************************
; 
; Check for player leaving room
; 
; On Exit:
;     A: 0=player is still within game area
;        1=exit room left
;        2=exit room bottom
;        4=exit room right
;        8=exit room top
; 
; *************************************************************************************
check_for_player_leaving_room
    lda object_x_high                                                 ; 19f4: ad 66 09    .f. :18c3[1]
    bmi increase_player_x_coordinate_to_enter_next_room               ; 19f7: 30 41       0A  :18c6[1]
    beq get_delta_y                                                   ; 19f9: f0 07       ..  :18c8[1]
    lda object_x_low                                                  ; 19fb: ad 50 09    .P. :18ca[1]
    cmp #$40 ; '@'                                                    ; 19fe: c9 40       .@  :18cd[1]
    bcs decrease_player_x_coordinate_to_enter_next_room               ; 1a00: b0 4e       .N  :18cf[1]
get_delta_y
    lda object_y_low                                                  ; 1a02: ad 7c 09    .|. :18d1[1]
    sec                                                               ; 1a05: 38          8   :18d4[1]
    sbc object_y_low_old                                              ; 1a06: ed 87 09    ... :18d5[1]
    beq return_with_a_zero                                            ; 1a09: f0 2c       .,  :18d8[1]
    lda object_y_high                                                 ; 1a0b: ad 92 09    ... :18da[1]
    sbc object_y_high_old                                             ; 1a0e: ed 9d 09    ... :18dd[1]
    sta object_y_delta                                                ; 1a11: 85 70       .p  :18e0[1]
    ldx #0                                                            ; 1a13: a2 00       ..  :18e2[1]
    jsr find_top_and_bottom_of_object                                 ; 1a15: 20 d2 24     .$ :18e4[1]
; Find the average of object_true_bottom and object_bottom and convert to a cell Y
; value. Use this value to test if the player is off screen.
    lda object_top_low                                                ; 1a18: a5 74       .t  :18e7[1]
    clc                                                               ; 1a1a: 18          .   :18e9[1]
    adc object_bottom_low                                             ; 1a1b: 65 76       ev  :18ea[1]
    sta object_top_cell_y                                             ; 1a1d: 85 7a       .z  :18ec[1]
    lda object_top_high                                               ; 1a1f: a5 75       .u  :18ee[1]
    adc object_bottom_high                                            ; 1a21: 65 77       ew  :18f0[1]
    lsr                                                               ; 1a23: 4a          J   :18f2[1]
    ror object_top_cell_y                                             ; 1a24: 66 7a       fz  :18f3[1]
    lsr                                                               ; 1a26: 4a          J   :18f5[1]
    ror object_top_cell_y                                             ; 1a27: 66 7a       fz  :18f6[1]
    lsr                                                               ; 1a29: 4a          J   :18f8[1]
    ror object_top_cell_y                                             ; 1a2a: 66 7a       fz  :18f9[1]
    lsr                                                               ; 1a2c: 4a          J   :18fb[1]
    ror object_top_cell_y                                             ; 1a2d: 66 7a       fz  :18fc[1]
    lda object_top_cell_y                                             ; 1a2f: a5 7a       .z  :18fe[1]
    bmi increase_player_y_coordinate_to_enter_next_room               ; 1a31: 30 35       05  :1900[1]
    cmp #game_area_height_cells                                       ; 1a33: c9 18       ..  :1902[1]
    bcs decrease_player_y_coordinate_to_enter_next_room               ; 1a35: b0 4b       .K  :1904[1]
return_with_a_zero
    lda #0                                                            ; 1a37: a9 00       ..  :1906[1]
    rts                                                               ; 1a39: 60          `   :1908[1]

; If the player is off the left of the game play area, this is called. It increases the
; X coordinate by 320 pixels. It does the same for object one, the player's accessory
; object. Returns with A=1.
increase_player_x_coordinate_to_enter_next_room
    ldx #1                                                            ; 1a3a: a2 01       ..  :1909[1]   ; object index (and loop counter)
; add one screen amount to the X coordinate
add_to_player_x_loop
    lda object_x_low,x                                                ; 1a3c: bd 50 09    .P. :190b[1]
    clc                                                               ; 1a3f: 18          .   :190e[1]
    adc #$40 ; '@'                                                    ; 1a40: 69 40       i@  :190f[1]
    sta object_x_low,x                                                ; 1a42: 9d 50 09    .P. :1911[1]
    lda #1                                                            ; 1a45: a9 01       ..  :1914[1]
    sta object_x_high,x                                               ; 1a47: 9d 66 09    .f. :1916[1]
    dex                                                               ; 1a4a: ca          .   :1919[1]
    bpl add_to_player_x_loop                                          ; 1a4b: 10 ef       ..  :191a[1]
    lda #1                                                            ; 1a4d: a9 01       ..  :191c[1]
    rts                                                               ; 1a4f: 60          `   :191e[1]

; If the player is off the right of the game play area, this is called. It decreases
; the X coordinate by 320 pixels. It does the same for object one, the player's
; accessory object. Returns with A=4.
decrease_player_x_coordinate_to_enter_next_room
    ldx #1                                                            ; 1a50: a2 01       ..  :191f[1]   ; object index (and loop counter)
subtract_from_player_x_loop
    lda object_x_low,x                                                ; 1a52: bd 50 09    .P. :1921[1]
    sec                                                               ; 1a55: 38          8   :1924[1]
    sbc #$40 ; '@'                                                    ; 1a56: e9 40       .@  :1925[1]
    sta object_x_low,x                                                ; 1a58: 9d 50 09    .P. :1927[1]
    lda #0                                                            ; 1a5b: a9 00       ..  :192a[1]
    sbc #0                                                            ; 1a5d: e9 00       ..  :192c[1]
    sta object_x_high,x                                               ; 1a5f: 9d 66 09    .f. :192e[1]
    dex                                                               ; 1a62: ca          .   :1931[1]
    bpl subtract_from_player_x_loop                                   ; 1a63: 10 ed       ..  :1932[1]
    lda #4                                                            ; 1a65: a9 04       ..  :1934[1]
    rts                                                               ; 1a67: 60          `   :1936[1]

; If the player is off the top of the game play area, this is called. It increases the
; Y coordinate by 192 pixels = 24*8 pixels. Does the same for object one, the player's
; accessory object. Returns with A=8.
increase_player_y_coordinate_to_enter_next_room
    lda object_y_delta                                                ; 1a68: a5 70       .p  :1937[1]
; return if the player is moving in the correct direction (down) to get back on screen
    bpl return_with_a_zero                                            ; 1a6a: 10 cb       ..  :1939[1]
    ldx #1                                                            ; 1a6c: a2 01       ..  :193b[1]   ; object index (and loop counter)
add_to_player_y_loop
    lda object_y_low,x                                                ; 1a6e: bd 7c 09    .|. :193d[1]
    clc                                                               ; 1a71: 18          .   :1940[1]
    adc #$c0                                                          ; 1a72: 69 c0       i.  :1941[1]
    sta object_y_low,x                                                ; 1a74: 9d 7c 09    .|. :1943[1]
    lda #0                                                            ; 1a77: a9 00       ..  :1946[1]
    sta object_y_high,x                                               ; 1a79: 9d 92 09    ... :1948[1]
    dex                                                               ; 1a7c: ca          .   :194b[1]
    bpl add_to_player_y_loop                                          ; 1a7d: 10 ef       ..  :194c[1]
    lda #8                                                            ; 1a7f: a9 08       ..  :194e[1]
    rts                                                               ; 1a81: 60          `   :1950[1]

; If the player is off the bottom of the game play area, this is called. It reduces the
; Y coordinate by 192 pixels = 24*8 pixels. Does the same for object one, the player's
; accessory object. Returns with A=2.
decrease_player_y_coordinate_to_enter_next_room
    lda object_y_delta                                                ; 1a82: a5 70       .p  :1951[1]
; return if the player is moving in the correct direction (up) to get back on screen
    bmi return_with_a_zero                                            ; 1a84: 30 b1       0.  :1953[1]
    ldx #1                                                            ; 1a86: a2 01       ..  :1955[1]   ; object index (and loop counter)
subtract_from_player_y_loop
    lda object_y_low,x                                                ; 1a88: bd 7c 09    .|. :1957[1]
    sec                                                               ; 1a8b: 38          8   :195a[1]
    sbc #$c0                                                          ; 1a8c: e9 c0       ..  :195b[1]
    sta object_y_low,x                                                ; 1a8e: 9d 7c 09    .|. :195d[1]
    dex                                                               ; 1a91: ca          .   :1960[1]
    bpl subtract_from_player_y_loop                                   ; 1a92: 10 f4       ..  :1961[1]
    lda #2                                                            ; 1a94: a9 02       ..  :1963[1]
    rts                                                               ; 1a96: 60          `   :1965[1]

; use the value stored in the X,Y registers as an address to jump to
jmp_yx
    stx jmp_instruction+1                                             ; 1a97: 8e 6d 19    .m. :1966[1]
    sty jmp_instruction+2                                             ; 1a9a: 8c 6e 19    .n. :1969[1]
jmp_instruction
    jmp 0                                                             ; 1a9d: 4c 00 00    L.. :196c[1]

load_sprdata
    lda #<sprdata_filename                                            ; 1aa0: a9 80       ..  :196f[1]
    sta osfile_block_filename_low                                     ; 1aa2: 85 70       .p  :1971[1]
    lda #>sprdata_filename                                            ; 1aa4: a9 19       ..  :1973[1]
    sta osfile_block_filename_high                                    ; 1aa6: 85 71       .q  :1975[1]
    ldx sprdata_ptr                                                   ; 1aa8: a6 54       .T  :1977[1]
    ldy sprdata_ptr + 1                                               ; 1aaa: a4 55       .U  :1979[1]
    lda #osfile_load                                                  ; 1aac: a9 ff       ..  :197b[1]
    jmp osfile_wrapper                                                ; 1aae: 4c dc 16    L.. :197d[1]

sprdata_filename
    !text "sprdata", $0d                                              ; 1ab1: 73 70 72... spr :1980[1]

; TODO: this is used by e.g. dataA
; *************************************************************************************
; 
; Initialise or update a brazier and associated fire.
; 
; On the first update, two objects are initialised, the brazier and the fire. It
; chooses a direction based on whether a wall is to the left or right. It sets a random
; initial animation state then draws them.
; On subsequent updates, the fire animation is advanced.
; 
; On Entry:
;     A: object index for brazier
;     X,Y: cell coordinates of brazier
; On Exit:
;     A,X,Y are preserved
; 
; *************************************************************************************
update_brazier_and_fire
    sta fire_object_index                                             ; 1ab9: 8d 0f 1a    ... :1988[1]
    txa                                                               ; 1abc: 8a          .   :198b[1]   ; remember X,Y
    pha                                                               ; 1abd: 48          H   :198c[1]
    tya                                                               ; 1abe: 98          .   :198d[1]
    pha                                                               ; 1abf: 48          H   :198e[1]
    lda update_room_first_update_flag                                 ; 1ac0: ad 2b 13    .+. :198f[1]
    beq not_first_update                                              ; 1ac3: f0 51       .Q  :1992[1]
; initialise brazier and fire, if not changing rooms
    lda desired_room_index                                            ; 1ac5: a5 30       .0  :1994[1]
    cmp currently_updating_logic_for_room_index                       ; 1ac7: cd ba 1a    ... :1996[1]
    bne done_with_brazier_and_fire                                    ; 1aca: d0 47       .G  :1999[1]
; work out direction to draw brazier (left or right)
    jsr read_collision_map_value_for_xy                               ; 1acc: 20 fa 1e     .. :199b[1]
    cmp #collision_map_solid_rock                                     ; 1acf: c9 03       ..  :199e[1]
    beq brazier_position_already_blocked_so_look_left                 ; 1ad1: f0 17       ..  :19a0[1]
; block positions and draw brazier
    lda #collision_map_solid_rock                                     ; 1ad3: a9 03       ..  :19a2[1]
    jsr write_a_single_value_to_cell_in_collision_map                 ; 1ad5: 20 bb 1e     .. :19a4[1]
    iny                                                               ; 1ad8: c8          .   :19a7[1]
    lda #spriteid_brazier                                             ; 1ad9: a9 3a       .:  :19a8[1]
    jsr draw_sprite_a_at_cell_xy                                      ; 1adb: 20 4c 1f     L. :19aa[1]
    dey                                                               ; 1ade: 88          .   :19ad[1]
; increment object index past the brazier to be the fire
    inx                                                               ; 1adf: e8          .   :19ae[1]
    lda fire_object_index                                             ; 1ae0: ad 0f 1a    ... :19af[1]
; set the fire object position
    jsr set_object_position_from_cell_xy                              ; 1ae3: 20 5d 1f     ]. :19b2[1]
; fire looks right
    lda #1                                                            ; 1ae6: a9 01       ..  :19b5[1]
    bne set_fire_direction                                            ; 1ae8: d0 1b       ..  :19b7[1]   ; ALWAYS branch
brazier_position_already_blocked_so_look_left
    dex                                                               ; 1aea: ca          .   :19b9[1]
; make the brazier solid
    lda #collision_map_solid_rock                                     ; 1aeb: a9 03       ..  :19ba[1]
    jsr write_a_single_value_to_cell_in_collision_map                 ; 1aed: 20 bb 1e     .. :19bc[1]
    inx                                                               ; 1af0: e8          .   :19bf[1]
; draw brazier reflected to look left
    lda #$ff                                                          ; 1af1: a9 ff       ..  :19c0[1]
    sta sprite_reflect_flag                                           ; 1af3: 85 1d       ..  :19c2[1]
    iny                                                               ; 1af5: c8          .   :19c4[1]
    lda #spriteid_brazier                                             ; 1af6: a9 3a       .:  :19c5[1]
    jsr draw_sprite_a_at_cell_xy                                      ; 1af8: 20 4c 1f     L. :19c7[1]
    dey                                                               ; 1afb: 88          .   :19ca[1]
    dex                                                               ; 1afc: ca          .   :19cb[1]
; set fire object position
    lda fire_object_index                                             ; 1afd: ad 0f 1a    ... :19cc[1]
    jsr set_object_position_from_cell_xy                              ; 1b00: 20 5d 1f     ]. :19cf[1]
; fire looks left
    lda #$ff                                                          ; 1b03: a9 ff       ..  :19d2[1]
set_fire_direction
    ldx fire_object_index                                             ; 1b05: ae 0f 1a    ... :19d4[1]
    sta object_direction,x                                            ; 1b08: 9d be 09    ... :19d7[1]
    lda #7                                                            ; 1b0b: a9 07       ..  :19da[1]
    jsr get_random_number_up_to_a                                     ; 1b0d: 20 a6 18     .. :19dc[1]
    sta object_current_index_in_animation,x                           ; 1b10: 9d d4 09    ... :19df[1]
done_with_brazier_and_fire
    jmp set_fire_sprite_to_use                                        ; 1b13: 4c f2 19    L.. :19e2[1]

not_first_update
    lda desired_room_index                                            ; 1b16: a5 30       .0  :19e5[1]
    cmp currently_updating_logic_for_room_index                       ; 1b18: cd ba 1a    ... :19e7[1]
    bne set_fire_sprite_to_use                                        ; 1b1b: d0 06       ..  :19ea[1]
    ldx fire_object_index                                             ; 1b1d: ae 0f 1a    ... :19ec[1]
    inc object_current_index_in_animation,x                           ; 1b20: fe d4 09    ... :19ef[1]
set_fire_sprite_to_use
    lda desired_room_index                                            ; 1b23: a5 30       .0  :19f2[1]
    cmp currently_updating_logic_for_room_index                       ; 1b25: cd ba 1a    ... :19f4[1]
    bne return_with_result                                            ; 1b28: d0 0e       ..  :19f7[1]
    ldx fire_object_index                                             ; 1b2a: ae 0f 1a    ... :19f9[1]
    lda object_current_index_in_animation,x                           ; 1b2d: bd d4 09    ... :19fc[1]
    and #7                                                            ; 1b30: 29 07       ).  :19ff[1]
    clc                                                               ; 1b32: 18          .   :1a01[1]
    adc #spriteid_fire1                                               ; 1b33: 69 3c       i<  :1a02[1]
    sta object_spriteid,x                                             ; 1b35: 9d a8 09    ... :1a04[1]
return_with_result
    pla                                                               ; 1b38: 68          h   :1a07[1]   ; recall X,Y
    tay                                                               ; 1b39: a8          .   :1a08[1]
    pla                                                               ; 1b3a: 68          h   :1a09[1]
    tax                                                               ; 1b3b: aa          .   :1a0a[1]
    lda fire_object_index                                             ; 1b3c: ad 0f 1a    ... :1a0b[1]
    rts                                                               ; 1b3f: 60          `   :1a0e[1]

fire_object_index
    !byte 0                                                           ; 1b40: 00          .   :1a0f[1]

; *************************************************************************************
; 
; Update the level completion detection
; 
; Checks for colliding with the level completion spell collectable, adds the spell to
; the toolbar, and shows diamonds or sparkles as needed.
; 
; On Entry:
;     A: objectid of the spell collectable
;     (X,Y): cell position of the spell collectable
; 
; *************************************************************************************
; TODO: this is used by e.g. dataA
update_level_completion
    sta remember_obj_index                                            ; 1b41: 8d ae 1a    ... :1a10[1]   ; remember inputs
    stx remember_cell_x                                               ; 1b44: 8e af 1a    ... :1a13[1]
    sty remember_cell_y                                               ; 1b47: 8c b0 1a    ... :1a16[1]
; update diamond sprite to use
    inc diamond_sprite_index                                          ; 1b4a: ee b1 1a    ... :1a19[1]
    lda diamond_sprite_index                                          ; 1b4d: ad b1 1a    ... :1a1c[1]
    and #7                                                            ; 1b50: 29 07       ).  :1a1f[1]
    tay                                                               ; 1b52: a8          .   :1a21[1]
; set diamond sprite to use
    lda diamond_sprite_cycle,y                                        ; 1b53: b9 b2 1a    ... :1a22[1]
    sta collectable_spriteids                                         ; 1b56: 8d ed 2e    ... :1a25[1]
    sta collectable_being_used_spriteids                              ; 1b59: 8d f2 2e    ... :1a28[1]
; set toolbar sprite to use for diamond spell
    lda #spriteid_menu_item_completion_spell                          ; 1b5c: a9 21       .!  :1a2b[1]
    sta toolbar_collectable_spriteids                                 ; 1b5e: 8d e8 2e    ... :1a2d[1]
; early out if room has just changed
    lda desired_room_index                                            ; 1b61: a5 30       .0  :1a30[1]
    cmp currently_updating_logic_for_room_index                       ; 1b63: cd ba 1a    ... :1a32[1]
    bne reset_offsets_and_exit                                        ; 1b66: d0 67       .g  :1a35[1]
    lda update_room_first_update_flag                                 ; 1b68: ad 2b 13    .+. :1a37[1]
    bne skip_adding_level_completion_spell                            ; 1b6b: d0 1d       ..  :1a3a[1]
; test for collision with spell collectable
    ldx remember_obj_index                                            ; 1b6d: ae ae 1a    ... :1a3c[1]
    ldy #objectid_old_player                                          ; 1b70: a0 0b       ..  :1a3f[1]
    jsr test_for_collision_between_objects_x_and_y                    ; 1b72: 20 e2 28     .( :1a41[1]
    beq skip_adding_level_completion_spell                            ; 1b75: f0 13       ..  :1a44[1]
; collided with level completion collectable, so mark level as completed
    lda current_level                                                 ; 1b77: a5 31       .1  :1a46[1]
    sec                                                               ; 1b79: 38          8   :1a48[1]
    sbc #first_level_letter                                           ; 1b7a: e9 41       .A  :1a49[1]
    tay                                                               ; 1b7c: a8          .   :1a4b[1]
; got completion spell
    lda level_progress_table,y                                        ; 1b7d: b9 ef 09    ... :1a4c[1]
    ora #$80                                                          ; 1b80: 09 80       ..  :1a4f[1]
    sta level_progress_table,y                                        ; 1b82: 99 ef 09    ... :1a51[1]
; add level completion spell to toolbar
    lda #spriteid_menu_item_completion_spell                          ; 1b85: a9 21       .!  :1a54[1]
    jsr find_or_create_menu_slot_for_A                                ; 1b87: 20 bd 2b     .+ :1a56[1]
skip_adding_level_completion_spell
    ldx remember_obj_index                                            ; 1b8a: ae ae 1a    ... :1a59[1]
    lda #spriteid_erase_sparkles                                      ; 1b8d: a9 c5       ..  :1a5c[1]
    sta object_erase_type,x                                           ; 1b8f: 9d ac 38    ..8 :1a5e[1]
    lda #spriteid_one_pixel_masked_out                                ; 1b92: a9 00       ..  :1a61[1]
    sta object_spriteid,x                                             ; 1b94: 9d a8 09    ... :1a63[1]
; exit if level is completed
    lda current_level                                                 ; 1b97: a5 31       .1  :1a66[1]
    sec                                                               ; 1b99: 38          8   :1a68[1]
    sbc #first_level_letter                                           ; 1b9a: e9 41       .A  :1a69[1]
    tay                                                               ; 1b9c: a8          .   :1a6b[1]
    lda level_progress_table,y                                        ; 1b9d: b9 ef 09    ... :1a6c[1]
    and #$80                                                          ; 1ba0: 29 80       ).  :1a6f[1]
    bne reset_offsets_and_exit                                        ; 1ba2: d0 2b       .+  :1a71[1]
    lda #1                                                            ; 1ba4: a9 01       ..  :1a73[1]
    sta object_direction,x                                            ; 1ba6: 9d be 09    ... :1a75[1]
    lda diamond_sprite_index                                          ; 1ba9: ad b1 1a    ... :1a78[1]
    and #7                                                            ; 1bac: 29 07       ).  :1a7b[1]
    tay                                                               ; 1bae: a8          .   :1a7d[1]
    cpy #5                                                            ; 1baf: c0 05       ..  :1a7e[1]
    bcc show_sparkles                                                 ; 1bb1: 90 0d       ..  :1a80[1]
; reverse direction of animation
    lda #$ff                                                          ; 1bb3: a9 ff       ..  :1a82[1]
    sta object_direction,x                                            ; 1bb5: 9d be 09    ... :1a84[1]
    inc temp_sprite_x_offset                                          ; 1bb8: e6 3a       .:  :1a87[1]
    tya                                                               ; 1bba: 98          .   :1a89[1]
    sbc #8                                                            ; 1bbb: e9 08       ..  :1a8a[1]
    eor #$ff                                                          ; 1bbd: 49 ff       I.  :1a8c[1]
    sec                                                               ; 1bbf: 38          8   :1a8e[1]
show_sparkles
    adc #spriteid_sparkles1                                           ; 1bc0: 69 22       i"  :1a8f[1]
    sta object_spriteid,x                                             ; 1bc2: 9d a8 09    ... :1a91[1]
; A=object index
    txa                                                               ; 1bc5: 8a          .   :1a94[1]
    ldx remember_cell_x                                               ; 1bc6: ae af 1a    ... :1a95[1]
    ldy remember_cell_y                                               ; 1bc9: ac b0 1a    ... :1a98[1]
    jsr set_object_position_from_cell_xy                              ; 1bcc: 20 5d 1f     ]. :1a9b[1]
reset_offsets_and_exit
    lda #0                                                            ; 1bcf: a9 00       ..  :1a9e[1]
    sta temp_sprite_x_offset                                          ; 1bd1: 85 3a       .:  :1aa0[1]
    sta temp_sprite_y_offset                                          ; 1bd3: 85 3b       .;  :1aa2[1]
    lda remember_obj_index                                            ; 1bd5: ad ae 1a    ... :1aa4[1]
    ldx remember_cell_x                                               ; 1bd8: ae af 1a    ... :1aa7[1]
    ldy remember_cell_y                                               ; 1bdb: ac b0 1a    ... :1aaa[1]
    rts                                                               ; 1bde: 60          `   :1aad[1]

remember_obj_index
    !byte 0                                                           ; 1bdf: 00          .   :1aae[1]
remember_cell_x
    !byte 0                                                           ; 1be0: 00          .   :1aaf[1]
remember_cell_y
    !byte 0                                                           ; 1be1: 00          .   :1ab0[1]
diamond_sprite_index
    !byte 0                                                           ; 1be2: 00          .   :1ab1[1]
diamond_sprite_cycle
    !byte spriteid_diamond1                                           ; 1be3: 27          '   :1ab2[1]
    !byte spriteid_diamond2                                           ; 1be4: 28          (   :1ab3[1]
    !byte spriteid_diamond3                                           ; 1be5: 29          )   :1ab4[1]
    !byte spriteid_diamond4                                           ; 1be6: 2a          *   :1ab5[1]
    !byte spriteid_diamond5                                           ; 1be7: 2b          +   :1ab6[1]
    !byte spriteid_diamond4                                           ; 1be8: 2a          *   :1ab7[1]
    !byte spriteid_diamond3                                           ; 1be9: 29          )   :1ab8[1]
    !byte spriteid_diamond2                                           ; 1bea: 28          (   :1ab9[1]
currently_updating_logic_for_room_index
    !byte 0                                                           ; 1beb: 00          .   :1aba[1]

; *************************************************************************************
; 
; Copy one or more tiles from off screen memory to a rectangular area of cells on
; screen. A 'tile' here means a bitmap of 8x8 pixels stored in eight bytes of memory.
; 
; On Entry:
;     X and Y registers specify top left cell
;     width_in_cells_to_write: width of rectangle (in cells)
;     height_in_cells_to_write: height of rectangle (in cells)
;     source_sprite_memory: source address data to copy to screen (top left)
;     copy_mode:
;         0: 2x2 pattern
;         1: simple copy
;         power of two: choose random tile offsets less than the power of two
;         negative: strip off top bit for length of tile offsets to cycle around
;     value_to_write_to_collision_map: if non-negative, write the value into the
; collision map using the same rectangle of cells
; 
; *************************************************************************************
copy_rectangle_of_memory_to_screen
    pha                                                               ; 1bec: 48          H   :1abb[1]
    sty current_row                                                   ; 1bed: 84 7d       .}  :1abc[1]
    jsr clip_cells_to_write_to_collision_map                          ; 1bef: 20 17 1e     .. :1abe[1]
    jsr get_screen_address_from_cell_xy                               ; 1bf2: 20 66 1b     f. :1ac1[1]
    lda cell_screen_address_low                                       ; 1bf5: a5 76       .v  :1ac4[1]
    sta first_cell_in_row_screen_address_low                          ; 1bf7: 85 74       .t  :1ac6[1]
    lda cell_screen_address_high                                      ; 1bf9: a5 77       .w  :1ac8[1]
    sta first_cell_in_row_screen_address_high                         ; 1bfb: 85 75       .u  :1aca[1]
    ldx source_sprite_memory_low                                      ; 1bfd: a6 40       .@  :1acc[1]
    ldy source_sprite_memory_high                                     ; 1bff: a4 41       .A  :1ace[1]
    stx original_off_screen_address_low                               ; 1c01: 86 78       .x  :1ad0[1]
    sty original_off_screen_address_high                              ; 1c03: 84 79       .y  :1ad2[1]
    stx off_screen_address_low                                        ; 1c05: 86 7a       .z  :1ad4[1]
    sty off_screen_address_high                                       ; 1c07: 84 7b       .{  :1ad6[1]
    clc                                                               ; 1c09: 18          .   :1ad8[1]
    lda #0                                                            ; 1c0a: a9 00       ..  :1ad9[1]
    sta pattern_length_cycle_counter                                  ; 1c0c: 85 7e       .~  :1adb[1]
row_copy_loop
    ldx width_in_cells_to_write                                       ; 1c0e: a6 72       .r  :1add[1]
    lda cell_x                                                        ; 1c10: a5 70       .p  :1adf[1]
    sta cell_x_plus_current_cell_within_row                           ; 1c12: 85 7c       .|  :1ae1[1]
cell_copy_loop
    ldy #7                                                            ; 1c14: a0 07       ..  :1ae3[1]
; Choose the pattern based on copy_mode
    lda copy_mode                                                     ; 1c16: a5 42       .B  :1ae5[1]
    beq two_by_two_alternating_pattern                                ; 1c18: f0 23       .#  :1ae7[1]
    bmi negative_copy_mode                                            ; 1c1a: 30 0d       0.  :1ae9[1]
    cmp #1                                                            ; 1c1c: c9 01       ..  :1aeb[1]
    clc                                                               ; 1c1e: 18          .   :1aed[1]
    beq copy_one_tile_loop                                            ; 1c1f: f0 38       .8  :1aee[1]
    sbc #0                                                            ; 1c21: e9 00       ..  :1af0[1]   ; Subtract 1; note C cleared before beq
    jsr get_random_number_up_to_a                                     ; 1c23: 20 a6 18     .. :1af2[1]
    jmp get_final_off_screen_tile_address                             ; 1c26: 4c 14 1b    L.. :1af5[1]

; strip off top bit, subtract one and compare with pattern_length_counter
negative_copy_mode
    and #$7f                                                          ; 1c29: 29 7f       ).  :1af8[1]
    sec                                                               ; 1c2b: 38          8   :1afa[1]
    sbc #1                                                            ; 1c2c: e9 01       ..  :1afb[1]
    cmp pattern_length_cycle_counter                                  ; 1c2e: c5 7e       .~  :1afd[1]
    lda pattern_length_cycle_counter                                  ; 1c30: a5 7e       .~  :1aff[1]
    inc pattern_length_cycle_counter                                  ; 1c32: e6 7e       .~  :1b01[1]
    bcs get_final_off_screen_tile_address                             ; 1c34: b0 0f       ..  :1b03[1]
    lda #0                                                            ; 1c36: a9 00       ..  :1b05[1]
    sta pattern_length_cycle_counter                                  ; 1c38: 85 7e       .~  :1b07[1]
    jmp get_final_off_screen_tile_address                             ; 1c3a: 4c 14 1b    L.. :1b09[1]

; Set A=%(low bit of current_row)(low bit of current column), giving a 2x2 alternating
; pattern.
two_by_two_alternating_pattern
    lda cell_x_plus_current_cell_within_row                           ; 1c3d: a5 7c       .|  :1b0c[1]
    lsr                                                               ; 1c3f: 4a          J   :1b0e[1]
    lda current_row                                                   ; 1c40: a5 7d       .}  :1b0f[1]
    rol                                                               ; 1c42: 2a          *   :1b11[1]
    and #3                                                            ; 1c43: 29 03       ).  :1b12[1]
; The value in A at this point is the offset from the first tile to use. We multiply
; this by eight to get the offset of the memory address of the tile (each tile being
; eight bytes), and add to the original tile address to get the final address of the
; tile we want to use.
; (The code uses the bottom two bits of off_screen_address_high to temporarily store
; the high bits of the offset. These two bits are then extracted and added to the
; original address to get the final address).
get_final_off_screen_tile_address
    asl                                                               ; 1c45: 0a          .   :1b14[1]
    asl                                                               ; 1c46: 0a          .   :1b15[1]
    rol off_screen_address_high                                       ; 1c47: 26 7b       &{  :1b16[1]
    asl                                                               ; 1c49: 0a          .   :1b18[1]
    rol off_screen_address_high                                       ; 1c4a: 26 7b       &{  :1b19[1]
    clc                                                               ; 1c4c: 18          .   :1b1b[1]
    adc original_off_screen_address_low                               ; 1c4d: 65 78       ex  :1b1c[1]
    sta off_screen_address_low                                        ; 1c4f: 85 7a       .z  :1b1e[1]
    lda off_screen_address_high                                       ; 1c51: a5 7b       .{  :1b20[1]
    and #3                                                            ; 1c53: 29 03       ).  :1b22[1]
    adc original_off_screen_address_high                              ; 1c55: 65 79       ey  :1b24[1]
    sta off_screen_address_high                                       ; 1c57: 85 7b       .{  :1b26[1]
copy_one_tile_loop
    lda (off_screen_address_low),y                                    ; 1c59: b1 7a       .z  :1b28[1]
    sta (cell_screen_address_low),y                                   ; 1c5b: 91 76       .v  :1b2a[1]
    dey                                                               ; 1c5d: 88          .   :1b2c[1]
    bpl copy_one_tile_loop                                            ; 1c5e: 10 f9       ..  :1b2d[1]
    inc cell_x_plus_current_cell_within_row                           ; 1c60: e6 7c       .|  :1b2f[1]
    dex                                                               ; 1c62: ca          .   :1b31[1]   ; X was initialised with width_in_cells_to_write
    beq all_cells_in_row_copied                                       ; 1c63: f0 0d       ..  :1b32[1]
    lda cell_screen_address_low                                       ; 1c65: a5 76       .v  :1b34[1]
    adc #8                                                            ; 1c67: 69 08       i.  :1b36[1]
    sta cell_screen_address_low                                       ; 1c69: 85 76       .v  :1b38[1]
    bcc cell_copy_loop                                                ; 1c6b: 90 a7       ..  :1b3a[1]
    inc cell_screen_address_high                                      ; 1c6d: e6 77       .w  :1b3c[1]
    clc                                                               ; 1c6f: 18          .   :1b3e[1]
    bcc cell_copy_loop                                                ; 1c70: 90 a2       ..  :1b3f[1]   ; ALWAYS branch
all_cells_in_row_copied
    inc current_row                                                   ; 1c72: e6 7d       .}  :1b41[1]
    dec height_in_cells_to_write                                      ; 1c74: c6 73       .s  :1b43[1]
    beq now_write_to_collision_map                                    ; 1c76: f0 12       ..  :1b45[1]
; Advance first_cell_in_row_screen_address by one row and reset cell_screen_address
    lda first_cell_in_row_screen_address_low                          ; 1c78: a5 74       .t  :1b47[1]
    adc #<(cells_per_character_row * rows_per_cell)                   ; 1c7a: 69 40       i@  :1b49[1]   ; C is clear because beq above not taken
    sta first_cell_in_row_screen_address_low                          ; 1c7c: 85 74       .t  :1b4b[1]
    sta cell_screen_address_low                                       ; 1c7e: 85 76       .v  :1b4d[1]
    lda first_cell_in_row_screen_address_high                         ; 1c80: a5 75       .u  :1b4f[1]
    adc #>(cells_per_character_row * rows_per_cell)                   ; 1c82: 69 01       i.  :1b51[1]
    sta first_cell_in_row_screen_address_high                         ; 1c84: 85 75       .u  :1b53[1]
    sta cell_screen_address_high                                      ; 1c86: 85 77       .w  :1b55[1]
    bcc row_copy_loop                                                 ; 1c88: 90 84       ..  :1b57[1]   ; ALWAYS branch
now_write_to_collision_map
    ldx cell_x                                                        ; 1c8a: a6 70       .p  :1b59[1]
    ldy cell_y                                                        ; 1c8c: a4 71       .q  :1b5b[1]
    lda value_to_write_to_collision_map                               ; 1c8e: a5 3e       .>  :1b5d[1]
    bmi skip_writing_to_collision_map                                 ; 1c90: 30 03       0.  :1b5f[1]
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 1c92: 20 44 1e     D. :1b61[1]
skip_writing_to_collision_map
    pla                                                               ; 1c95: 68          h   :1b64[1]
    rts                                                               ; 1c96: 60          `   :1b65[1]

; cell_screen_address = screen_base_address + Y*$140 + X*8
get_screen_address_from_cell_xy
    lda #0                                                            ; 1c97: a9 00       ..  :1b66[1]
    sta cell_screen_address_low                                       ; 1c99: 85 76       .v  :1b68[1]
    sty cell_screen_address_high                                      ; 1c9b: 84 77       .w  :1b6a[1]
    tya                                                               ; 1c9d: 98          .   :1b6c[1]
    lsr                                                               ; 1c9e: 4a          J   :1b6d[1]
    ror cell_screen_address_low                                       ; 1c9f: 66 76       fv  :1b6e[1]
    lsr                                                               ; 1ca1: 4a          J   :1b70[1]
    ror cell_screen_address_low                                       ; 1ca2: 66 76       fv  :1b71[1]
    adc cell_screen_address_high                                      ; 1ca4: 65 77       ew  :1b73[1]
    tay                                                               ; 1ca6: a8          .   :1b75[1]
    txa                                                               ; 1ca7: 8a          .   :1b76[1]
    asl                                                               ; 1ca8: 0a          .   :1b77[1]
    asl                                                               ; 1ca9: 0a          .   :1b78[1]
    asl                                                               ; 1caa: 0a          .   :1b79[1]
    bcc skip_high_byte2                                               ; 1cab: 90 02       ..  :1b7a[1]
    iny                                                               ; 1cad: c8          .   :1b7c[1]
    clc                                                               ; 1cae: 18          .   :1b7d[1]
skip_high_byte2
    adc cell_screen_address_low                                       ; 1caf: 65 76       ev  :1b7e[1]
    sta cell_screen_address_low                                       ; 1cb1: 85 76       .v  :1b80[1]
    tya                                                               ; 1cb3: 98          .   :1b82[1]
    adc screen_base_address_high                                      ; 1cb4: 65 4c       eL  :1b83[1]
    ldy cell_screen_address_high                                      ; 1cb6: a4 77       .w  :1b85[1]
    sta cell_screen_address_high                                      ; 1cb8: 85 77       .w  :1b87[1]
    rts                                                               ; 1cba: 60          `   :1b89[1]

draw_right_facing_wall_local
    jmp draw_right_facing_wall                                        ; 1cbb: 4c 3b 1c    L;. :1b8a[1]

draw_left_wall_local
    jmp draw_left_wall                                                ; 1cbe: 4c 9d 1c    L.. :1b8d[1]

; TODO: This is called from level-specific machine code, e.g. see dataA.asm
; *************************************************************************************
; 
; Once the rocks of the room have been drawn, this function carves the floor, wall and
; ceiling tiles into the rock.
; 
; *************************************************************************************
draw_floor_walls_and_ceiling_around_solid_rock
    lda #collision_map_solid_rock                                     ; 1cc1: a9 03       ..  :1b90[1]
    sta default_collision_map_option                                  ; 1cc3: 85 44       .D  :1b92[1]
; Y is loop counter over cell rows
    ldy #game_area_height_cells - 1                                   ; 1cc5: a0 17       ..  :1b94[1]
; X is loop counter over cell columns
draw_rows_loop
    ldx #screen_width_minus_one                                       ; 1cc7: a2 27       .'  :1b96[1]
draw_columns_loop
    jsr read_collision_map_value_for_xy                               ; 1cc9: 20 fa 1e     .. :1b98[1]
    cmp #collision_map_solid_rock                                     ; 1ccc: c9 03       ..  :1b9b[1]
    bne next_cell_over                                                ; 1cce: d0 24       .$  :1b9d[1]
    inx                                                               ; 1cd0: e8          .   :1b9f[1]
    jsr read_collision_map_value_for_xy                               ; 1cd1: 20 fa 1e     .. :1ba0[1]
    dex                                                               ; 1cd4: ca          .   :1ba3[1]
    cmp #collision_map_solid_rock                                     ; 1cd5: c9 03       ..  :1ba4[1]
    bne draw_right_facing_wall_local                                  ; 1cd7: d0 e2       ..  :1ba6[1]
    dex                                                               ; 1cd9: ca          .   :1ba8[1]
    jsr read_collision_map_value_for_xy                               ; 1cda: 20 fa 1e     .. :1ba9[1]
    inx                                                               ; 1cdd: e8          .   :1bac[1]
    cmp #collision_map_solid_rock                                     ; 1cde: c9 03       ..  :1bad[1]
    bne draw_left_wall_local                                          ; 1ce0: d0 dc       ..  :1baf[1]
    dey                                                               ; 1ce2: 88          .   :1bb1[1]
    jsr read_collision_map_value_for_xy                               ; 1ce3: 20 fa 1e     .. :1bb2[1]
    iny                                                               ; 1ce6: c8          .   :1bb5[1]
    cmp #collision_map_solid_rock                                     ; 1ce7: c9 03       ..  :1bb6[1]
    bne draw_floor                                                    ; 1ce9: d0 10       ..  :1bb8[1]
    iny                                                               ; 1ceb: c8          .   :1bba[1]
    jsr read_collision_map_value_for_xy                               ; 1cec: 20 fa 1e     .. :1bbb[1]
    dey                                                               ; 1cef: 88          .   :1bbe[1]
    cmp #collision_map_solid_rock                                     ; 1cf0: c9 03       ..  :1bbf[1]
    bne draw_ceiling                                                  ; 1cf2: d0 52       .R  :1bc1[1]
next_cell_over
    dex                                                               ; 1cf4: ca          .   :1bc3[1]
    bpl draw_columns_loop                                             ; 1cf5: 10 d2       ..  :1bc4[1]
    dey                                                               ; 1cf7: 88          .   :1bc6[1]
    bpl draw_rows_loop                                                ; 1cf8: 10 cd       ..  :1bc7[1]
    rts                                                               ; 1cfa: 60          `   :1bc9[1]

; *************************************************************************************
; 
; Draw floor
; 
; On Entry:
;     (X,Y): cell coordinates
; 
; *************************************************************************************
draw_floor
    sty cell_y                                                        ; 1cfb: 84 71       .q  :1bca[1]   ; remember Y
    dey                                                               ; 1cfd: 88          .   :1bcc[1]
    jsr get_screen_address_from_cell_xy                               ; 1cfe: 20 66 1b     f. :1bcd[1]
; find tile index based on the cellX: tile index=(cellX AND 3)*2
    txa                                                               ; 1d01: 8a          .   :1bd0[1]
    and #3                                                            ; 1d02: 29 03       ).  :1bd1[1]
    asl                                                               ; 1d04: 0a          .   :1bd3[1]
    asl                                                               ; 1d05: 0a          .   :1bd4[1]
    asl                                                               ; 1d06: 0a          .   :1bd5[1]
    asl                                                               ; 1d07: 0a          .   :1bd6[1]
; add address of first floor tile
    clc                                                               ; 1d08: 18          .   :1bd7[1]
    adc #<tile_floor0_top                                             ; 1d09: 69 19       i.  :1bd8[1]
    sta off_screen_address_low                                        ; 1d0b: 85 7a       .z  :1bda[1]
    lda #0                                                            ; 1d0d: a9 00       ..  :1bdc[1]
    adc #>tile_floor0_top                                             ; 1d0f: 69 1d       i.  :1bde[1]
    sta off_screen_address_high                                       ; 1d11: 85 7b       .{  :1be0[1]
; copy tile lower six rows to screen
    ldy #7                                                            ; 1d13: a0 07       ..  :1be2[1]
draw_floor_top_loop
    lda (off_screen_address_low),y                                    ; 1d15: b1 7a       .z  :1be4[1]
    sta (cell_screen_address_low),y                                   ; 1d17: 91 76       .v  :1be6[1]
    dey                                                               ; 1d19: 88          .   :1be8[1]
    cpy #2                                                            ; 1d1a: c0 02       ..  :1be9[1]
    bcs draw_floor_top_loop                                           ; 1d1c: b0 f7       ..  :1beb[1]
; off_screen_address += bytes_per_cell
    lda off_screen_address_low                                        ; 1d1e: a5 7a       .z  :1bed[1]
    clc                                                               ; 1d20: 18          .   :1bef[1]
    adc #<bytes_per_cell                                              ; 1d21: 69 08       i.  :1bf0[1]
    sta off_screen_address_low                                        ; 1d23: 85 7a       .z  :1bf2[1]
    lda off_screen_address_high                                       ; 1d25: a5 7b       .{  :1bf4[1]
    adc #>bytes_per_cell                                              ; 1d27: 69 00       i.  :1bf6[1]
    sta off_screen_address_high                                       ; 1d29: 85 7b       .{  :1bf8[1]
    lda cell_screen_address_low                                       ; 1d2b: a5 76       .v  :1bfa[1]
; cell_screen_address += bytes_per_character_row
    clc                                                               ; 1d2d: 18          .   :1bfc[1]
    adc #<bytes_per_character_row                                     ; 1d2e: 69 40       i@  :1bfd[1]
    sta cell_screen_address_low                                       ; 1d30: 85 76       .v  :1bff[1]
    lda cell_screen_address_high                                      ; 1d32: a5 77       .w  :1c01[1]
    adc #>bytes_per_character_row                                     ; 1d34: 69 01       i.  :1c03[1]
    sta cell_screen_address_high                                      ; 1d36: 85 77       .w  :1c05[1]

; copy tile upper 6 rows to screen
    ldy #5                                                            ; 1d38: a0 05       ..  :1c07[1]
draw_floor_bottom_loop
    lda (off_screen_address_low),y                                    ; 1d3a: b1 7a       .z  :1c09[1]
    sta (cell_screen_address_low),y                                   ; 1d3c: 91 76       .v  :1c0b[1]
    dey                                                               ; 1d3e: 88          .   :1c0d[1]
    bpl draw_floor_bottom_loop                                        ; 1d3f: 10 f9       ..  :1c0e[1]
; restore Y
    ldy cell_y                                                        ; 1d41: a4 71       .q  :1c10[1]
    jmp next_cell_over                                                ; 1d43: 4c c3 1b    L.. :1c12[1]

; *************************************************************************************
; 
; Draw ceiling
; 
; On Entry:
;     (X,Y): cell coordinates
; 
; *************************************************************************************
draw_ceiling
    jsr get_screen_address_from_cell_xy                               ; 1d46: 20 66 1b     f. :1c15[1]
    txa                                                               ; 1d49: 8a          .   :1c18[1]
    and #3                                                            ; 1d4a: 29 03       ).  :1c19[1]
    asl                                                               ; 1d4c: 0a          .   :1c1b[1]
    asl                                                               ; 1d4d: 0a          .   :1c1c[1]
    asl                                                               ; 1d4e: 0a          .   :1c1d[1]
    clc                                                               ; 1d4f: 18          .   :1c1e[1]
    adc #<tile_ceiling0                                               ; 1d50: 69 59       iY  :1c1f[1]
    sta off_screen_address_low                                        ; 1d52: 85 7a       .z  :1c21[1]
    lda #0                                                            ; 1d54: a9 00       ..  :1c23[1]
    adc #>tile_ceiling0                                               ; 1d56: 69 1d       i.  :1c25[1]
    sta off_screen_address_high                                       ; 1d58: 85 7b       .{  :1c27[1]
    sty cell_y                                                        ; 1d5a: 84 71       .q  :1c29[1]
    ldy #7                                                            ; 1d5c: a0 07       ..  :1c2b[1]
copy_ceiling_tile_loop
    lda (off_screen_address_low),y                                    ; 1d5e: b1 7a       .z  :1c2d[1]
    sta (cell_screen_address_low),y                                   ; 1d60: 91 76       .v  :1c2f[1]
    dey                                                               ; 1d62: 88          .   :1c31[1]
    cpy #2                                                            ; 1d63: c0 02       ..  :1c32[1]
    bcs copy_ceiling_tile_loop                                        ; 1d65: b0 f7       ..  :1c34[1]
    ldy cell_y                                                        ; 1d67: a4 71       .q  :1c36[1]
    jmp next_cell_over                                                ; 1d69: 4c c3 1b    L.. :1c38[1]

; *************************************************************************************
; 
; Draw right facing wall, including corner pieces
; 
; On Entry:
;     (X,Y): cell coordinates
; 
; *************************************************************************************
draw_right_facing_wall
    jsr find_corner_spriteid                                          ; 1d6c: 20 f3 1c     .. :1c3b[1]
    beq normal_right_wall_not_corner                                  ; 1d6f: f0 0e       ..  :1c3e[1]
    inx                                                               ; 1d71: e8          .   :1c40[1]
    lda #$ff                                                          ; 1d72: a9 ff       ..  :1c41[1]
    sta sprite_reflect_flag                                           ; 1d74: 85 1d       ..  :1c43[1]
    lda sprite_id                                                     ; 1d76: a5 16       ..  :1c45[1]
    jsr draw_sprite_a_at_cell_xy                                      ; 1d78: 20 4c 1f     L. :1c47[1]
    dex                                                               ; 1d7b: ca          .   :1c4a[1]
    jmp move_up_and_left_to_check_if_wall_continues1                  ; 1d7c: 4c 6e 1c    Ln. :1c4b[1]

; no corner found, so the cell Y position is used to determine the tile to use
normal_right_wall_not_corner
    tya                                                               ; 1d7f: 98          .   :1c4e[1]
; find the tile to use based on tile base address + (cellY and 3)*8
    and #3                                                            ; 1d80: 29 03       ).  :1c4f[1]
    asl                                                               ; 1d82: 0a          .   :1c51[1]
    asl                                                               ; 1d83: 0a          .   :1c52[1]
    asl                                                               ; 1d84: 0a          .   :1c53[1]
    clc                                                               ; 1d85: 18          .   :1c54[1]
    adc #<tile_wall_right0                                            ; 1d86: 69 99       i.  :1c55[1]
    sta off_screen_address_low                                        ; 1d88: 85 7a       .z  :1c57[1]
    lda #0                                                            ; 1d8a: a9 00       ..  :1c59[1]
    adc #>tile_wall_right0                                            ; 1d8c: 69 1d       i.  :1c5b[1]
    sta off_screen_address_high                                       ; 1d8e: 85 7b       .{  :1c5d[1]
    ldy #7                                                            ; 1d90: a0 07       ..  :1c5f[1]
copy_right_wall_tile_loop
    lda (cell_screen_address_low),y                                   ; 1d92: b1 76       .v  :1c61[1]
; just copy the rightmost six pixels
    and #%11000000                                                    ; 1d94: 29 c0       ).  :1c63[1]
    ora (off_screen_address_low),y                                    ; 1d96: 11 7a       .z  :1c65[1]
    sta (cell_screen_address_low),y                                   ; 1d98: 91 76       .v  :1c67[1]
    dey                                                               ; 1d9a: 88          .   :1c69[1]
    bpl copy_right_wall_tile_loop                                     ; 1d9b: 10 f5       ..  :1c6a[1]
    ldy cell_y                                                        ; 1d9d: a4 71       .q  :1c6c[1]
move_up_and_left_to_check_if_wall_continues1
    inx                                                               ; 1d9f: e8          .   :1c6e[1]
    dey                                                               ; 1da0: 88          .   :1c6f[1]
    bmi not_top_corner                                                ; 1da1: 30 10       0.  :1c70[1]
    jsr read_collision_map_value_for_xy                               ; 1da3: 20 fa 1e     .. :1c72[1]
    cmp #collision_map_solid_rock                                     ; 1da6: c9 03       ..  :1c75[1]
    bne not_top_corner                                                ; 1da8: d0 09       ..  :1c77[1]
    lda #$ff                                                          ; 1daa: a9 ff       ..  :1c79[1]
    sta sprite_reflect_flag                                           ; 1dac: 85 1d       ..  :1c7b[1]
    lda #spriteid_corner_top_right                                    ; 1dae: a9 2f       ./  :1c7d[1]
    jsr draw_sprite_a_at_cell_xy                                      ; 1db0: 20 4c 1f     L. :1c7f[1]
not_top_corner
    iny                                                               ; 1db3: c8          .   :1c82[1]
    iny                                                               ; 1db4: c8          .   :1c83[1]
    cpy #24                                                           ; 1db5: c0 18       ..  :1c84[1]
    bcs finished_wall                                                 ; 1db7: b0 10       ..  :1c86[1]
    jsr read_collision_map_value_for_xy                               ; 1db9: 20 fa 1e     .. :1c88[1]
    cmp #collision_map_solid_rock                                     ; 1dbc: c9 03       ..  :1c8b[1]
    bne finished_wall                                                 ; 1dbe: d0 09       ..  :1c8d[1]
; draw final corner
    lda #$ff                                                          ; 1dc0: a9 ff       ..  :1c8f[1]
    sta sprite_reflect_flag                                           ; 1dc2: 85 1d       ..  :1c91[1]
    lda #spriteid_corner_bottom_right                                 ; 1dc4: a9 2e       ..  :1c93[1]
    jsr draw_sprite_a_at_cell_xy                                      ; 1dc6: 20 4c 1f     L. :1c95[1]
finished_wall
    dex                                                               ; 1dc9: ca          .   :1c98[1]
    dey                                                               ; 1dca: 88          .   :1c99[1]
    jmp next_cell_over                                                ; 1dcb: 4c c3 1b    L.. :1c9a[1]

; *************************************************************************************
; 
; Draw left facing wall, including corner pieces
; 
; On Entry:
;     (X,Y): cell coordinates
; 
; *************************************************************************************
draw_left_wall
    jsr find_corner_spriteid                                          ; 1dce: 20 f3 1c     .. :1c9d[1]
    beq normal_left_wall_no_corner                                    ; 1dd1: f0 06       ..  :1ca0[1]
; draw corner sprite
    jsr draw_sprite_a_at_cell_xy                                      ; 1dd3: 20 4c 1f     L. :1ca2[1]
    jmp move_up_and_left_to_check_if_wall_continues2                  ; 1dd6: 4c c8 1c    L.. :1ca5[1]

; no corner found, so the cell Y position is used to determine the tile to use
normal_left_wall_no_corner
    tya                                                               ; 1dd9: 98          .   :1ca8[1]
    and #3                                                            ; 1dda: 29 03       ).  :1ca9[1]
    asl                                                               ; 1ddc: 0a          .   :1cab[1]
    asl                                                               ; 1ddd: 0a          .   :1cac[1]
    asl                                                               ; 1dde: 0a          .   :1cad[1]
    clc                                                               ; 1ddf: 18          .   :1cae[1]
    adc #<tile_wall_left0                                             ; 1de0: 69 79       iy  :1caf[1]
    sta off_screen_address_low                                        ; 1de2: 85 7a       .z  :1cb1[1]
    lda #0                                                            ; 1de4: a9 00       ..  :1cb3[1]
    adc #>tile_wall_left0                                             ; 1de6: 69 1d       i.  :1cb5[1]
    sta off_screen_address_high                                       ; 1de8: 85 7b       .{  :1cb7[1]
    ldy #7                                                            ; 1dea: a0 07       ..  :1cb9[1]
copy_wall_tile_loop
    lda (cell_screen_address_low),y                                   ; 1dec: b1 76       .v  :1cbb[1]
; just copy the leftmost six pixels
    and #%00000011                                                    ; 1dee: 29 03       ).  :1cbd[1]
    ora (off_screen_address_low),y                                    ; 1df0: 11 7a       .z  :1cbf[1]
    sta (cell_screen_address_low),y                                   ; 1df2: 91 76       .v  :1cc1[1]
    dey                                                               ; 1df4: 88          .   :1cc3[1]
    bpl copy_wall_tile_loop                                           ; 1df5: 10 f5       ..  :1cc4[1]
    ldy cell_y                                                        ; 1df7: a4 71       .q  :1cc6[1]
move_up_and_left_to_check_if_wall_continues2
    dex                                                               ; 1df9: ca          .   :1cc8[1]
    dey                                                               ; 1dfa: 88          .   :1cc9[1]
    bmi move_to_next_row2                                             ; 1dfb: 30 0e       0.  :1cca[1]
    jsr read_collision_map_value_for_xy                               ; 1dfd: 20 fa 1e     .. :1ccc[1]
    cmp #collision_map_solid_rock                                     ; 1e00: c9 03       ..  :1ccf[1]
    bne move_to_next_row2                                             ; 1e02: d0 07       ..  :1cd1[1]
    lda #spriteid_corner_top_right                                    ; 1e04: a9 2f       ./  :1cd3[1]
    inx                                                               ; 1e06: e8          .   :1cd5[1]
    jsr draw_sprite_a_at_cell_xy                                      ; 1e07: 20 4c 1f     L. :1cd6[1]
    dex                                                               ; 1e0a: ca          .   :1cd9[1]
move_to_next_row2
    iny                                                               ; 1e0b: c8          .   :1cda[1]
    iny                                                               ; 1e0c: c8          .   :1cdb[1]
    cpy #game_area_height_cells                                       ; 1e0d: c0 18       ..  :1cdc[1]
    bcs not_corner                                                    ; 1e0f: b0 0e       ..  :1cde[1]
    jsr read_collision_map_value_for_xy                               ; 1e11: 20 fa 1e     .. :1ce0[1]
    cmp #collision_map_solid_rock                                     ; 1e14: c9 03       ..  :1ce3[1]
    bne not_corner                                                    ; 1e16: d0 07       ..  :1ce5[1]
    lda #spriteid_corner_bottom_right                                 ; 1e18: a9 2e       ..  :1ce7[1]
    inx                                                               ; 1e1a: e8          .   :1ce9[1]
    jsr draw_sprite_a_at_cell_xy                                      ; 1e1b: 20 4c 1f     L. :1cea[1]
    dex                                                               ; 1e1e: ca          .   :1ced[1]
not_corner
    inx                                                               ; 1e1f: e8          .   :1cee[1]
    dey                                                               ; 1e20: 88          .   :1cef[1]
    jmp next_cell_over                                                ; 1e21: 4c c3 1b    L.. :1cf0[1]

find_corner_spriteid
    lda #spriteid_corner_top_left                                     ; 1e24: a9 2c       .,  :1cf3[1]
    sta sprite_id                                                     ; 1e26: 85 16       ..  :1cf5[1]
    dey                                                               ; 1e28: 88          .   :1cf7[1]
    jsr read_collision_map_value_for_xy                               ; 1e29: 20 fa 1e     .. :1cf8[1]
    iny                                                               ; 1e2c: c8          .   :1cfb[1]
    cmp #collision_map_solid_rock                                     ; 1e2d: c9 03       ..  :1cfc[1]
    bne return_with_result1                                           ; 1e2f: d0 16       ..  :1cfe[1]
    lda #spriteid_corner_bottom_left                                  ; 1e31: a9 2d       .-  :1d00[1]
    sta sprite_id                                                     ; 1e33: 85 16       ..  :1d02[1]
    iny                                                               ; 1e35: c8          .   :1d04[1]
    jsr read_collision_map_value_for_xy                               ; 1e36: 20 fa 1e     .. :1d05[1]
    dey                                                               ; 1e39: 88          .   :1d08[1]
    cmp #collision_map_solid_rock                                     ; 1e3a: c9 03       ..  :1d09[1]
found_corner_spriteid
    bne return_with_result1                                           ; 1e3c: d0 09       ..  :1d0b[1]
    sty cell_y                                                        ; 1e3e: 84 71       .q  :1d0d[1]
    jsr get_screen_address_from_cell_xy                               ; 1e40: 20 66 1b     f. :1d0f[1]
    lda #spriteid_one_pixel_masked_out                                ; 1e43: a9 00       ..  :1d12[1]
    sta sprite_id                                                     ; 1e45: 85 16       ..  :1d14[1]
return_with_result1
    lda sprite_id                                                     ; 1e47: a5 16       ..  :1d16[1]
    rts                                                               ; 1e49: 60          `   :1d18[1]

tile_floor0_top
    !byte %........                                                   ; 1e4a: 00          .   :1d19[1]
    !byte %........                                                   ; 1e4b: 00          .   :1d1a[1]
    !byte %........                                                   ; 1e4c: 00          .   :1d1b[1]
    !byte %########                                                   ; 1e4d: ff          .   :1d1c[1]
    !byte %#.##.###                                                   ; 1e4e: b7          .   :1d1d[1]
    !byte %########                                                   ; 1e4f: ff          .   :1d1e[1]
    !byte %######.#                                                   ; 1e50: fd          .   :1d1f[1]
    !byte %###.####                                                   ; 1e51: ef          .   :1d20[1]
tile_floor0_bottom
    !byte %........                                                   ; 1e52: 00          .   :1d21[1]
    !byte %########                                                   ; 1e53: ff          .   :1d22[1]
    !byte %######.#                                                   ; 1e54: fd          .   :1d23[1]
    !byte %##.#####                                                   ; 1e55: df          .   :1d24[1]
    !byte %####..##                                                   ; 1e56: f3          .   :1d25[1]
    !byte %........                                                   ; 1e57: 00          .   :1d26[1]
    !byte %........                                                   ; 1e58: 00          .   :1d27[1]
    !byte %........                                                   ; 1e59: 00          .   :1d28[1]
tile_floor1_top
    !byte %........                                                   ; 1e5a: 00          .   :1d29[1]
    !byte %........                                                   ; 1e5b: 00          .   :1d2a[1]
    !byte %....##..                                                   ; 1e5c: 0c          .   :1d2b[1]
    !byte %####..##                                                   ; 1e5d: f3          .   :1d2c[1]
    !byte %#.######                                                   ; 1e5e: bf          .   :1d2d[1]
    !byte %######.#                                                   ; 1e5f: fd          .   :1d2e[1]
    !byte %###.####                                                   ; 1e60: ef          .   :1d2f[1]
    !byte %########                                                   ; 1e61: ff          .   :1d30[1]
tile_floor1_bottom
    !byte %........                                                   ; 1e62: 00          .   :1d31[1]
    !byte %########                                                   ; 1e63: ff          .   :1d32[1]
    !byte %#####.##                                                   ; 1e64: fb          .   :1d33[1]
    !byte %#.######                                                   ; 1e65: bf          .   :1d34[1]
    !byte %########                                                   ; 1e66: ff          .   :1d35[1]
    !byte %........                                                   ; 1e67: 00          .   :1d36[1]
    !byte %........                                                   ; 1e68: 00          .   :1d37[1]
    !byte %........                                                   ; 1e69: 00          .   :1d38[1]
tile_floor2_top
    !byte %........                                                   ; 1e6a: 00          .   :1d39[1]
    !byte %........                                                   ; 1e6b: 00          .   :1d3a[1]
    !byte %........                                                   ; 1e6c: 00          .   :1d3b[1]
    !byte %########                                                   ; 1e6d: ff          .   :1d3c[1]
    !byte %#.####.#                                                   ; 1e6e: bd          .   :1d3d[1]
    !byte %########                                                   ; 1e6f: ff          .   :1d3e[1]
    !byte %##.#####                                                   ; 1e70: df          .   :1d3f[1]
    !byte %#####.##                                                   ; 1e71: fb          .   :1d40[1]
tile_floor2_bottom
    !byte %.....#..                                                   ; 1e72: 04          .   :1d41[1]
    !byte %###.####                                                   ; 1e73: ef          .   :1d42[1]
    !byte %########                                                   ; 1e74: ff          .   :1d43[1]
    !byte %##.##.##                                                   ; 1e75: db          .   :1d44[1]
    !byte %########                                                   ; 1e76: ff          .   :1d45[1]
    !byte %........                                                   ; 1e77: 00          .   :1d46[1]
    !byte %........                                                   ; 1e78: 00          .   :1d47[1]
    !byte %........                                                   ; 1e79: 00          .   :1d48[1]
tile_floor3_top
    !byte %........                                                   ; 1e7a: 00          .   :1d49[1]
    !byte %........                                                   ; 1e7b: 00          .   :1d4a[1]
    !byte %..#.....                                                   ; 1e7c: 20              :1d4b[1]
    !byte %##.#####                                                   ; 1e7d: df          .   :1d4c[1]
    !byte %####.###                                                   ; 1e7e: f7          .   :1d4d[1]
    !byte %#.####.#                                                   ; 1e7f: bd          .   :1d4e[1]
    !byte %###.####                                                   ; 1e80: ef          .   :1d4f[1]
    !byte %########                                                   ; 1e81: ff          .   :1d50[1]
tile_floor3_bottom
    !byte %......#.                                                   ; 1e82: 02          .   :1d51[1]
    !byte %######.#                                                   ; 1e83: fd          .   :1d52[1]
    !byte %#.######                                                   ; 1e84: bf          .   :1d53[1]
    !byte %#####.##                                                   ; 1e85: fb          .   :1d54[1]
    !byte %###.####                                                   ; 1e86: ef          .   :1d55[1]
    !byte %........                                                   ; 1e87: 00          .   :1d56[1]
    !byte %........                                                   ; 1e88: 00          .   :1d57[1]
    !byte %........                                                   ; 1e89: 00          .   :1d58[1]
tile_ceiling0
    !byte %........                                                   ; 1e8a: 00          .   :1d59[1]
    !byte %........                                                   ; 1e8b: 00          .   :1d5a[1]
    !byte %........                                                   ; 1e8c: 00          .   :1d5b[1]
    !byte %##.#####                                                   ; 1e8d: df          .   :1d5c[1]
    !byte %######.#                                                   ; 1e8e: fd          .   :1d5d[1]
    !byte %#.######                                                   ; 1e8f: bf          .   :1d5e[1]
    !byte %####.###                                                   ; 1e90: f7          .   :1d5f[1]
    !byte %....#...                                                   ; 1e91: 08          .   :1d60[1]
tile_ceiling1
    !byte %........                                                   ; 1e92: 00          .   :1d61[1]
    !byte %........                                                   ; 1e93: 00          .   :1d62[1]
    !byte %........                                                   ; 1e94: 00          .   :1d63[1]
    !byte %########                                                   ; 1e95: ff          .   :1d64[1]
    !byte %#####.##                                                   ; 1e96: fb          .   :1d65[1]
    !byte %##.#####                                                   ; 1e97: df          .   :1d66[1]
    !byte %####.###                                                   ; 1e98: f7          .   :1d67[1]
    !byte %........                                                   ; 1e99: 00          .   :1d68[1]
tile_ceiling2
    !byte %........                                                   ; 1e9a: 00          .   :1d69[1]
    !byte %........                                                   ; 1e9b: 00          .   :1d6a[1]
    !byte %........                                                   ; 1e9c: 00          .   :1d6b[1]
    !byte %#.######                                                   ; 1e9d: bf          .   :1d6c[1]
    !byte %####.###                                                   ; 1e9e: f7          .   :1d6d[1]
    !byte %##.#####                                                   ; 1e9f: df          .   :1d6e[1]
    !byte %#####..#                                                   ; 1ea0: f9          .   :1d6f[1]
    !byte %.....##.                                                   ; 1ea1: 06          .   :1d70[1]
tile_ceiling3
    !byte %........                                                   ; 1ea2: 00          .   :1d71[1]
    !byte %........                                                   ; 1ea3: 00          .   :1d72[1]
    !byte %........                                                   ; 1ea4: 00          .   :1d73[1]
    !byte %###.####                                                   ; 1ea5: ef          .   :1d74[1]
    !byte %#####.##                                                   ; 1ea6: fb          .   :1d75[1]
    !byte %#.######                                                   ; 1ea7: bf          .   :1d76[1]
    !byte %########                                                   ; 1ea8: ff          .   :1d77[1]
    !byte %........                                                   ; 1ea9: 00          .   :1d78[1]
tile_wall_left0
    !byte %.####...                                                   ; 1eaa: 78          x   :1d79[1]
    !byte %.#.##...                                                   ; 1eab: 58          X   :1d7a[1]
    !byte %.###....                                                   ; 1eac: 70          p   :1d7b[1]
    !byte %.###....                                                   ; 1ead: 70          p   :1d7c[1]
    !byte %.#.##...                                                   ; 1eae: 58          X   :1d7d[1]
    !byte %.####...                                                   ; 1eaf: 78          x   :1d7e[1]
    !byte %.##.#...                                                   ; 1eb0: 68          h   :1d7f[1]
    !byte %.####...                                                   ; 1eb1: 78          x   :1d80[1]
tile_wall_left1
    !byte %.####...                                                   ; 1eb2: 78          x   :1d81[1]
    !byte %.##.#...                                                   ; 1eb3: 68          h   :1d82[1]
    !byte %.####...                                                   ; 1eb4: 78          x   :1d83[1]
    !byte %.#.##...                                                   ; 1eb5: 58          X   :1d84[1]
    !byte %.####...                                                   ; 1eb6: 78          x   :1d85[1]
    !byte %#.###...                                                   ; 1eb7: b8          .   :1d86[1]
    !byte %.##.#...                                                   ; 1eb8: 68          h   :1d87[1]
    !byte %.####...                                                   ; 1eb9: 78          x   :1d88[1]
tile_wall_left2
    !byte %.####...                                                   ; 1eba: 78          x   :1d89[1]
    !byte %.#.##...                                                   ; 1ebb: 58          X   :1d8a[1]
    !byte %.####...                                                   ; 1ebc: 78          x   :1d8b[1]
    !byte %.##.#...                                                   ; 1ebd: 68          h   :1d8c[1]
    !byte %.####...                                                   ; 1ebe: 78          x   :1d8d[1]
    !byte %.###....                                                   ; 1ebf: 70          p   :1d8e[1]
    !byte %.#.##...                                                   ; 1ec0: 58          X   :1d8f[1]
    !byte %.####...                                                   ; 1ec1: 78          x   :1d90[1]
tile_wall_left3
    !byte %.##.#...                                                   ; 1ec2: 68          h   :1d91[1]
    !byte %.####...                                                   ; 1ec3: 78          x   :1d92[1]
    !byte %.####...                                                   ; 1ec4: 78          x   :1d93[1]
    !byte %#.###...                                                   ; 1ec5: b8          .   :1d94[1]
    !byte %#.#.#...                                                   ; 1ec6: a8          .   :1d95[1]
    !byte %.####...                                                   ; 1ec7: 78          x   :1d96[1]
    !byte %.#.##...                                                   ; 1ec8: 58          X   :1d97[1]
    !byte %.####...                                                   ; 1ec9: 78          x   :1d98[1]
tile_wall_right0
    !byte %...####.                                                   ; 1eca: 1e          .   :1d99[1]
    !byte %...##.#.                                                   ; 1ecb: 1a          .   :1d9a[1]
    !byte %....###.                                                   ; 1ecc: 0e          .   :1d9b[1]
    !byte %....###.                                                   ; 1ecd: 0e          .   :1d9c[1]
    !byte %...##.#.                                                   ; 1ece: 1a          .   :1d9d[1]
    !byte %...####.                                                   ; 1ecf: 1e          .   :1d9e[1]
    !byte %...#.##.                                                   ; 1ed0: 16          .   :1d9f[1]
    !byte %...####.                                                   ; 1ed1: 1e          .   :1da0[1]
tile_wall_right1
    !byte %...####.                                                   ; 1ed2: 1e          .   :1da1[1]
    !byte %...#.##.                                                   ; 1ed3: 16          .   :1da2[1]
    !byte %...####.                                                   ; 1ed4: 1e          .   :1da3[1]
    !byte %...##.#.                                                   ; 1ed5: 1a          .   :1da4[1]
    !byte %...####.                                                   ; 1ed6: 1e          .   :1da5[1]
    !byte %...###.#                                                   ; 1ed7: 1d          .   :1da6[1]
    !byte %...#.##.                                                   ; 1ed8: 16          .   :1da7[1]
    !byte %...####.                                                   ; 1ed9: 1e          .   :1da8[1]
tile_wall_right2
    !byte %...####.                                                   ; 1eda: 1e          .   :1da9[1]
    !byte %...##.#.                                                   ; 1edb: 1a          .   :1daa[1]
    !byte %...####.                                                   ; 1edc: 1e          .   :1dab[1]
    !byte %...#.##.                                                   ; 1edd: 16          .   :1dac[1]
    !byte %...####.                                                   ; 1ede: 1e          .   :1dad[1]
    !byte %....###.                                                   ; 1edf: 0e          .   :1dae[1]
    !byte %...##.#.                                                   ; 1ee0: 1a          .   :1daf[1]
    !byte %...####.                                                   ; 1ee1: 1e          .   :1db0[1]
tile_wall_right3
    !byte %...#.##.                                                   ; 1ee2: 16          .   :1db1[1]
    !byte %...####.                                                   ; 1ee3: 1e          .   :1db2[1]
    !byte %...####.                                                   ; 1ee4: 1e          .   :1db3[1]
    !byte %...###.#                                                   ; 1ee5: 1d          .   :1db4[1]
    !byte %...#.#.#                                                   ; 1ee6: 15          .   :1db5[1]
    !byte %...####.                                                   ; 1ee7: 1e          .   :1db6[1]
    !byte %...##.#.                                                   ; 1ee8: 1a          .   :1db7[1]
    !byte %...####.                                                   ; 1ee9: 1e          .   :1db8[1]

; TODO: This is called from e.g. data
; *************************************************************************************
; 
; Draw rope
;     The top of the rope is a rope hook, which has collision map value 3 (solid)
;     The rope itself has collision map value 2 (climbable), including the rope end
; 
; On Entry:
;     A: rope length
;     (X,Y): cell coordinates for the top of the rope
; 
; On Exit:
;     Preserves A,X,Y
; 
; *************************************************************************************
draw_rope
    sta temp_rope_length                                              ; 1eea: 85 56       .V  :1db9[1]
    pha                                                               ; 1eec: 48          H   :1dbb[1]   ; remember A,Y
    tya                                                               ; 1eed: 98          .   :1dbc[1]
    pha                                                               ; 1eee: 48          H   :1dbd[1]
; Don't draw the rope hook if Y is zero
    beq draw_rope_loop                                                ; 1eef: f0 09       ..  :1dbe[1]
    lda #spriteid_rope_hook                                           ; 1ef1: a9 0b       ..  :1dc0[1]
    jsr draw_sprite_a_at_cell_xy                                      ; 1ef3: 20 4c 1f     L. :1dc2[1]
    lda #collision_map_solid_rock                                     ; 1ef6: a9 03       ..  :1dc5[1]
    bne write_to_collision_map                                        ; 1ef8: d0 11       ..  :1dc7[1]
draw_rope_loop
    lda temp_rope_length                                              ; 1efa: a5 56       .V  :1dc9[1]
    cmp #1                                                            ; 1efc: c9 01       ..  :1dcb[1]
    beq draw_end_of_rope                                              ; 1efe: f0 17       ..  :1dcd[1]
; cycle through the rope sprites based on Y coordinate
    tya                                                               ; 1f00: 98          .   :1dcf[1]
    and #3                                                            ; 1f01: 29 03       ).  :1dd0[1]
    clc                                                               ; 1f03: 18          .   :1dd2[1]
    adc #spriteid_rope1                                               ; 1f04: 69 55       iU  :1dd3[1]
    jsr draw_sprite_a_at_cell_xy                                      ; 1f06: 20 4c 1f     L. :1dd5[1]
    lda #collision_map_rope                                           ; 1f09: a9 02       ..  :1dd8[1]
write_to_collision_map
    jsr write_a_single_value_to_cell_in_collision_map                 ; 1f0b: 20 bb 1e     .. :1dda[1]
    dec temp_rope_length                                              ; 1f0e: c6 56       .V  :1ddd[1]
    iny                                                               ; 1f10: c8          .   :1ddf[1]
    cpy #game_area_height_cells                                       ; 1f11: c0 18       ..  :1de0[1]
    bcc draw_rope_loop                                                ; 1f13: 90 e5       ..  :1de2[1]
    bcs restore_ay_and_return                                         ; 1f15: b0 0a       ..  :1de4[1]
draw_end_of_rope
    lda #spriteid_rope_end                                            ; 1f17: a9 0a       ..  :1de6[1]
    jsr draw_sprite_a_at_cell_xy                                      ; 1f19: 20 4c 1f     L. :1de8[1]
    lda #collision_map_rope                                           ; 1f1c: a9 02       ..  :1deb[1]
    jsr write_a_single_value_to_cell_in_collision_map                 ; 1f1e: 20 bb 1e     .. :1ded[1]
restore_ay_and_return
    pla                                                               ; 1f21: 68          h   :1df0[1]   ; recall A,Y
    tay                                                               ; 1f22: a8          .   :1df1[1]
    pla                                                               ; 1f23: 68          h   :1df2[1]
    rts                                                               ; 1f24: 60          `   :1df3[1]

; *************************************************************************************
; 
; Clear the game area
; 
; Set all the game area pixels, and clear the collision map
; 
; *************************************************************************************
clear_game_area
    lda #0                                                            ; 1f25: a9 00       ..  :1df4[1]
    tay                                                               ; 1f27: a8          .   :1df6[1]
clear_collision_map_loop
    sta collision_map,y                                               ; 1f28: 99 00 0c    ... :1df7[1]
    iny                                                               ; 1f2b: c8          .   :1dfa[1]
    cpy #collision_map_length                                         ; 1f2c: c0 f0       ..  :1dfb[1]
    bne clear_collision_map_loop                                      ; 1f2e: d0 f8       ..  :1dfd[1]
    ldy #<game_area_screen_address                                    ; 1f30: a0 00       ..  :1dff[1]
    sty screen_address_low                                            ; 1f32: 84 70       .p  :1e01[1]
    ldx #>game_area_screen_address                                    ; 1f34: a2 62       .b  :1e03[1]
    stx screen_address_high                                           ; 1f36: 86 71       .q  :1e05[1]
    lda #$ff                                                          ; 1f38: a9 ff       ..  :1e07[1]
    ldx #>end_of_screen_memory                                        ; 1f3a: a2 80       ..  :1e09[1]
clear_screen_game_area_loop
    sta (screen_address_low),y                                        ; 1f3c: 91 70       .p  :1e0b[1]
    iny                                                               ; 1f3e: c8          .   :1e0d[1]
    bne clear_screen_game_area_loop                                   ; 1f3f: d0 fb       ..  :1e0e[1]
    inc screen_address_high                                           ; 1f41: e6 71       .q  :1e10[1]
    cpx screen_address_high                                           ; 1f43: e4 71       .q  :1e12[1]
    bne clear_screen_game_area_loop                                   ; 1f45: d0 f5       ..  :1e14[1]
    rts                                                               ; 1f47: 60          `   :1e16[1]

; *************************************************************************************
; 
; Clip the given rectangle of cells to the game area (right and bottom)
; 
; The game area is a grid of 40x24 cells.
; 
; On Entry:
;     X: Left cell X coordinate of rectangle
;     Y: Top cell X coordinate of rectangle
;     width_in_cells: Rectangle width
;     height_in_cells: Rectangle height
; 
; On Exit:
;     width_in_cells_to_write: Clipped rectangle width
;     height_in_cells_to_write: Clipped rectangle height
; 
; *************************************************************************************
clip_cells_to_write_to_collision_map
    stx cell_x                                                        ; 1f48: 86 70       .p  :1e17[1]
    sty cell_y                                                        ; 1f4a: 84 71       .q  :1e19[1]
    lda width_in_cells                                                ; 1f4c: a5 3c       .<  :1e1b[1]
    sta width_in_cells_to_write                                       ; 1f4e: 85 72       .r  :1e1d[1]
    lda height_in_cells                                               ; 1f50: a5 3d       .=  :1e1f[1]
    sta height_in_cells_to_write                                      ; 1f52: 85 73       .s  :1e21[1]
    txa                                                               ; 1f54: 8a          .   :1e23[1]
    clc                                                               ; 1f55: 18          .   :1e24[1]
    adc width_in_cells                                                ; 1f56: 65 3c       e<  :1e25[1]
    bcs clip_x                                                        ; 1f58: b0 04       ..  :1e27[1]
    cmp #game_area_width_cells+1                                      ; 1f5a: c9 29       .)  :1e29[1]
    bcc clipped_x_ok                                                  ; 1f5c: 90 06       ..  :1e2b[1]
clip_x
    lda #game_area_width_cells                                        ; 1f5e: a9 28       .(  :1e2d[1]
    sbc cell_x                                                        ; 1f60: e5 70       .p  :1e2f[1]
    sta width_in_cells_to_write                                       ; 1f62: 85 72       .r  :1e31[1]
clipped_x_ok
    tya                                                               ; 1f64: 98          .   :1e33[1]
    clc                                                               ; 1f65: 18          .   :1e34[1]
    adc height_in_cells                                               ; 1f66: 65 3d       e=  :1e35[1]
    bcs clip_y                                                        ; 1f68: b0 04       ..  :1e37[1]
    cmp #game_area_height_cells+1                                     ; 1f6a: c9 19       ..  :1e39[1]
    bcc return7                                                       ; 1f6c: 90 06       ..  :1e3b[1]
clip_y
    lda #game_area_height_cells                                       ; 1f6e: a9 18       ..  :1e3d[1]
    sbc cell_y                                                        ; 1f70: e5 71       .q  :1e3f[1]
    sta height_in_cells_to_write                                      ; 1f72: 85 73       .s  :1e41[1]
return7
    rts                                                               ; 1f74: 60          `   :1e43[1]

; *************************************************************************************
; 
; Write a value to a rectangle in the collision map
; 
; On Entry:
;     value_to_write_to_collision_map: Value to write
;     X: Left cell X coordinate of rectangle
;     Y: Top cell X coordinate of rectangle
;     width_in_cells: Rectangle width
;     height_in_cells: Rectangle height
; 
; On Exit:
;     Preserves A,X,Y
; 
; *************************************************************************************
write_value_to_a_rectangle_of_cells_in_collision_map
    pha                                                               ; 1f75: 48          H   :1e44[1]
    lda value_to_write_to_collision_map                               ; 1f76: a5 3e       .>  :1e45[1]
    cmp #4                                                            ; 1f78: c9 04       ..  :1e47[1]
    bcc write_value_to_rectangle_of_collision_map                     ; 1f7a: 90 03       ..  :1e49[1]
    jmp pull_and_return                                               ; 1f7c: 4c a5 1e    L.. :1e4b[1]

; value is (0-3)
write_value_to_rectangle_of_collision_map
    sta temp_value                                                    ; 1f7f: 85 49       .I  :1e4e[1]
    jsr clip_cells_to_write_to_collision_map                          ; 1f81: 20 17 1e     .. :1e50[1]
; multiply Y by 10 and store in temp_coordinate
    tya                                                               ; 1f84: 98          .   :1e53[1]
    asl                                                               ; 1f85: 0a          .   :1e54[1]
    sta temp_coordinate                                               ; 1f86: 85 4a       .J  :1e55[1]
    asl                                                               ; 1f88: 0a          .   :1e57[1]
    asl                                                               ; 1f89: 0a          .   :1e58[1]
    adc temp_coordinate                                               ; 1f8a: 65 4a       eJ  :1e59[1]
    sta temp_coordinate                                               ; 1f8c: 85 4a       .J  :1e5b[1]
; divide X by 4 and add the Y coordinate, and store in Y, the byte offset in the
; collision map
    txa                                                               ; 1f8e: 8a          .   :1e5d[1]
    lsr                                                               ; 1f8f: 4a          J   :1e5e[1]
    lsr                                                               ; 1f90: 4a          J   :1e5f[1]
    clc                                                               ; 1f91: 18          .   :1e60[1]
    adc temp_coordinate                                               ; 1f92: 65 4a       eJ  :1e61[1]
    tay                                                               ; 1f94: a8          .   :1e63[1]
; let X be the offset within the byte for the current cell (0-3)
    txa                                                               ; 1f95: 8a          .   :1e64[1]
    and #3                                                            ; 1f96: 29 03       ).  :1e65[1]
    eor #3                                                            ; 1f98: 49 03       I.  :1e67[1]
    tax                                                               ; 1f9a: aa          .   :1e69[1]
write_to_next_column_in_collision_map_loop
    lda height_in_cells_to_write                                      ; 1f9b: a5 73       .s  :1e6a[1]
    sta height_counter                                                ; 1f9d: 85 4b       .K  :1e6c[1]
    stx offset_within_byte                                            ; 1f9f: 86 74       .t  :1e6e[1]
; multiply input value (0-3) by four
    lda temp_value                                                    ; 1fa1: a5 49       .I  :1e70[1]
    asl                                                               ; 1fa3: 0a          .   :1e72[1]
    asl                                                               ; 1fa4: 0a          .   :1e73[1]
; add offset within byte in the bottom two bits
; use as the offset into the bitmask2 array
    ora offset_within_byte                                            ; 1fa5: 05 74       .t  :1e74[1]
    tax                                                               ; 1fa7: aa          .   :1e76[1]
    lda value_to_write_into_collision_map_table,x                     ; 1fa8: bd ab 1e    ... :1e77[1]
    ldx offset_within_byte                                            ; 1fab: a6 74       .t  :1e7a[1]
; store the value to write in the 'offset_within_byte' variable
    sta offset_within_byte                                            ; 1fad: 85 74       .t  :1e7c[1]
    sty offset_within_collision_map                                   ; 1faf: 84 75       .u  :1e7e[1]
write_to_next_row_in_collision_map_loop
    lda collision_map,y                                               ; 1fb1: b9 00 0c    ... :1e80[1]   ; read from current collision map
    and bitmask_of_bits_to_keep_from_collision_map_table,x            ; 1fb4: 3d a7 1e    =.. :1e83[1]   ; mask out the bits for the current cell
    ora offset_within_byte                                            ; 1fb7: 05 74       .t  :1e86[1]   ; OR in the new bits for the cell
    sta collision_map,y                                               ; 1fb9: 99 00 0c    ... :1e88[1]   ; write the new value back to the collision map
    tya                                                               ; 1fbc: 98          .   :1e8b[1]   ; add 10 to Y to move to next row
    adc #10                                                           ; 1fbd: 69 0a       i.  :1e8c[1]
    tay                                                               ; 1fbf: a8          .   :1e8e[1]
    dec height_counter                                                ; 1fc0: c6 4b       .K  :1e8f[1]   ; loop counter
    bne write_to_next_row_in_collision_map_loop                       ; 1fc2: d0 ed       ..  :1e91[1]
    ldy offset_within_collision_map                                   ; 1fc4: a4 75       .u  :1e93[1]
; X is the offset within the byte to write to (0-3)
    dex                                                               ; 1fc6: ca          .   :1e95[1]
    bpl try_next_cell_across                                          ; 1fc7: 10 03       ..  :1e96[1]
    ldx #3                                                            ; 1fc9: a2 03       ..  :1e98[1]   ; move to next byte
    iny                                                               ; 1fcb: c8          .   :1e9a[1]
try_next_cell_across
    dec width_in_cells_to_write                                       ; 1fcc: c6 72       .r  :1e9b[1]
    bne write_to_next_column_in_collision_map_loop                    ; 1fce: d0 cb       ..  :1e9d[1]
    lda temp_value                                                    ; 1fd0: a5 49       .I  :1e9f[1]
    ldx cell_x                                                        ; 1fd2: a6 70       .p  :1ea1[1]
    ldy cell_y                                                        ; 1fd4: a4 71       .q  :1ea3[1]
pull_and_return
    pla                                                               ; 1fd6: 68          h   :1ea5[1]
    rts                                                               ; 1fd7: 60          `   :1ea6[1]

bitmask_of_bits_to_keep_from_collision_map_table
    !byte %00111111, %11001111, %11110011, %11111100                  ; 1fd8: 3f cf f3... ?.. :1ea7[1]
value_to_write_into_collision_map_table
    !byte %00000000, %00000000, %00000000, %00000000                  ; 1fdc: 00 00 00... ... :1eab[1]
    !byte %01000000, %00010000, %00000100, %00000001                  ; 1fe0: 40 10 04... @.. :1eaf[1]
    !byte %10000000, %00100000, %00001000, %00000010                  ; 1fe4: 80 20 08... . . :1eb3[1]
    !byte %11000000, %00110000, %00001100, %00000011                  ; 1fe8: c0 30 0c... .0. :1eb7[1]

; TODO: this is used by e.g. dataA
; *************************************************************************************
; 
; Write a value to a single cell in the collision map
; 
; On Entry:
;     A: Value to write
;     X: Cell X coordinate
;     Y: Cell Y coordinate
; 
; On Exit:
;     Preserves A,X,Y
; 
; *************************************************************************************
write_a_single_value_to_cell_in_collision_map
    and #3                                                            ; 1fec: 29 03       ).  :1ebb[1]
    sta temp_value                                                    ; 1fee: 85 49       .I  :1ebd[1]   ; remember value to write
    txa                                                               ; 1ff0: 8a          .   :1ebf[1]   ; remember X,Y
    pha                                                               ; 1ff1: 48          H   :1ec0[1]
    tya                                                               ; 1ff2: 98          .   :1ec1[1]
    pha                                                               ; 1ff3: 48          H   :1ec2[1]
; multiply A by ten, and store in temp_coordinate
    asl                                                               ; 1ff4: 0a          .   :1ec3[1]
    sta temp_coordinate                                               ; 1ff5: 85 4a       .J  :1ec4[1]
    asl                                                               ; 1ff7: 0a          .   :1ec6[1]
    asl                                                               ; 1ff8: 0a          .   :1ec7[1]
    adc temp_coordinate                                               ; 1ff9: 65 4a       eJ  :1ec8[1]
    sta temp_coordinate                                               ; 1ffb: 85 4a       .J  :1eca[1]
; divide X by four and add temp_coordinate. This is the offset into the collision map,
; stored in Y.
    txa                                                               ; 1ffd: 8a          .   :1ecc[1]
    lsr                                                               ; 1ffe: 4a          J   :1ecd[1]
    lsr                                                               ; 1fff: 4a          J   :1ece[1]
    clc                                                               ; 2000: 18          .   :1ecf[1]
    adc temp_coordinate                                               ; 2001: 65 4a       eJ  :1ed0[1]
    tay                                                               ; 2003: a8          .   :1ed2[1]
; store the offset within the byte in temp_coordinate (0-3)
    txa                                                               ; 2004: 8a          .   :1ed3[1]
    and #3                                                            ; 2005: 29 03       ).  :1ed4[1]
    eor #3                                                            ; 2007: 49 03       I.  :1ed6[1]
    sta temp_coordinate                                               ; 2009: 85 4a       .J  :1ed8[1]
; get the value to write multiplied by four and add the offset within the byte. This is
; the index into the table for the value to write
    lda temp_value                                                    ; 200b: a5 49       .I  :1eda[1]
    asl                                                               ; 200d: 0a          .   :1edc[1]
    asl                                                               ; 200e: 0a          .   :1edd[1]
    ora temp_coordinate                                               ; 200f: 05 4a       .J  :1ede[1]
    tax                                                               ; 2011: aa          .   :1ee0[1]
; get the value to write
    lda value_to_write_into_collision_map_table,x                     ; 2012: bd ab 1e    ... :1ee1[1]
; store the value to write in temp_coordinate, but first put it's previous value (the
; offset within the byte) into X
    ldx temp_coordinate                                               ; 2015: a6 4a       .J  :1ee4[1]
    sta temp_coordinate                                               ; 2017: 85 4a       .J  :1ee6[1]
; write the new value into the collision map, based on some bits from the old value and
; the new value bits being written, similar to the routine above.
    lda collision_map,y                                               ; 2019: b9 00 0c    ... :1ee8[1]
    and bitmask_of_bits_to_keep_from_collision_map_table,x            ; 201c: 3d a7 1e    =.. :1eeb[1]
    ora temp_coordinate                                               ; 201f: 05 4a       .J  :1eee[1]
    sta collision_map,y                                               ; 2021: 99 00 0c    ... :1ef0[1]
; restore X,Y and A
    pla                                                               ; 2024: 68          h   :1ef3[1]   ; recall X,Y
    tay                                                               ; 2025: a8          .   :1ef4[1]
    pla                                                               ; 2026: 68          h   :1ef5[1]
    tax                                                               ; 2027: aa          .   :1ef6[1]
    lda temp_value                                                    ; 2028: a5 49       .I  :1ef7[1]
    rts                                                               ; 202a: 60          `   :1ef9[1]

; *************************************************************************************
; 
; Read a two bit value from the collision map at X,Y
; 
; On Entry:
;     (X,Y): cell position to read the collision map
; 
; On Exit:
;     A: holds value 0-3 from the collision map
; 
; *************************************************************************************
read_collision_map_value_for_xy
    cpx #game_area_width_cells                                        ; 202b: e0 28       .(  :1efa[1]
    bcs outside_game_area                                             ; 202d: b0 2f       ./  :1efc[1]
    cpy #game_area_height_cells                                       ; 202f: c0 18       ..  :1efe[1]
    bcs outside_game_area                                             ; 2031: b0 2b       .+  :1f00[1]
    stx saved_x                                                       ; 2033: 86 4a       .J  :1f02[1]
    sty saved_y                                                       ; 2035: 84 4b       .K  :1f04[1]
; Set temp_value=10*Y
retry_read_collision_map
    tya                                                               ; 2037: 98          .   :1f06[1]
    asl                                                               ; 2038: 0a          .   :1f07[1]
    sta temp_value                                                    ; 2039: 85 49       .I  :1f08[1]
    asl                                                               ; 203b: 0a          .   :1f0a[1]
    asl                                                               ; 203c: 0a          .   :1f0b[1]
    adc temp_value                                                    ; 203d: 65 49       eI  :1f0c[1]
    sta temp_value                                                    ; 203f: 85 49       .I  :1f0e[1]
; Set Y=temp_value+X/4
    txa                                                               ; 2041: 8a          .   :1f10[1]
    lsr                                                               ; 2042: 4a          J   :1f11[1]
    lsr                                                               ; 2043: 4a          J   :1f12[1]
    clc                                                               ; 2044: 18          .   :1f13[1]
    adc temp_value                                                    ; 2045: 65 49       eI  :1f14[1]
    tay                                                               ; 2047: a8          .   :1f16[1]

    txa                                                               ; 2048: 8a          .   :1f17[1]
    and #3                                                            ; 2049: 29 03       ).  :1f18[1]
    tax                                                               ; 204b: aa          .   :1f1a[1]
    lda collision_map,y                                               ; 204c: b9 00 0c    ... :1f1b[1]
    jmp right_shift_a_by_2x                                           ; 204f: 4c 23 1f    L#. :1f1e[1]

right_shift_a_by_2x_loop
    lsr                                                               ; 2052: 4a          J   :1f21[1]
    lsr                                                               ; 2053: 4a          J   :1f22[1]
right_shift_a_by_2x
    dex                                                               ; 2054: ca          .   :1f23[1]
    bpl right_shift_a_by_2x_loop                                      ; 2055: 10 fb       ..  :1f24[1]
    ldx saved_x                                                       ; 2057: a6 4a       .J  :1f26[1]
    ldy saved_y                                                       ; 2059: a4 4b       .K  :1f28[1]
    and #3                                                            ; 205b: 29 03       ).  :1f2a[1]
return8
    rts                                                               ; 205d: 60          `   :1f2c[1]

outside_game_area
    lda default_collision_map_option                                  ; 205e: a5 44       .D  :1f2d[1]
    bpl return8                                                       ; 2060: 10 fb       ..  :1f2f[1]
    stx saved_x                                                       ; 2062: 86 4a       .J  :1f31[1]
    sty saved_y                                                       ; 2064: 84 4b       .K  :1f33[1]
; next time, read from leftmost column
    ldx #0                                                            ; 2066: a2 00       ..  :1f35[1]
    lda saved_x                                                       ; 2068: a5 4a       .J  :1f37[1]
    bmi retry_read_collision_map                                      ; 206a: 30 cb       0.  :1f39[1]
; next time, read from rightmost column
    ldx #game_area_width_cells-1                                      ; 206c: a2 27       .'  :1f3b[1]
    cmp #game_area_width_cells                                        ; 206e: c9 28       .(  :1f3d[1]
    bcs retry_read_collision_map                                      ; 2070: b0 c5       ..  :1f3f[1]
    tax                                                               ; 2072: aa          .   :1f41[1]
; next time, read from topmost column
    ldy #0                                                            ; 2073: a0 00       ..  :1f42[1]
    lda saved_y                                                       ; 2075: a5 4b       .K  :1f44[1]
    bmi retry_read_collision_map                                      ; 2077: 30 be       0.  :1f46[1]
; next time, read from bottommost column
    ldy #game_area_height_cells-1                                     ; 2079: a0 17       ..  :1f48[1]
    bne retry_read_collision_map                                      ; 207b: d0 ba       ..  :1f4a[1]   ; ALWAYS branch
; TODO: this is used by e.g. dataA
; *************************************************************************************
; 
; Draw a sprite at a cell position
; 
; On Entry:
;     A: spriteid
;     (X,Y): cell coordinates
; 
; On Exit:
;     Preserves A,X,Y
; 
; *************************************************************************************
draw_sprite_a_at_cell_xy
    sta sprite_id                                                     ; 207d: 85 16       ..  :1f4c[1]
    jsr set_sprite_pixel_position_to_cell_xy_plus_pixel_offset        ; 207f: 20 84 1f     .. :1f4e[1]
    jsr sprite_op                                                     ; 2082: 20 8d 13     .. :1f51[1]
    lda sprite_id                                                     ; 2085: a5 16       ..  :1f54[1]
    rts                                                               ; 2087: 60          `   :1f56[1]

; TODO: This is called from e.g. dataA
; *************************************************************************************
; 
; Draw a sprite at a cell position, and write a rectangle of values into the collision
; map
; 
; On Entry:
;     A: spriteid
;     (X,Y): cell coordinates
;     value_to_write_to_collision_map: value to write
;     width_in_cells: rectangle width
;     height_in_cells: rectangle height
; 
; On Exit:
;     Preserves A,X,Y
; 
; *************************************************************************************
draw_sprite_a_at_cell_xy_and_write_to_collision_map
    jsr draw_sprite_a_at_cell_xy                                      ; 2088: 20 4c 1f     L. :1f57[1]
    jmp write_value_to_a_rectangle_of_cells_in_collision_map          ; 208b: 4c 44 1e    LD. :1f5a[1]

; TODO: this is used by e.g. dataA
; *************************************************************************************
; 
; Set object's position based on a cell XY position
; 
; On Entry:
;     A: object index
;     (X,Y): cell coordinates
; 
; On Exit:
;     Preserves A,X,Y
; 
; *************************************************************************************
set_object_position_from_cell_xy
    jsr set_sprite_pixel_position_to_cell_xy_plus_pixel_offset        ; 208e: 20 84 1f     .. :1f5d[1]
    stx remember_x                                                    ; 2091: 8e 6c 1f    .l. :1f60[1]
    tax                                                               ; 2094: aa          .   :1f63[1]
    jsr set_object_position_from_current_sprite_position              ; 2095: 20 6d 1f     m. :1f64[1]
    txa                                                               ; 2098: 8a          .   :1f67[1]
    ldx remember_x                                                    ; 2099: ae 6c 1f    .l. :1f68[1]
    rts                                                               ; 209c: 60          `   :1f6b[1]

remember_x
    !byte 0                                                           ; 209d: 00          .   :1f6c[1]

; *************************************************************************************
; 
; Set object position from sprite coordinates
; 
; On Entry:
;     X: object index
;     (sprite_x_base, sprite_y_base): pixel position to set
; 
; On Exit:
;     Preserves A,X,Y
; 
; *************************************************************************************
; TODO: this is used by e.g. dataA
set_object_position_from_current_sprite_position
    pha                                                               ; 209e: 48          H   :1f6d[1]
    lda sprite_x_base_low                                             ; 209f: a5 18       ..  :1f6e[1]
    sta object_x_low,x                                                ; 20a1: 9d 50 09    .P. :1f70[1]
    lda sprite_x_base_high                                            ; 20a4: a5 19       ..  :1f73[1]
    sta object_x_high,x                                               ; 20a6: 9d 66 09    .f. :1f75[1]
    lda sprite_y_base_low                                             ; 20a9: a5 1a       ..  :1f78[1]
    sta object_y_low,x                                                ; 20ab: 9d 7c 09    .|. :1f7a[1]
    lda sprite_y_base_high                                            ; 20ae: a5 1b       ..  :1f7d[1]
    sta object_y_high,x                                               ; 20b0: 9d 92 09    ... :1f7f[1]
    pla                                                               ; 20b3: 68          h   :1f82[1]
    rts                                                               ; 20b4: 60          `   :1f83[1]

; *************************************************************************************
; 
; Set the current sprite position to a cell XY plus a pixel offset
; 
; On Entry:
;     (X,Y): cell coordinates (can be negative)
;     temp_sprite_x_offset: Add pixel offset to the result (then reset to zero on exit)
;     temp_sprite_y_offset: Add pixel offset to the result (then reset to zero on exit)
; 
; On Exit:
;     (sprite_x_base, sprite_y_base): pixel position
;     Preserves A,X,Y
; 
; *************************************************************************************
set_sprite_pixel_position_to_cell_xy_plus_pixel_offset
    pha                                                               ; 20b5: 48          H   :1f84[1]   ; remember A,X,Y
    txa                                                               ; 20b6: 8a          .   :1f85[1]
    pha                                                               ; 20b7: 48          H   :1f86[1]
    tya                                                               ; 20b8: 98          .   :1f87[1]
    pha                                                               ; 20b9: 48          H   :1f88[1]
    txa                                                               ; 20ba: 8a          .   :1f89[1]
    asl                                                               ; 20bb: 0a          .   :1f8a[1]
    asl                                                               ; 20bc: 0a          .   :1f8b[1]
    asl                                                               ; 20bd: 0a          .   :1f8c[1]
    sta sprite_x_base_low                                             ; 20be: 85 18       ..  :1f8d[1]
    txa                                                               ; 20c0: 8a          .   :1f8f[1]
    and #$80                                                          ; 20c1: 29 80       ).  :1f90[1]
    beq positive_x_cell                                               ; 20c3: f0 02       ..  :1f92[1]
    lda #$ff                                                          ; 20c5: a9 ff       ..  :1f94[1]
positive_x_cell
    rol                                                               ; 20c7: 2a          *   :1f96[1]
    sta sprite_x_base_high                                            ; 20c8: 85 19       ..  :1f97[1]
    ldx #0                                                            ; 20ca: a2 00       ..  :1f99[1]
    lda temp_sprite_x_offset                                          ; 20cc: a5 3a       .:  :1f9b[1]
    bpl positive_x_pixel                                              ; 20ce: 10 01       ..  :1f9d[1]
    dex                                                               ; 20d0: ca          .   :1f9f[1]
positive_x_pixel
    clc                                                               ; 20d1: 18          .   :1fa0[1]
    adc sprite_x_base_low                                             ; 20d2: 65 18       e.  :1fa1[1]
    sta sprite_x_base_low                                             ; 20d4: 85 18       ..  :1fa3[1]
    txa                                                               ; 20d6: 8a          .   :1fa5[1]
    adc sprite_x_base_high                                            ; 20d7: 65 19       e.  :1fa6[1]
    sta sprite_x_base_high                                            ; 20d9: 85 19       ..  :1fa8[1]
    tya                                                               ; 20db: 98          .   :1faa[1]
    asl                                                               ; 20dc: 0a          .   :1fab[1]
    asl                                                               ; 20dd: 0a          .   :1fac[1]
    asl                                                               ; 20de: 0a          .   :1fad[1]
    sta sprite_y_base_low                                             ; 20df: 85 1a       ..  :1fae[1]
    tya                                                               ; 20e1: 98          .   :1fb0[1]
    and #$80                                                          ; 20e2: 29 80       ).  :1fb1[1]
    beq positive_y_cell                                               ; 20e4: f0 02       ..  :1fb3[1]
    lda #$ff                                                          ; 20e6: a9 ff       ..  :1fb5[1]
positive_y_cell
    rol                                                               ; 20e8: 2a          *   :1fb7[1]
    sta sprite_y_base_high                                            ; 20e9: 85 1b       ..  :1fb8[1]
    ldy #0                                                            ; 20eb: a0 00       ..  :1fba[1]
    lda temp_sprite_y_offset                                          ; 20ed: a5 3b       .;  :1fbc[1]
    bpl positive_y_pixel                                              ; 20ef: 10 01       ..  :1fbe[1]
    dey                                                               ; 20f1: 88          .   :1fc0[1]
positive_y_pixel
    clc                                                               ; 20f2: 18          .   :1fc1[1]
    adc sprite_y_base_low                                             ; 20f3: 65 1a       e.  :1fc2[1]
    sta sprite_y_base_low                                             ; 20f5: 85 1a       ..  :1fc4[1]
    tya                                                               ; 20f7: 98          .   :1fc6[1]
    adc sprite_y_base_high                                            ; 20f8: 65 1b       e.  :1fc7[1]
    sta sprite_y_base_high                                            ; 20fa: 85 1b       ..  :1fc9[1]
    lda #0                                                            ; 20fc: a9 00       ..  :1fcb[1]
    sta temp_sprite_x_offset                                          ; 20fe: 85 3a       .:  :1fcd[1]
    sta temp_sprite_y_offset                                          ; 2100: 85 3b       .;  :1fcf[1]
    pla                                                               ; 2102: 68          h   :1fd1[1]   ; recall A,X,Y
    tay                                                               ; 2103: a8          .   :1fd2[1]
    pla                                                               ; 2104: 68          h   :1fd3[1]
    tax                                                               ; 2105: aa          .   :1fd4[1]
    pla                                                               ; 2106: 68          h   :1fd5[1]
    rts                                                               ; 2107: 60          `   :1fd6[1]

; *************************************************************************************
; 
; Update objects
; 
; Draws and undraws objects, taking into account z-order.
; 
; The z-order values range from $00 at the front, $80 at the midpoint (where the player
; is) and $ff at the back.
; 
; Objects are (a) undrawn from front to back, then (b) redrawn from back to front.
; Objects are not redrawn if their state remains unchanged ('inactive'), unless they
; need to be because there's an active object behind them.
; 
; The algorithm used to do this is:
; 
; 1. Mark all objects as 'not dealt with'
; 2. Find the backmost object that is (a) undealt with (b) has a sprite and (c) has
; changed state ('active').
; 3. If none found (i.e. all that need to be dealt with have been), then update (copy)
; the state of the inactive objects and return.
; 4. Mark the active object as dealt with.
; 5. Append the object to a list of active objects.
; 6. Append any inactive objects that are in front of this active object. Those
; inactive objects are marked as 'dealt with'.
; 7. Goto 4 if more inactive objects were appended to the active list to deal with them
; and append anything in front of them.
; 8. Sort the active objects list from front to back.
; 9. Undraw the active objects (front to back).
; 10. Draw the active objects (back to front).
; 11. Goto 2.
; 
; Object state is stored in 'object_*' memory locations, and the state of the
; previously drawn objects is in 'object_*_old' memory locations.
; 
; *************************************************************************************
update_objects
    lda player_held_object_spriteid                                   ; 2108: a5 52       .R  :1fd7[1]
    pha                                                               ; 210a: 48          H   :1fd9[1]
    lda #0                                                            ; 210b: a9 00       ..  :1fda[1]
    sta player_held_object_spriteid                                   ; 210d: 85 52       .R  :1fdc[1]
; mark all objects as 'not dealt with' yet
    lda #0                                                            ; 210f: a9 00       ..  :1fde[1]
    tax                                                               ; 2111: aa          .   :1fe0[1]
reset_object_dealt_with_flags_loop
    sta object_dealt_with_flag,x                                      ; 2112: 9d 16 01    ... :1fe1[1]
    inx                                                               ; 2115: e8          .   :1fe4[1]
    cpx #max_objects                                                  ; 2116: e0 0b       ..  :1fe5[1]
    bcc reset_object_dealt_with_flags_loop                            ; 2118: 90 f8       ..  :1fe7[1]
; find the object that is at the back
find_backmost_object_not_dealt_with_yet
    ldx #0                                                            ; 211a: a2 00       ..  :1fe9[1]
    stx num_active_objects                                            ; 211c: 86 62       .b  :1feb[1]
    stx temp_active_object_index                                      ; 211e: 86 63       .c  :1fed[1]
; initialise the backmost object index to be $ff (nothing found yet), and at the front
; (z-order $00)
    lda #$ff                                                          ; 2120: a9 ff       ..  :1fef[1]
    sta backmost_object_index                                         ; 2122: 85 60       .`  :1ff1[1]
    stx backmost_object_z_order                                       ; 2124: 86 61       .a  :1ff3[1]
find_backmost_object_loop
    lda object_dealt_with_flag,x                                      ; 2126: bd 16 01    ... :1ff5[1]
    bne try_next_object                                               ; 2129: d0 13       ..  :1ff8[1]
; object doesn't count if it has no sprites
    lda object_spriteid,x                                             ; 212b: bd a8 09    ... :1ffa[1]
    ora object_spriteid_old,x                                         ; 212e: 1d b3 09    ... :1ffd[1]
    beq try_next_object                                               ; 2131: f0 0b       ..  :2000[1]
; check object X z-order against the best so far
    lda object_z_order,x                                              ; 2133: bd c2 38    ..8 :2002[1]
    cmp backmost_object_z_order                                       ; 2136: c5 61       .a  :2005[1]
    bcc try_next_object                                               ; 2138: 90 04       ..  :2007[1]
; found new backmost object, store it's index and z-order
    sta backmost_object_z_order                                       ; 213a: 85 61       .a  :2009[1]
    stx backmost_object_index                                         ; 213c: 86 60       .`  :200b[1]
try_next_object
    inx                                                               ; 213e: e8          .   :200d[1]
    cpx #max_objects                                                  ; 213f: e0 0b       ..  :200e[1]
    bcc find_backmost_object_loop                                     ; 2141: 90 e3       ..  :2010[1]
; check if we found a backmost object
    ldx backmost_object_index                                         ; 2143: a6 60       .`  :2012[1]
    bpl found_backmost_object                                         ; 2145: 10 11       ..  :2014[1]
; after dealing with all active objects, update the state of the inactive ones
    ldx #max_objects-1                                                ; 2147: a2 0a       ..  :2016[1]
update_non_active_object_state_loop
    lda object_dealt_with_flag,x                                      ; 2149: bd 16 01    ... :2018[1]
    bne skip_objects_already_dealt_with                               ; 214c: d0 03       ..  :201b[1]
    jsr copy_object_state_to_old                                      ; 214e: 20 f7 20     .  :201d[1]
skip_objects_already_dealt_with
    dex                                                               ; 2151: ca          .   :2020[1]
    bpl update_non_active_object_state_loop                           ; 2152: 10 f5       ..  :2021[1]
; restore the player held object
    pla                                                               ; 2154: 68          h   :2023[1]
    sta player_held_object_spriteid                                   ; 2155: 85 52       .R  :2024[1]
    rts                                                               ; 2157: 60          `   :2026[1]

found_backmost_object
    lda #$ff                                                          ; 2158: a9 ff       ..  :2027[1]   ; mark object as dealt with
    sta object_dealt_with_flag,x                                      ; 215a: 9d 16 01    ... :2029[1]
; Look for active objects. If the object hasn't changed state, move to the next object
    jsr has_object_changed_state                                      ; 215d: 20 1e 21     .! :202c[1]
    beq find_backmost_object_not_dealt_with_yet                       ; 2160: f0 b8       ..  :202f[1]
; append the active object to the active_objects_table
    txa                                                               ; 2162: 8a          .   :2031[1]
    ldx num_active_objects                                            ; 2163: a6 62       .b  :2032[1]
    sta active_objects_table,x                                        ; 2165: 9d 00 01    ... :2034[1]
    inc num_active_objects                                            ; 2168: e6 62       .b  :2037[1]
process_active_objects_loop
    ldx temp_active_object_index                                      ; 216a: a6 63       .c  :2039[1]
    ldy active_objects_table,x                                        ; 216c: bc 00 01    ... :203b[1]
    sty backmost_object_index                                         ; 216f: 84 60       .`  :203e[1]
    lda object_z_order,y                                              ; 2171: b9 c2 38    ..8 :2040[1]
    sta backmost_object_z_order                                       ; 2174: 85 61       .a  :2043[1]

; this whole next section looks for any inactive objects that (a) are in front of and
; (b) intersect with the latest active object. These are added to the active object
; list too. This determines the drawing order.
    ldx #0                                                            ; 2176: a2 00       ..  :2045[1]
loop_over_all_objects_x
    txa                                                               ; 2178: 8a          .   :2047[1]
; find inactive objects. i.e. if object x is found in the active objects table, skip it
; and try the next object
    ldy #0                                                            ; 2179: a0 00       ..  :2048[1]
find_object_y_loop
    cmp active_objects_table,y                                        ; 217b: d9 00 01    ... :204a[1]
    beq move_to_next_object_x                                         ; 217e: f0 3e       .>  :204d[1]
    iny                                                               ; 2180: c8          .   :204f[1]
    cpy num_active_objects                                            ; 2181: c4 62       .b  :2050[1]
    bcc find_object_y_loop                                            ; 2183: 90 f6       ..  :2052[1]
; found an inactive object x. If it's in front of the backmost active object, test it
; for collision
    lda object_z_order,x                                              ; 2185: bd c2 38    ..8 :2054[1]
    cmp backmost_object_z_order                                       ; 2188: c5 61       .a  :2057[1]
    bcc test_for_collision                                            ; 218a: 90 06       ..  :2059[1]
; to resolve equal z orders, look at the index. i.e. if the object x has the same z
; order as the backmost active object and a smaller index, also test for collision.
    bne move_to_next_object_x                                         ; 218c: d0 30       .0  :205b[1]
    cpx backmost_object_index                                         ; 218e: e4 60       .`  :205d[1]
    bcs move_to_next_object_x                                         ; 2190: b0 2c       .,  :205f[1]
test_for_collision
    stx temp_object_index                                             ; 2192: 86 64       .d  :2061[1]
    txa                                                               ; 2194: 8a          .   :2063[1]
    clc                                                               ; 2195: 18          .   :2064[1]
    adc #max_objects                                                  ; 2196: 69 0b       i.  :2065[1]
    tax                                                               ; 2198: aa          .   :2067[1]
    ldy backmost_object_index                                         ; 2199: a4 60       .`  :2068[1]
    jsr test_for_collision_between_objects_x_and_y                    ; 219b: 20 e2 28     .( :206a[1]
    bne found_collision                                               ; 219e: d0 0e       ..  :206d[1]
    tya                                                               ; 21a0: 98          .   :206f[1]
    clc                                                               ; 21a1: 18          .   :2070[1]
    adc #max_objects                                                  ; 21a2: 69 0b       i.  :2071[1]
    tay                                                               ; 21a4: a8          .   :2073[1]
    jsr test_for_collision_between_objects_x_and_y                    ; 21a5: 20 e2 28     .( :2074[1]
    ldx temp_object_index                                             ; 21a8: a6 64       .d  :2077[1]
    ora #0                                                            ; 21aa: 09 00       ..  :2079[1]
    beq move_to_next_object_x                                         ; 21ac: f0 10       ..  :207b[1]
found_collision
    ldx temp_object_index                                             ; 21ae: a6 64       .d  :207d[1]
; mark object x as dealt with
    lda #$ff                                                          ; 21b0: a9 ff       ..  :207f[1]
    sta object_dealt_with_flag,x                                      ; 21b2: 9d 16 01    ... :2081[1]
; append to the active objects list
    txa                                                               ; 21b5: 8a          .   :2084[1]
    ldx num_active_objects                                            ; 21b6: a6 62       .b  :2085[1]
    sta active_objects_table,x                                        ; 21b8: 9d 00 01    ... :2087[1]
    inc num_active_objects                                            ; 21bb: e6 62       .b  :208a[1]
    tax                                                               ; 21bd: aa          .   :208c[1]
move_to_next_object_x
    inx                                                               ; 21be: e8          .   :208d[1]
    cpx #max_objects                                                  ; 21bf: e0 0b       ..  :208e[1]
    bcc loop_over_all_objects_x                                       ; 21c1: 90 b5       ..  :2090[1]
    inc temp_active_object_index                                      ; 21c3: e6 63       .c  :2092[1]
    lda temp_active_object_index                                      ; 21c5: a5 63       .c  :2094[1]
    cmp num_active_objects                                            ; 21c7: c5 62       .b  :2096[1]
    bcc process_active_objects_loop                                   ; 21c9: 90 9f       ..  :2098[1]

; sort active objects, frontmost first
    lda #0                                                            ; 21cb: a9 00       ..  :209a[1]
    sta temp_active_object_index                                      ; 21cd: 85 63       .c  :209c[1]
sort_objects_loop
    lda #$ff                                                          ; 21cf: a9 ff       ..  :209e[1]
    sta backmost_object_index                                         ; 21d1: 85 60       .`  :20a0[1]
    sta backmost_object_z_order                                       ; 21d3: 85 61       .a  :20a2[1]

; now find the frontmost of the active objects
    ldx #0                                                            ; 21d5: a2 00       ..  :20a4[1]
inner_object_loop
    ldy active_objects_table,x                                        ; 21d7: bc 00 01    ... :20a6[1]
    bmi move_to_next_active_object                                    ; 21da: 30 13       0.  :20a9[1]
    lda object_z_order,y                                              ; 21dc: b9 c2 38    ..8 :20ab[1]
    cmp backmost_object_z_order                                       ; 21df: c5 61       .a  :20ae[1]
    bcc found_an_object_further_front                                 ; 21e1: 90 06       ..  :20b0[1]
    bne move_to_next_active_object                                    ; 21e3: d0 0a       ..  :20b2[1]
    cpy backmost_object_index                                         ; 21e5: c4 60       .`  :20b4[1]
    bcs move_to_next_active_object                                    ; 21e7: b0 06       ..  :20b6[1]
found_an_object_further_front
    sty backmost_object_index                                         ; 21e9: 84 60       .`  :20b8[1]
    sta backmost_object_z_order                                       ; 21eb: 85 61       .a  :20ba[1]
    stx temp_object_index                                             ; 21ed: 86 64       .d  :20bc[1]
move_to_next_active_object
    inx                                                               ; 21ef: e8          .   :20be[1]
    cpx num_active_objects                                            ; 21f0: e4 62       .b  :20bf[1]
    bcc inner_object_loop                                             ; 21f2: 90 e3       ..  :20c1[1]

; mark object as done
    ldx temp_object_index                                             ; 21f4: a6 64       .d  :20c3[1]
    lda #$ff                                                          ; 21f6: a9 ff       ..  :20c5[1]
    sta active_objects_table,x                                        ; 21f8: 9d 00 01    ... :20c7[1]
; record frontmost object in table
    ldx temp_active_object_index                                      ; 21fb: a6 63       .c  :20ca[1]
    lda backmost_object_index                                         ; 21fd: a5 60       .`  :20cc[1]
    sta frontmost_objects_table,x                                     ; 21ff: 9d 0b 01    ... :20ce[1]
    inx                                                               ; 2202: e8          .   :20d1[1]
    stx temp_active_object_index                                      ; 2203: 86 63       .c  :20d2[1]
    cpx num_active_objects                                            ; 2205: e4 62       .b  :20d4[1]
    bcc sort_objects_loop                                             ; 2207: 90 c6       ..  :20d6[1]

; undraw objects from front to back
    ldy #0                                                            ; 2209: a0 00       ..  :20d8[1]
undraw_loop
    lda frontmost_objects_table,y                                     ; 220b: b9 0b 01    ... :20da[1]
    tax                                                               ; 220e: aa          .   :20dd[1]
    jsr undraw_object_x                                               ; 220f: 20 57 21     W! :20de[1]
    iny                                                               ; 2212: c8          .   :20e1[1]
    cpy num_active_objects                                            ; 2213: c4 62       .b  :20e2[1]
    bcc undraw_loop                                                   ; 2215: 90 f4       ..  :20e4[1]

; draw objects from back to front (aka 'painters algorithm')
    dey                                                               ; 2217: 88          .   :20e6[1]
draw_loop
    lda frontmost_objects_table,y                                     ; 2218: b9 0b 01    ... :20e7[1]
    tax                                                               ; 221b: aa          .   :20ea[1]
    jsr draw_object_x                                                 ; 221c: 20 9a 21     .! :20eb[1]
    jsr copy_object_state_to_old                                      ; 221f: 20 f7 20     .  :20ee[1]
    dey                                                               ; 2222: 88          .   :20f1[1]
    bpl draw_loop                                                     ; 2223: 10 f3       ..  :20f2[1]
    jmp find_backmost_object_not_dealt_with_yet                       ; 2225: 4c e9 1f    L.. :20f4[1]

; *************************************************************************************
; 
; Once an object is drawn to the screen, this remembers the current object state in
; '_old' variables. We use this later to detect whether the object state has changed
; and to undraw if needed.
; 
; On Entry:
;     X: object index
; 
; On Exit:
;     Preserves A,X,Y
; 
; *************************************************************************************
copy_object_state_to_old
    pha                                                               ; 2228: 48          H   :20f7[1]
    lda object_x_low,x                                                ; 2229: bd 50 09    .P. :20f8[1]
    sta object_x_low_old,x                                            ; 222c: 9d 5b 09    .[. :20fb[1]
    lda object_x_high,x                                               ; 222f: bd 66 09    .f. :20fe[1]
    sta object_x_high_old,x                                           ; 2232: 9d 71 09    .q. :2101[1]
    lda object_y_low,x                                                ; 2235: bd 7c 09    .|. :2104[1]
    sta object_y_low_old,x                                            ; 2238: 9d 87 09    ... :2107[1]
    lda object_y_high,x                                               ; 223b: bd 92 09    ... :210a[1]
    sta object_y_high_old,x                                           ; 223e: 9d 9d 09    ... :210d[1]
    lda object_spriteid,x                                             ; 2241: bd a8 09    ... :2110[1]
    sta object_spriteid_old,x                                         ; 2244: 9d b3 09    ... :2113[1]
    lda object_direction,x                                            ; 2247: bd be 09    ... :2116[1]
    sta object_direction_old,x                                        ; 224a: 9d c9 09    ... :2119[1]
    pla                                                               ; 224d: 68          h   :211c[1]
    rts                                                               ; 224e: 60          `   :211d[1]

has_object_changed_state
    lda #$ff                                                          ; 224f: a9 ff       ..  :211e[1]
    pha                                                               ; 2251: 48          H   :2120[1]
    lda object_x_low,x                                                ; 2252: bd 50 09    .P. :2121[1]
    cmp object_x_low_old,x                                            ; 2255: dd 5b 09    .[. :2124[1]
    bne pull_result_and_return                                        ; 2258: d0 2c       .,  :2127[1]
    lda object_x_high,x                                               ; 225a: bd 66 09    .f. :2129[1]
    cmp object_x_high_old,x                                           ; 225d: dd 71 09    .q. :212c[1]
    bne pull_result_and_return                                        ; 2260: d0 24       .$  :212f[1]
    lda object_y_low,x                                                ; 2262: bd 7c 09    .|. :2131[1]
    cmp object_y_low_old,x                                            ; 2265: dd 87 09    ... :2134[1]
    bne pull_result_and_return                                        ; 2268: d0 1c       ..  :2137[1]
    lda object_y_high,x                                               ; 226a: bd 92 09    ... :2139[1]
    cmp object_y_high_old,x                                           ; 226d: dd 9d 09    ... :213c[1]
    bne pull_result_and_return                                        ; 2270: d0 14       ..  :213f[1]
    lda object_spriteid,x                                             ; 2272: bd a8 09    ... :2141[1]
    cmp object_spriteid_old,x                                         ; 2275: dd b3 09    ... :2144[1]
    bne pull_result_and_return                                        ; 2278: d0 0c       ..  :2147[1]
    lda object_direction,x                                            ; 227a: bd be 09    ... :2149[1]
    cmp object_direction_old,x                                        ; 227d: dd c9 09    ... :214c[1]
    bne pull_result_and_return                                        ; 2280: d0 04       ..  :214f[1]
    pla                                                               ; 2282: 68          h   :2151[1]
    lda #0                                                            ; 2283: a9 00       ..  :2152[1]
    pha                                                               ; 2285: 48          H   :2154[1]
pull_result_and_return
    pla                                                               ; 2286: 68          h   :2155[1]
    rts                                                               ; 2287: 60          `   :2156[1]

undraw_object_x
    tya                                                               ; 2288: 98          .   :2157[1]
    pha                                                               ; 2289: 48          H   :2158[1]
; exit if object is not visible
    lda object_spriteid_old,x                                         ; 228a: bd b3 09    ... :2159[1]
    beq done_drawing_object                                           ; 228d: f0 39       .9  :215c[1]
; prepare to draw sprite
    lda object_x_low_old,x                                            ; 228f: bd 5b 09    .[. :215e[1]
    sta sprite_x_base_low                                             ; 2292: 85 18       ..  :2161[1]
    lda object_x_high_old,x                                           ; 2294: bd 71 09    .q. :2163[1]
    sta sprite_x_base_high                                            ; 2297: 85 19       ..  :2166[1]
    lda object_y_low_old,x                                            ; 2299: bd 87 09    ... :2168[1]
    sta sprite_y_base_low                                             ; 229c: 85 1a       ..  :216b[1]
    lda object_y_high_old,x                                           ; 229e: bd 9d 09    ... :216d[1]
    sta sprite_y_base_high                                            ; 22a1: 85 1b       ..  :2170[1]
    lda object_direction_old,x                                        ; 22a3: bd c9 09    ... :2172[1]
    sta sprite_reflect_flag                                           ; 22a6: 85 1d       ..  :2175[1]
; based on object_erase_type:
; 
;     00 means erase to bg colour,
;     ff means erase to fg colour,
;     otherwise erase by drawing an 'erase' spriteid
    lda object_erase_type,x                                           ; 22a8: bd ac 38    ..8 :2177[1]
    beq erase_object_to_bg_colour                                     ; 22ab: f0 08       ..  :217a[1]
    cmp #$ff                                                          ; 22ad: c9 ff       ..  :217c[1]
    beq erase_object_to_fg_colour                                     ; 22af: f0 0b       ..  :217e[1]
    ldy #sprite_op_flags_normal                                       ; 22b1: a0 00       ..  :2180[1]
    beq draw_or_erase_object                                          ; 22b3: f0 0c       ..  :2182[1]   ; ALWAYS branch
erase_object_to_bg_colour
    lda object_spriteid_old,x                                         ; 22b5: bd b3 09    ... :2184[1]
    ldy #sprite_op_flags_erase_to_bg_colour                           ; 22b8: a0 02       ..  :2187[1]
    bne draw_or_erase_object                                          ; 22ba: d0 05       ..  :2189[1]   ; ALWAYS branch
erase_object_to_fg_colour
    lda object_spriteid_old,x                                         ; 22bc: bd b3 09    ... :218b[1]
    ldy #sprite_op_flags_erase_to_fg_colour                           ; 22bf: a0 04       ..  :218e[1]
draw_or_erase_object
    sta sprite_id                                                     ; 22c1: 85 16       ..  :2190[1]
    sty sprite_op_flags                                               ; 22c3: 84 15       ..  :2192[1]
    jsr sprite_op                                                     ; 22c5: 20 8d 13     .. :2194[1]
done_drawing_object
    pla                                                               ; 22c8: 68          h   :2197[1]
    tay                                                               ; 22c9: a8          .   :2198[1]
    rts                                                               ; 22ca: 60          `   :2199[1]

draw_object_x
    lda object_spriteid,x                                             ; 22cb: bd a8 09    ... :219a[1]
    beq return9                                                       ; 22ce: f0 60       .`  :219d[1]
    lda object_x_low,x                                                ; 22d0: bd 50 09    .P. :219f[1]
    sta sprite_x_base_low                                             ; 22d3: 85 18       ..  :21a2[1]
    lda object_x_high,x                                               ; 22d5: bd 66 09    .f. :21a4[1]
    sta sprite_x_base_high                                            ; 22d8: 85 19       ..  :21a7[1]
    lda object_y_low,x                                                ; 22da: bd 7c 09    .|. :21a9[1]
    sta sprite_y_base_low                                             ; 22dd: 85 1a       ..  :21ac[1]
    lda object_y_high,x                                               ; 22df: bd 92 09    ... :21ae[1]
    sta sprite_y_base_high                                            ; 22e2: 85 1b       ..  :21b1[1]
    lda object_direction,x                                            ; 22e4: bd be 09    ... :21b3[1]
    sta sprite_reflect_flag                                           ; 22e7: 85 1d       ..  :21b6[1]
    lda object_spriteid,x                                             ; 22e9: bd a8 09    ... :21b8[1]
    sta sprite_id                                                     ; 22ec: 85 16       ..  :21bb[1]
    lda #sprite_op_flags_normal                                       ; 22ee: a9 00       ..  :21bd[1]
    sta sprite_op_flags                                               ; 22f0: 85 15       ..  :21bf[1]
; The object_erase_type determines the sprite operation:
; 
;     $00: draw normally
;     $ff: draw normally
;     other value S: copy what's on screen to this destination spriteid (used when
; erasing)
; 
    lda object_erase_type,x                                           ; 22f2: bd ac 38    ..8 :21c1[1]
    beq draw_object_sprite                                            ; 22f5: f0 0a       ..  :21c4[1]
    cmp #$ff                                                          ; 22f7: c9 ff       ..  :21c6[1]
    beq draw_object_sprite                                            ; 22f9: f0 06       ..  :21c8[1]
    sta dest_sprite_id                                                ; 22fb: 85 14       ..  :21ca[1]
    lda #sprite_op_flags_erase_to_bg_colour | sprite_op_flags_copy_screen; 22fd: a9 03       ..  :21cc[1]
    sta sprite_op_flags                                               ; 22ff: 85 15       ..  :21ce[1]
draw_object_sprite
    jsr sprite_op                                                     ; 2301: 20 8d 13     .. :21d0[1]
; return if not the player accessory object
    cpx #objectid_player_accessory                                    ; 2304: e0 01       ..  :21d3[1]
    bne return9                                                       ; 2306: d0 28       .(  :21d5[1]
; return if current player character is not the wizard
    lda current_player_character                                      ; 2308: a5 48       .H  :21d7[1]
    cmp #spriteid_icodata_wizard                                      ; 230a: c9 04       ..  :21d9[1]
    bne return9                                                       ; 230c: d0 22       ."  :21db[1]
; special wizard processing - if the player is carrying an accessory object, draw the
; wizard's hand in front of that
    stx remember_player_accessory_object_index                        ; 230e: 86 65       .e  :21dd[1]
    ldx #objectid_player                                              ; 2310: a2 00       ..  :21df[1]
; check if player state has changed
    jsr has_object_changed_state                                      ; 2312: 20 1e 21     .! :21e1[1]
    ldx remember_player_accessory_object_index                        ; 2315: a6 65       .e  :21e4[1]
    ora #0                                                            ; 2317: 09 00       ..  :21e6[1]
    beq player_state_unchanged                                        ; 2319: f0 05       ..  :21e8[1]
; make sure the player has been dealt with first
    lda object_dealt_with_flag                                        ; 231b: ad 16 01    ... :21ea[1]
    beq return9                                                       ; 231e: f0 10       ..  :21ed[1]
player_state_unchanged
    lda object_direction,x                                            ; 2320: bd be 09    ... :21ef[1]
    sta sprite_reflect_flag                                           ; 2323: 85 1d       ..  :21f2[1]
    lda #sprite_op_flags_normal                                       ; 2325: a9 00       ..  :21f4[1]
    sta sprite_op_flags                                               ; 2327: 85 15       ..  :21f6[1]
    lda #spriteid_wizard_hand                                         ; 2329: a9 37       .7  :21f8[1]
    sta sprite_id                                                     ; 232b: 85 16       ..  :21fa[1]
    jsr sprite_op                                                     ; 232d: 20 8d 13     .. :21fc[1]
return9
    rts                                                               ; 2330: 60          `   :21ff[1]

set_player_spriteid_and_offset_from_animation_table
    stx animation_address_low                                         ; 2331: 86 70       .p  :2200[1]   ; store YX as animation table address
    sty animation_address_high                                        ; 2333: 84 71       .q  :2202[1]
; load byte at offset A from table, the spriteid
    tay                                                               ; 2335: a8          .   :2204[1]
    lda (animation_address_low),y                                     ; 2336: b1 70       .p  :2205[1]
    sta object_spriteid                                               ; 2338: 8d a8 09    ... :2207[1]
; check if we should add offset x
    iny                                                               ; 233b: c8          .   :220a[1]
    lda player_wall_collision_reaction_speed                          ; 233c: ad 33 24    .3$ :220b[1]
    bne skip8                                                         ; 233f: d0 21       .!  :220e[1]
; load next byte from table, the X offset
    lda (animation_address_low),y                                     ; 2341: b1 70       .p  :2210[1]
; invert offset if direction is reversed
    ldx object_direction                                              ; 2343: ae be 09    ... :2212[1]
    bpl add_movement_in_direction_to_player                           ; 2346: 10 05       ..  :2215[1]
; invert A if direction is left
    eor #$ff                                                          ; 2348: 49 ff       I.  :2217[1]
    clc                                                               ; 234a: 18          .   :2219[1]
    adc #1                                                            ; 234b: 69 01       i.  :221a[1]
; add offset in X to player position
add_movement_in_direction_to_player
    ldx #0                                                            ; 234d: a2 00       ..  :221c[1]
    ora #0                                                            ; 234f: 09 00       ..  :221e[1]
    bpl skip7                                                         ; 2351: 10 01       ..  :2220[1]
    dex                                                               ; 2353: ca          .   :2222[1]
skip7
    clc                                                               ; 2354: 18          .   :2223[1]
    adc object_x_low                                                  ; 2355: 6d 50 09    mP. :2224[1]
    sta object_x_low                                                  ; 2358: 8d 50 09    .P. :2227[1]
    txa                                                               ; 235b: 8a          .   :222a[1]
    adc object_x_high                                                 ; 235c: 6d 66 09    mf. :222b[1]
    sta object_x_high                                                 ; 235f: 8d 66 09    .f. :222e[1]
skip8
    iny                                                               ; 2362: c8          .   :2231[1]
; load next byte from table, the Y offset
    ldx #0                                                            ; 2363: a2 00       ..  :2232[1]
    lda (animation_address_low),y                                     ; 2365: b1 70       .p  :2234[1]
    bpl skip9                                                         ; 2367: 10 01       ..  :2236[1]
    dex                                                               ; 2369: ca          .   :2238[1]
; add offset in Y to player position
skip9
    clc                                                               ; 236a: 18          .   :2239[1]
    adc object_y_low                                                  ; 236b: 6d 7c 09    m|. :223a[1]
    sta object_y_low                                                  ; 236e: 8d 7c 09    .|. :223d[1]
    txa                                                               ; 2371: 8a          .   :2240[1]
    adc object_y_high                                                 ; 2372: 6d 92 09    m.. :2241[1]
    sta object_y_high                                                 ; 2375: 8d 92 09    ... :2244[1]
    rts                                                               ; 2378: 60          `   :2247[1]

; *************************************************************************************
; 
; Update player accessory object animation
; 
; The player is object zero, and can have an associated 'accessory' object at index
; one. This is often a tail, but otherwise can be an object the wizard is carrying
; (e.g. the whip)
; 
; On Entry:
;                     A: if top bit clear, it's a spriteid
;                        if top bit set, lower 7 bits are the offset into sprite array
;                    YX: Address of main sprite list
;     animation_address: accessory sprite list
; 
; *************************************************************************************
update_player_accessory_object_animation
    stx temp_sprite_list_low                                          ; 2379: 86 72       .r  :2248[1]
    sty temp_sprite_list_high                                         ; 237b: 84 73       .s  :224a[1]
    ldy #0                                                            ; 237d: a0 00       ..  :224c[1]
    ora #0                                                            ; 237f: 09 00       ..  :224e[1]
    bpl store_accessory_object_state                                  ; 2381: 10 15       ..  :2250[1]
    and #$7f                                                          ; 2383: 29 7f       ).  :2252[1]
    tay                                                               ; 2385: a8          .   :2254[1]
    lda (animation_address_low),y                                     ; 2386: b1 70       .p  :2255[1]
    cpy #$7f                                                          ; 2388: c0 7f       ..  :2257[1]
    bne store_accessory_object_state                                  ; 238a: d0 0c       ..  :2259[1]
; check for end of animation (loop if needed)
    ldy object_current_index_in_animation+1                           ; 238c: ac d5 09    ... :225b[1]
    iny                                                               ; 238f: c8          .   :225e[1]
    lda (animation_address_low),y                                     ; 2390: b1 70       .p  :225f[1]
    bne store_accessory_object_state                                  ; 2392: d0 04       ..  :2261[1]
    ldy #0                                                            ; 2394: a0 00       ..  :2263[1]
    lda (animation_address_low),y                                     ; 2396: b1 70       .p  :2265[1]
store_accessory_object_state
    sty object_current_index_in_animation+1                           ; 2398: 8c d5 09    ... :2267[1]
    sta object_spriteid + objectid_player_accessory                   ; 239b: 8d a9 09    ... :226a[1]
    lda object_direction                                              ; 239e: ad be 09    ... :226d[1]
    sta object_direction + objectid_player_accessory                  ; 23a1: 8d bf 09    ... :2270[1]
    lda object_spriteid                                               ; 23a4: ad a8 09    ... :2273[1]
; add animation XY offset to player object position (inverted if looking left)
    jsr find_sprite_xy_offset_from_spriteid                           ; 23a7: 20 ae 22     ." :2276[1]
    txa                                                               ; 23aa: 8a          .   :2279[1]
    ldx object_direction                                              ; 23ab: ae be 09    ... :227a[1]
    bpl skip_invert_a                                                 ; 23ae: 10 05       ..  :227d[1]
    eor #$ff                                                          ; 23b0: 49 ff       I.  :227f[1]
    clc                                                               ; 23b2: 18          .   :2281[1]
    adc #1                                                            ; 23b3: 69 01       i.  :2282[1]
skip_invert_a
    ldx #0                                                            ; 23b5: a2 00       ..  :2284[1]
    ora #0                                                            ; 23b7: 09 00       ..  :2286[1]
    bpl skip_decrement_high_byte1                                     ; 23b9: 10 01       ..  :2288[1]
    dex                                                               ; 23bb: ca          .   :228a[1]
skip_decrement_high_byte1
    clc                                                               ; 23bc: 18          .   :228b[1]
    adc object_x_low                                                  ; 23bd: 6d 50 09    mP. :228c[1]
    sta object_x_low + objectid_player_accessory                      ; 23c0: 8d 51 09    .Q. :228f[1]
    txa                                                               ; 23c3: 8a          .   :2292[1]
    adc object_x_high                                                 ; 23c4: 6d 66 09    mf. :2293[1]
    sta object_x_high + objectid_player_accessory                     ; 23c7: 8d 67 09    .g. :2296[1]
    ldx #0                                                            ; 23ca: a2 00       ..  :2299[1]
    tya                                                               ; 23cc: 98          .   :229b[1]
    bpl skip_decrement_high_byte2                                     ; 23cd: 10 01       ..  :229c[1]
    dex                                                               ; 23cf: ca          .   :229e[1]
skip_decrement_high_byte2
    clc                                                               ; 23d0: 18          .   :229f[1]
    adc object_y_low                                                  ; 23d1: 6d 7c 09    m|. :22a0[1]
    sta object_y_low + objectid_player_accessory                      ; 23d4: 8d 7d 09    .}. :22a3[1]
    txa                                                               ; 23d7: 8a          .   :22a6[1]
    adc object_y_high                                                 ; 23d8: 6d 92 09    m.. :22a7[1]
    sta object_y_high + objectid_player_accessory                     ; 23db: 8d 93 09    ... :22aa[1]
    rts                                                               ; 23de: 60          `   :22ad[1]

; *************************************************************************************
; 
; Find the offset X,Y for a sprite in a list
; 
; On Entry:
;     A: spriteid to search for
;     temp_animation: address of list to search
; 
; On Exit:
;     X: X pixel offset from animation
;     Y: Y pixel offset from animation
; 
; *************************************************************************************
find_sprite_xy_offset_from_spriteid
    sta temp_spriteid                                                 ; 23df: 85 74       .t  :22ae[1]
    ldy #0                                                            ; 23e1: a0 00       ..  :22b0[1]
    beq start_search                                                  ; 23e3: f0 07       ..  :22b2[1]   ; ALWAYS branch
list_search_loop
    cmp temp_spriteid                                                 ; 23e5: c5 74       .t  :22b4[1]
    beq found_entry_in_list                                           ; 23e7: f0 0c       ..  :22b6[1]
    iny                                                               ; 23e9: c8          .   :22b8[1]
    iny                                                               ; 23ea: c8          .   :22b9[1]
    iny                                                               ; 23eb: c8          .   :22ba[1]
start_search
    lda (temp_sprite_list_low),y                                      ; 23ec: b1 72       .r  :22bb[1]
    bne list_search_loop                                              ; 23ee: d0 f5       ..  :22bd[1]
    ldx #0                                                            ; 23f0: a2 00       ..  :22bf[1]
    ldy #0                                                            ; 23f2: a0 00       ..  :22c1[1]
    rts                                                               ; 23f4: 60          `   :22c3[1]

found_entry_in_list
    iny                                                               ; 23f5: c8          .   :22c4[1]
    lda (temp_sprite_list_low),y                                      ; 23f6: b1 72       .r  :22c5[1]
    tax                                                               ; 23f8: aa          .   :22c7[1]
    iny                                                               ; 23f9: c8          .   :22c8[1]
    lda (temp_sprite_list_low),y                                      ; 23fa: b1 72       .r  :22c9[1]
    tay                                                               ; 23fc: a8          .   :22cb[1]
    rts                                                               ; 23fd: 60          `   :22cc[1]

; *************************************************************************************
; 
; Update player
; 
; *************************************************************************************
update_player
    lda current_player_character                                      ; 23fe: a5 48       .H  :22cd[1]
    beq update_mid_transformation_local                               ; 2400: f0 0f       ..  :22cf[1]
    cmp #spriteid_icodata_wizard                                      ; 2402: c9 04       ..  :22d1[1]
    beq update_wizard_local                                           ; 2404: f0 0e       ..  :22d3[1]
    cmp #spriteid_icodata_cat                                         ; 2406: c9 05       ..  :22d5[1]
    beq update_cat_local                                              ; 2408: f0 0d       ..  :22d7[1]
    cmp #spriteid_icodata_monkey                                      ; 240a: c9 06       ..  :22d9[1]
    beq update_monkey_local                                           ; 240c: f0 0c       ..  :22db[1]
jmp_for_update_extra_player_character
    jmp return10                                                      ; 240e: 4c ec 22    L." :22dd[1]   ; could just 'rts'? But maybe the bird modifies this code...?

update_mid_transformation_local
    jmp update_mid_transformation                                     ; 2411: 4c 86 39    L.9 :22e0[1]

update_wizard_local
    jmp update_wizard                                                 ; 2414: 4c 87 2d    L.- :22e3[1]

update_cat_local
    jmp update_cat                                                    ; 2417: 4c c8 2f    L./ :22e6[1]

update_monkey_local
    jmp update_monkey                                                 ; 241a: 4c d8 31    L.1 :22e9[1]

return10
    rts                                                               ; 241d: 60          `   :22ec[1]

transform_out_animation
    !byte 0                                                           ; 241e: 00          .   :22ed[1]

; *************************************************************************************
; 
; Set the base animation address for the current player type and handle any transform
; in/out
; 
; On Entry:
;     XY: Address of start of animation data for the current player type
;     A: Offset into animation data to read (usually three for the next animation step,
; since each animation step takes three bytes)
; 
; On Exit:
;     Y: set to the current offset of player animation
;     A: (for zero flag) $FF if transform in/out is in progress, $00 otherwise
; 
; *************************************************************************************
set_base_animation_address_and_handle_transform_in_out
    stx animation_address_low                                         ; 241f: 86 70       .p  :22ee[1]
    sty animation_address_high                                        ; 2421: 84 71       .q  :22f0[1]
; read next entry in animation
    clc                                                               ; 2423: 18          .   :22f2[1]
    adc object_current_index_in_animation                             ; 2424: 6d d4 09    m.. :22f3[1]
    tay                                                               ; 2427: a8          .   :22f6[1]
    lda (animation_address_low),y                                     ; 2428: b1 70       .p  :22f7[1]
; branch if not at the end of the animation
    bne not_at_end_of_animation                                       ; 242a: d0 03       ..  :22f9[1]
; restart the animation
    ldy current_player_animation                                      ; 242c: ac df 09    ... :22fb[1]
; check for 'transform in' animation
not_at_end_of_animation
    lda current_player_animation                                      ; 242f: ad df 09    ... :22fe[1]
    bne not_the_transform_in_animation                                ; 2432: d0 06       ..  :2301[1]
    tya                                                               ; 2434: 98          .   :2303[1]
    bne transforming                                                  ; 2435: d0 2b       .+  :2304[1]
    jsr start_of_transform_in_animation                               ; 2437: 20 58 23     X# :2306[1]
; check for 'transform out' animation
not_the_transform_in_animation
    lda current_player_animation                                      ; 243a: ad df 09    ... :2309[1]
    cmp transform_out_animation                                       ; 243d: cd ed 22    .." :230c[1]
    bne not_transforming_out                                          ; 2440: d0 14       ..  :230f[1]
    cpy current_player_animation                                      ; 2442: cc df 09    ... :2311[1]
    bne transforming                                                  ; 2445: d0 1b       ..  :2314[1]
; start the 'transform in' animation, having finished the 'transform out'
    lda #0                                                            ; 2447: a9 00       ..  :2316[1]
    sta current_player_animation                                      ; 2449: 8d df 09    ... :2318[1]
    sta object_current_index_in_animation                             ; 244c: 8d d4 09    ... :231b[1]
    sta current_player_character                                      ; 244f: 85 48       .H  :231e[1]
; stack shenanigans: remove the latest return address from the stack to restart the
; calling function
    pla                                                               ; 2451: 68          h   :2320[1]
    pla                                                               ; 2452: 68          h   :2321[1]
    jmp update_player                                                 ; 2453: 4c cd 22    L." :2322[1]

not_transforming_out
    lda current_player_character                                      ; 2456: a5 48       .H  :2325[1]
    cmp new_player_character                                          ; 2458: c5 4d       .M  :2327[1]
    beq not_transforming                                              ; 245a: f0 09       ..  :2329[1]
; start 'transform out' animation
    ldy transform_out_animation                                       ; 245c: ac ed 22    .." :232b[1]
    sty current_player_animation                                      ; 245f: 8c df 09    ... :232e[1]
transforming
    lda #$ff                                                          ; 2462: a9 ff       ..  :2331[1]
    rts                                                               ; 2464: 60          `   :2333[1]

not_transforming
    lda #0                                                            ; 2465: a9 00       ..  :2334[1]
    rts                                                               ; 2467: 60          `   :2336[1]

; *************************************************************************************
; 
; Transform the player into a new form.
; 
; On Entry:
;     A: spriteid of player character to transform into
; 
; *************************************************************************************
transform
    sta new_player_character                                          ; 2468: 85 4d       .M  :2337[1]
    lda #0                                                            ; 246a: a9 00       ..  :2339[1]
    sta player_wall_collision_reaction_speed                          ; 246c: 8d 33 24    .3$ :233b[1]
    sta player_held_object_spriteid                                   ; 246f: 85 52       .R  :233e[1]
; if the current menu item is to the left of the player characters, then we have just
; loaded a level or something, so don't play the transform sounds.
    lda new_menu_index                                                ; 2471: a5 29       .)  :2340[1]
    cmp menu_index_for_first_player_character                         ; 2473: cd 6d 29    .m) :2342[1]
    bcc return11                                                      ; 2476: 90 10       ..  :2345[1]
; play transform sounds with priority
    lda #$ff                                                          ; 2478: a9 ff       ..  :2347[1]
    ldx #<sound_data2                                                 ; 247a: a2 d0       ..  :2349[1]
    ldy #>sound_data2                                                 ; 247c: a0 38       .8  :234b[1]
    jsr play_sound_yx                                                 ; 247e: 20 f6 38     .8 :234d[1]
    ldx #<sound_data3                                                 ; 2481: a2 ba       ..  :2350[1]
    ldy #>sound_data3                                                 ; 2483: a0 38       .8  :2352[1]
    jsr play_sound_yx                                                 ; 2485: 20 f6 38     .8 :2354[1]
return11
    rts                                                               ; 2488: 60          `   :2357[1]

start_of_transform_in_animation
    lda #osbyte_flush_buffer                                          ; 2489: a9 15       ..  :2358[1]
    ldx #buffer_sound_channel_0                                       ; 248b: a2 04       ..  :235a[1]
    jsr osbyte                                                        ; 248d: 20 f4 ff     .. :235c[1]   ; Flush sound channel 0 (X=4)
    lda #0                                                            ; 2490: a9 00       ..  :235f[1]
    sta sound_priority_per_channel_table                              ; 2492: 8d 6f 39    .o9 :2361[1]
    sta sound_priority_per_channel_table + 1                          ; 2495: 8d 70 39    .p9 :2364[1]
    sta player_wall_collision_reaction_speed                          ; 2498: 8d 33 24    .3$ :2367[1]
    rts                                                               ; 249b: 60          `   :236a[1]

handle_player_landing_sound
    lda object_spriteid                                               ; 249c: ad a8 09    ... :236b[1]
    and object_spriteid_old                                           ; 249f: 2d b3 09    -.. :236e[1]
    beq return12                                                      ; 24a2: f0 35       .5  :2371[1]
    lda #2                                                            ; 24a4: a9 02       ..  :2373[1]
    sta temp_bottom_offset                                            ; 24a6: 8d 51 25    .Q% :2375[1]
    lda #0                                                            ; 24a9: a9 00       ..  :2378[1]
    jsr get_solid_rock_collision_for_object_a                         ; 24ab: 20 94 28     .( :237a[1]
    beq return12                                                      ; 24ae: f0 29       .)  :237d[1]
; wall collision found. if player was moving down at the time, we have hit the floor
    lda object_y_low_old                                              ; 24b0: ad 87 09    ... :237f[1]
    sec                                                               ; 24b3: 38          8   :2382[1]
    sbc object_y_low                                                  ; 24b4: ed 7c 09    .|. :2383[1]
    beq player_y_is_unchanged                                         ; 24b7: f0 0a       ..  :2386[1]
    lda object_y_high_old                                             ; 24b9: ad 9d 09    ... :2388[1]
    sbc object_y_high                                                 ; 24bc: ed 92 09    ... :238b[1]
    bmi has_landed                                                    ; 24bf: 30 15       0.  :238e[1]
    bpl return12                                                      ; 24c1: 10 16       ..  :2390[1]   ; ALWAYS branch
; check for player collision with floor
player_y_is_unchanged
    lda object_room_collision_flags                                   ; 24c3: ad d8 38    ..8 :2392[1]
    and #object_collided_floor                                        ; 24c6: 29 02       ).  :2395[1]
    beq return12                                                      ; 24c8: f0 0f       ..  :2397[1]
    lda #2                                                            ; 24ca: a9 02       ..  :2399[1]
    sta temp_bottom_offset                                            ; 24cc: 8d 51 25    .Q% :239b[1]
    lda #objectid_old_player                                          ; 24cf: a9 0b       ..  :239e[1]
    jsr get_solid_rock_collision_for_object_a                         ; 24d1: 20 94 28     .( :23a0[1]
    bne return12                                                      ; 24d4: d0 03       ..  :23a3[1]
has_landed
    jsr play_landing_sound                                            ; 24d6: 20 a9 23     .# :23a5[1]
return12
    rts                                                               ; 24d9: 60          `   :23a8[1]

; TODO: this is used by e.g. dataA
play_landing_sound
    pha                                                               ; 24da: 48          H   :23a9[1]   ; remember A,X,Y
    txa                                                               ; 24db: 8a          .   :23aa[1]
    pha                                                               ; 24dc: 48          H   :23ab[1]
    tya                                                               ; 24dd: 98          .   :23ac[1]
    pha                                                               ; 24de: 48          H   :23ad[1]
    lda #0                                                            ; 24df: a9 00       ..  :23ae[1]
    ldx #<sound_landing1                                              ; 24e1: a2 ee       ..  :23b0[1]
    ldy #>sound_landing1                                              ; 24e3: a0 38       .8  :23b2[1]
    jsr play_sound_yx                                                 ; 24e5: 20 f6 38     .8 :23b4[1]
    ldx #<sound_landing2                                              ; 24e8: a2 e6       ..  :23b7[1]
    ldy #>sound_landing2                                              ; 24ea: a0 38       .8  :23b9[1]
    jsr play_sound_yx                                                 ; 24ec: 20 f6 38     .8 :23bb[1]
    pla                                                               ; 24ef: 68          h   :23be[1]   ; recall A,X,Y
    tay                                                               ; 24f0: a8          .   :23bf[1]
    pla                                                               ; 24f1: 68          h   :23c0[1]
    tax                                                               ; 24f2: aa          .   :23c1[1]
    pla                                                               ; 24f3: 68          h   :23c2[1]
    rts                                                               ; 24f4: 60          `   :23c3[1]

; *************************************************************************************
; 
; Check for player hitting the floor and deal with it.
; Check for player being pushed, and update if so.
; 
; On Exit:
;     A and flags: $00 if no collision is happening
;                  $80 if player is hitting a wall (left or right)
;                  otherwise it's a signed byte for the velocity while being pushed.
;     Preserves X,Y
; 
; *************************************************************************************
update_player_hitting_floor_or_pushed
    txa                                                               ; 24f5: 8a          .   :23c4[1]   ; remember X,Y
    pha                                                               ; 24f6: 48          H   :23c5[1]
    tya                                                               ; 24f7: 98          .   :23c6[1]
    pha                                                               ; 24f8: 48          H   :23c7[1]
    lda #objectid_player                                              ; 24f9: a9 00       ..  :23c8[1]
    jsr update_object_hitting_floor                                   ; 24fb: 20 70 27     p' :23ca[1]
; if (no player collision) then branch (return)
    lda player_wall_collision_reaction_speed                          ; 24fe: ad 33 24    .3$ :23cd[1]
    beq recall_registers_and_return1                                  ; 2501: f0 59       .Y  :23d0[1]
; if (player hit wall) then branch
    cmp #$80                                                          ; 2503: c9 80       ..  :23d2[1]
    beq if_player_hit_wall_and_floor_then_clear_wall_collision_flag   ; 2505: f0 44       .D  :23d4[1]
; player is being pushed.
; check direction of push.
    lda player_wall_collision_reaction_speed                          ; 2507: ad 33 24    .3$ :23d6[1]
    bmi player_being_pushed_left                                      ; 250a: 30 07       0.  :23d9[1]
; player being pushed right
    inc temp_right_offset                                             ; 250c: ee d1 24    ..$ :23db[1]
    ldy #0                                                            ; 250f: a0 00       ..  :23de[1]
    beq check_for_collision_while_player_is_being_pushed              ; 2511: f0 05       ..  :23e0[1]   ; ALWAYS branch

player_being_pushed_left
    dec temp_left_offset                                              ; 2513: ce d0 24    ..$ :23e2[1]
    ldy #$ff                                                          ; 2516: a0 ff       ..  :23e5[1]
check_for_collision_while_player_is_being_pushed
    lda #1                                                            ; 2518: a9 01       ..  :23e7[1]
    sta temp_bottom_offset                                            ; 251a: 8d 51 25    .Q% :23e9[1]
; if no player-rock collision, then branch
    lda #objectid_player                                              ; 251d: a9 00       ..  :23ec[1]
    jsr get_solid_rock_collision_for_object_a                         ; 251f: 20 94 28     .( :23ee[1]
    beq push_continues_no_collision                                   ; 2522: f0 07       ..  :23f1[1]
; mark as a regular wall collision (no longer pushed)
    lda #$80                                                          ; 2524: a9 80       ..  :23f3[1]
    sta player_wall_collision_reaction_speed                          ; 2526: 8d 33 24    .3$ :23f5[1]
    bne if_player_hit_wall_and_floor_then_clear_wall_collision_flag   ; 2529: d0 20       .   :23f8[1]   ; ALWAYS branch

push_continues_no_collision
    lda object_has_hit_floor_flag                                     ; 252b: ad 8f 28    ..( :23fa[1]
    beq move_player_because_of_push                                   ; 252e: f0 05       ..  :23fd[1]
    lda #0                                                            ; 2530: a9 00       ..  :23ff[1]
    sta current_player_animation                                      ; 2532: 8d df 09    ... :2401[1]
move_player_because_of_push
    ldx #1                                                            ; 2535: a2 01       ..  :2404[1]
push_player_and_accessory_object_loop
    lda player_wall_collision_reaction_speed                          ; 2537: ad 33 24    .3$ :2406[1]
    clc                                                               ; 253a: 18          .   :2409[1]
    adc object_x_low,x                                                ; 253b: 7d 50 09    }P. :240a[1]
    sta object_x_low,x                                                ; 253e: 9d 50 09    .P. :240d[1]
    tya                                                               ; 2541: 98          .   :2410[1]
    adc object_x_high,x                                               ; 2542: 7d 66 09    }f. :2411[1]
    sta object_x_high,x                                               ; 2545: 9d 66 09    .f. :2414[1]
    dex                                                               ; 2548: ca          .   :2417[1]
    bpl push_player_and_accessory_object_loop                         ; 2549: 10 ec       ..  :2418[1]
; if no collision, or a push, branch (return)
if_player_hit_wall_and_floor_then_clear_wall_collision_flag
    lda player_wall_collision_reaction_speed                          ; 254b: ad 33 24    .3$ :241a[1]
    cmp #$80                                                          ; 254e: c9 80       ..  :241d[1]
    bne recall_registers_and_return1                                  ; 2550: d0 0a       ..  :241f[1]
; if not hit floor, then branch
    lda object_has_hit_floor_flag                                     ; 2552: ad 8f 28    ..( :2421[1]
    beq recall_registers_and_return1                                  ; 2555: f0 05       ..  :2424[1]
    lda #0                                                            ; 2557: a9 00       ..  :2426[1]
    sta player_wall_collision_reaction_speed                          ; 2559: 8d 33 24    .3$ :2428[1]
recall_registers_and_return1
    pla                                                               ; 255c: 68          h   :242b[1]   ; recall X,Y
    tay                                                               ; 255d: a8          .   :242c[1]
    pla                                                               ; 255e: 68          h   :242d[1]
    tax                                                               ; 255f: aa          .   :242e[1]
    lda player_wall_collision_reaction_speed                          ; 2560: ad 33 24    .3$ :242f[1]
    rts                                                               ; 2563: 60          `   :2432[1]

player_wall_collision_reaction_speed
    !byte 0                                                           ; 2564: 00          .   :2433[1]

; *************************************************************************************
; 
; Find the left and right extents of the object
; 
; Returns both the left and right Y coordinate of the object (found using the object
; position, sprite offset, current sprite width, and object direction).
; It also returns cell based versions of these two coordinates.
; 
; As input, pixel based 'temporary' offsets can be added to the result. 'Temporary'
; because they are zeroed on exit.
; 
; On Entry:
;                        X: the object index to look at
;         temp_left_offset: offset to add to result (zeroed on exit)
;        temp_right_offset: offset to add to result (zeroed on exit)
; 
; On Exit:
;              object_left: Set to object's position X + sprite offset
;             object_right: Set to object's position X + sprite offset + sprite width
;       object_left_cell_x: Cell X for object_left
;      object_right_cell_x: Cell X for object_right
;      Preserves X
; 
; *************************************************************************************
find_left_and_right_of_object
    txa                                                               ; 2565: 8a          .   :2434[1]
; remember object index
    pha                                                               ; 2566: 48          H   :2435[1]
    lda object_spriteid,x                                             ; 2567: bd a8 09    ... :2436[1]
; get address of current sprite for object
    jsr get_address_of_sprite_a                                       ; 256a: 20 2c 13     ,. :2439[1]
    stx sprite_addr_low                                               ; 256d: 86 80       ..  :243c[1]
    sty sprite_addr_high                                              ; 256f: 84 81       ..  :243e[1]
; recall object index
    pla                                                               ; 2571: 68          h   :2440[1]
    tax                                                               ; 2572: aa          .   :2441[1]
; read the sprite's X offset
    ldy #0                                                            ; 2573: a0 00       ..  :2442[1]
    lda (sprite_addr_low),y                                           ; 2575: b1 80       ..  :2444[1]
; add sprite Y offset to object position (or if looking left, subtract the sprite Y
; offset), then store in object_left.
    ldy object_direction,x                                            ; 2577: bc be 09    ... :2446[1]
    bpl got_signed_offset_in_a_so_sign_extend_to_y                    ; 257a: 10 02       ..  :2449[1]
    eor #$ff                                                          ; 257c: 49 ff       I.  :244b[1]
got_signed_offset_in_a_so_sign_extend_to_y
    ldy #0                                                            ; 257e: a0 00       ..  :244d[1]
    ora #0                                                            ; 2580: 09 00       ..  :244f[1]
    bpl add_ya_to_object_x_position                                   ; 2582: 10 01       ..  :2451[1]
    dey                                                               ; 2584: 88          .   :2453[1]
add_ya_to_object_x_position
    clc                                                               ; 2585: 18          .   :2454[1]   ; update address1 based on sprite offset
    adc object_x_low,x                                                ; 2586: 7d 50 09    }P. :2455[1]
    sta object_left_low                                               ; 2589: 85 70       .p  :2458[1]
    tya                                                               ; 258b: 98          .   :245a[1]
    adc object_x_high,x                                               ; 258c: 7d 66 09    }f. :245b[1]
    sta object_left_high                                              ; 258f: 85 71       .q  :245e[1]
; get sprite width
    ldy #2                                                            ; 2591: a0 02       ..  :2460[1]
    lda (sprite_addr_low),y                                           ; 2593: b1 80       ..  :2462[1]
; add sprite width-1 to address1 if looking right, or subtract if looking left storing
; result in object_right
    sec                                                               ; 2595: 38          8   :2464[1]
    sbc #1                                                            ; 2596: e9 01       ..  :2465[1]
    ldy object_direction,x                                            ; 2598: bc be 09    ... :2467[1]
    bmi subtract_sprite_width                                         ; 259b: 30 0e       0.  :246a[1]
    clc                                                               ; 259d: 18          .   :246c[1]
    adc object_left_low                                               ; 259e: 65 70       ep  :246d[1]
    sta object_right_low                                              ; 25a0: 85 72       .r  :246f[1]
    lda #0                                                            ; 25a2: a9 00       ..  :2471[1]
    adc object_left_high                                              ; 25a4: 65 71       eq  :2473[1]
    sta object_right_high                                             ; 25a6: 85 73       .s  :2475[1]
    jmp add_temporary_offsets                                         ; 25a8: 4c 8d 24    L.$ :2477[1]

; subtract sprite width
subtract_sprite_width
    sta object_right_high                                             ; 25ab: 85 73       .s  :247a[1]
    lda object_left_low                                               ; 25ad: a5 70       .p  :247c[1]
    sta object_right_low                                              ; 25af: 85 72       .r  :247e[1]
    sec                                                               ; 25b1: 38          8   :2480[1]
    sbc object_right_high                                             ; 25b2: e5 73       .s  :2481[1]
    sta object_left_low                                               ; 25b4: 85 70       .p  :2483[1]
    lda object_left_high                                              ; 25b6: a5 71       .q  :2485[1]
    sta object_right_high                                             ; 25b8: 85 73       .s  :2487[1]
    sbc #0                                                            ; 25ba: e9 00       ..  :2489[1]
    sta object_left_high                                              ; 25bc: 85 71       .q  :248b[1]
add_temporary_offsets
    ldy #0                                                            ; 25be: a0 00       ..  :248d[1]
; add temporary left offset to object left position
    lda temp_left_offset                                              ; 25c0: ad d0 24    ..$ :248f[1]
    bpl add_ya_to_object_left                                         ; 25c3: 10 01       ..  :2492[1]
    dey                                                               ; 25c5: 88          .   :2494[1]
add_ya_to_object_left
    clc                                                               ; 25c6: 18          .   :2495[1]
    adc object_left_low                                               ; 25c7: 65 70       ep  :2496[1]
    sta object_left_low                                               ; 25c9: 85 70       .p  :2498[1]
    sta object_left_cell_x                                            ; 25cb: 85 78       .x  :249a[1]
    tya                                                               ; 25cd: 98          .   :249c[1]
    adc object_left_high                                              ; 25ce: 65 71       eq  :249d[1]
    sta object_left_high                                              ; 25d0: 85 71       .q  :249f[1]
; divide by eight to get cell left position
    lsr                                                               ; 25d2: 4a          J   :24a1[1]
    ror object_left_cell_x                                            ; 25d3: 66 78       fx  :24a2[1]
    lsr                                                               ; 25d5: 4a          J   :24a4[1]
    ror object_left_cell_x                                            ; 25d6: 66 78       fx  :24a5[1]
    lsr                                                               ; 25d8: 4a          J   :24a7[1]
    ror object_left_cell_x                                            ; 25d9: 66 78       fx  :24a8[1]
    ldy #0                                                            ; 25db: a0 00       ..  :24aa[1]
; add temporary right offset to object right position
    lda temp_right_offset                                             ; 25dd: ad d1 24    ..$ :24ac[1]
    bpl add_ya_to_object_right                                        ; 25e0: 10 01       ..  :24af[1]
    dey                                                               ; 25e2: 88          .   :24b1[1]
add_ya_to_object_right
    clc                                                               ; 25e3: 18          .   :24b2[1]
    adc object_right_low                                              ; 25e4: 65 72       er  :24b3[1]
    sta object_right_low                                              ; 25e6: 85 72       .r  :24b5[1]
    sta object_right_cell_x                                           ; 25e8: 85 79       .y  :24b7[1]
    tya                                                               ; 25ea: 98          .   :24b9[1]
    adc object_right_high                                             ; 25eb: 65 73       es  :24ba[1]
    sta object_right_high                                             ; 25ed: 85 73       .s  :24bc[1]
; divide by eight to get cell right position
    lsr                                                               ; 25ef: 4a          J   :24be[1]
    ror object_right_cell_x                                           ; 25f0: 66 79       fy  :24bf[1]
    lsr                                                               ; 25f2: 4a          J   :24c1[1]
    ror object_right_cell_x                                           ; 25f3: 66 79       fy  :24c2[1]
    lsr                                                               ; 25f5: 4a          J   :24c4[1]
    ror object_right_cell_x                                           ; 25f6: 66 79       fy  :24c5[1]
    lda #0                                                            ; 25f8: a9 00       ..  :24c7[1]
    sta temp_left_offset                                              ; 25fa: 8d d0 24    ..$ :24c9[1]
    sta temp_right_offset                                             ; 25fd: 8d d1 24    ..$ :24cc[1]
    rts                                                               ; 2600: 60          `   :24cf[1]

temp_left_offset
    !byte 0                                                           ; 2601: 00          .   :24d0[1]
temp_right_offset
    !byte 0                                                           ; 2602: 00          .   :24d1[1]

; *************************************************************************************
; 
; Find the top and bottom extents of the object
; 
; Returns both the top and bottom Y coordinate of the object (found using the object
; position, sprite offset and current sprite height).
; It also returns cell based versions of these two coordinates.
; 
; As input, pixel based 'temporary' offsets can be added to the result. 'Temporary'
; because they are zeroed on exit.
; 
; On Entry:
;                        X: the object index to look at
;          temp_top_offset: offset to add to result (zeroed on exit)
;       temp_bottom_offset: offset to add to result (zeroed on exit)
; 
; On Exit:
;               object_top: Set to object's position Y + sprite offset - sprite height
;            object_bottom: Set to object's position Y + sprite offset
;        object_top_cell_y: Cell Y for object_top
;     object_bottom_cell_y: Cell Y for object_bottom
; 
; *************************************************************************************
find_top_and_bottom_of_object
    txa                                                               ; 2603: 8a          .   :24d2[1]
; remember object index
    pha                                                               ; 2604: 48          H   :24d3[1]
; get address of current sprite for object
    lda object_spriteid,x                                             ; 2605: bd a8 09    ... :24d4[1]
    jsr get_address_of_sprite_a                                       ; 2608: 20 2c 13     ,. :24d7[1]
    stx sprite_addr_low                                               ; 260b: 86 80       ..  :24da[1]
    sty sprite_addr_high                                              ; 260d: 84 81       ..  :24dc[1]
; recall object index
    pla                                                               ; 260f: 68          h   :24de[1]
    tax                                                               ; 2610: aa          .   :24df[1]
; get sprite Y offset
    ldy #1                                                            ; 2611: a0 01       ..  :24e0[1]
    lda (sprite_addr_low),y                                           ; 2613: b1 80       ..  :24e2[1]
; add sprite Y offset to object position, store in object_bottom
    ldy #0                                                            ; 2615: a0 00       ..  :24e4[1]
    ora #0                                                            ; 2617: 09 00       ..  :24e6[1]
    bpl add_ya_to_object_bottom1                                      ; 2619: 10 01       ..  :24e8[1]
    dey                                                               ; 261b: 88          .   :24ea[1]
add_ya_to_object_bottom1
    clc                                                               ; 261c: 18          .   :24eb[1]
    adc object_y_low,x                                                ; 261d: 7d 7c 09    }|. :24ec[1]
    sta object_bottom_low                                             ; 2620: 85 76       .v  :24ef[1]
    tya                                                               ; 2622: 98          .   :24f1[1]
    adc object_y_high,x                                               ; 2623: 7d 92 09    }.. :24f2[1]
    sta object_bottom_high                                            ; 2626: 85 77       .w  :24f5[1]
; read sprite height
    ldy #3                                                            ; 2628: a0 03       ..  :24f7[1]
    lda (sprite_addr_low),y                                           ; 262a: b1 80       ..  :24f9[1]
; store sprite height minus one
    sec                                                               ; 262c: 38          8   :24fb[1]
    sbc #1                                                            ; 262d: e9 01       ..  :24fc[1]
    sta object_top_low                                                ; 262f: 85 74       .t  :24fe[1]
; subtract (sprite height Y minus one) to get object_top
    lda object_bottom_low                                             ; 2631: a5 76       .v  :2500[1]
    sec                                                               ; 2633: 38          8   :2502[1]
    sbc object_top_low                                                ; 2634: e5 74       .t  :2503[1]
    sta object_top_low                                                ; 2636: 85 74       .t  :2505[1]
    lda object_bottom_high                                            ; 2638: a5 77       .w  :2507[1]
    sbc #0                                                            ; 263a: e9 00       ..  :2509[1]
    sta object_top_high                                               ; 263c: 85 75       .u  :250b[1]
    ldy #0                                                            ; 263e: a0 00       ..  :250d[1]
; add temporary signed offset to object_top
    lda temp_top_offset                                               ; 2640: ad 50 25    .P% :250f[1]
    bpl add_ya_to_object_top                                          ; 2643: 10 01       ..  :2512[1]
    dey                                                               ; 2645: 88          .   :2514[1]
add_ya_to_object_top
    clc                                                               ; 2646: 18          .   :2515[1]
    adc object_top_low                                                ; 2647: 65 74       et  :2516[1]
    sta object_top_low                                                ; 2649: 85 74       .t  :2518[1]
    sta object_top_cell_y                                             ; 264b: 85 7a       .z  :251a[1]
    tya                                                               ; 264d: 98          .   :251c[1]
    adc object_top_high                                               ; 264e: 65 75       eu  :251d[1]
    sta object_top_high                                               ; 2650: 85 75       .u  :251f[1]
; divide the bottom pixel coordinate by eight to get the cell Y
    lsr                                                               ; 2652: 4a          J   :2521[1]
    ror object_top_cell_y                                             ; 2653: 66 7a       fz  :2522[1]
    lsr                                                               ; 2655: 4a          J   :2524[1]
    ror object_top_cell_y                                             ; 2656: 66 7a       fz  :2525[1]
    lsr                                                               ; 2658: 4a          J   :2527[1]
    ror object_top_cell_y                                             ; 2659: 66 7a       fz  :2528[1]
    ldy #0                                                            ; 265b: a0 00       ..  :252a[1]
; add temporary signed offset to object_bottom
    lda temp_bottom_offset                                            ; 265d: ad 51 25    .Q% :252c[1]
    bpl add_ya_to_object_bottom2                                      ; 2660: 10 01       ..  :252f[1]
    dey                                                               ; 2662: 88          .   :2531[1]
add_ya_to_object_bottom2
    clc                                                               ; 2663: 18          .   :2532[1]
    adc object_bottom_low                                             ; 2664: 65 76       ev  :2533[1]
    sta object_bottom_low                                             ; 2666: 85 76       .v  :2535[1]
    sta object_bottom_cell_y                                          ; 2668: 85 7b       .{  :2537[1]
    tya                                                               ; 266a: 98          .   :2539[1]
    adc object_bottom_high                                            ; 266b: 65 77       ew  :253a[1]
    sta object_bottom_high                                            ; 266d: 85 77       .w  :253c[1]
; divide the bottom pixel coordinate by eight to get the cell Y
    lsr                                                               ; 266f: 4a          J   :253e[1]
    ror object_bottom_cell_y                                          ; 2670: 66 7b       f{  :253f[1]
    lsr                                                               ; 2672: 4a          J   :2541[1]
    ror object_bottom_cell_y                                          ; 2673: 66 7b       f{  :2542[1]
    lsr                                                               ; 2675: 4a          J   :2544[1]
    ror object_bottom_cell_y                                          ; 2676: 66 7b       f{  :2545[1]
; zero the temporary offsets
    lda #0                                                            ; 2678: a9 00       ..  :2547[1]
    sta temp_top_offset                                               ; 267a: 8d 50 25    .P% :2549[1]
    sta temp_bottom_offset                                            ; 267d: 8d 51 25    .Q% :254c[1]
    rts                                                               ; 2680: 60          `   :254f[1]

temp_top_offset
    !byte 0                                                           ; 2681: 00          .   :2550[1]
temp_bottom_offset
    !byte 0                                                           ; 2682: 00          .   :2551[1]

adjust_left_or_right_extent_due_to_holding_an_object
    cpx #objectid_player                                              ; 2683: e0 00       ..  :2552[1]   ; Look for X=0 or X=11
    beq got_a_player_object                                           ; 2685: f0 04       ..  :2554[1]
    cpx #objectid_old_player                                          ; 2687: e0 0b       ..  :2556[1]
    bne return_zeroing_offsets                                        ; 2689: d0 7c       .|  :2558[1]
; if (player is not holding an object) then return
got_a_player_object
    lda player_held_object_spriteid                                   ; 268b: a5 52       .R  :255a[1]
    beq return_zeroing_offsets                                        ; 268d: f0 78       .x  :255c[1]
; get spriteid of object being held
    inx                                                               ; 268f: e8          .   :255e[1]
    lda object_spriteid,x                                             ; 2690: bd a8 09    ... :255f[1]
    dex                                                               ; 2693: ca          .   :2562[1]
; if (object being held has no sprite) then return
    ora #0                                                            ; 2694: 09 00       ..  :2563[1]
    beq return_zeroing_offsets                                        ; 2696: f0 6f       .o  :2565[1]
    inx                                                               ; 2698: e8          .   :2567[1]
; remember old object_left and object_right coordinates (four bytes)
    ldy #3                                                            ; 2699: a0 03       ..  :2568[1]
copy_coordinates_loop
    lda object_left_low,y                                             ; 269b: b9 70 00    .p. :256a[1]
    sta old_object_left_low,y                                         ; 269e: 99 29 01    .). :256d[1]
    dey                                                               ; 26a1: 88          .   :2570[1]
    bpl copy_coordinates_loop                                         ; 26a2: 10 f7       ..  :2571[1]
; remember old left and right cell coordinates
    lda object_left_cell_x                                            ; 26a4: a5 78       .x  :2573[1]
    sta old_object_left_cell                                          ; 26a6: 8d 2d 01    .-. :2575[1]
    lda object_right_cell_x                                           ; 26a9: a5 79       .y  :2578[1]
    sta old_object_right_cell                                         ; 26ab: 8d 2e 01    ... :257a[1]
; get held object's left/right extents
    jsr find_left_and_right_of_object                                 ; 26ae: 20 34 24     4$ :257d[1]
    lda object_direction,x                                            ; 26b1: bd be 09    ... :2580[1]
    bpl looking_right                                                 ; 26b4: 10 1f       ..  :2583[1]
; looking left. If held object's left is larger than the old left, then use the old
; coordinates
    lda object_left_low                                               ; 26b6: a5 70       .p  :2585[1]
    sec                                                               ; 26b8: 38          8   :2587[1]
    sbc old_object_left_low                                           ; 26b9: ed 29 01    .). :2588[1]
    lda object_left_high                                              ; 26bc: a5 71       .q  :258b[1]
    sbc old_object_left_high                                          ; 26be: ed 2a 01    .*. :258d[1]
    bpl reset_old_values_back_into_object_left_and_right              ; 26c1: 10 2e       ..  :2590[1]
; use the held object's left coordinate
    lda object_left_low                                               ; 26c3: a5 70       .p  :2592[1]
    sta old_object_left_low                                           ; 26c5: 8d 29 01    .). :2594[1]
    lda object_left_high                                              ; 26c8: a5 71       .q  :2597[1]
    sta old_object_left_high                                          ; 26ca: 8d 2a 01    .*. :2599[1]
    lda object_left_cell_x                                            ; 26cd: a5 78       .x  :259c[1]
    sta old_object_left_cell                                          ; 26cf: 8d 2d 01    .-. :259e[1]
    jmp reset_old_values_back_into_object_left_and_right              ; 26d2: 4c c0 25    L.% :25a1[1]

; looking right. If held object's right is smaller or equal to the old right, then use
; the old coordinates
looking_right
    lda old_object_right_low                                          ; 26d5: ad 2b 01    .+. :25a4[1]
    sec                                                               ; 26d8: 38          8   :25a7[1]
    sbc object_right_low                                              ; 26d9: e5 72       .r  :25a8[1]
    lda old_object_right_high                                         ; 26db: ad 2c 01    .,. :25aa[1]
    sbc object_right_high                                             ; 26de: e5 73       .s  :25ad[1]
    bpl reset_old_values_back_into_object_left_and_right              ; 26e0: 10 0f       ..  :25af[1]
; use the held object's right coordinate
    lda object_right_low                                              ; 26e2: a5 72       .r  :25b1[1]
    sta old_object_right_low                                          ; 26e4: 8d 2b 01    .+. :25b3[1]
    lda object_right_high                                             ; 26e7: a5 73       .s  :25b6[1]
    sta old_object_right_high                                         ; 26e9: 8d 2c 01    .,. :25b8[1]
    lda object_right_cell_x                                           ; 26ec: a5 79       .y  :25bb[1]
    sta old_object_right_cell                                         ; 26ee: 8d 2e 01    ... :25bd[1]
reset_old_values_back_into_object_left_and_right
    ldy #3                                                            ; 26f1: a0 03       ..  :25c0[1]
reset_coordinates_loop
    lda old_object_left_low,y                                         ; 26f3: b9 29 01    .). :25c2[1]
    sta object_left_low,y                                             ; 26f6: 99 70 00    .p. :25c5[1]
    dey                                                               ; 26f9: 88          .   :25c8[1]
    bpl reset_coordinates_loop                                        ; 26fa: 10 f7       ..  :25c9[1]
    lda old_object_left_cell                                          ; 26fc: ad 2d 01    .-. :25cb[1]
    sta object_left_cell_x                                            ; 26ff: 85 78       .x  :25ce[1]
    lda old_object_right_cell                                         ; 2701: ad 2e 01    ... :25d0[1]
    sta object_right_cell_x                                           ; 2704: 85 79       .y  :25d3[1]
    dex                                                               ; 2706: ca          .   :25d5[1]
return_zeroing_offsets
    lda #0                                                            ; 2707: a9 00       ..  :25d6[1]
    sta temp_left_offset                                              ; 2709: 8d d0 24    ..$ :25d8[1]
    sta temp_right_offset                                             ; 270c: 8d d1 24    ..$ :25db[1]
    rts                                                               ; 270f: 60          `   :25de[1]

; remember temp_left and right offsets, since we will use them again to find the
; attached object's left/right extents
find_left_and_right_of_object_including_held_object
    lda temp_left_offset                                              ; 2710: ad d0 24    ..$ :25df[1]
    pha                                                               ; 2713: 48          H   :25e2[1]
    lda temp_right_offset                                             ; 2714: ad d1 24    ..$ :25e3[1]
    pha                                                               ; 2717: 48          H   :25e6[1]
    jsr find_left_and_right_of_object                                 ; 2718: 20 34 24     4$ :25e7[1]
    pla                                                               ; 271b: 68          h   :25ea[1]
    sta temp_right_offset                                             ; 271c: 8d d1 24    ..$ :25eb[1]
    pla                                                               ; 271f: 68          h   :25ee[1]
    sta temp_left_offset                                              ; 2720: 8d d0 24    ..$ :25ef[1]
    jmp adjust_left_or_right_extent_due_to_holding_an_object          ; 2723: 4c 52 25    LR% :25f2[1]

; *************************************************************************************
update_object_a_solid_rock_collision
    sta objectid_to_test                                              ; 2726: 85 53       .S  :25f5[1]
    tax                                                               ; 2728: aa          .   :25f7[1]
; clear collision flags
    lda #0                                                            ; 2729: a9 00       ..  :25f8[1]
    sta object_room_collision_flags,x                                 ; 272b: 9d d8 38    ..8 :25fa[1]
; anything outside the game area returns collision map value $ff
    lda #$ff                                                          ; 272e: a9 ff       ..  :25fd[1]
    sta default_collision_map_option                                  ; 2730: 85 44       .D  :25ff[1]
; raise from the floor one pixel
    lda #1                                                            ; 2732: a9 01       ..  :2601[1]
    sta temp_bottom_offset                                            ; 2734: 8d 51 25    .Q% :2603[1]
; find extents of object and check for wall collisions
    ldx objectid_to_test                                              ; 2737: a6 53       .S  :2606[1]
    jsr find_left_and_right_of_object_including_held_object           ; 2739: 20 df 25     .% :2608[1]
    lda objectid_to_test                                              ; 273c: a5 53       .S  :260b[1]
    clc                                                               ; 273e: 18          .   :260d[1]
    adc #max_objects                                                  ; 273f: 69 0b       i.  :260e[1]
    tax                                                               ; 2741: aa          .   :2610[1]
    jsr find_top_and_bottom_of_object                                 ; 2742: 20 d2 24     .$ :2611[1]
    jsr check_for_object_intersecting_wall_left_or_right              ; 2745: 20 5a 26     Z& :2614[1]
; if (no collisions left or right) then branch
    lda object_hit_wall_on_left_result_flag                           ; 2748: a5 7c       .|  :2617[1]
    ora object_hit_wall_on_right_result_flag                          ; 274a: 05 7d       .}  :2619[1]
    beq check_top_and_bottom_for_collisions                           ; 274c: f0 09       ..  :261b[1]
    lda objectid_to_test                                              ; 274e: a5 53       .S  :261d[1]
    clc                                                               ; 2750: 18          .   :261f[1]
    adc #max_objects                                                  ; 2751: 69 0b       i.  :2620[1]
    tax                                                               ; 2753: aa          .   :2622[1]
    jsr find_left_and_right_of_object_including_held_object           ; 2754: 20 df 25     .% :2623[1]
check_top_and_bottom_for_collisions
    lda #1                                                            ; 2757: a9 01       ..  :2626[1]
    sta temp_bottom_offset                                            ; 2759: 8d 51 25    .Q% :2628[1]
    ldx objectid_to_test                                              ; 275c: a6 53       .S  :262b[1]
    jsr find_top_and_bottom_of_object                                 ; 275e: 20 d2 24     .$ :262d[1]
    jsr check_for_object_intersecting_floor_or_ceiling                ; 2761: 20 e5 26     .& :2630[1]
    jsr update_floor_or_ceiling_collision                             ; 2764: 20 1e 27     .' :2633[1]
    lda object_hit_wall_on_left_result_flag                           ; 2767: a5 7c       .|  :2636[1]
    ora object_hit_wall_on_right_result_flag                          ; 2769: 05 7d       .}  :2638[1]
    beq finished_collision_update                                     ; 276b: f0 13       ..  :263a[1]
; handle wall collision
    lda #1                                                            ; 276d: a9 01       ..  :263c[1]
    sta temp_bottom_offset                                            ; 276f: 8d 51 25    .Q% :263e[1]
    ldx objectid_to_test                                              ; 2772: a6 53       .S  :2641[1]
    jsr find_left_and_right_of_object_including_held_object           ; 2774: 20 df 25     .% :2643[1]
    jsr find_top_and_bottom_of_object                                 ; 2777: 20 d2 24     .$ :2646[1]
    jsr check_for_object_intersecting_wall_left_or_right              ; 277a: 20 5a 26     Z& :2649[1]
    jsr handle_left_right_wall_collision                              ; 277d: 20 93 26     .& :264c[1]
finished_collision_update
    lda objectid_to_test                                              ; 2780: a5 53       .S  :264f[1]
    bne return13                                                      ; 2782: d0 06       ..  :2651[1]
; player specific update
    jsr update_player_accessory_including_toolbar                     ; 2784: 20 b8 2e     .. :2653[1]
    jsr handle_player_landing_sound                                   ; 2787: 20 6b 23     k# :2656[1]
return13
    rts                                                               ; 278a: 60          `   :2659[1]

; *************************************************************************************
; 
; Check for object intersecting wall to the left or right
; 
; On Entry:
;     The cell based extents of the object have been worked out previously:
;           object_left_cell_x
;          object_right_cell_x
;            object_top_cell_y
;         object_bottom_cell_y
; 
; On Exit:
;      object_hit_wall_on_left_result_flag: Flag set ($ff) if object is intersecting
; wall on the left side of the object
;     object_hit_wall_on_right_result_flag: Flag set ($ff) if intersecting wall on the
; right side of the object
; 
; *************************************************************************************
check_for_object_intersecting_wall_left_or_right
    lda #$ff                                                          ; 278b: a9 ff       ..  :265a[1]
    sta object_hit_wall_on_left_result_flag                           ; 278d: 85 7c       .|  :265c[1]
; store objects's cell height
    ldx object_left_cell_x                                            ; 278f: a6 78       .x  :265e[1]
    ldy object_bottom_cell_y                                          ; 2791: a4 7b       .{  :2660[1]
    tya                                                               ; 2793: 98          .   :2662[1]
    sec                                                               ; 2794: 38          8   :2663[1]
    sbc object_top_cell_y                                             ; 2795: e5 7a       .z  :2664[1]
    sta object_height_in_cells                                        ; 2797: 85 80       ..  :2666[1]
; look at collision map at each cell up the object's height, looking for a solid wall
loop_up_object_cells_looking_for_solid_wall
    jsr read_collision_map_value_for_xy                               ; 2799: 20 fa 1e     .. :2668[1]
    cmp #collision_map_solid_rock                                     ; 279c: c9 03       ..  :266b[1]
    beq found_wall_on_objects_left_side                               ; 279e: f0 07       ..  :266d[1]
    dey                                                               ; 27a0: 88          .   :266f[1]
    dec object_height_in_cells                                        ; 27a1: c6 80       ..  :2670[1]
    bpl loop_up_object_cells_looking_for_solid_wall                   ; 27a3: 10 f4       ..  :2672[1]
; mark that no collision was found on the left side
    inc object_hit_wall_on_left_result_flag                           ; 27a5: e6 7c       .|  :2674[1]
found_wall_on_objects_left_side
    lda #$ff                                                          ; 27a7: a9 ff       ..  :2676[1]
    sta object_hit_wall_on_right_result_flag                          ; 27a9: 85 7d       .}  :2678[1]
; store object's cell height (again)
    ldx object_right_cell_x                                           ; 27ab: a6 79       .y  :267a[1]
    ldy object_bottom_cell_y                                          ; 27ad: a4 7b       .{  :267c[1]
    tya                                                               ; 27af: 98          .   :267e[1]
    sec                                                               ; 27b0: 38          8   :267f[1]
    sbc object_top_cell_y                                             ; 27b1: e5 7a       .z  :2680[1]
    sta object_height_in_cells                                        ; 27b3: 85 80       ..  :2682[1]
; look at collision map at each cell up the object's height, looking for a solid wall
read_cells_in_column_loop
    jsr read_collision_map_value_for_xy                               ; 27b5: 20 fa 1e     .. :2684[1]
    cmp #collision_map_solid_rock                                     ; 27b8: c9 03       ..  :2687[1]
    beq return14                                                      ; 27ba: f0 07       ..  :2689[1]
    dey                                                               ; 27bc: 88          .   :268b[1]
    dec object_height_in_cells                                        ; 27bd: c6 80       ..  :268c[1]
    bpl read_cells_in_column_loop                                     ; 27bf: 10 f4       ..  :268e[1]
; mark that no collision was found on the right side
    inc object_hit_wall_on_right_result_flag                          ; 27c1: e6 7d       .}  :2690[1]
return14
    rts                                                               ; 27c3: 60          `   :2692[1]

; *************************************************************************************
; 
; If colliding with a wall, line up next to the wall instead of going through it.
; 
; On Entry:
;     objectid_to_test: object index to test
; 
; *************************************************************************************
handle_left_right_wall_collision
    ldx objectid_to_test                                              ; 27c4: a6 53       .S  :2693[1]
    lda object_hit_wall_on_left_result_flag                           ; 27c6: a5 7c       .|  :2695[1]
    cmp object_hit_wall_on_right_result_flag                          ; 27c8: c5 7d       .}  :2697[1]
    beq return15                                                      ; 27ca: f0 49       .I  :2699[1]
    bcc object_has_hit_wall_on_right_side                             ; 27cc: 90 25       .%  :269b[1]
; object has hit wall on left side. Adjust object position to align with the cell next
; to the wall.
    lda object_left_low                                               ; 27ce: a5 70       .p  :269d[1]
    and #7                                                            ; 27d0: 29 07       ).  :269f[1]
    sta adjustment                                                    ; 27d2: 85 80       ..  :26a1[1]
    lda #8                                                            ; 27d4: a9 08       ..  :26a3[1]
    sec                                                               ; 27d6: 38          8   :26a5[1]
    sbc adjustment                                                    ; 27d7: e5 80       ..  :26a6[1]
    clc                                                               ; 27d9: 18          .   :26a8[1]
    adc object_x_low,x                                                ; 27da: 7d 50 09    }P. :26a9[1]
    sta object_x_low,x                                                ; 27dd: 9d 50 09    .P. :26ac[1]
    lda #0                                                            ; 27e0: a9 00       ..  :26af[1]
    adc object_x_high,x                                               ; 27e2: 7d 66 09    }f. :26b1[1]
    sta object_x_high,x                                               ; 27e5: 9d 66 09    .f. :26b4[1]
; mark object has collided with left wall
    lda object_room_collision_flags,x                                 ; 27e8: bd d8 38    ..8 :26b7[1]
    ora #object_collided_left_wall                                    ; 27eb: 09 01       ..  :26ba[1]
    sta object_room_collision_flags,x                                 ; 27ed: 9d d8 38    ..8 :26bc[1]
    jmp return15                                                      ; 27f0: 4c e4 26    L.& :26bf[1]

; object has hit wall on right side. Adjust object position to align with the cell next
; to the wall.
object_has_hit_wall_on_right_side
    lda object_right_low                                              ; 27f3: a5 72       .r  :26c2[1]
    and #7                                                            ; 27f5: 29 07       ).  :26c4[1]
    clc                                                               ; 27f7: 18          .   :26c6[1]
    adc #1                                                            ; 27f8: 69 01       i.  :26c7[1]
    sta adjustment                                                    ; 27fa: 85 80       ..  :26c9[1]
    lda object_x_low,x                                                ; 27fc: bd 50 09    .P. :26cb[1]
    sec                                                               ; 27ff: 38          8   :26ce[1]
    sbc adjustment                                                    ; 2800: e5 80       ..  :26cf[1]
    sta object_x_low,x                                                ; 2802: 9d 50 09    .P. :26d1[1]
    lda object_x_high,x                                               ; 2805: bd 66 09    .f. :26d4[1]
    sbc #0                                                            ; 2808: e9 00       ..  :26d7[1]
    sta object_x_high,x                                               ; 280a: 9d 66 09    .f. :26d9[1]
; mark object has collided with right wall
    lda object_room_collision_flags,x                                 ; 280d: bd d8 38    ..8 :26dc[1]
    ora #object_collided_right_wall                                   ; 2810: 09 04       ..  :26df[1]
    sta object_room_collision_flags,x                                 ; 2812: 9d d8 38    ..8 :26e1[1]
return15
    rts                                                               ; 2815: 60          `   :26e4[1]

; *************************************************************************************
; 
; Check for object intersecting floor or ceiling of the room
; 
; On Entry:
;     The cell based extents of the object have been worked out previously:
;           object_left_cell_x
;          object_right_cell_x
;            object_top_cell_y
;         object_bottom_cell_y
; 
; On Exit:
;       object_hit_floor_result_flag: $ff if hit, $00 otherwise
;     object_hit_ceiling_result_flag: $ff if hit, $00 otherwise
; 
; *************************************************************************************
check_for_object_intersecting_floor_or_ceiling
    lda #$ff                                                          ; 2816: a9 ff       ..  :26e5[1]
    sta object_hit_ceiling_result_flag                                ; 2818: 85 7e       .~  :26e7[1]
; start at top right
    ldy object_top_cell_y                                             ; 281a: a4 7a       .z  :26e9[1]
; get object width in cells
    ldx object_right_cell_x                                           ; 281c: a6 79       .y  :26eb[1]
    txa                                                               ; 281e: 8a          .   :26ed[1]
    sec                                                               ; 281f: 38          8   :26ee[1]
    sbc object_left_cell_x                                            ; 2820: e5 78       .x  :26ef[1]
    sta object_width_in_cells                                         ; 2822: 85 80       ..  :26f1[1]
; loop from top right to top left looking for a solid_rock
look_for_solid_rock_along_object_top_edge_loop
    jsr read_collision_map_value_for_xy                               ; 2824: 20 fa 1e     .. :26f3[1]
    cmp #collision_map_solid_rock                                     ; 2827: c9 03       ..  :26f6[1]
    beq found_solid_rock                                              ; 2829: f0 07       ..  :26f8[1]
    dex                                                               ; 282b: ca          .   :26fa[1]
    dec object_width_in_cells                                         ; 282c: c6 80       ..  :26fb[1]
    bpl look_for_solid_rock_along_object_top_edge_loop                ; 282e: 10 f4       ..  :26fd[1]
; no collision with top edge of object
    inc object_hit_ceiling_result_flag                                ; 2830: e6 7e       .~  :26ff[1]
found_solid_rock
    lda #$ff                                                          ; 2832: a9 ff       ..  :2701[1]
    sta object_hit_floor_result_flag                                  ; 2834: 85 7f       ..  :2703[1]
; start at bottom right
    ldy object_bottom_cell_y                                          ; 2836: a4 7b       .{  :2705[1]
; get object width in cells (again)
    ldx object_right_cell_x                                           ; 2838: a6 79       .y  :2707[1]
    txa                                                               ; 283a: 8a          .   :2709[1]
    sec                                                               ; 283b: 38          8   :270a[1]
    sbc object_left_cell_x                                            ; 283c: e5 78       .x  :270b[1]
    sta object_width_in_cells                                         ; 283e: 85 80       ..  :270d[1]
look_for_solid_rock_along_object_bottom_edge_loop
    jsr read_collision_map_value_for_xy                               ; 2840: 20 fa 1e     .. :270f[1]
    cmp #collision_map_solid_rock                                     ; 2843: c9 03       ..  :2712[1]
    beq return16                                                      ; 2845: f0 07       ..  :2714[1]
    dex                                                               ; 2847: ca          .   :2716[1]
    dec object_width_in_cells                                         ; 2848: c6 80       ..  :2717[1]
    bpl look_for_solid_rock_along_object_bottom_edge_loop             ; 284a: 10 f4       ..  :2719[1]
; no collision with bottom edge of object
    inc object_hit_floor_result_flag                                  ; 284c: e6 7f       ..  :271b[1]
return16
    rts                                                               ; 284e: 60          `   :271d[1]

; *************************************************************************************
update_floor_or_ceiling_collision
    ldx objectid_to_test                                              ; 284f: a6 53       .S  :271e[1]
    lda object_hit_ceiling_result_flag                                ; 2851: a5 7e       .~  :2720[1]
    cmp object_hit_floor_result_flag                                  ; 2853: c5 7f       ..  :2722[1]
    beq return17                                                      ; 2855: f0 49       .I  :2724[1]
    bcc object_has_hit_floor                                          ; 2857: 90 25       .%  :2726[1]
; object has hit ceiling. Adjust object position to align with the cell below the
; ceiling.
    lda object_top_low                                                ; 2859: a5 74       .t  :2728[1]
    and #7                                                            ; 285b: 29 07       ).  :272a[1]
    sta adjustment                                                    ; 285d: 85 80       ..  :272c[1]
    lda #8                                                            ; 285f: a9 08       ..  :272e[1]
    sec                                                               ; 2861: 38          8   :2730[1]
    sbc adjustment                                                    ; 2862: e5 80       ..  :2731[1]
    clc                                                               ; 2864: 18          .   :2733[1]
    adc object_y_low,x                                                ; 2865: 7d 7c 09    }|. :2734[1]
    sta object_y_low,x                                                ; 2868: 9d 7c 09    .|. :2737[1]
    lda #0                                                            ; 286b: a9 00       ..  :273a[1]
    adc object_y_high,x                                               ; 286d: 7d 92 09    }.. :273c[1]
    sta object_y_high,x                                               ; 2870: 9d 92 09    ... :273f[1]
; mark object has collided with ceiling
    lda object_room_collision_flags,x                                 ; 2873: bd d8 38    ..8 :2742[1]
    ora #object_collided_ceiling                                      ; 2876: 09 08       ..  :2745[1]
    sta object_room_collision_flags,x                                 ; 2878: 9d d8 38    ..8 :2747[1]
    jmp return17                                                      ; 287b: 4c 6f 27    Lo' :274a[1]

; object has hit floor. Adjust object position to align with the cell above the floor.
object_has_hit_floor
    lda object_bottom_low                                             ; 287e: a5 76       .v  :274d[1]
    and #7                                                            ; 2880: 29 07       ).  :274f[1]
    clc                                                               ; 2882: 18          .   :2751[1]
    adc #1                                                            ; 2883: 69 01       i.  :2752[1]
    sta adjustment                                                    ; 2885: 85 80       ..  :2754[1]
    lda object_y_low,x                                                ; 2887: bd 7c 09    .|. :2756[1]
    sec                                                               ; 288a: 38          8   :2759[1]
    sbc adjustment                                                    ; 288b: e5 80       ..  :275a[1]
    sta object_y_low,x                                                ; 288d: 9d 7c 09    .|. :275c[1]
    lda object_y_high,x                                               ; 2890: bd 92 09    ... :275f[1]
    sbc #0                                                            ; 2893: e9 00       ..  :2762[1]
    sta object_y_high,x                                               ; 2895: 9d 92 09    ... :2764[1]
; mark object has collided with floor
    lda object_room_collision_flags,x                                 ; 2898: bd d8 38    ..8 :2767[1]
    ora #object_collided_floor                                        ; 289b: 09 02       ..  :276a[1]
    sta object_room_collision_flags,x                                 ; 289d: 9d d8 38    ..8 :276c[1]
return17
    rts                                                               ; 28a0: 60          `   :276f[1]

; *************************************************************************************
; 
; Check if the object is hitting the floor, and if so, deal with it
; 
; On Entry:
;     A: object id to test
; 
; On Exit:
;     object_has_hit_floor_flag and A and flags: $ff if player/object hit floor,
;                                                $00 otherwise.
;         object_just_fallen_off_edge_direction: $ff if player/object is off left edge,
;                                                $01 if off right edge,
;                                                $00 otherwise.
;        object_just_fallen_centrally_direction: $ff if player/object is off the centre
; left,
;                                                $01 if off the centre right,
;                                                $00 otherwise.
; 
; *************************************************************************************
update_object_hitting_floor
    sta objectid_to_test                                              ; 28a1: 85 53       .S  :2770[1]
    txa                                                               ; 28a3: 8a          .   :2772[1]   ; remember X,Y
    pha                                                               ; 28a4: 48          H   :2773[1]
    tya                                                               ; 28a5: 98          .   :2774[1]
    pha                                                               ; 28a6: 48          H   :2775[1]
; check collision of object with room
    ldx objectid_to_test                                              ; 28a7: a6 53       .S  :2776[1]
    jsr find_left_and_right_of_object_including_held_object           ; 28a9: 20 df 25     .% :2778[1]
    lda #2                                                            ; 28ac: a9 02       ..  :277b[1]
    sta temp_bottom_offset                                            ; 28ae: 8d 51 25    .Q% :277d[1]
    jsr find_top_and_bottom_of_object                                 ; 28b1: 20 d2 24     .$ :2780[1]
; don't write values to the collision map
    lda #$ff                                                          ; 28b4: a9 ff       ..  :2783[1]
    sta default_collision_map_option                                  ; 28b6: 85 44       .D  :2785[1]
; have we hit the floor?
    jsr check_for_object_intersecting_floor_or_ceiling                ; 28b8: 20 e5 26     .& :2787[1]
; clear 'just fallen off' table
    lda #0                                                            ; 28bb: a9 00       ..  :278a[1]
    sta object_just_fallen_off_edge_direction                         ; 28bd: 8d 90 28    ..( :278c[1]
    sta object_just_fallen_centrally_direction                        ; 28c0: 8d 91 28    ..( :278f[1]
; if (object hit floor) then branch
    lda object_hit_floor_result_flag                                  ; 28c3: a5 7f       ..  :2792[1]
    sta object_has_hit_floor_flag                                     ; 28c5: 8d 8f 28    ..( :2794[1]
    bne object_hit_floor                                              ; 28c8: d0 03       ..  :2797[1]
    jmp recall_registers_and_return2                                  ; 28ca: 4c 51 28    LQ( :2799[1]

object_hit_floor
    lda object_left_cell_x                                            ; 28cd: a5 78       .x  :279c[1]
    sta temp_object_left_cell                                         ; 28cf: 8d 21 01    .!. :279e[1]
    lda object_right_cell_x                                           ; 28d2: a5 79       .y  :27a1[1]
    sta temp_object_right_cell                                        ; 28d4: 8d 22 01    .". :27a3[1]
    ldx objectid_to_test                                              ; 28d7: a6 53       .S  :27a6[1]
; find the left/right extents of object without the accessory object
    jsr find_left_and_right_of_object                                 ; 28d9: 20 34 24     4$ :27a8[1]
; add one to the right pixel extent
    lda object_right_low                                              ; 28dc: a5 72       .r  :27ab[1]
    clc                                                               ; 28de: 18          .   :27ad[1]
    adc #1                                                            ; 28df: 69 01       i.  :27ae[1]
    sta object_right_low                                              ; 28e1: 85 72       .r  :27b0[1]
    lda object_right_high                                             ; 28e3: a5 73       .s  :27b2[1]
    adc #0                                                            ; 28e5: 69 00       i.  :27b4[1]
    sta object_right_high                                             ; 28e7: 85 73       .s  :27b6[1]
; sum the left and right extents
    lda object_left_low                                               ; 28e9: a5 70       .p  :27b8[1]
    clc                                                               ; 28eb: 18          .   :27ba[1]
    adc object_right_low                                              ; 28ec: 65 72       er  :27bb[1]
    sta sum_of_left_and_right_extents_low                             ; 28ee: 8d 92 28    ..( :27bd[1]
    lda object_left_high                                              ; 28f1: a5 71       .q  :27c0[1]
    adc object_right_high                                             ; 28f3: 65 73       es  :27c2[1]
    sta sum_of_left_and_right_extents_high                            ; 28f5: 8d 93 28    ..( :27c4[1]
; restore original left right cells
    lda temp_object_left_cell                                         ; 28f8: ad 21 01    .!. :27c7[1]
    sta object_left_cell_x                                            ; 28fb: 85 78       .x  :27ca[1]
    lda temp_object_right_cell                                        ; 28fd: ad 22 01    .". :27cc[1]
    sta object_right_cell_x                                           ; 2900: 85 79       .y  :27cf[1]
; set y to be the bottom cell (later we'll get a value from the collision map)
    ldy object_bottom_cell_y                                          ; 2902: a4 7b       .{  :27d1[1]
; To see if the object should fall, the idea here is to look at the cell below the
; object, 3/4 of the way to the left. Calculating 3/4 of the way along is done by
; calculating (2L+(L+R))/4 = (3L+R)/4 = (3/4)L + (1/4)R
; the result is rounded, so that we look at two adjacent cells based on the rounding.
; First double the left extent, and add to the sum of left and right extents...
    asl object_left_low                                               ; 2904: 06 70       .p  :27d3[1]
    rol object_left_high                                              ; 2906: 26 71       &q  :27d5[1]
    lda sum_of_left_and_right_extents_low                             ; 2908: ad 92 28    ..( :27d7[1]
    clc                                                               ; 290b: 18          .   :27da[1]
    adc object_left_low                                               ; 290c: 65 70       ep  :27db[1]
    sta object_top_cell_y                                             ; 290e: 85 7a       .z  :27dd[1]
    lda sum_of_left_and_right_extents_high                            ; 2910: ad 93 28    ..( :27df[1]
    adc object_left_high                                              ; 2913: 65 71       eq  :27e2[1]
; ...then divide by four...
    lsr                                                               ; 2915: 4a          J   :27e4[1]
    ror object_top_cell_y                                             ; 2916: 66 7a       fz  :27e5[1]
    lsr                                                               ; 2918: 4a          J   :27e7[1]
    ror object_top_cell_y                                             ; 2919: 66 7a       fz  :27e8[1]
    tax                                                               ; 291b: aa          .   :27ea[1]
; ...and round the result
    lda object_top_cell_y                                             ; 291c: a5 7a       .z  :27eb[1]
    sbc #0                                                            ; 291e: e9 00       ..  :27ed[1]
    sta object_top_cell_y                                             ; 2920: 85 7a       .z  :27ef[1]
    txa                                                               ; 2922: 8a          .   :27f1[1]
    sbc #0                                                            ; 2923: e9 00       ..  :27f2[1]
    jsr check_for_solid_rock_along_a_row_of_cells1                    ; 2925: 20 59 28     Y( :27f4[1]
    bne check_for_solid_rock_under_object_to_right                    ; 2928: d0 05       ..  :27f7[1]
; object has fallen off the edge to the left
    dec object_just_fallen_off_edge_direction                         ; 292a: ce 90 28    ..( :27f9[1]
    bne object_has_fallen_off_either_edge                             ; 292d: d0 1f       ..  :27fc[1]   ; ALWAYS branch
; solid rock was found three quarters to the left, now check three quarters right.
; This is similar to above code, starting with: Double the right extent, and add to the
; sum of left and right extents...
check_for_solid_rock_under_object_to_right
    asl object_right_low                                              ; 292f: 06 72       .r  :27fe[1]
    rol object_right_high                                             ; 2931: 26 73       &s  :2800[1]
    lda sum_of_left_and_right_extents_low                             ; 2933: ad 92 28    ..( :2802[1]
    clc                                                               ; 2936: 18          .   :2805[1]
    adc object_right_low                                              ; 2937: 65 72       er  :2806[1]
    sta object_top_cell_y                                             ; 2939: 85 7a       .z  :2808[1]
    lda sum_of_left_and_right_extents_high                            ; 293b: ad 93 28    ..( :280a[1]
    adc object_right_high                                             ; 293e: 65 73       es  :280d[1]
; ...then divide by four...
    lsr                                                               ; 2940: 4a          J   :280f[1]
    ror object_top_cell_y                                             ; 2941: 66 7a       fz  :2810[1]
    lsr                                                               ; 2943: 4a          J   :2812[1]
    ror object_top_cell_y                                             ; 2944: 66 7a       fz  :2813[1]
; check cells for solid rock
    jsr check_for_solid_rock_along_a_row_of_cells2                    ; 2946: 20 6d 28     m( :2815[1]
    bne recall_registers_and_return2                                  ; 2949: d0 37       .7  :2818[1]
; object has fallen off the edge to the right
    inc object_just_fallen_off_edge_direction                         ; 294b: ee 90 28    ..( :281a[1]
object_has_fallen_off_either_edge
    lda objectid_to_test                                              ; 294e: a5 53       .S  :281d[1]
    beq check_cell_centre_below_player                                ; 2950: f0 04       ..  :281f[1]
    cmp #objectid_old_player                                          ; 2952: c9 0b       ..  :2821[1]
    bne recall_registers_and_return2                                  ; 2954: d0 2c       .,  :2823[1]
; divide the sum by two to find the centre position
check_cell_centre_below_player
    lsr sum_of_left_and_right_extents_high                            ; 2956: 4e 93 28    N.( :2825[1]
    ror sum_of_left_and_right_extents_low                             ; 2959: 6e 92 28    n.( :2828[1]
; round result
    lda sum_of_left_and_right_extents_low                             ; 295c: ad 92 28    ..( :282b[1]
    sbc #0                                                            ; 295f: e9 00       ..  :282e[1]
    sta object_top_cell_y                                             ; 2961: 85 7a       .z  :2830[1]
    lda sum_of_left_and_right_extents_high                            ; 2963: ad 93 28    ..( :2832[1]
    sbc #0                                                            ; 2966: e9 00       ..  :2835[1]
; check cells for solid rock
    jsr check_for_solid_rock_along_a_row_of_cells1                    ; 2968: 20 59 28     Y( :2837[1]
    bne check_object_supported_to_centre_left                         ; 296b: d0 05       ..  :283a[1]
; object fallen more centrally to the left
    dec object_just_fallen_centrally_direction                        ; 296d: ce 91 28    ..( :283c[1]
    bne recall_registers_and_return2                                  ; 2970: d0 10       ..  :283f[1]
check_object_supported_to_centre_left
    lda sum_of_left_and_right_extents_low                             ; 2972: ad 92 28    ..( :2841[1]
    sta object_top_cell_y                                             ; 2975: 85 7a       .z  :2844[1]
    lda sum_of_left_and_right_extents_high                            ; 2977: ad 93 28    ..( :2846[1]
; check cells for solid rock
    jsr check_for_solid_rock_along_a_row_of_cells2                    ; 297a: 20 6d 28     m( :2849[1]
    bne recall_registers_and_return2                                  ; 297d: d0 03       ..  :284c[1]
; object fallen more centrally to the right
    inc object_just_fallen_centrally_direction                        ; 297f: ee 91 28    ..( :284e[1]
recall_registers_and_return2
    pla                                                               ; 2982: 68          h   :2851[1]   ; recall X,Y
    tay                                                               ; 2983: a8          .   :2852[1]
    pla                                                               ; 2984: 68          h   :2853[1]
    tax                                                               ; 2985: aa          .   :2854[1]
    lda object_has_hit_floor_flag                                     ; 2986: ad 8f 28    ..( :2855[1]
    rts                                                               ; 2989: 60          `   :2858[1]

; *************************************************************************************
; 
; Read the collision cells along a row, looking for solid rock anywhere.
; Pixel position is the right extent of the row.
; 
; On Entry:
;     (A, object_top_cell_y): the right extent of the row (pixel X coordinate)
;                          Y: cell Y coordinate to check
;         object_left_cell_x: the left extent of the row (cell X coordinate)
; 
; On Exit:
;     Zero flag: result is non-zero if solid rock found
; 
; *************************************************************************************
; divide the pixel coordinate by eight
check_for_solid_rock_along_a_row_of_cells1
    lsr                                                               ; 298a: 4a          J   :2859[1]
    ror object_top_cell_y                                             ; 298b: 66 7a       fz  :285a[1]
    lsr                                                               ; 298d: 4a          J   :285c[1]
    ror object_top_cell_y                                             ; 298e: 66 7a       fz  :285d[1]
    lsr                                                               ; 2990: 4a          J   :285f[1]
    ror object_top_cell_y                                             ; 2991: 66 7a       fz  :2860[1]
; find width in cells of the row to check (this will be our loop counter)
    ldx object_top_cell_y                                             ; 2993: a6 7a       .z  :2862[1]
    txa                                                               ; 2995: 8a          .   :2864[1]
    sec                                                               ; 2996: 38          8   :2865[1]
    sbc object_left_cell_x                                            ; 2997: e5 78       .x  :2866[1]
    sta cell_based_loop_counter                                       ; 2999: 85 80       ..  :2868[1]
    jmp cell_row_loop                                                 ; 299b: 4c 7e 28    L~( :286a[1]

; *************************************************************************************
; 
; Read the collision cells along a row, looking for solid rock anywhere.
; Pixel position is the left extent of the row.
; 
; On Entry:
;     (A, object_top_cell_y): the left extent of the row (pixel X coordinate)
;                          Y: cell Y coordinate to check
;        object_right_cell_x: the right extent of the row (cell X coordinate)
; 
; On Exit:
;     Zero flag: result is non-zero if solid rock found
; 
; *************************************************************************************
; divide the pixel coordinate by eight
check_for_solid_rock_along_a_row_of_cells2
    lsr                                                               ; 299e: 4a          J   :286d[1]
    ror object_top_cell_y                                             ; 299f: 66 7a       fz  :286e[1]
    lsr                                                               ; 29a1: 4a          J   :2870[1]
    ror object_top_cell_y                                             ; 29a2: 66 7a       fz  :2871[1]
    lsr                                                               ; 29a4: 4a          J   :2873[1]
    ror object_top_cell_y                                             ; 29a5: 66 7a       fz  :2874[1]
; find width in cells of the row to check (this will be our loop counter)
    ldx object_right_cell_x                                           ; 29a7: a6 79       .y  :2876[1]
    txa                                                               ; 29a9: 8a          .   :2878[1]
    sec                                                               ; 29aa: 38          8   :2879[1]
    sbc object_top_cell_y                                             ; 29ab: e5 7a       .z  :287a[1]
    sta cell_based_loop_counter                                       ; 29ad: 85 80       ..  :287c[1]
cell_row_loop
    jsr read_collision_map_value_for_xy                               ; 29af: 20 fa 1e     .. :287e[1]
    cmp #collision_map_solid_rock                                     ; 29b2: c9 03       ..  :2881[1]
    beq return_with_flags                                             ; 29b4: f0 07       ..  :2883[1]
    dex                                                               ; 29b6: ca          .   :2885[1]
    dec cell_based_loop_counter                                       ; 29b7: c6 80       ..  :2886[1]
    bpl cell_row_loop                                                 ; 29b9: 10 f4       ..  :2888[1]
; no solid rock found
    lda #0                                                            ; 29bb: a9 00       ..  :288a[1]
return_with_flags
    ora #0                                                            ; 29bd: 09 00       ..  :288c[1]
    rts                                                               ; 29bf: 60          `   :288e[1]

object_has_hit_floor_flag
    !byte 0                                                           ; 29c0: 00          .   :288f[1]
object_just_fallen_off_edge_direction
    !byte 0                                                           ; 29c1: 00          .   :2890[1]
object_just_fallen_centrally_direction
    !byte 0                                                           ; 29c2: 00          .   :2891[1]
sum_of_left_and_right_extents_low
    !byte 0                                                           ; 29c3: 00          .   :2892[1]
sum_of_left_and_right_extents_high
    !byte 0                                                           ; 29c4: 00          .   :2893[1]

; *************************************************************************************
; 
; Get solid_rock collision flags for object
; 
; On Entry:
;                        A: object index
;         temp_left_offset: offset to add to result (zeroed on exit)
;        temp_right_offset: offset to add to result (zeroed on exit)
;          temp_top_offset: offset to add to result (zeroed on exit)
;       temp_bottom_offset: offset to add to result (zeroed on exit)
; 
; 
; On Exit:
;     A: A=1 means object collided with left wall
;        A=2 means object collided with floor
;        A=4 means object collided with right wall
;        A=8 means object collided with ceiling
;     Flags reflect A on exit.
; 
; *************************************************************************************
; TODO: this is used by e.g. dataA
get_solid_rock_collision_for_object_a
    sta temp_collision_result                                         ; 29c5: 8d 5b 29    .[) :2894[1]
    txa                                                               ; 29c8: 8a          .   :2897[1]   ; remember X,Y
    pha                                                               ; 29c9: 48          H   :2898[1]
    tya                                                               ; 29ca: 98          .   :2899[1]
    pha                                                               ; 29cb: 48          H   :289a[1]
    ldx temp_collision_result                                         ; 29cc: ae 5b 29    .[) :289b[1]
    jsr find_left_and_right_of_object_including_held_object           ; 29cf: 20 df 25     .% :289e[1]
    jsr find_top_and_bottom_of_object                                 ; 29d2: 20 d2 24     .$ :28a1[1]
    lda temp_default_collision_map_option                             ; 29d5: ad e1 28    ..( :28a4[1]
    sta default_collision_map_option                                  ; 29d8: 85 44       .D  :28a7[1]
    jsr check_for_object_intersecting_wall_left_or_right              ; 29da: 20 5a 26     Z& :28a9[1]
    jsr check_for_object_intersecting_floor_or_ceiling                ; 29dd: 20 e5 26     .& :28ac[1]
    lda object_hit_wall_on_left_result_flag                           ; 29e0: a5 7c       .|  :28af[1]
    and #1                                                            ; 29e2: 29 01       ).  :28b1[1]
    sta temp_collision_result                                         ; 29e4: 8d 5b 29    .[) :28b3[1]
    lda object_hit_wall_on_right_result_flag                          ; 29e7: a5 7d       .}  :28b6[1]
    and #4                                                            ; 29e9: 29 04       ).  :28b8[1]
    ora temp_collision_result                                         ; 29eb: 0d 5b 29    .[) :28ba[1]
    sta temp_collision_result                                         ; 29ee: 8d 5b 29    .[) :28bd[1]
    lda object_hit_ceiling_result_flag                                ; 29f1: a5 7e       .~  :28c0[1]
    and #8                                                            ; 29f3: 29 08       ).  :28c2[1]
    ora temp_collision_result                                         ; 29f5: 0d 5b 29    .[) :28c4[1]
    sta temp_collision_result                                         ; 29f8: 8d 5b 29    .[) :28c7[1]
    lda object_hit_floor_result_flag                                  ; 29fb: a5 7f       ..  :28ca[1]
    and #2                                                            ; 29fd: 29 02       ).  :28cc[1]
    ora temp_collision_result                                         ; 29ff: 0d 5b 29    .[) :28ce[1]
    sta temp_collision_result                                         ; 2a02: 8d 5b 29    .[) :28d1[1]
    lda #collision_map_none                                           ; 2a05: a9 00       ..  :28d4[1]
    sta temp_default_collision_map_option                             ; 2a07: 8d e1 28    ..( :28d6[1]
    pla                                                               ; 2a0a: 68          h   :28d9[1]   ; recall X,Y
    tay                                                               ; 2a0b: a8          .   :28da[1]
    pla                                                               ; 2a0c: 68          h   :28db[1]
    tax                                                               ; 2a0d: aa          .   :28dc[1]
    lda temp_collision_result                                         ; 2a0e: ad 5b 29    .[) :28dd[1]
    rts                                                               ; 2a11: 60          `   :28e0[1]

temp_default_collision_map_option
    !byte collision_map_none                                          ; 2a12: 00          .   :28e1[1]

; TODO: this is used by e.g. dataA
; *************************************************************************************
; 
; Test for a collision between two objects
; 
; Calculate if the bounding boxes of the two objects overlap.
; 
; On Entry:
;     X, Y: The object indexes of two objects to test
; 
; On Exit:
;     A: $ff if collision occcurs, else $00
;     flags: reflect value in A
;     Preserves X,Y
; 
; *************************************************************************************
test_for_collision_between_objects_x_and_y
    txa                                                               ; 2a13: 8a          .   :28e2[1]   ; remember X,Y
    pha                                                               ; 2a14: 48          H   :28e3[1]
    tya                                                               ; 2a15: 98          .   :28e4[1]
    pha                                                               ; 2a16: 48          H   :28e5[1]
    lda #0                                                            ; 2a17: a9 00       ..  :28e6[1]
    sta temp_collision_result                                         ; 2a19: 8d 5b 29    .[) :28e8[1]
; make sure we have sprites for both objects X and Y
    lda object_spriteid,x                                             ; 2a1c: bd a8 09    ... :28eb[1]
    beq return_restoring_registers                                    ; 2a1f: f0 55       .U  :28ee[1]
    lda object_spriteid,y                                             ; 2a21: b9 a8 09    ... :28f0[1]
    beq return_restoring_registers                                    ; 2a24: f0 50       .P  :28f3[1]
    jsr find_left_and_right_of_object_including_held_object           ; 2a26: 20 df 25     .% :28f5[1]
    jsr find_top_and_bottom_of_object                                 ; 2a29: 20 d2 24     .$ :28f8[1]
; remember extents for object x (as 'x_' versions) (copy eight bytes)
    ldx #7                                                            ; 2a2c: a2 07       ..  :28fb[1]
copy_extents_loop
    lda object_left_low,x                                             ; 2a2e: b5 70       .p  :28fd[1]
    sta x_object_left_low,x                                           ; 2a30: 9d 21 01    .!. :28ff[1]
    dex                                                               ; 2a33: ca          .   :2902[1]
    bpl copy_extents_loop                                             ; 2a34: 10 f8       ..  :2903[1]
; retrieve index for second object (was in Y on entry), and put in X register
    pla                                                               ; 2a36: 68          h   :2905[1]
    pha                                                               ; 2a37: 48          H   :2906[1]
    tax                                                               ; 2a38: aa          .   :2907[1]
; get extents for object Y
    jsr find_left_and_right_of_object_including_held_object           ; 2a39: 20 df 25     .% :2908[1]
    jsr find_top_and_bottom_of_object                                 ; 2a3c: 20 d2 24     .$ :290b[1]
; compare edges of the two objects to see if there is an overlap
    lda x_object_right_low                                            ; 2a3f: ad 23 01    .#. :290e[1]
    sec                                                               ; 2a42: 38          8   :2911[1]
    sbc object_left_low                                               ; 2a43: e5 70       .p  :2912[1]
    lda x_object_right_high                                           ; 2a45: ad 24 01    .$. :2914[1]
    sbc object_left_high                                              ; 2a48: e5 71       .q  :2917[1]
    bmi return_restoring_registers                                    ; 2a4a: 30 2a       0*  :2919[1]
    lda object_right_low                                              ; 2a4c: a5 72       .r  :291b[1]
    sec                                                               ; 2a4e: 38          8   :291d[1]
    sbc x_object_left_low                                             ; 2a4f: ed 21 01    .!. :291e[1]
    lda object_right_high                                             ; 2a52: a5 73       .s  :2921[1]
    sbc x_object_left_high                                            ; 2a54: ed 22 01    .". :2923[1]
    bmi return_restoring_registers                                    ; 2a57: 30 1d       0.  :2926[1]
    lda x_object_bottom_low                                           ; 2a59: ad 27 01    .'. :2928[1]
    sec                                                               ; 2a5c: 38          8   :292b[1]
    sbc object_top_low                                                ; 2a5d: e5 74       .t  :292c[1]
    lda x_object_bottom_high                                          ; 2a5f: ad 28 01    .(. :292e[1]
    sbc object_top_high                                               ; 2a62: e5 75       .u  :2931[1]
    bmi return_restoring_registers                                    ; 2a64: 30 10       0.  :2933[1]
    lda object_bottom_low                                             ; 2a66: a5 76       .v  :2935[1]
    sec                                                               ; 2a68: 38          8   :2937[1]
    sbc x_object_top_low                                              ; 2a69: ed 25 01    .%. :2938[1]
    lda object_bottom_high                                            ; 2a6c: a5 77       .w  :293b[1]
    sbc x_object_top_high                                             ; 2a6e: ed 26 01    .&. :293d[1]
    bmi return_restoring_registers                                    ; 2a71: 30 03       0.  :2940[1]
; there is an overlap
    dec temp_collision_result                                         ; 2a73: ce 5b 29    .[) :2942[1]
return_restoring_registers
    lda #0                                                            ; 2a76: a9 00       ..  :2945[1]
    sta temp_top_offset                                               ; 2a78: 8d 50 25    .P% :2947[1]
    sta temp_bottom_offset                                            ; 2a7b: 8d 51 25    .Q% :294a[1]
    sta temp_right_offset                                             ; 2a7e: 8d d1 24    ..$ :294d[1]
    sta temp_left_offset                                              ; 2a81: 8d d0 24    ..$ :2950[1]
    pla                                                               ; 2a84: 68          h   :2953[1]   ; recall X,Y
    tay                                                               ; 2a85: a8          .   :2954[1]
    pla                                                               ; 2a86: 68          h   :2955[1]
    tax                                                               ; 2a87: aa          .   :2956[1]
    lda temp_collision_result                                         ; 2a88: ad 5b 29    .[) :2957[1]
    rts                                                               ; 2a8b: 60          `   :295a[1]

temp_collision_result
    !byte 0                                                           ; 2a8c: 00          .   :295b[1]

desired_menu_slots
    !byte spriteid_icodata_disc                                       ; 2a8d: 03          .   :295c[1]
    !byte spriteid_icodata_sound                                      ; 2a8e: 02          .   :295d[1]
    !byte spriteid_icodata_password                                   ; 2a8f: 08          .   :295e[1]
    !byte spriteid_icodata_info                                       ; 2a90: 07          .   :295f[1]
    !byte 0                                                           ; 2a91: 00          .   :2960[1]
    !byte spriteid_icodata_cat                                        ; 2a92: 05          .   :2961[1]
    !byte spriteid_icodata_monkey                                     ; 2a93: 06          .   :2962[1]
    !byte spriteid_icodata_wizard                                     ; 2a94: 04          .   :2963[1]
    !byte 0, 0, 0, 0, 0, 0, 0, 0, 0                                   ; 2a95: 00 00 00... ... :2964[1]

menu_index_for_first_player_character
    !byte 5                                                           ; 2a9e: 05          .   :296d[1]

; The 'extra' menu items are level specific items after the player character items
menu_index_for_extra_items
    !byte 9                                                           ; 2a9f: 09          .   :296e[1]

displayed_menu_slots
    !byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0           ; 2aa0: 00 00 00... ... :296f[1]

; *************************************************************************************
; 
; Reset menu items to defaults
; 
; *************************************************************************************
reset_menu_items
    ldx #9                                                            ; 2ab1: a2 09       ..  :2980[1]   ; set standard set as nine menu items (including separators)
    stx menu_index_for_extra_items                                    ; 2ab3: 8e 6e 29    .n) :2982[1]
; clear desired slots from slot eight upwards
    dex                                                               ; 2ab6: ca          .   :2985[1]
    lda #0                                                            ; 2ab7: a9 00       ..  :2986[1]
clear_extra_menu_slots_loop
    sta desired_menu_slots,x                                          ; 2ab9: 9d 5c 29    .\) :2988[1]
    inx                                                               ; 2abc: e8          .   :298b[1]
    cpx #$11                                                          ; 2abd: e0 11       ..  :298c[1]
    bcc clear_extra_menu_slots_loop                                   ; 2abf: 90 f8       ..  :298e[1]
; clear table of level specific collectables
    ldx #3                                                            ; 2ac1: a2 03       ..  :2990[1]
clear_collectables_loop
    sta toolbar_collectable_spriteids+1,x                             ; 2ac3: 9d e9 2e    ... :2992[1]
    dex                                                               ; 2ac6: ca          .   :2995[1]
    bpl clear_collectables_loop                                       ; 2ac7: 10 fa       ..  :2996[1]
; set new menu position
    lda menu_index_for_first_player_character                         ; 2ac9: ad 6d 29    .m) :2998[1]
    clc                                                               ; 2acc: 18          .   :299b[1]
    adc #2                                                            ; 2acd: 69 02       i.  :299c[1]
    sta new_menu_index                                                ; 2acf: 85 29       .)  :299e[1]
    rts                                                               ; 2ad1: 60          `   :29a0[1]

draw_toolbar
    jsr draw_menu_icons                                               ; 2ad2: 20 a8 29     .) :29a1[1]
    jsr apply_new_menu_index                                          ; 2ad5: 20 de 29     .) :29a4[1]
    rts                                                               ; 2ad8: 60          `   :29a7[1]

; *************************************************************************************
; 
; Update menu items (redrawing them if needed)
; 
; *************************************************************************************
draw_menu_icons
    ldx #0                                                            ; 2ad9: a2 00       ..  :29a8[1]
; check to see if menu icon has changed since last drawn
draw_menu_icon_loop
    lda desired_menu_slots,x                                          ; 2adb: bd 5c 29    .\) :29aa[1]
    cmp displayed_menu_slots,x                                        ; 2ade: dd 6f 29    .o) :29ad[1]
    beq draw_next_menu_slot                                           ; 2ae1: f0 25       .%  :29b0[1]
; if the current icon to be redrawn shows the hand pointer, we unplot the hand pointer
; first, draw the new icon, then redraw the hand after
    lda #0                                                            ; 2ae3: a9 00       ..  :29b2[1]
    sta redraw_menu_pointer_flag                                      ; 2ae5: 8d dd 29    ..) :29b4[1]
    cpx current_menu_index                                            ; 2ae8: e4 2e       ..  :29b7[1]
    bne menu_pointer_not_present_on_slot                              ; 2aea: d0 06       ..  :29b9[1]
    dec redraw_menu_pointer_flag                                      ; 2aec: ce dd 29    ..) :29bb[1]
    jsr unplot_menu_pointer                                           ; 2aef: 20 eb 29     .) :29be[1]
; draw the new menu icon
menu_pointer_not_present_on_slot
    jsr plot_menu_item                                                ; 2af2: 20 0c 2c     ., :29c1[1]
    lda redraw_menu_pointer_flag                                      ; 2af5: ad dd 29    ..) :29c4[1]
    beq draw_next_menu_slot                                           ; 2af8: f0 0e       ..  :29c7[1]
; If there's a blank under the pointer in the new menu, bump the pointer left until we
; find a non-blank slot.
find_valid_menu_slot_loop
    ldy new_menu_index                                                ; 2afa: a4 29       .)  :29c9[1]
    lda desired_menu_slots,y                                          ; 2afc: b9 5c 29    .\) :29cb[1]
    bne new_menu_index_valid                                          ; 2aff: d0 04       ..  :29ce[1]
    dec new_menu_index                                                ; 2b01: c6 29       .)  :29d0[1]
    bne find_valid_menu_slot_loop                                     ; 2b03: d0 f5       ..  :29d2[1]
new_menu_index_valid
    jsr plot_menu_pointer                                             ; 2b05: 20 17 2a     .* :29d4[1]
draw_next_menu_slot
    inx                                                               ; 2b08: e8          .   :29d7[1]
    cpx #menu_slot_count                                              ; 2b09: e0 11       ..  :29d8[1]
    bcc draw_menu_icon_loop                                           ; 2b0b: 90 ce       ..  :29da[1]
    rts                                                               ; 2b0d: 60          `   :29dc[1]

redraw_menu_pointer_flag
    !byte 0                                                           ; 2b0e: 00          .   :29dd[1]

apply_new_menu_index
    lda new_menu_index                                                ; 2b0f: a5 29       .)  :29de[1]
    cmp current_menu_index                                            ; 2b11: c5 2e       ..  :29e0[1]
    beq return18                                                      ; 2b13: f0 06       ..  :29e2[1]
    jsr unplot_menu_pointer                                           ; 2b15: 20 eb 29     .) :29e4[1]
    jsr plot_menu_pointer                                             ; 2b18: 20 17 2a     .* :29e7[1]
return18
    rts                                                               ; 2b1b: 60          `   :29ea[1]

; *************************************************************************************
; 
; Unplot Menu Hand Pointer
; 
; *************************************************************************************
unplot_menu_pointer
    ldx current_menu_index                                            ; 2b1c: a6 2e       ..  :29eb[1]
    bmi no_menu_item_selected                                         ; 2b1e: 30 23       0#  :29ed[1]
; remember currrent screen base address
    lda screen_base_address_high                                      ; 2b20: a5 4c       .L  :29ef[1]
    pha                                                               ; 2b22: 48          H   :29f1[1]
; select toolbar area for drawing
    lda #>toolbar_screen_address                                      ; 2b23: a9 58       .X  :29f2[1]
    sta screen_base_address_high                                      ; 2b25: 85 4c       .L  :29f4[1]
; find position of current menu item
    jsr calculate_sprite_position_for_menu_item                       ; 2b27: 20 46 2c     F, :29f6[1]
; erase the hand
    lda #spriteid_pointer_hand                                        ; 2b2a: a9 1d       ..  :29f9[1]
    sta sprite_id                                                     ; 2b2c: 85 16       ..  :29fb[1]
    lda #sprite_op_flags_erase_to_bg_colour                           ; 2b2e: a9 02       ..  :29fd[1]
    sta sprite_op_flags                                               ; 2b30: 85 15       ..  :29ff[1]
    jsr sprite_op                                                     ; 2b32: 20 8d 13     .. :2a01[1]
; restore the background tile where the fingertip overlaps the tile
    lda #spriteid_fingertip_tile_restoration                          ; 2b35: a9 1e       ..  :2a04[1]
    sta sprite_id                                                     ; 2b37: 85 16       ..  :2a06[1]
    lda #sprite_op_flags_normal                                       ; 2b39: a9 00       ..  :2a08[1]
    sta sprite_op_flags                                               ; 2b3b: 85 15       ..  :2a0a[1]
    jsr sprite_op                                                     ; 2b3d: 20 8d 13     .. :2a0c[1]
; restore original screen base address
    pla                                                               ; 2b40: 68          h   :2a0f[1]
    sta screen_base_address_high                                      ; 2b41: 85 4c       .L  :2a10[1]
no_menu_item_selected
    lda #$ff                                                          ; 2b43: a9 ff       ..  :2a12[1]
    sta current_menu_index                                            ; 2b45: 85 2e       ..  :2a14[1]
    rts                                                               ; 2b47: 60          `   :2a16[1]

; *************************************************************************************
; 
; Plot Menu Hand Pointer
; 
; *************************************************************************************
plot_menu_pointer
    ldx new_menu_index                                                ; 2b48: a6 29       .)  :2a17[1]
    bmi record_the_new_menu_item                                      ; 2b4a: 30 18       0.  :2a19[1]
; remember currrent screen base address
    lda screen_base_address_high                                      ; 2b4c: a5 4c       .L  :2a1b[1]
    pha                                                               ; 2b4e: 48          H   :2a1d[1]
; select toolbar area for drawing
    lda #>toolbar_screen_address                                      ; 2b4f: a9 58       .X  :2a1e[1]
    sta screen_base_address_high                                      ; 2b51: 85 4c       .L  :2a20[1]
; find position of current menu item
    jsr calculate_sprite_position_for_menu_item                       ; 2b53: 20 46 2c     F, :2a22[1]
; draw the hand
    lda #spriteid_pointer_hand                                        ; 2b56: a9 1d       ..  :2a25[1]
    sta sprite_id                                                     ; 2b58: 85 16       ..  :2a27[1]
    lda #sprite_op_flags_normal                                       ; 2b5a: a9 00       ..  :2a29[1]
    sta sprite_op_flags                                               ; 2b5c: 85 15       ..  :2a2b[1]
    jsr sprite_op                                                     ; 2b5e: 20 8d 13     .. :2a2d[1]
; restore original screen base address
    pla                                                               ; 2b61: 68          h   :2a30[1]
    sta screen_base_address_high                                      ; 2b62: 85 4c       .L  :2a31[1]
record_the_new_menu_item
    lda new_menu_index                                                ; 2b64: a5 29       .)  :2a33[1]
    sta current_menu_index                                            ; 2b66: 85 2e       ..  :2a35[1]
    rts                                                               ; 2b68: 60          `   :2a37[1]

update_menus
    ldx timingA_counter_low                                           ; 2b69: ae 04 11    ... :2a38[1]
    ldy timingA_counter_high                                          ; 2b6c: ac 05 11    ... :2a3b[1]
    jsr wait_for_timer_2_using_yx                                     ; 2b6f: 20 91 17     .. :2a3e[1]
    jsr draw_toolbar                                                  ; 2b72: 20 a1 29     .) :2a41[1]
    jsr check_menu_keys                                               ; 2b75: 20 8f 3a     .: :2a44[1]
    lda developer_mode_sideways_ram_is_set_up_flag                    ; 2b78: a5 5b       .[  :2a47[1]
    beq skip_developer_escape_key_handling                            ; 2b7a: f0 15       ..  :2a49[1]
    lda developer_flags                                               ; 2b7c: ad 03 11    ... :2a4b[1]
    and #1                                                            ; 2b7f: 29 01       ).  :2a4e[1]
    beq skip_developer_escape_key_handling                            ; 2b81: f0 0e       ..  :2a50[1]
    ldx #inkey_key_escape                                             ; 2b83: a2 8f       ..  :2a52[1]
    jsr negative_inkey                                                ; 2b85: 20 cc 3a     .: :2a54[1]
    beq skip_developer_escape_key_handling                            ; 2b88: f0 07       ..  :2a57[1]
    pla                                                               ; 2b8a: 68          h   :2a59[1]
    pla                                                               ; 2b8b: 68          h   :2a5a[1]
    pla                                                               ; 2b8c: 68          h   :2a5b[1]
    pla                                                               ; 2b8d: 68          h   :2a5c[1]
    jmp reset_game_because_escape_pressed                             ; 2b8e: 4c 39 18    L9. :2a5d[1]

skip_developer_escape_key_handling
    lda new_menu_index                                                ; 2b91: a5 29       .)  :2a60[1]
    sta old_menu_index                                                ; 2b93: 85 25       .%  :2a62[1]
    jsr apply_pending_menu_motion                                     ; 2b95: 20 67 2c     g, :2a64[1]
    lda new_menu_index                                                ; 2b98: a5 29       .)  :2a67[1]
    cmp old_menu_index                                                ; 2b9a: c5 25       .%  :2a69[1]
    beq not_changing_menu_position                                    ; 2b9c: f0 06       ..  :2a6b[1]
    jsr remove_dialog                                                 ; 2b9e: 20 53 04     S. :2a6d[1]
    jmp no_space_bar_pressed                                          ; 2ba1: 4c 81 2a    L.* :2a70[1]

not_changing_menu_position
    lda space_flag2                                                   ; 2ba4: ad a0 3a    ..: :2a73[1]
    beq no_space_bar_pressed                                          ; 2ba7: f0 09       ..  :2a76[1]
    jsr check_for_one_of_first_four_menu_items_chosen                 ; 2ba9: 20 db 2a     .* :2a78[1]
    jsr check_if_player_character_menu_item_chosen                    ; 2bac: 20 37 2b     7+ :2a7b[1]
    jsr check_for_extra_menu_item_chosen                              ; 2baf: 20 65 2b     e+ :2a7e[1]
no_space_bar_pressed
    lda new_menu_index                                                ; 2bb2: a5 29       .)  :2a81[1]
    cmp menu_index_for_first_player_character                         ; 2bb4: cd 6d 29    .m) :2a83[1]
    bcs over_a_player_character_or_later_on_menu                      ; 2bb7: b0 45       .E  :2a86[1]
    lda old_menu_index                                                ; 2bb9: a5 25       .%  :2a88[1]
    cmp menu_index_for_first_player_character                         ; 2bbb: cd 6d 29    .m) :2a8a[1]
    bcc update_menu_with_game_paused                                  ; 2bbe: 90 11       ..  :2a8d[1]
    lda #osbyte_flush_buffer_class                                    ; 2bc0: a9 0f       ..  :2a8f[1]
    ldx #0                                                            ; 2bc2: a2 00       ..  :2a91[1]
    jsr osbyte                                                        ; 2bc4: 20 f4 ff     .. :2a93[1]   ; Flush all buffers (X=0)
    ldx #3                                                            ; 2bc7: a2 03       ..  :2a96[1]
    lda #0                                                            ; 2bc9: a9 00       ..  :2a98[1]
clear_sound_priorities_loop2
    sta sound_priority_per_channel_table,x                            ; 2bcb: 9d 6f 39    .o9 :2a9a[1]
    dex                                                               ; 2bce: ca          .   :2a9d[1]
    bpl clear_sound_priorities_loop2                                  ; 2bcf: 10 fa       ..  :2a9e[1]
update_menu_with_game_paused
    jsr wait_for_timingB_counter                                      ; 2bd1: 20 00 04     .. :2aa0[1]
    jsr update_password_dialog                                        ; 2bd4: 20 64 36     d6 :2aa3[1]
    jsr update_disc_menu                                              ; 2bd7: 20 4b 34     K4 :2aa6[1]
    lda developer_flags                                               ; 2bda: ad 03 11    ... :2aa9[1]
    and #1                                                            ; 2bdd: 29 01       ).  :2aac[1]
    beq skip_developer_shift_key_handling                             ; 2bdf: f0 07       ..  :2aae[1]
    ldx #inkey_key_shift                                              ; 2be1: a2 ff       ..  :2ab0[1]
    jsr negative_inkey                                                ; 2be3: 20 cc 3a     .: :2ab2[1]
    bne shift_key_detected                                            ; 2be6: d0 06       ..  :2ab5[1]
skip_developer_shift_key_handling
    jsr wait_for_vsync                                                ; 2be8: 20 8c 17     .. :2ab7[1]
    jmp update_menus                                                  ; 2beb: 4c 38 2a    L8* :2aba[1]

shift_key_detected
    jsr read_player_movement_keys                                     ; 2bee: 20 a2 3a     .: :2abd[1]
; wait for a bit to slow down the gameplay/animation for debugging purposes
    ldx #$80                                                          ; 2bf1: a2 80       ..  :2ac0[1]
    ldy #0                                                            ; 2bf3: a0 00       ..  :2ac2[1]
delay_loop1
    dey                                                               ; 2bf5: 88          .   :2ac4[1]
    bne delay_loop1                                                   ; 2bf6: d0 fd       ..  :2ac5[1]
    dex                                                               ; 2bf8: ca          .   :2ac7[1]
    bne delay_loop1                                                   ; 2bf9: d0 fa       ..  :2ac8[1]
    jmp return19                                                      ; 2bfb: 4c da 2a    L.* :2aca[1]

over_a_player_character_or_later_on_menu
    lda old_menu_index                                                ; 2bfe: a5 25       .%  :2acd[1]
    cmp menu_index_for_first_player_character                         ; 2c00: cd 6d 29    .m) :2acf[1]
    bcs return19                                                      ; 2c03: b0 06       ..  :2ad2[1]
    jsr read_player_movement_keys                                     ; 2c05: 20 a2 3a     .: :2ad4[1]
    jsr update_main_keys                                              ; 2c08: 20 12 3a     .: :2ad7[1]
return19
    rts                                                               ; 2c0b: 60          `   :2ada[1]

check_for_one_of_first_four_menu_items_chosen
    ldx new_menu_index                                                ; 2c0c: a6 29       .)  :2adb[1]
    cpx menu_index_for_first_player_character                         ; 2c0e: ec 6d 29    .m) :2add[1]
    bcs return20                                                      ; 2c11: b0 13       ..  :2ae0[1]
    lda desired_menu_slots,x                                          ; 2c13: bd 5c 29    .\) :2ae2[1]
    cmp #spriteid_icodata_info                                        ; 2c16: c9 07       ..  :2ae5[1]
    beq show_level_info_dialog_local                                  ; 2c18: f0 0d       ..  :2ae7[1]
    cmp #spriteid_icodata_password                                    ; 2c1a: c9 08       ..  :2ae9[1]
    beq show_password_entry_dialog_local                              ; 2c1c: f0 0c       ..  :2aeb[1]
    cmp #spriteid_icodata_sound                                       ; 2c1e: c9 02       ..  :2aed[1]
    beq toggle_sound_on_off                                           ; 2c20: f0 0e       ..  :2aef[1]
    cmp #spriteid_icodata_disc                                        ; 2c22: c9 03       ..  :2af1[1]
    beq toggle_load_save_dialog_local                                 ; 2c24: f0 07       ..  :2af3[1]
return20
    rts                                                               ; 2c26: 60          `   :2af5[1]

show_level_info_dialog_local
    jmp show_level_info_dialog                                        ; 2c27: 4c 7e 37    L~7 :2af6[1]

show_password_entry_dialog_local
    jmp show_password_entry_dialog                                    ; 2c2a: 4c 36 36    L66 :2af9[1]

toggle_load_save_dialog_local
    jmp toggle_load_save_dialog                                       ; 2c2d: 4c 04 34    L.4 :2afc[1]

toggle_sound_on_off
    jsr calculate_sprite_position_for_menu_item                       ; 2c30: 20 46 2c     F, :2aff[1]
    lda sound_enable_flag                                             ; 2c33: ad 66 39    .f9 :2b02[1]   ; remember current sound flag
    pha                                                               ; 2c36: 48          H   :2b05[1]
    lda #$ff                                                          ; 2c37: a9 ff       ..  :2b06[1]   ; temporarily enable sound
    sta sound_enable_flag                                             ; 2c39: 8d 66 39    .f9 :2b08[1]
    lda #0                                                            ; 2c3c: a9 00       ..  :2b0b[1]   ; play brief tick sound
    ldx #<sound_data1                                                 ; 2c3e: a2 a4       ..  :2b0d[1]
    ldy #>sound_data1                                                 ; 2c40: a0 38       .8  :2b0f[1]
    jsr play_sound_yx                                                 ; 2c42: 20 f6 38     .8 :2b11[1]
    pla                                                               ; 2c45: 68          h   :2b14[1]   ; recall current sound flag
    eor #$ff                                                          ; 2c46: 49 ff       I.  :2b15[1]   ; toggle current flag
    sta sound_enable_flag                                             ; 2c48: 8d 66 39    .f9 :2b17[1]   ; save new sound flag
    lda #spriteid_one_pixel_set                                       ; 2c4b: a9 1f       ..  :2b1a[1]
    sta sprite_id                                                     ; 2c4d: 85 16       ..  :2b1c[1]
    lda screen_base_address_high                                      ; 2c4f: a5 4c       .L  :2b1e[1]
    pha                                                               ; 2c51: 48          H   :2b20[1]
    lda #>toolbar_screen_address                                      ; 2c52: a9 58       .X  :2b21[1]
    sta screen_base_address_high                                      ; 2c54: 85 4c       .L  :2b23[1]
    lda #sprite_op_flags_normal                                       ; 2c56: a9 00       ..  :2b25[1]
    ldx sound_enable_flag                                             ; 2c58: ae 66 39    .f9 :2b27[1]
    bne set_normal_or_erase_mode                                      ; 2c5b: d0 02       ..  :2b2a[1]
    lda #sprite_op_flags_erase_to_bg_colour                           ; 2c5d: a9 02       ..  :2b2c[1]
set_normal_or_erase_mode
    sta sprite_op_flags                                               ; 2c5f: 85 15       ..  :2b2e[1]
    jsr sprite_op                                                     ; 2c61: 20 8d 13     .. :2b30[1]
    pla                                                               ; 2c64: 68          h   :2b33[1]
    sta screen_base_address_high                                      ; 2c65: 85 4c       .L  :2b34[1]
    rts                                                               ; 2c67: 60          `   :2b36[1]

check_if_player_character_menu_item_chosen
    ldx new_menu_index                                                ; 2c68: a6 29       .)  :2b37[1]   ; check menu item is in the player character range
    cpx menu_index_for_first_player_character                         ; 2c6a: ec 6d 29    .m) :2b39[1]
    bcc return21                                                      ; 2c6d: 90 26       .&  :2b3c[1]
    cpx menu_index_for_extra_items                                    ; 2c6f: ec 6e 29    .n) :2b3e[1]
    bcs return21                                                      ; 2c72: b0 21       .!  :2b41[1]
; return if transforming-out
    lda current_player_character                                      ; 2c74: a5 48       .H  :2b43[1]
    cmp new_player_character                                          ; 2c76: c5 4d       .M  :2b45[1]
    bne return21                                                      ; 2c78: d0 1b       ..  :2b47[1]
; return if transforming-in
    lda current_player_animation                                      ; 2c7a: ad df 09    ... :2b49[1]
    beq return21                                                      ; 2c7d: f0 16       ..  :2b4c[1]
    lda #0                                                            ; 2c7f: a9 00       ..  :2b4e[1]
    sta player_held_object_spriteid                                   ; 2c81: 85 52       .R  :2b50[1]
; return if we are already this player character
    lda desired_menu_slots,x                                          ; 2c83: bd 5c 29    .\) :2b52[1]
    cmp current_player_character                                      ; 2c86: c5 48       .H  :2b55[1]
    beq return21                                                      ; 2c88: f0 0b       ..  :2b57[1]
; reduce number of transformations left and execute transformation
    jsr decrement_current_transformations_remaining                   ; 2c8a: 20 8c 2c     ., :2b59[1]
; branch if zero transformations were remaining before attempted decrement
    bcc return21                                                      ; 2c8d: 90 06       ..  :2b5c[1]
    jsr update_displayed_transformations_remaining                    ; 2c8f: 20 31 01     1. :2b5e[1]
    jsr transform                                                     ; 2c92: 20 37 23     7# :2b61[1]
return21
    rts                                                               ; 2c95: 60          `   :2b64[1]

check_for_extra_menu_item_chosen
    ldx new_menu_index                                                ; 2c96: a6 29       .)  :2b65[1]
    cpx menu_index_for_extra_items                                    ; 2c98: ec 6e 29    .n) :2b67[1]
    bcc return22                                                      ; 2c9b: 90 1a       ..  :2b6a[1]
    lda current_player_character                                      ; 2c9d: a5 48       .H  :2b6c[1]
    cmp #spriteid_icodata_wizard                                      ; 2c9f: c9 04       ..  :2b6e[1]
    bne return22                                                      ; 2ca1: d0 14       ..  :2b70[1]
    cmp new_player_character                                          ; 2ca3: c5 4d       .M  :2b72[1]
    bne return22                                                      ; 2ca5: d0 10       ..  :2b74[1]
    lda current_player_animation                                      ; 2ca7: ad df 09    ... :2b76[1]
    beq return22                                                      ; 2caa: f0 0b       ..  :2b79[1]
    lda desired_menu_slots,x                                          ; 2cac: bd 5c 29    .\) :2b7b[1]
    cmp player_held_object_spriteid                                   ; 2caf: c5 52       .R  :2b7e[1]
    bne skip6                                                         ; 2cb1: d0 02       ..  :2b80[1]
    lda #0                                                            ; 2cb3: a9 00       ..  :2b82[1]
skip6
    sta player_held_object_spriteid                                   ; 2cb5: 85 52       .R  :2b84[1]
return22
    rts                                                               ; 2cb7: 60          `   :2b86[1]

; *************************************************************************************
; 
; Insert a player character menu item into the toolbar
; 
; *************************************************************************************
insert_character_menu_item_into_toolbar
    sta menu_item_to_use                                              ; 2cb8: 85 70       .p  :2b87[1]   ; remember menu item to insert
; flag that nothing has changed yet
    lda #0                                                            ; 2cba: a9 00       ..  :2b89[1]
    sta menu_has_changed_flag                                         ; 2cbc: 85 71       .q  :2b8b[1]
; start at first player character, and loop until we reach the extras or we find the
; character
    ldx menu_index_for_first_player_character                         ; 2cbe: ae 6d 29    .m) :2b8d[1]
find_existing_item_loop
    lda desired_menu_slots,x                                          ; 2cc1: bd 5c 29    .\) :2b90[1]
    cmp menu_item_to_use                                              ; 2cc4: c5 70       .p  :2b93[1]
    beq return_with_flag_set_if_item_inserted                         ; 2cc6: f0 23       .#  :2b95[1]
    inx                                                               ; 2cc8: e8          .   :2b97[1]
    cpx menu_index_for_extra_items                                    ; 2cc9: ec 6e 29    .n) :2b98[1]
    bcc find_existing_item_loop                                       ; 2ccc: 90 f3       ..  :2b9b[1]
; shuffle existing items right to make room for the new item
    ldx #menu_slot_count - 1                                          ; 2cce: a2 10       ..  :2b9d[1]
    lda desired_menu_slots,x                                          ; 2cd0: bd 5c 29    .\) :2b9f[1]
    bne return_with_flag_set_if_item_inserted                         ; 2cd3: d0 16       ..  :2ba2[1]
shuffle_menu_items_right_loop
    lda desired_menu_slots-1,x                                        ; 2cd5: bd 5b 29    .[) :2ba4[1]
    sta desired_menu_slots,x                                          ; 2cd8: 9d 5c 29    .\) :2ba7[1]
    dex                                                               ; 2cdb: ca          .   :2baa[1]
    cpx menu_index_for_extra_items                                    ; 2cdc: ec 6e 29    .n) :2bab[1]
    bcs shuffle_menu_items_right_loop                                 ; 2cdf: b0 f4       ..  :2bae[1]
; the start of the 'extra' menu items is now one to the right
    inc menu_index_for_extra_items                                    ; 2ce1: ee 6e 29    .n) :2bb0[1]
; store the new item
    lda menu_item_to_use                                              ; 2ce4: a5 70       .p  :2bb3[1]
    sta desired_menu_slots,x                                          ; 2ce6: 9d 5c 29    .\) :2bb5[1]
; flag that the menu has changed
    dec menu_has_changed_flag                                         ; 2ce9: c6 71       .q  :2bb8[1]
return_with_flag_set_if_item_inserted
    lda menu_has_changed_flag                                         ; 2ceb: a5 71       .q  :2bba[1]
    rts                                                               ; 2ced: 60          `   :2bbc[1]

; *************************************************************************************
; 
; Find or append menu item onto toolbar
; 
; Find an existing menu slot containing A, or fill the lowest empty slot if one hasn't
; been found yet. Only 'extra' slots are considered after the standard set, and there
; are no gaps beyond this point until the end of the menu.
; 
; On Exit:
;     A=0 if matching slot found or no match found and no empty slot available,
;     A=$ff if empty slot found and filled with the entry value of A.
;     X is the index of the slot.
;     Flags reflect A on exit.
; 
; I am not sure the 'no empty slot and no match' behaviour is terribly sensible, but it
; should never actually happen.
; 
; *************************************************************************************
find_or_create_menu_slot_for_A
    sta menu_item_to_use                                              ; 2cee: 85 70       .p  :2bbd[1]
    lda #0                                                            ; 2cf0: a9 00       ..  :2bbf[1]
    sta menu_has_changed_flag                                         ; 2cf2: 85 71       .q  :2bc1[1]
    ldx menu_index_for_extra_items                                    ; 2cf4: ae 6e 29    .n) :2bc3[1]
find_slot_loop
    lda desired_menu_slots,x                                          ; 2cf7: bd 5c 29    .\) :2bc6[1]
    beq empty_slot_found                                              ; 2cfa: f0 0b       ..  :2bc9[1]
    cmp menu_item_to_use                                              ; 2cfc: c5 70       .p  :2bcb[1]
    beq matching_slot_found_or_no_empty_slot                          ; 2cfe: f0 0e       ..  :2bcd[1]
    inx                                                               ; 2d00: e8          .   :2bcf[1]
    cpx #menu_slot_count                                              ; 2d01: e0 11       ..  :2bd0[1]
    bcc find_slot_loop                                                ; 2d03: 90 f2       ..  :2bd2[1]
    bcs matching_slot_found_or_no_empty_slot                          ; 2d05: b0 07       ..  :2bd4[1]
empty_slot_found
    lda menu_item_to_use                                              ; 2d07: a5 70       .p  :2bd6[1]
    sta desired_menu_slots,x                                          ; 2d09: 9d 5c 29    .\) :2bd8[1]
    dec menu_has_changed_flag                                         ; 2d0c: c6 71       .q  :2bdb[1]
matching_slot_found_or_no_empty_slot
    lda menu_has_changed_flag                                         ; 2d0e: a5 71       .q  :2bdd[1]
    rts                                                               ; 2d10: 60          `   :2bdf[1]

; *************************************************************************************
; 
; Remove a menu item from the toolbar
; 
; On Entry:
;     A: menu item to remove
; 
; On Exit:
;     Preserves Y
; 
; *************************************************************************************
remove_item_from_toolbar_menu
    sta menu_item_to_use                                              ; 2d11: 85 70       .p  :2be0[1]   ; remember item to remove
; flag that nothing has changed yet
    lda #0                                                            ; 2d13: a9 00       ..  :2be2[1]
    sta menu_has_changed_flag                                         ; 2d15: 85 71       .q  :2be4[1]
; set X to the start index for non-standard menu items
    ldx menu_index_for_extra_items                                    ; 2d17: ae 6e 29    .n) :2be6[1]
find_menu_item_loop
    lda desired_menu_slots,x                                          ; 2d1a: bd 5c 29    .\) :2be9[1]
    cmp menu_item_to_use                                              ; 2d1d: c5 70       .p  :2bec[1]
    beq shuffle_menu_items_left_loop                                  ; 2d1f: f0 07       ..  :2bee[1]
    inx                                                               ; 2d21: e8          .   :2bf0[1]
    cpx #menu_slot_count                                              ; 2d22: e0 11       ..  :2bf1[1]
    bcc find_menu_item_loop                                           ; 2d24: 90 f4       ..  :2bf3[1]
    bcs return_with_flag_set_if_shuffled_left                         ; 2d26: b0 12       ..  :2bf5[1]   ; ALWAYS branch
; shuffle menu items left
shuffle_menu_items_left_loop
    lda desired_menu_slots+1,x                                        ; 2d28: bd 5d 29    .]) :2bf7[1]
    sta desired_menu_slots,x                                          ; 2d2b: 9d 5c 29    .\) :2bfa[1]
    inx                                                               ; 2d2e: e8          .   :2bfd[1]
    cpx #menu_slot_count - 1                                          ; 2d2f: e0 10       ..  :2bfe[1]
    bcc shuffle_menu_items_left_loop                                  ; 2d31: 90 f5       ..  :2c00[1]
; make final menu slot empty
    lda #0                                                            ; 2d33: a9 00       ..  :2c02[1]
    sta desired_menu_slots,x                                          ; 2d35: 9d 5c 29    .\) :2c04[1]
    dec menu_has_changed_flag                                         ; 2d38: c6 71       .q  :2c07[1]
return_with_flag_set_if_shuffled_left
    lda menu_has_changed_flag                                         ; 2d3a: a5 71       .q  :2c09[1]
    rts                                                               ; 2d3c: 60          `   :2c0b[1]

; *************************************************************************************
; 
; Plot menu item
; 
; On Entry:
;     X: index of menu item to plot
; 
; On Exit:
;     Preserves A,X,Y
; 
; *************************************************************************************
plot_menu_item
    pha                                                               ; 2d3d: 48          H   :2c0c[1]   ; remember A,X,Y
    txa                                                               ; 2d3e: 8a          .   :2c0d[1]
    pha                                                               ; 2d3f: 48          H   :2c0e[1]
    tya                                                               ; 2d40: 98          .   :2c0f[1]
    pha                                                               ; 2d41: 48          H   :2c10[1]
; Save the current screen_base_address_high so we can temporarily set it to $58 to plot
; the menu icon. This just saving the old value because it's tidy/safe. We could just
; do lda #blah:sta screen_base_address_high at the end of this routine.
    lda screen_base_address_high                                      ; 2d42: a5 4c       .L  :2c11[1]
    pha                                                               ; 2d44: 48          H   :2c13[1]
    lda #>toolbar_screen_address                                      ; 2d45: a9 58       .X  :2c14[1]
    sta screen_base_address_high                                      ; 2d47: 85 4c       .L  :2c16[1]
    jsr calculate_sprite_position_for_menu_item                       ; 2d49: 20 46 2c     F, :2c18[1]
    lda #sprite_op_flags_normal                                       ; 2d4c: a9 00       ..  :2c1b[1]
    sta sprite_op_flags                                               ; 2d4e: 85 15       ..  :2c1d[1]
    lda #spriteid_icon_background                                     ; 2d50: a9 01       ..  :2c1f[1]
    sta sprite_id                                                     ; 2d52: 85 16       ..  :2c21[1]
    lda desired_menu_slots,x                                          ; 2d54: bd 5c 29    .\) :2c23[1]
    sta displayed_menu_slots,x                                        ; 2d57: 9d 6f 29    .o) :2c26[1]
    bne plot_menu_item_sprites                                        ; 2d5a: d0 0a       ..  :2c29[1]
; erase where menu item used to be
    lda #sprite_op_flags_erase_to_bg_colour                           ; 2d5c: a9 02       ..  :2c2b[1]
    sta sprite_op_flags                                               ; 2d5e: 85 15       ..  :2c2d[1]
    jsr sprite_op                                                     ; 2d60: 20 8d 13     .. :2c2f[1]
    jmp restore_variables_and_return                                  ; 2d63: 4c 3d 2c    L=, :2c32[1]

; draw background sprite
plot_menu_item_sprites
    jsr sprite_op                                                     ; 2d66: 20 8d 13     .. :2c35[1]
; draw icon sprite
    sta sprite_id                                                     ; 2d69: 85 16       ..  :2c38[1]
    jsr sprite_op                                                     ; 2d6b: 20 8d 13     .. :2c3a[1]
restore_variables_and_return
    pla                                                               ; 2d6e: 68          h   :2c3d[1]
    sta screen_base_address_high                                      ; 2d6f: 85 4c       .L  :2c3e[1]
    pla                                                               ; 2d71: 68          h   :2c40[1]   ; recall A,X,Y
    tay                                                               ; 2d72: a8          .   :2c41[1]
    pla                                                               ; 2d73: 68          h   :2c42[1]
    tax                                                               ; 2d74: aa          .   :2c43[1]
    pla                                                               ; 2d75: 68          h   :2c44[1]
    rts                                                               ; 2d76: 60          `   :2c45[1]

; *************************************************************************************
; 
; Calculate the position of a menu item
; 
; Calculate the X position of the toolbar menu item: 37 + index*20
; 
; On Entry:
;     X: index of menu index
; On Exit:
;     Preserves X
; 
; *************************************************************************************
calculate_sprite_position_for_menu_item
    txa                                                               ; 2d77: 8a          .   :2c46[1]
    pha                                                               ; 2d78: 48          H   :2c47[1]
    lda #37                                                           ; 2d79: a9 25       .%  :2c48[1]
    sta sprite_y_base_low                                             ; 2d7b: 85 1a       ..  :2c4a[1]
    lda #0                                                            ; 2d7d: a9 00       ..  :2c4c[1]
    sta sprite_x_base_high                                            ; 2d7f: 85 19       ..  :2c4e[1]
    sta sprite_y_base_high                                            ; 2d81: 85 1b       ..  :2c50[1]
    lda #0                                                            ; 2d83: a9 00       ..  :2c52[1]
    cpx #0                                                            ; 2d85: e0 00       ..  :2c54[1]
    beq finished_multiply                                             ; 2d87: f0 0a       ..  :2c56[1]
multiply_x_by_twenty_loop
    clc                                                               ; 2d89: 18          .   :2c58[1]
    adc #20                                                           ; 2d8a: 69 14       i.  :2c59[1]
    bcc skip_increment_high_byte                                      ; 2d8c: 90 02       ..  :2c5b[1]
    inc sprite_x_base_high                                            ; 2d8e: e6 19       ..  :2c5d[1]
skip_increment_high_byte
    dex                                                               ; 2d90: ca          .   :2c5f[1]
    bne multiply_x_by_twenty_loop                                     ; 2d91: d0 f6       ..  :2c60[1]
finished_multiply
    sta sprite_x_base_low                                             ; 2d93: 85 18       ..  :2c62[1]
    pla                                                               ; 2d95: 68          h   :2c64[1]
    tax                                                               ; 2d96: aa          .   :2c65[1]
    rts                                                               ; 2d97: 60          `   :2c66[1]

apply_pending_menu_motion
    ldx new_menu_index                                                ; 2d98: a6 29       .)  :2c67[1]
    lda left_right_flag_pending                                       ; 2d9a: ad a1 3a    ..: :2c69[1]
    beq no_menu_motion                                                ; 2d9d: f0 1a       ..  :2c6c[1]
    bmi menu_left_pending                                             ; 2d9f: 30 0e       0.  :2c6e[1]
menu_right_pending
    inx                                                               ; 2da1: e8          .   :2c70[1]
    cpx #$11                                                          ; 2da2: e0 11       ..  :2c71[1]
    bcs no_menu_motion                                                ; 2da4: b0 13       ..  :2c73[1]
    lda desired_menu_slots,x                                          ; 2da6: bd 5c 29    .\) :2c75[1]
    beq menu_right_pending                                            ; 2da9: f0 f6       ..  :2c78[1]
    stx new_menu_index                                                ; 2dab: 86 29       .)  :2c7a[1]
    bne no_menu_motion                                                ; 2dad: d0 0a       ..  :2c7c[1]   ; ALWAYS branch
menu_left_pending
    dex                                                               ; 2daf: ca          .   :2c7e[1]
    bmi no_menu_motion                                                ; 2db0: 30 07       0.  :2c7f[1]
    lda desired_menu_slots,x                                          ; 2db2: bd 5c 29    .\) :2c81[1]
    beq menu_left_pending                                             ; 2db5: f0 f8       ..  :2c84[1]
    stx new_menu_index                                                ; 2db7: 86 29       .)  :2c86[1]
no_menu_motion
    jsr apply_new_menu_index                                          ; 2db9: 20 de 29     .) :2c88[1]
    rts                                                               ; 2dbc: 60          `   :2c8b[1]

; Decrement current_transformations_remaining by one, unless it's already zero. Leading
; digits are handled specially so they turn into spaces rather than zeroes. Carry is
; clear on exit iff the value was zero on entry.
decrement_current_transformations_remaining
    pha                                                               ; 2dbd: 48          H   :2c8c[1]
    lda current_transformations_remaining                             ; 2dbe: ad ec 09    ... :2c8d[1]
    clc                                                               ; 2dc1: 18          .   :2c90[1]
    adc current_transformations_remaining+1                           ; 2dc2: 6d ed 09    m.. :2c91[1]
    cmp #' ' + '0'                                                    ; 2dc5: c9 50       .P  :2c94[1]
    clc                                                               ; 2dc7: 18          .   :2c96[1]
    beq decrement_current_transformations_remaining_pla_rts           ; 2dc8: f0 3c       .<  :2c97[1]
    dec current_transformations_remaining                             ; 2dca: ce ec 09    ... :2c99[1]
    lda current_transformations_remaining                             ; 2dcd: ad ec 09    ... :2c9c[1]
    cmp #'0'                                                          ; 2dd0: c9 30       .0  :2c9f[1]
    bcs decrement_current_transformations_remaining_no_borrow         ; 2dd2: b0 31       .1  :2ca1[1]
    lda #'9'                                                          ; 2dd4: a9 39       .9  :2ca3[1]
    sta current_transformations_remaining                             ; 2dd6: 8d ec 09    ... :2ca5[1]
    dec current_transformations_remaining+1                           ; 2dd9: ce ed 09    ... :2ca8[1]
    lda current_transformations_remaining+1                           ; 2ddc: ad ed 09    ... :2cab[1]
    cmp #'0'                                                          ; 2ddf: c9 30       .0  :2cae[1]
    beq decrement_current_transformations_remaining_middle_digit_now_zero; 2de1: f0 18       ..  :2cb0[1]
    bcs decrement_current_transformations_remaining_no_borrow         ; 2de3: b0 20       .   :2cb2[1]
    lda #'9'                                                          ; 2de5: a9 39       .9  :2cb4[1]
    sta current_transformations_remaining+1                           ; 2de7: 8d ed 09    ... :2cb6[1]
    dec current_transformations_remaining+2                           ; 2dea: ce ee 09    ... :2cb9[1]
    lda current_transformations_remaining+2                           ; 2ded: ad ee 09    ... :2cbc[1]
    cmp #'0'                                                          ; 2df0: c9 30       .0  :2cbf[1]
    bne decrement_current_transformations_remaining_no_borrow         ; 2df2: d0 11       ..  :2cc1[1]
    lda #' '                                                          ; 2df4: a9 20       .   :2cc3[1]
    sta current_transformations_remaining+2                           ; 2df6: 8d ee 09    ... :2cc5[1]
    bne decrement_current_transformations_remaining_no_borrow         ; 2df9: d0 0a       ..  :2cc8[1]
decrement_current_transformations_remaining_middle_digit_now_zero
    lda current_transformations_remaining+2                           ; 2dfb: ad ee 09    ... :2cca[1]
    cmp #' '                                                          ; 2dfe: c9 20       .   :2ccd[1]
    bne decrement_current_transformations_remaining_no_borrow         ; 2e00: d0 03       ..  :2ccf[1]
    sta current_transformations_remaining+1                           ; 2e02: 8d ed 09    ... :2cd1[1]
decrement_current_transformations_remaining_no_borrow
    sec                                                               ; 2e05: 38          8   :2cd4[1]
decrement_current_transformations_remaining_pla_rts
    pla                                                               ; 2e06: 68          h   :2cd5[1]
    rts                                                               ; 2e07: 60          `   :2cd6[1]

; *************************************************************************************
; 
; Animation code
; 
; *************************************************************************************
wizard_sprite_list
    !byte             spriteid_wizard1,                            2  ; 2e08: 30 02       0.  :2cd7[1]
    !byte                          $f8,             spriteid_wizard2  ; 2e0a: f8 31       .1  :2cd9[1]
    !byte                            4,                          $f7  ; 2e0c: 04 f7       ..  :2cdb[1]
    !byte             spriteid_wizard3,                            2  ; 2e0e: 32 02       2.  :2cdd[1]
    !byte                          $f8,             spriteid_wizard4  ; 2e10: f8 33       .3  :2cdf[1]
    !byte                            0,                          $f7  ; 2e12: 00 f7       ..  :2ce1[1]
    !byte             spriteid_wizard5,                            3  ; 2e14: 34 03       4.  :2ce3[1]
    !byte                          $f5,             spriteid_wizard7  ; 2e16: f5 36       .6  :2ce5[1]
    !byte                            2,                          $f7  ; 2e18: 02 f7       ..  :2ce7[1]
    !byte spriteid_wizard_using_object,                            4  ; 2e1a: 35 04       5.  :2ce9[1]
    !byte                          $f6,                            0  ; 2e1c: f6 00       ..  :2ceb[1]
wizard_base_animation
wizard_transform_in_animation
    !byte                          0,                          0      ; 2e1e: 00 00       ..  :2ced[1]
    !byte                          0, spriteid_wizard_transform2      ; 2e20: 00 39       .9  :2cef[1]
    !byte                          0,                          0      ; 2e22: 00 00       ..  :2cf1[1]
    !byte spriteid_wizard_transform2,                          0      ; 2e24: 39 00       9.  :2cf3[1]
    !byte                          0, spriteid_wizard_transform1      ; 2e26: 00 38       .8  :2cf5[1]
    !byte                          0,                          0      ; 2e28: 00 00       ..  :2cf7[1]
    !byte spriteid_wizard_transform1,                          0      ; 2e2a: 38 00       8.  :2cf9[1]
    !byte                          0,           spriteid_wizard5      ; 2e2c: 00 34       .4  :2cfb[1]
    !byte                          0,                          0      ; 2e2e: 00 00       ..  :2cfd[1]
    !byte           spriteid_wizard5,                          0      ; 2e30: 34 00       4.  :2cff[1]
    !byte                          0,                          0      ; 2e32: 00 00       ..  :2d01[1]
wizard_transform_out_animation
    !byte           spriteid_wizard5,                          0      ; 2e34: 34 00       4.  :2d03[1]
    !byte                          0,           spriteid_wizard5      ; 2e36: 00 34       .4  :2d05[1]
    !byte                          0,                          0      ; 2e38: 00 00       ..  :2d07[1]
    !byte spriteid_wizard_transform1,                          0      ; 2e3a: 38 00       8.  :2d09[1]
    !byte                          0, spriteid_wizard_transform1      ; 2e3c: 00 38       .8  :2d0b[1]
    !byte                          0,                          0      ; 2e3e: 00 00       ..  :2d0d[1]
    !byte spriteid_wizard_transform2,                          0      ; 2e40: 39 00       9.  :2d0f[1]
    !byte                          0, spriteid_wizard_transform2      ; 2e42: 00 39       .9  :2d11[1]
    !byte                          0,                          0      ; 2e44: 00 00       ..  :2d13[1]
    !byte                          0                                  ; 2e46: 00          .   :2d15[1]
wizard_walk_cycle_animation
    !byte spriteid_wizard1,                4,                0        ; 2e47: 30 04 00    0.. :2d16[1]
    !byte spriteid_wizard2,                4,                0        ; 2e4a: 31 04 00    1.. :2d19[1]
    !byte spriteid_wizard3,                4,                0        ; 2e4d: 32 04 00    2.. :2d1c[1]
    !byte spriteid_wizard4,                4,                0        ; 2e50: 33 04 00    3.. :2d1f[1]
    !byte                0                                            ; 2e53: 00          .   :2d22[1]
wizard_change_direction_animation
    !byte spriteid_wizard4,                0,                0        ; 2e54: 33 00 00    3.. :2d23[1]
wizard_change_direction_animation_last_step
    !byte spriteid_wizard4,                2,                0        ; 2e57: 33 02 00    3.. :2d26[1]
    !byte                0                                            ; 2e5a: 00          .   :2d29[1]
wizard_transition_to_standing_still_animation
    !byte spriteid_wizard7,                4,                0        ; 2e5b: 36 04 00    6.. :2d2a[1]
    !byte                0                                            ; 2e5e: 00          .   :2d2d[1]
wizard_standing_still_animation
    !byte spriteid_wizard7,                0,                0        ; 2e5f: 36 00 00    6.. :2d2e[1]
    !byte                0                                            ; 2e62: 00          .   :2d31[1]
wizard_transition_to_transforming_animation
    !byte spriteid_wizard_using_object,                            0  ; 2e63: 35 00       5.  :2d32[1]
    !byte                            0,                            0  ; 2e65: 00 00       ..  :2d34[1]
wizard_jump_animation
    !byte spriteid_wizard5,                6,              $fc        ; 2e67: 34 06 fc    4.. :2d36[1]
    !byte spriteid_wizard5,                6,              $fd        ; 2e6a: 34 06 fd    4.. :2d39[1]
    !byte spriteid_wizard5,                5,              $fe        ; 2e6d: 34 05 fe    4.. :2d3c[1]
    !byte spriteid_wizard5,                5,              $ff        ; 2e70: 34 05 ff    4.. :2d3f[1]
    !byte spriteid_wizard5,                4,                0        ; 2e73: 34 04 00    4.. :2d42[1]
    !byte                0                                            ; 2e76: 00          .   :2d45[1]
wizard_start_to_fall_animation
    !byte spriteid_wizard5,                4,                1        ; 2e77: 34 04 01    4.. :2d46[1]
    !byte spriteid_wizard5,                3,                2        ; 2e7a: 34 03 02    4.. :2d49[1]
    !byte spriteid_wizard5,                3,                3        ; 2e7d: 34 03 03    4.. :2d4c[1]
    !byte spriteid_wizard5,                2,                4        ; 2e80: 34 02 04    4.. :2d4f[1]
    !byte spriteid_wizard5,                2,                5        ; 2e83: 34 02 05    4.. :2d52[1]
    !byte spriteid_wizard5,                1,                6        ; 2e86: 34 01 06    4.. :2d55[1]
    !byte                0                                            ; 2e89: 00          .   :2d58[1]
wizard_animation11
    !byte spriteid_wizard5,                4,                2        ; 2e8a: 34 04 02    4.. :2d59[1]
    !byte spriteid_wizard5,                3,                3        ; 2e8d: 34 03 03    4.. :2d5c[1]
    !byte spriteid_wizard5,                2,                4        ; 2e90: 34 02 04    4.. :2d5f[1]
    !byte spriteid_wizard5,                1,                5        ; 2e93: 34 01 05    4.. :2d62[1]
    !byte                0                                            ; 2e96: 00          .   :2d65[1]
wizard_animation12
    !byte spriteid_wizard5,              $fc,                2        ; 2e97: 34 fc 02    4.. :2d66[1]
    !byte spriteid_wizard5,              $fd,                3        ; 2e9a: 34 fd 03    4.. :2d69[1]
    !byte spriteid_wizard5,              $fe,                4        ; 2e9d: 34 fe 04    4.. :2d6c[1]
    !byte spriteid_wizard5,              $ff,                5        ; 2ea0: 34 ff 05    4.. :2d6f[1]
    !byte                0                                            ; 2ea3: 00          .   :2d72[1]
wizard_standing_fall_animation
    !byte spriteid_wizard5,                0,                1        ; 2ea4: 34 00 01    4.. :2d73[1]
    !byte spriteid_wizard5,                0,                2        ; 2ea7: 34 00 02    4.. :2d76[1]
    !byte spriteid_wizard5,                0,                3        ; 2eaa: 34 00 03    4.. :2d79[1]
    !byte spriteid_wizard5,                0,                4        ; 2ead: 34 00 04    4.. :2d7c[1]
    !byte spriteid_wizard5,                0,                5        ; 2eb0: 34 00 05    4.. :2d7f[1]
    !byte                0                                            ; 2eb3: 00          .   :2d82[1]
wizard_fall_continues_animation
    !byte spriteid_wizard5,                0,                7        ; 2eb4: 34 00 07    4.. :2d83[1]
    !byte                0                                            ; 2eb7: 00          .   :2d86[1]

update_wizard
    lda #wizard_transform_out_animation - wizard_base_animation       ; 2eb8: a9 16       ..  :2d87[1]
    sta transform_out_animation                                       ; 2eba: 8d ed 22    .." :2d89[1]
    ldx #<wizard_base_animation                                       ; 2ebd: a2 ed       ..  :2d8c[1]
    ldy #>wizard_base_animation                                       ; 2ebf: a0 2c       .,  :2d8e[1]
    lda #3                                                            ; 2ec1: a9 03       ..  :2d90[1]
    jsr set_base_animation_address_and_handle_transform_in_out        ; 2ec3: 20 ee 22     ." :2d92[1]
; branch if transforming
    bne wizard_got_index_in_animation_local                           ; 2ec6: d0 29       .)  :2d95[1]
; has the change of direction animation finished?
    cpy #wizard_change_direction_animation_last_step - wizard_base_animation; 2ec8: c0 39       .9  :2d97[1]
    bne wizard_not_changing_direction                                 ; 2eca: d0 0b       ..  :2d99[1]
; toggle player direction
    lda object_direction                                              ; 2ecc: ad be 09    ... :2d9b[1]
    eor #$fe                                                          ; 2ecf: 49 fe       I.  :2d9e[1]
    sta object_direction                                              ; 2ed1: 8d be 09    ... :2da0[1]
    jmp wizard_got_index_in_animation                                 ; 2ed4: 4c 5f 2e    L_. :2da3[1]

wizard_not_changing_direction
    jsr update_player_hitting_floor_or_pushed                         ; 2ed7: 20 c4 23     .# :2da6[1]
    bne wizard_falling                                                ; 2eda: d0 39       .9  :2da9[1]
    lda current_player_animation                                      ; 2edc: ad df 09    ... :2dab[1]
    cmp #wizard_jump_animation - wizard_base_animation                ; 2edf: c9 49       .I  :2dae[1]
    bne wizard_not_jumping                                            ; 2ee1: d0 18       ..  :2db0[1]
; wizard is jumping
    dec temp_top_offset                                               ; 2ee3: ce 50 25    .P% :2db2[1]
; if (collided with room while jumping) then branch (fall)
    lda #0                                                            ; 2ee6: a9 00       ..  :2db5[1]
    jsr get_solid_rock_collision_for_object_a                         ; 2ee8: 20 94 28     .( :2db7[1]
    bne wizard_start_to_fall                                          ; 2eeb: d0 07       ..  :2dba[1]
; if (jump animation has looped) then branch (fall)
    cpy #wizard_jump_animation - wizard_base_animation                ; 2eed: c0 49       .I  :2dbc[1]
    beq wizard_start_to_fall                                          ; 2eef: f0 03       ..  :2dbe[1]
wizard_got_index_in_animation_local
    jmp wizard_got_index_in_animation                                 ; 2ef1: 4c 5f 2e    L_. :2dc0[1]

wizard_start_to_fall
    lda #wizard_fall_continues_animation - wizard_base_animation      ; 2ef4: a9 96       ..  :2dc3[1]
    sta current_player_animation                                      ; 2ef6: 8d df 09    ... :2dc5[1]
    ldy #wizard_start_to_fall_animation - wizard_base_animation       ; 2ef9: a0 59       .Y  :2dc8[1]
; if (player has hit floor) then branch
wizard_not_jumping
    lda object_has_hit_floor_flag                                     ; 2efb: ad 8f 28    ..( :2dca[1]
    bne wizard_hits_ground                                            ; 2efe: d0 24       .$  :2dcd[1]
; Player is not jumping and not on the floor, so must be falling.
; if (not already falling) then branch (start falling)
    lda current_player_animation                                      ; 2f00: ad df 09    ... :2dcf[1]
    cmp #wizard_fall_continues_animation - wizard_base_animation      ; 2f03: c9 96       ..  :2dd2[1]
    bne wizard_falling                                                ; 2f05: d0 0e       ..  :2dd4[1]
; if (player not hitting left or right wall) then branch (start falling)
    lda #object_collided_right_wall                                   ; 2f07: a9 04       ..  :2dd6[1]
    ora #object_collided_left_wall                                    ; 2f09: 09 01       ..  :2dd8[1]   ; why not just lda #5?
    and object_room_collision_flags                                   ; 2f0b: 2d d8 38    -.8 :2dda[1]
    beq wizard_falling                                                ; 2f0e: f0 05       ..  :2ddd[1]
    lda #$80                                                          ; 2f10: a9 80       ..  :2ddf[1]
    sta player_wall_collision_reaction_speed                          ; 2f12: 8d 33 24    .3$ :2de1[1]
wizard_falling
    lda #wizard_fall_continues_animation - wizard_base_animation      ; 2f15: a9 96       ..  :2de4[1]
    cmp current_player_animation                                      ; 2f17: cd df 09    ... :2de6[1]
    beq wizard_got_index_in_animation_local                           ; 2f1a: f0 d5       ..  :2de9[1]
; wizard wasn't falling, but now is. It's a fall from a standing position, like through
; a trapdoor that just opened up beneath you. Also happens when being pushed.
    sta current_player_animation                                      ; 2f1c: 8d df 09    ... :2deb[1]
    ldy #wizard_standing_fall_animation - wizard_base_animation       ; 2f1f: a0 86       ..  :2dee[1]
    jmp wizard_got_index_in_animation                                 ; 2f21: 4c 5f 2e    L_. :2df0[1]

wizard_hits_ground
    ldx player_move_direction_requested                               ; 2f24: ae c9 3a    ..: :2df3[1]
    beq wizard_standing_still                                         ; 2f27: f0 23       .#  :2df6[1]
    lda #wizard_change_direction_animation - wizard_base_animation    ; 2f29: a9 36       .6  :2df8[1]
    cpx object_direction                                              ; 2f2b: ec be 09    ... :2dfa[1]
    bne wizard_changing_direction_or_jump_requested                   ; 2f2e: d0 10       ..  :2dfd[1]
    lda #wizard_walk_cycle_animation - wizard_base_animation          ; 2f30: a9 29       .)  :2dff[1]
    ldx jump_requested                                                ; 2f32: ae c7 3a    ..: :2e01[1]
    beq wizard_changing_direction_or_jump_requested                   ; 2f35: f0 09       ..  :2e04[1]
    ldx current_player_animation                                      ; 2f37: ae df 09    ... :2e06[1]
    cpx #wizard_fall_continues_animation - wizard_base_animation      ; 2f3a: e0 96       ..  :2e09[1]
    beq wizard_changing_direction_or_jump_requested                   ; 2f3c: f0 02       ..  :2e0b[1]
    lda #wizard_jump_animation - wizard_base_animation                ; 2f3e: a9 49       .I  :2e0d[1]
wizard_changing_direction_or_jump_requested
    cmp current_player_animation                                      ; 2f40: cd df 09    ... :2e0f[1]
    beq wizard_check_if_fallen_off_edge                               ; 2f43: f0 30       .0  :2e12[1]
    sta current_player_animation                                      ; 2f45: 8d df 09    ... :2e14[1]
    tay                                                               ; 2f48: a8          .   :2e17[1]
    jmp wizard_check_if_fallen_off_edge                               ; 2f49: 4c 44 2e    LD. :2e18[1]

wizard_standing_still
    lda current_player_animation                                      ; 2f4c: ad df 09    ... :2e1b[1]
    ldy #wizard_standing_still_animation - wizard_base_animation      ; 2f4f: a0 41       .A  :2e1e[1]
    sty current_player_animation                                      ; 2f51: 8c df 09    ... :2e20[1]
    cmp #wizard_walk_cycle_animation - wizard_base_animation          ; 2f54: c9 29       .)  :2e23[1]
    beq wizard_transition_to_standing_still                           ; 2f56: f0 1b       ..  :2e25[1]
    cmp #wizard_change_direction_animation - wizard_base_animation    ; 2f58: c9 36       .6  :2e27[1]
    beq wizard_transition_to_standing_still                           ; 2f5a: f0 17       ..  :2e29[1]
    lda jump_requested                                                ; 2f5c: ad c7 3a    ..: :2e2b[1]
    beq wizard_check_if_fallen_off_edge                               ; 2f5f: f0 14       ..  :2e2e[1]
    lda player_held_object_spriteid                                   ; 2f61: a5 52       .R  :2e30[1]
    beq wizard_check_if_fallen_off_edge                               ; 2f63: f0 10       ..  :2e32[1]
    ldy #wizard_transition_to_transforming_animation - wizard_base_animation; 2f65: a0 45       .E  :2e34[1]
    cmp #spriteid_menu_item_completion_spell                          ; 2f67: c9 21       .!  :2e36[1]
    bne wizard_check_if_fallen_off_edge                               ; 2f69: d0 0a       ..  :2e38[1]
; transform to nothing (end of level spell)
    lda #spriteid_one_pixel_masked_out                                ; 2f6b: a9 00       ..  :2e3a[1]
    jsr transform                                                     ; 2f6d: 20 37 23     7# :2e3c[1]
    jmp update_wizard                                                 ; 2f70: 4c 87 2d    L.- :2e3f[1]

; transition from a walk cycle or change of direction animation to standing still
wizard_transition_to_standing_still
    ldy #wizard_transition_to_standing_still_animation - wizard_base_animation; 2f73: a0 3d       .=  :2e42[1]
wizard_check_if_fallen_off_edge
    ldx #0                                                            ; 2f75: a2 00       ..  :2e44[1]
; Read the 'player_just_fallen_off_edge_direction' if stationary, or the
; 'player_just_fallen_off_centrally_direction' if moving
    lda player_move_direction_requested                               ; 2f77: ad c9 3a    ..: :2e46[1]
    beq got_index_from_direction_requested                            ; 2f7a: f0 01       ..  :2e49[1]
    inx                                                               ; 2f7c: e8          .   :2e4b[1]
got_index_from_direction_requested
    lda object_just_fallen_off_edge_direction,x                       ; 2f7d: bd 90 28    ..( :2e4c[1]
    beq wizard_got_index_in_animation                                 ; 2f80: f0 0e       ..  :2e4f[1]
    ldy #wizard_fall_continues_animation - wizard_base_animation      ; 2f82: a0 96       ..  :2e51[1]
    sty current_player_animation                                      ; 2f84: 8c df 09    ... :2e53[1]
    ldy #wizard_animation11 - wizard_base_animation                   ; 2f87: a0 6c       .l  :2e56[1]
    cmp object_direction                                              ; 2f89: cd be 09    ... :2e58[1]
    beq wizard_got_index_in_animation                                 ; 2f8c: f0 02       ..  :2e5b[1]
    ldy #wizard_animation12 - wizard_base_animation                   ; 2f8e: a0 79       .y  :2e5d[1]
wizard_got_index_in_animation
    sty object_current_index_in_animation                             ; 2f90: 8c d4 09    ... :2e5f[1]
    lda #0                                                            ; 2f93: a9 00       ..  :2e62[1]
    sta temp_collision_results                                        ; 2f95: 8d b5 2e    ... :2e64[1]
    lda player_held_object_spriteid                                   ; 2f98: a5 52       .R  :2e67[1]
    beq wizard_skip_holding_object_handling                           ; 2f9a: f0 17       ..  :2e69[1]
; wizard is holding an object
    ldy object_current_index_in_animation                             ; 2f9c: ac d4 09    ... :2e6b[1]
    lda wizard_base_animation,y                                       ; 2f9f: b9 ed 2c    .., :2e6e[1]
    sta object_spriteid                                               ; 2fa2: 8d a8 09    ... :2e71[1]
    jsr update_player_accessory_including_toolbar                     ; 2fa5: 20 b8 2e     .. :2e74[1]
    lda #objectid_player                                              ; 2fa8: a9 00       ..  :2e77[1]
    jsr update_object_a_solid_rock_collision                          ; 2faa: 20 f5 25     .% :2e79[1]
    lda object_room_collision_flags                                   ; 2fad: ad d8 38    ..8 :2e7c[1]
    sta temp_collision_results                                        ; 2fb0: 8d b5 2e    ... :2e7f[1]
wizard_skip_holding_object_handling
    lda object_current_index_in_animation                             ; 2fb3: ad d4 09    ... :2e82[1]
; update sprite for wizard
    ldx #<wizard_base_animation                                       ; 2fb6: a2 ed       ..  :2e85[1]
    ldy #>wizard_base_animation                                       ; 2fb8: a0 2c       .,  :2e87[1]
    jsr set_player_spriteid_and_offset_from_animation_table           ; 2fba: 20 00 22     ." :2e89[1]
    jsr update_player_accessory_including_toolbar                     ; 2fbd: 20 b8 2e     .. :2e8c[1]
; update collision
    lda #objectid_player                                              ; 2fc0: a9 00       ..  :2e8f[1]
    jsr update_object_a_solid_rock_collision                          ; 2fc2: 20 f5 25     .% :2e91[1]
    lda object_room_collision_flags                                   ; 2fc5: ad d8 38    ..8 :2e94[1]
    ora temp_collision_results                                        ; 2fc8: 0d b5 2e    ... :2e97[1]
    sta object_room_collision_flags                                   ; 2fcb: 8d d8 38    ..8 :2e9a[1]
; Save the current value of player_using_object at previous_player_using_object
    lda player_using_object_spriteid                                  ; 2fce: ad b6 2e    ... :2e9d[1]
    sta previous_player_using_object_spriteid                         ; 2fd1: 8d b7 2e    ... :2ea0[1]
; Set player_using_object_spriteid to player_held_object_spriteid if player is using an
; object, or zero otherwise.
    ldx #0                                                            ; 2fd4: a2 00       ..  :2ea3[1]
; if (the player is not using an item) then branch
    lda object_spriteid                                               ; 2fd6: ad a8 09    ... :2ea5[1]
    cmp #spriteid_wizard_using_object                                 ; 2fd9: c9 35       .5  :2ea8[1]
    bne store_object_being_used                                       ; 2fdb: d0 05       ..  :2eaa[1]
; This test is redundant
    lda player_held_object_spriteid                                   ; 2fdd: a5 52       .R  :2eac[1]
    beq store_object_being_used                                       ; 2fdf: f0 01       ..  :2eae[1]
    tax                                                               ; 2fe1: aa          .   :2eb0[1]
store_object_being_used
    stx player_using_object_spriteid                                  ; 2fe2: 8e b6 2e    ... :2eb1[1]
    rts                                                               ; 2fe5: 60          `   :2eb4[1]

temp_collision_results
    !byte 0                                                           ; 2fe6: 00          .   :2eb5[1]
player_using_object_spriteid
    !byte 0                                                           ; 2fe7: 00          .   :2eb6[1]
previous_player_using_object_spriteid
    !byte 0                                                           ; 2fe8: 00          .   :2eb7[1]

update_player_accessory_including_toolbar
    ldx player_held_object_spriteid                                   ; 2fe9: a6 52       .R  :2eb8[1]
    beq store_object_held_and_return                                  ; 2feb: f0 28       .(  :2eba[1]
    ldx #<wizard_sprite_list                                          ; 2fed: a2 d7       ..  :2ebc[1]
    ldy #>wizard_sprite_list                                          ; 2fef: a0 2c       .,  :2ebe[1]
    lda #0                                                            ; 2ff1: a9 00       ..  :2ec0[1]
    jsr update_player_accessory_object_animation                      ; 2ff3: 20 48 22     H" :2ec2[1]
    lda player_held_object_spriteid                                   ; 2ff6: a5 52       .R  :2ec5[1]
; find the menu index of the player accessory given its spriteid
    ldy #0                                                            ; 2ff8: a0 00       ..  :2ec7[1]
find_menu_index_given_spriteid_loop
    cmp toolbar_collectable_spriteids,y                               ; 2ffa: d9 e8 2e    ... :2ec9[1]
    beq found_menu_index                                              ; 2ffd: f0 09       ..  :2ecc[1]
    iny                                                               ; 2fff: c8          .   :2ece[1]
    cpy #4                                                            ; 3000: c0 04       ..  :2ecf[1]
    bcc find_menu_index_given_spriteid_loop                           ; 3002: 90 f6       ..  :2ed1[1]
; menu index not found, give up
    ldx #0                                                            ; 3004: a2 00       ..  :2ed3[1]
    beq store_object_held_and_return                                  ; 3006: f0 0d       ..  :2ed5[1]   ; ALWAYS branch
found_menu_index
    ldx collectable_being_used_spriteids,y                            ; 3008: be f2 2e    ... :2ed7[1]
    lda object_spriteid                                               ; 300b: ad a8 09    ... :2eda[1]
    cmp #spriteid_wizard_using_object                                 ; 300e: c9 35       .5  :2edd[1]
    beq store_object_held_and_return                                  ; 3010: f0 03       ..  :2edf[1]
    ldx collectable_spriteids,y                                       ; 3012: be ed 2e    ... :2ee1[1]
store_object_held_and_return
    stx object_spriteid + objectid_player_accessory                   ; 3015: 8e a9 09    ... :2ee4[1]
    rts                                                               ; 3018: 60          `   :2ee7[1]

toolbar_collectable_spriteids
    !byte 0, 0, 0, 0, 0                                               ; 3019: 00 00 00... ... :2ee8[1]
collectable_spriteids
    !byte 0, 0, 0, 0, 0                                               ; 301e: 00 00 00... ... :2eed[1]
collectable_being_used_spriteids
    !byte 0, 0, 0, 0, 0                                               ; 3023: 00 00 00... ... :2ef2[1]

cat_tail_spriteids
    !byte spriteid_cat_tail1, spriteid_cat_tail2, spriteid_cat_tail3  ; 3028: 12 13 14    ... :2ef7[1]
    !byte spriteid_cat_tail4, spriteid_cat_tail5, spriteid_cat_tail6  ; 302b: 15 16 17    ... :2efa[1]
    !byte spriteid_cat_tail7, spriteid_cat_tail8,                  0  ; 302e: 18 19 00    ... :2efd[1]
cat_sprite_list
    !byte spriteid_cat_walk1,                $f9,                $f6  ; 3031: 0c f9 f6    ... :2f00[1]
    !byte spriteid_cat_walk2,                $f9,                $f5  ; 3034: 0d f9 f5    ... :2f03[1]
    !byte spriteid_cat_walk3,                $f9,                $f6  ; 3037: 0e f9 f6    ... :2f06[1]
    !byte spriteid_cat_walk4,                $f9,                $f5  ; 303a: 0f f9 f5    ... :2f09[1]
    !byte spriteid_cat_walk4,                $f9,                $f5  ; 303d: 0f f9 f5    ... :2f0c[1]
    !byte      spriteid_cat2,                $f9,                $f5  ; 3040: 1c f9 f5    ... :2f0f[1]
    !byte  spriteid_cat_jump,                $f9,                $f6  ; 3043: 1a f9 f6    ... :2f12[1]
    !byte                  0                                          ; 3046: 00          .   :2f15[1]
cat_base_animation
cat_transform_in_animation
    !byte                       0,                       0            ; 3047: 00 00       ..  :2f16[1]
    !byte                       0, spriteid_cat_transform2            ; 3049: 00 11       ..  :2f18[1]
    !byte                       0,                       0            ; 304b: 00 00       ..  :2f1a[1]
    !byte spriteid_cat_transform2,                       0            ; 304d: 11 00       ..  :2f1c[1]
    !byte                       0, spriteid_cat_transform1            ; 304f: 00 10       ..  :2f1e[1]
    !byte                       0,                       0            ; 3051: 00 00       ..  :2f20[1]
    !byte spriteid_cat_transform1,                       0            ; 3053: 10 00       ..  :2f22[1]
    !byte                       0,      spriteid_cat_walk4            ; 3055: 00 0f       ..  :2f24[1]
    !byte                       0,                       0            ; 3057: 00 00       ..  :2f26[1]
    !byte      spriteid_cat_walk4,                       0            ; 3059: 0f 00       ..  :2f28[1]
    !byte                       0,                       0            ; 305b: 00 00       ..  :2f2a[1]
cat_transform_out_animation
    !byte      spriteid_cat_walk4,                       0            ; 305d: 0f 00       ..  :2f2c[1]
    !byte                       0,      spriteid_cat_walk4            ; 305f: 00 0f       ..  :2f2e[1]
    !byte                       0,                       0            ; 3061: 00 00       ..  :2f30[1]
    !byte spriteid_cat_transform1,                       0            ; 3063: 10 00       ..  :2f32[1]
    !byte                       0, spriteid_cat_transform1            ; 3065: 00 10       ..  :2f34[1]
    !byte                       0,                       0            ; 3067: 00 00       ..  :2f36[1]
    !byte spriteid_cat_transform2,                       0            ; 3069: 11 00       ..  :2f38[1]
    !byte                       0, spriteid_cat_transform2            ; 306b: 00 11       ..  :2f3a[1]
    !byte                       0,                       0            ; 306d: 00 00       ..  :2f3c[1]
    !byte                       0                                     ; 306f: 00          .   :2f3e[1]
cat_walk_cycle_animation
    !byte spriteid_cat_walk1,                  4,                  0  ; 3070: 0c 04 00    ... :2f3f[1]
    !byte spriteid_cat_walk2,                  4,                  0  ; 3073: 0d 04 00    ... :2f42[1]
    !byte spriteid_cat_walk3,                  4,                  0  ; 3076: 0e 04 00    ... :2f45[1]
    !byte spriteid_cat_walk4,                  4,                  0  ; 3079: 0f 04 00    ... :2f48[1]
    !byte                  0                                          ; 307c: 00          .   :2f4b[1]
cat_change_direction_animation
    !byte spriteid_cat_walk4,                  0,                  0  ; 307d: 0f 00 00    ... :2f4c[1]
cat_change_direction_animation_last_step
    !byte spriteid_cat_walk4,                  2,                  0  ; 3080: 0f 02 00    ... :2f4f[1]
    !byte                  0                                          ; 3083: 00          .   :2f52[1]
cat_transition_to_standing_still_animation
    !byte spriteid_cat2,             4,             0,             0  ; 3084: 1c 04 00... ... :2f53[1]
cat_standing_still_animation
    !byte spriteid_cat2,             0,             0,             0  ; 3088: 1c 00 00... ... :2f57[1]
cat_jump_animation
    !byte spriteid_cat_jump,                 6,               $fb     ; 308c: 1a 06 fb    ... :2f5b[1]
    !byte spriteid_cat_jump,                 6,               $fc     ; 308f: 1a 06 fc    ... :2f5e[1]
    !byte spriteid_cat_jump,                 5,               $fc     ; 3092: 1a 05 fc    ... :2f61[1]
    !byte spriteid_cat_jump,                 5,               $fd     ; 3095: 1a 05 fd    ... :2f64[1]
    !byte spriteid_cat_jump,                 5,               $fe     ; 3098: 1a 05 fe    ... :2f67[1]
    !byte spriteid_cat_jump,                 5,               $ff     ; 309b: 1a 05 ff    ... :2f6a[1]
    !byte                 0                                           ; 309e: 00          .   :2f6d[1]
cat_jump_apex_animation
    !byte spriteid_cat_jump,                 5,                 0     ; 309f: 1a 05 00    ... :2f6e[1]
    !byte spriteid_cat_jump,                 5,                 0     ; 30a2: 1a 05 00    ... :2f71[1]
    !byte                 0                                           ; 30a5: 00          .   :2f74[1]
cat_start_to_fall_animation
    !byte spriteid_cat_walk4,                  5,                  1  ; 30a6: 0f 05 01    ... :2f75[1]
    !byte spriteid_cat_walk4,                  5,                  2  ; 30a9: 0f 05 02    ... :2f78[1]
    !byte spriteid_cat_walk4,                  4,                  3  ; 30ac: 0f 04 03    ... :2f7b[1]
    !byte spriteid_cat_walk4,                  4,                  4  ; 30af: 0f 04 04    ... :2f7e[1]
    !byte spriteid_cat_walk4,                  4,                  4  ; 30b2: 0f 04 04    ... :2f81[1]
    !byte spriteid_cat_walk4,                  4,                  5  ; 30b5: 0f 04 05    ... :2f84[1]
    !byte spriteid_cat_walk4,                  3,                  5  ; 30b8: 0f 03 05    ... :2f87[1]
    !byte spriteid_cat_walk4,                  3,                  5  ; 30bb: 0f 03 05    ... :2f8a[1]
    !byte spriteid_cat_walk4,                  2,                  6  ; 30be: 0f 02 06    ... :2f8d[1]
    !byte spriteid_cat_walk4,                  2,                  6  ; 30c1: 0f 02 06    ... :2f90[1]
    !byte spriteid_cat_walk4,                  1,                  6  ; 30c4: 0f 01 06    ... :2f93[1]
    !byte spriteid_cat_walk4,                  1,                  6  ; 30c7: 0f 01 06    ... :2f96[1]
    !byte                  0                                          ; 30ca: 00          .   :2f99[1]
cat_animation11
    !byte spriteid_cat_walk4,                  4,                  2  ; 30cb: 0f 04 02    ... :2f9a[1]
    !byte spriteid_cat_walk4,                  3,                  3  ; 30ce: 0f 03 03    ... :2f9d[1]
    !byte spriteid_cat_walk4,                  2,                  4  ; 30d1: 0f 02 04    ... :2fa0[1]
    !byte spriteid_cat_walk4,                  1,                  5  ; 30d4: 0f 01 05    ... :2fa3[1]
    !byte                  0                                          ; 30d7: 00          .   :2fa6[1]
cat_animation12
    !byte spriteid_cat_walk4,                $fc,                  2  ; 30d8: 0f fc 02    ... :2fa7[1]
    !byte spriteid_cat_walk4,                $fd,                  3  ; 30db: 0f fd 03    ... :2faa[1]
    !byte spriteid_cat_walk4,                $fe,                  4  ; 30de: 0f fe 04    ... :2fad[1]
    !byte spriteid_cat_walk4,                $ff,                  5  ; 30e1: 0f ff 05    ... :2fb0[1]
    !byte                  0                                          ; 30e4: 00          .   :2fb3[1]
cat_standing_fall_animation
    !byte spriteid_cat_walk4,                  0,                  1  ; 30e5: 0f 00 01    ... :2fb4[1]
    !byte spriteid_cat_walk4,                  0,                  2  ; 30e8: 0f 00 02    ... :2fb7[1]
    !byte spriteid_cat_walk4,                  0,                  3  ; 30eb: 0f 00 03    ... :2fba[1]
    !byte spriteid_cat_walk4,                  0,                  4  ; 30ee: 0f 00 04    ... :2fbd[1]
    !byte spriteid_cat_walk4,                  0,                  5  ; 30f1: 0f 00 05    ... :2fc0[1]
    !byte                  0                                          ; 30f4: 00          .   :2fc3[1]
cat_fall_animation
    !byte spriteid_cat_walk4,                  0,                  7  ; 30f5: 0f 00 07    ... :2fc4[1]
    !byte                  0                                          ; 30f8: 00          .   :2fc7[1]

update_cat
    lda #cat_transform_out_animation - cat_base_animation             ; 30f9: a9 16       ..  :2fc8[1]
    sta transform_out_animation                                       ; 30fb: 8d ed 22    .." :2fca[1]
    ldx #<cat_base_animation                                          ; 30fe: a2 16       ..  :2fcd[1]
    ldy #>cat_base_animation                                          ; 3100: a0 2f       ./  :2fcf[1]
    lda #3                                                            ; 3102: a9 03       ..  :2fd1[1]
    jsr set_base_animation_address_and_handle_transform_in_out        ; 3104: 20 ee 22     ." :2fd3[1]
    bne cat_got_index_in_animation_local                              ; 3107: d0 36       .6  :2fd6[1]
    cpy #cat_change_direction_animation_last_step - cat_base_animation; 3109: c0 39       .9  :2fd8[1]
    bne cat_not_changing_direction                                    ; 310b: d0 0b       ..  :2fda[1]
; toggle player direction
    lda object_direction                                              ; 310d: ad be 09    ... :2fdc[1]
    eor #$fe                                                          ; 3110: 49 fe       I.  :2fdf[1]
    sta object_direction                                              ; 3112: 8d be 09    ... :2fe1[1]
    jmp cat_got_index_in_animation                                    ; 3115: 4c a5 30    L.0 :2fe4[1]

cat_not_changing_direction
    jsr update_player_hitting_floor_or_pushed                         ; 3118: 20 c4 23     .# :2fe7[1]
    bne cat_falling                                                   ; 311b: d0 58       .X  :2fea[1]
    lda current_player_animation                                      ; 311d: ad df 09    ... :2fec[1]
    cmp #cat_jump_animation - cat_base_animation                      ; 3120: c9 45       .E  :2fef[1]
    bne cat_not_jumping                                               ; 3122: d0 1e       ..  :2ff1[1]
; cat is jumping
    dec temp_top_offset                                               ; 3124: ce 50 25    .P% :2ff3[1]
; if (collided with room while jumping) then branch (fall)
    lda #0                                                            ; 3127: a9 00       ..  :2ff6[1]
    jsr get_solid_rock_collision_for_object_a                         ; 3129: 20 94 28     .( :2ff8[1]
    bne cat_start_to_fall                                             ; 312c: d0 26       .&  :2ffb[1]
; if (jump animation has looped) then branch (fall)
    cpy #cat_jump_animation - cat_base_animation                      ; 312e: c0 45       .E  :2ffd[1]
    bne cat_got_index_in_animation_local                              ; 3130: d0 0d       ..  :2fff[1]
    lda player_move_direction_requested                               ; 3132: ad c9 3a    ..: :3001[1]
    cmp object_direction                                              ; 3135: cd be 09    ... :3004[1]
    bne cat_start_to_fall                                             ; 3138: d0 1a       ..  :3007[1]
    ldy #cat_jump_apex_animation - cat_base_animation                 ; 313a: a0 58       .X  :3009[1]
    sty current_player_animation                                      ; 313c: 8c df 09    ... :300b[1]
cat_got_index_in_animation_local
    jmp cat_got_index_in_animation                                    ; 313f: 4c a5 30    L.0 :300e[1]

cat_not_jumping
    cmp #cat_jump_apex_animation - cat_base_animation                 ; 3142: c9 58       .X  :3011[1]
    bne cat_check_for_hitting_floor                                   ; 3144: d0 15       ..  :3013[1]
    dec temp_top_offset                                               ; 3146: ce 50 25    .P% :3015[1]
    lda #0                                                            ; 3149: a9 00       ..  :3018[1]
    jsr get_solid_rock_collision_for_object_a                         ; 314b: 20 94 28     .( :301a[1]
    bne cat_start_to_fall                                             ; 314e: d0 04       ..  :301d[1]
    cpy #cat_jump_apex_animation - cat_base_animation                 ; 3150: c0 58       .X  :301f[1]
    bne cat_got_index_in_animation_local                              ; 3152: d0 eb       ..  :3021[1]
cat_start_to_fall
    lda #cat_fall_animation - cat_base_animation                      ; 3154: a9 ae       ..  :3023[1]
    sta current_player_animation                                      ; 3156: 8d df 09    ... :3025[1]
    ldy #cat_start_to_fall_animation - cat_base_animation             ; 3159: a0 5f       ._  :3028[1]
; if (player has hit floor) then branch
cat_check_for_hitting_floor
    lda object_has_hit_floor_flag                                     ; 315b: ad 8f 28    ..( :302a[1]
    bne cat_hits_ground                                               ; 315e: d0 24       .$  :302d[1]
    lda current_player_animation                                      ; 3160: ad df 09    ... :302f[1]
    cmp #cat_fall_animation - cat_base_animation                      ; 3163: c9 ae       ..  :3032[1]
    bne cat_falling                                                   ; 3165: d0 0e       ..  :3034[1]
; check player for collision with left or right wall
    lda #object_collided_right_wall                                   ; 3167: a9 04       ..  :3036[1]
    ora #object_collided_left_wall                                    ; 3169: 09 01       ..  :3038[1]   ; why not just lda #5?
    and object_room_collision_flags                                   ; 316b: 2d d8 38    -.8 :303a[1]
    beq cat_falling                                                   ; 316e: f0 05       ..  :303d[1]
    lda #$80                                                          ; 3170: a9 80       ..  :303f[1]
    sta player_wall_collision_reaction_speed                          ; 3172: 8d 33 24    .3$ :3041[1]
cat_falling
    lda #cat_fall_animation - cat_base_animation                      ; 3175: a9 ae       ..  :3044[1]
    cmp current_player_animation                                      ; 3177: cd df 09    ... :3046[1]
    beq cat_got_index_in_animation_local                              ; 317a: f0 c3       ..  :3049[1]
; cat wasn't falling, but now is. It's a fall from a standing position, like through a
; trapdoor that just opened up beneath you. Also happens when being pushed.
    sta current_player_animation                                      ; 317c: 8d df 09    ... :304b[1]
    ldy #cat_standing_fall_animation - cat_base_animation             ; 317f: a0 9e       ..  :304e[1]
    jmp cat_got_index_in_animation                                    ; 3181: 4c a5 30    L.0 :3050[1]

cat_hits_ground
    ldx player_move_direction_requested                               ; 3184: ae c9 3a    ..: :3053[1]
    beq cat_standing_still                                            ; 3187: f0 1c       ..  :3056[1]
    lda #cat_change_direction_animation - cat_base_animation          ; 3189: a9 36       .6  :3058[1]
    cpx object_direction                                              ; 318b: ec be 09    ... :305a[1]
    bne cat_changing_direction_or_jump_requested                      ; 318e: d0 09       ..  :305d[1]
    lda #cat_walk_cycle_animation - cat_base_animation                ; 3190: a9 29       .)  :305f[1]
    ldx jump_requested                                                ; 3192: ae c7 3a    ..: :3061[1]
    beq cat_changing_direction_or_jump_requested                      ; 3195: f0 02       ..  :3064[1]
    lda #cat_jump_animation - cat_base_animation                      ; 3197: a9 45       .E  :3066[1]
cat_changing_direction_or_jump_requested
    cmp current_player_animation                                      ; 3199: cd df 09    ... :3068[1]
    beq cat_check_if_fallen_off_edge                                  ; 319c: f0 1d       ..  :306b[1]
    sta current_player_animation                                      ; 319e: 8d df 09    ... :306d[1]
    tay                                                               ; 31a1: a8          .   :3070[1]
    jmp cat_check_if_fallen_off_edge                                  ; 31a2: 4c 8a 30    L.0 :3071[1]

cat_standing_still
    lda current_player_animation                                      ; 31a5: ad df 09    ... :3074[1]
    cmp #cat_standing_still_animation - cat_base_animation            ; 31a8: c9 41       .A  :3077[1]
    beq cat_check_if_fallen_off_edge                                  ; 31aa: f0 0f       ..  :3079[1]
    ldy #cat_standing_still_animation - cat_base_animation            ; 31ac: a0 41       .A  :307b[1]
    sty current_player_animation                                      ; 31ae: 8c df 09    ... :307d[1]
    cmp #cat_walk_cycle_animation - cat_base_animation                ; 31b1: c9 29       .)  :3080[1]
    beq cat_transition_to_standing_still                              ; 31b3: f0 04       ..  :3082[1]
    cmp #cat_change_direction_animation - cat_base_animation          ; 31b5: c9 36       .6  :3084[1]
    bne cat_check_if_fallen_off_edge                                  ; 31b7: d0 02       ..  :3086[1]
; transition from a walk cycle or change of direction animation to standing still
cat_transition_to_standing_still
    ldy #cat_transition_to_standing_still_animation - cat_base_animation; 31b9: a0 3d       .=  :3088[1]
cat_check_if_fallen_off_edge
    ldx #0                                                            ; 31bb: a2 00       ..  :308a[1]
; Read the 'player_just_fallen_off_edge_direction' if stationary, or the
; 'player_just_fallen_off_centrally_direction' if moving
    lda player_move_direction_requested                               ; 31bd: ad c9 3a    ..: :308c[1]
    beq got_direction_index                                           ; 31c0: f0 01       ..  :308f[1]
    inx                                                               ; 31c2: e8          .   :3091[1]
got_direction_index
    lda object_just_fallen_off_edge_direction,x                       ; 31c3: bd 90 28    ..( :3092[1]
    beq cat_got_index_in_animation                                    ; 31c6: f0 0e       ..  :3095[1]
; cat is falling
    ldy #cat_fall_animation - cat_base_animation                      ; 31c8: a0 ae       ..  :3097[1]
    sty current_player_animation                                      ; 31ca: 8c df 09    ... :3099[1]
    ldy #cat_animation11 - cat_base_animation                         ; 31cd: a0 84       ..  :309c[1]
    cmp object_direction                                              ; 31cf: cd be 09    ... :309e[1]
    beq cat_got_index_in_animation                                    ; 31d2: f0 02       ..  :30a1[1]
    ldy #cat_animation12 - cat_base_animation                         ; 31d4: a0 91       ..  :30a3[1]
cat_got_index_in_animation
    sty object_current_index_in_animation                             ; 31d6: 8c d4 09    ... :30a5[1]
    tya                                                               ; 31d9: 98          .   :30a8[1]
    ldx #<cat_base_animation                                          ; 31da: a2 16       ..  :30a9[1]
    ldy #>cat_base_animation                                          ; 31dc: a0 2f       ./  :30ab[1]
    jsr set_player_spriteid_and_offset_from_animation_table           ; 31de: 20 00 22     ." :30ad[1]
    lda #objectid_player                                              ; 31e1: a9 00       ..  :30b0[1]
    jsr update_object_a_solid_rock_collision                          ; 31e3: 20 f5 25     .% :30b2[1]
; update cat tail
    lda #<cat_tail_spriteids                                          ; 31e6: a9 f7       ..  :30b5[1]
    sta address1_low                                                  ; 31e8: 85 70       .p  :30b7[1]
    lda #>cat_tail_spriteids                                          ; 31ea: a9 2e       ..  :30b9[1]
    sta address1_high                                                 ; 31ec: 85 71       .q  :30bb[1]
    lda #$ff                                                          ; 31ee: a9 ff       ..  :30bd[1]
    ldx current_player_animation                                      ; 31f0: ae df 09    ... :30bf[1]
    cpx #cat_transform_in_animation - cat_base_animation              ; 31f3: e0 00       ..  :30c2[1]
    beq cat_transforming_in_or_out                                    ; 31f5: f0 04       ..  :30c4[1]
    cpx #cat_transform_out_animation - cat_base_animation             ; 31f7: e0 16       ..  :30c6[1]
    bne cat_update_tail                                               ; 31f9: d0 0b       ..  :30c8[1]
; don't draw cat tail while transforming until cat_walk4 sprite reached
cat_transforming_in_or_out
    lda #0                                                            ; 31fb: a9 00       ..  :30ca[1]
    ldx object_spriteid                                               ; 31fd: ae a8 09    ... :30cc[1]
    cpx #spriteid_cat_walk4                                           ; 3200: e0 0f       ..  :30cf[1]
    bne cat_update_tail                                               ; 3202: d0 02       ..  :30d1[1]
; top bit set with lower 7 bits = 1, so setting offset 1 into cat_sprite_list
    lda #$81                                                          ; 3204: a9 81       ..  :30d3[1]
cat_update_tail
    ldx #<cat_sprite_list                                             ; 3206: a2 00       ..  :30d5[1]
    ldy #>cat_sprite_list                                             ; 3208: a0 2f       ./  :30d7[1]
    jsr update_player_accessory_object_animation                      ; 320a: 20 48 22     H" :30d9[1]
    rts                                                               ; 320d: 60          `   :30dc[1]

monkey_tail_spriteids
    !byte spriteid_monkey_tail1, spriteid_monkey_tail2                ; 320e: 46 47       FG  :30dd[1]
    !byte spriteid_monkey_tail3, spriteid_monkey_tail4                ; 3210: 48 49       HI  :30df[1]
    !byte spriteid_monkey_tail5, spriteid_monkey_tail6                ; 3212: 4a 4b       JK  :30e1[1]
    !byte spriteid_monkey_tail7, spriteid_monkey_tail8                ; 3214: 4c 4d       LM  :30e3[1]
    !byte 0                                                           ; 3216: 00          .   :30e5[1]
monkey_sprite_list
    !byte spriteid_monkey5,              $f7,              $f9        ; 3217: 52 f7 f9    R.. :30e6[1]
    !byte spriteid_monkey1,              $f7,              $fa        ; 321a: 4e f7 fa    N.. :30e9[1]
    !byte spriteid_monkey2,              $f7,              $f9        ; 321d: 4f f7 f9    O.. :30ec[1]
    !byte spriteid_monkey3,              $f7,              $fa        ; 3220: 50 f7 fa    P.. :30ef[1]
    !byte spriteid_monkey4,              $f7,              $f9        ; 3223: 51 f7 f9    Q.. :30f2[1]
    !byte spriteid_monkey4,              $f7,              $f9        ; 3226: 51 f7 f9    Q.. :30f5[1]
    !byte spriteid_monkey_climb1,                    $f7              ; 3229: 53 f7       S.  :30f8[1]
    !byte                    $fa                                      ; 322b: fa          .   :30fa[1]
    !byte spriteid_monkey_climb2,                    $f8              ; 322c: 54 f8       T.  :30fb[1]
    !byte                    $fa                                      ; 322e: fa          .   :30fd[1]
    !byte 0                                                           ; 322f: 00          .   :30fe[1]
monkey_base_animation
monkey_transform_in_animation
    !byte 0, 0, 0                                                     ; 3230: 00 00 00    ... :30ff[1]
    !byte spriteid_monkey_transform2,                          0      ; 3233: 45 00       E.  :3102[1]
    !byte                          0                                  ; 3235: 00          .   :3104[1]
    !byte spriteid_monkey_transform2,                          0      ; 3236: 45 00       E.  :3105[1]
    !byte                          0                                  ; 3238: 00          .   :3107[1]
    !byte spriteid_monkey_transform1,                          0      ; 3239: 44 00       D.  :3108[1]
    !byte                          0                                  ; 323b: 00          .   :310a[1]
    !byte spriteid_monkey_transform1,                          0      ; 323c: 44 00       D.  :310b[1]
    !byte                          0                                  ; 323e: 00          .   :310d[1]
    !byte spriteid_monkey4,                0,                0        ; 323f: 51 00 00    Q.. :310e[1]
    !byte spriteid_monkey4,                0,                0        ; 3242: 51 00 00    Q.. :3111[1]
    !byte 0                                                           ; 3245: 00          .   :3114[1]
monkey_transform_out_animation
    !byte spriteid_monkey4,                0,                0        ; 3246: 51 00 00    Q.. :3115[1]
    !byte spriteid_monkey4,                0,                0        ; 3249: 51 00 00    Q.. :3118[1]
    !byte spriteid_monkey_transform1,                          0      ; 324c: 44 00       D.  :311b[1]
    !byte                          0                                  ; 324e: 00          .   :311d[1]
    !byte spriteid_monkey_transform1,                          0      ; 324f: 44 00       D.  :311e[1]
    !byte                          0                                  ; 3251: 00          .   :3120[1]
    !byte spriteid_monkey_transform2,                          0      ; 3252: 45 00       E.  :3121[1]
    !byte                          0                                  ; 3254: 00          .   :3123[1]
    !byte spriteid_monkey_transform2,                          0      ; 3255: 45 00       E.  :3124[1]
    !byte                          0                                  ; 3257: 00          .   :3126[1]
    !byte 0                                                           ; 3258: 00          .   :3127[1]
monkey_walk_cycle_animation
    !byte spriteid_monkey1,                4,                0        ; 3259: 4e 04 00    N.. :3128[1]
    !byte spriteid_monkey2,                4,                0        ; 325c: 4f 04 00    O.. :312b[1]
    !byte spriteid_monkey3,                4,                0        ; 325f: 50 04 00    P.. :312e[1]
    !byte spriteid_monkey4,                4,                0        ; 3262: 51 04 00    Q.. :3131[1]
    !byte                0                                            ; 3265: 00          .   :3134[1]
monkey_change_direction_animation
    !byte spriteid_monkey4,                0,                0        ; 3266: 51 00 00    Q.. :3135[1]
monkey_change_direction_animation_last_step
    !byte spriteid_monkey4,                2,                0        ; 3269: 51 02 00    Q.. :3138[1]
    !byte                0                                            ; 326c: 00          .   :313b[1]
monkey_animation6
    !byte spriteid_monkey5,                4,                0        ; 326d: 52 04 00    R.. :313c[1]
    !byte                0                                            ; 3270: 00          .   :313f[1]
monkey_standing_still_animation
    !byte spriteid_monkey5,                0,                0        ; 3271: 52 00 00    R.. :3140[1]
    !byte                0                                            ; 3274: 00          .   :3143[1]
monkey_climb_idle_animation
    !byte spriteid_monkey_climb1,                      0              ; 3275: 53 00       S.  :3144[1]
    !byte                      0,                      0              ; 3277: 00 00       ..  :3146[1]
monkey_climb_down_animation
    !byte spriteid_monkey_climb1,                      0              ; 3279: 53 00       S.  :3148[1]
    !byte                      6,                      0              ; 327b: 06 00       ..  :314a[1]
monkey_animation10
    !byte spriteid_monkey_climb1,                      0              ; 327d: 53 00       S.  :314c[1]
    !byte                    $fc,                      0              ; 327f: fc 00       ..  :314e[1]
monkey_climb_animation
    !byte spriteid_monkey_climb2,                      0              ; 3281: 54 00       T.  :3150[1]
    !byte                    $fc, spriteid_monkey_climb1              ; 3283: fc 53       .S  :3152[1]
    !byte                      0,                    $fc              ; 3285: 00 fc       ..  :3154[1]
    !byte                      0                                      ; 3287: 00          .   :3156[1]
monkey_animation12
    !byte spriteid_monkey4,                7,                0        ; 3288: 51 07 00    Q.. :3157[1]
    !byte spriteid_monkey4,                7,                1        ; 328b: 51 07 01    Q.. :315a[1]
    !byte spriteid_monkey4,                6,                1        ; 328e: 51 06 01    Q.. :315d[1]
    !byte spriteid_monkey4,                6,                2        ; 3291: 51 06 02    Q.. :3160[1]
    !byte spriteid_monkey4,                4,                2        ; 3294: 51 04 02    Q.. :3163[1]
    !byte spriteid_monkey4,                4,                3        ; 3297: 51 04 03    Q.. :3166[1]
    !byte spriteid_monkey4,                3,                4        ; 329a: 51 03 04    Q.. :3169[1]
    !byte spriteid_monkey4,                2,                4        ; 329d: 51 02 04    Q.. :316c[1]
    !byte spriteid_monkey4,                2,                4        ; 32a0: 51 02 04    Q.. :316f[1]
    !byte spriteid_monkey4,                1,                5        ; 32a3: 51 01 05    Q.. :3172[1]
    !byte spriteid_monkey4,                1,                6        ; 32a6: 51 01 06    Q.. :3175[1]
    !byte                0                                            ; 32a9: 00          .   :3178[1]
monkey_standing_fall_animation
    !byte spriteid_monkey4,                0,              $fc        ; 32aa: 51 00 fc    Q.. :3179[1]
    !byte spriteid_monkey4,                0,              $fd        ; 32ad: 51 00 fd    Q.. :317c[1]
    !byte spriteid_monkey4,                0,              $fe        ; 32b0: 51 00 fe    Q.. :317f[1]
    !byte spriteid_monkey4,                0,              $ff        ; 32b3: 51 00 ff    Q.. :3182[1]
    !byte                0                                            ; 32b6: 00          .   :3185[1]
monkey_jump_animation
    !byte spriteid_monkey4,                6,              $fc        ; 32b7: 51 06 fc    Q.. :3186[1]
    !byte spriteid_monkey4,                6,              $fe        ; 32ba: 51 06 fe    Q.. :3189[1]
    !byte spriteid_monkey4,                5,              $fe        ; 32bd: 51 05 fe    Q.. :318c[1]
    !byte spriteid_monkey4,                5,              $ff        ; 32c0: 51 05 ff    Q.. :318f[1]
    !byte spriteid_monkey4,                4,                0        ; 32c3: 51 04 00    Q.. :3192[1]
    !byte                0                                            ; 32c6: 00          .   :3195[1]
monkey_animation15
    !byte spriteid_monkey4,                4,                1        ; 32c7: 51 04 01    Q.. :3196[1]
    !byte spriteid_monkey4,                3,                2        ; 32ca: 51 03 02    Q.. :3199[1]
    !byte spriteid_monkey4,                3,                3        ; 32cd: 51 03 03    Q.. :319c[1]
    !byte spriteid_monkey4,                2,                4        ; 32d0: 51 02 04    Q.. :319f[1]
    !byte spriteid_monkey4,                2,                5        ; 32d3: 51 02 05    Q.. :31a2[1]
    !byte spriteid_monkey4,                1,                6        ; 32d6: 51 01 06    Q.. :31a5[1]
    !byte                0                                            ; 32d9: 00          .   :31a8[1]
monkey_animation16
    !byte spriteid_monkey4,                4,                2        ; 32da: 51 04 02    Q.. :31a9[1]
    !byte spriteid_monkey4,                3,                3        ; 32dd: 51 03 03    Q.. :31ac[1]
    !byte spriteid_monkey4,                2,                4        ; 32e0: 51 02 04    Q.. :31af[1]
    !byte spriteid_monkey4,                1,                5        ; 32e3: 51 01 05    Q.. :31b2[1]
    !byte                0                                            ; 32e6: 00          .   :31b5[1]
monkey_animation17
    !byte spriteid_monkey4,              $fc,                2        ; 32e7: 51 fc 02    Q.. :31b6[1]
    !byte spriteid_monkey4,              $fd,                3        ; 32ea: 51 fd 03    Q.. :31b9[1]
    !byte spriteid_monkey4,              $fe,                4        ; 32ed: 51 fe 04    Q.. :31bc[1]
    !byte spriteid_monkey4,              $ff,                5        ; 32f0: 51 ff 05    Q.. :31bf[1]
    !byte                0                                            ; 32f3: 00          .   :31c2[1]
monkey_animation18
    !byte spriteid_monkey4,                0,                1        ; 32f4: 51 00 01    Q.. :31c3[1]
    !byte spriteid_monkey4,                0,                2        ; 32f7: 51 00 02    Q.. :31c6[1]
    !byte spriteid_monkey4,                0,                3        ; 32fa: 51 00 03    Q.. :31c9[1]
    !byte spriteid_monkey4,                0,                4        ; 32fd: 51 00 04    Q.. :31cc[1]
    !byte spriteid_monkey4,                0,                5        ; 3300: 51 00 05    Q.. :31cf[1]
    !byte                0                                            ; 3303: 00          .   :31d2[1]
monkey_fall_animation
    !byte spriteid_monkey4,                0,                7        ; 3304: 51 00 07    Q.. :31d3[1]
    !byte                0                                            ; 3307: 00          .   :31d6[1]
inhibit_monkey_climb_flag
    !byte 0                                                           ; 3308: 00          .   :31d7[1]

update_monkey
    lda #monkey_transform_out_animation - monkey_base_animation       ; 3309: a9 16       ..  :31d8[1]
    sta transform_out_animation                                       ; 330b: 8d ed 22    .." :31da[1]
    ldx #<monkey_base_animation                                       ; 330e: a2 ff       ..  :31dd[1]
    ldy #>monkey_base_animation                                       ; 3310: a0 30       .0  :31df[1]
    lda #3                                                            ; 3312: a9 03       ..  :31e1[1]
    jsr set_base_animation_address_and_handle_transform_in_out        ; 3314: 20 ee 22     ." :31e3[1]
    bne monkey_got_index_in_animation_local1                          ; 3317: d0 0c       ..  :31e6[1]
    cpy #monkey_change_direction_animation_last_step - monkey_base_animation; 3319: c0 39       .9  :31e8[1]
    bne monkey_not_changing_direction                                 ; 331b: d0 0b       ..  :31ea[1]
; toggle player direction
    lda object_direction                                              ; 331d: ad be 09    ... :31ec[1]
    eor #$fe                                                          ; 3320: 49 fe       I.  :31ef[1]
    sta object_direction                                              ; 3322: 8d be 09    ... :31f1[1]
monkey_got_index_in_animation_local1
    jmp monkey_got_index_in_animation                                 ; 3325: 4c 31 33    L13 :31f4[1]

monkey_not_changing_direction
    jsr update_player_hitting_floor_or_pushed                         ; 3328: 20 c4 23     .# :31f7[1]
    beq monkey_not_falling                                            ; 332b: f0 03       ..  :31fa[1]
    jmp monkey_falling                                                ; 332d: 4c b1 32    L.2 :31fc[1]

monkey_not_falling
    lda current_player_animation                                      ; 3330: ad df 09    ... :31ff[1]
    cmp #monkey_climb_animation - monkey_base_animation               ; 3333: c9 51       .Q  :3202[1]
    beq update_monkey_climbing                                        ; 3335: f0 1c       ..  :3204[1]
    cmp #monkey_climb_down_animation - monkey_base_animation          ; 3337: c9 49       .I  :3206[1]
    beq update_monkey_climbing                                        ; 3339: f0 18       ..  :3208[1]
    cmp #monkey_climb_idle_animation - monkey_base_animation          ; 333b: c9 45       .E  :320a[1]
    beq update_monkey_climbing                                        ; 333d: f0 14       ..  :320c[1]
    lda jump_requested                                                ; 333f: ad c7 3a    ..: :320e[1]
    beq monkey_update_standing_fall                                   ; 3342: f0 63       .c  :3211[1]
    jsr can_monkey_climb                                              ; 3344: 20 6e 33     n3 :3213[1]
    beq monkey_update_standing_fall                                   ; 3347: f0 5e       .^  :3216[1]
    lda #monkey_climb_animation - monkey_base_animation               ; 3349: a9 51       .Q  :3218[1]
    sta current_player_animation                                      ; 334b: 8d df 09    ... :321a[1]
    ldy #monkey_animation10 - monkey_base_animation                   ; 334e: a0 4d       .M  :321d[1]
    jmp monkey_got_index_in_animation                                 ; 3350: 4c 31 33    L13 :321f[1]

update_monkey_climbing
    ldx #monkey_fall_animation - monkey_base_animation                ; 3353: a2 d4       ..  :3222[1]
    jsr can_monkey_climb                                              ; 3355: 20 6e 33     n3 :3224[1]
    beq monkey_start_falling                                          ; 3358: f0 36       .6  :3227[1]
    lda jump_requested                                                ; 335a: ad c7 3a    ..: :3229[1]
    beq monkey_not_jumping                                            ; 335d: f0 1e       ..  :322c[1]
    dec temp_top_offset                                               ; 335f: ce 50 25    .P% :322e[1]
    lda #0                                                            ; 3362: a9 00       ..  :3231[1]
    jsr get_solid_rock_collision_for_object_a                         ; 3364: 20 94 28     .( :3233[1]
    bne monkey_set_climb_idle                                         ; 3367: d0 0f       ..  :3236[1]
    ldx #monkey_climb_animation - monkey_base_animation               ; 3369: a2 51       .Q  :3238[1]
    lda inhibit_monkey_climb_flag                                     ; 336b: ad d7 31    ..1 :323a[1]
    bne monkey_set_climb_idle                                         ; 336e: d0 08       ..  :323d[1]
    lda move_left_requested                                           ; 3370: ad ca 3a    ..: :323f[1]
    ora move_right_requested                                          ; 3373: 0d cb 3a    ..: :3242[1]
    beq monkey_set_animation_x                                        ; 3376: f0 22       ."  :3245[1]
monkey_set_climb_idle
    ldx #monkey_climb_idle_animation - monkey_base_animation          ; 3378: a2 45       .E  :3247[1]
    jmp monkey_set_animation_x                                        ; 337a: 4c 69 32    Li2 :3249[1]

monkey_not_jumping
    ldx #monkey_animation12 - monkey_base_animation                   ; 337d: a2 58       .X  :324c[1]
    lda player_move_direction_requested                               ; 337f: ad c9 3a    ..: :324e[1]
    cmp object_direction                                              ; 3382: cd be 09    ... :3251[1]
    beq monkey_start_falling                                          ; 3385: f0 09       ..  :3254[1]
    ldx #monkey_climb_down_animation - monkey_base_animation          ; 3387: a2 49       .I  :3256[1]
    lda object_has_hit_floor_flag                                     ; 3389: ad 8f 28    ..( :3258[1]
    beq monkey_set_animation_x                                        ; 338c: f0 0c       ..  :325b[1]
    bne monkey_update_standing_fall                                   ; 338e: d0 17       ..  :325d[1]   ; ALWAYS branch

monkey_start_falling
    lda #monkey_fall_animation - monkey_base_animation                ; 3390: a9 d4       ..  :325f[1]
    sta current_player_animation                                      ; 3392: 8d df 09    ... :3261[1]
    txa                                                               ; 3395: 8a          .   :3264[1]
    tay                                                               ; 3396: a8          .   :3265[1]
    jmp monkey_update_standing_fall                                   ; 3397: 4c 76 32    Lv2 :3266[1]

monkey_set_animation_x
    cpx current_player_animation                                      ; 339a: ec df 09    ... :3269[1]
    beq monkey_got_index_in_animation_local2                          ; 339d: f0 05       ..  :326c[1]
    txa                                                               ; 339f: 8a          .   :326e[1]
    tay                                                               ; 33a0: a8          .   :326f[1]
    sty current_player_animation                                      ; 33a1: 8c df 09    ... :3270[1]
monkey_got_index_in_animation_local2
    jmp monkey_got_index_in_animation                                 ; 33a4: 4c 31 33    L13 :3273[1]

monkey_update_standing_fall
    lda current_player_animation                                      ; 33a7: ad df 09    ... :3276[1]
    cmp #monkey_standing_fall_animation - monkey_base_animation       ; 33aa: c9 7a       .z  :3279[1]
    bne monkey_update_jump                                            ; 33ac: d0 10       ..  :327b[1]
    dec temp_top_offset                                               ; 33ae: ce 50 25    .P% :327d[1]
    lda #0                                                            ; 33b1: a9 00       ..  :3280[1]
    jsr get_solid_rock_collision_for_object_a                         ; 33b3: 20 94 28     .( :3282[1]
    bne monkey_check_if_hit_floor                                     ; 33b6: d0 25       .%  :3285[1]
    cpy #monkey_standing_fall_animation - monkey_base_animation       ; 33b8: c0 7a       .z  :3287[1]
    beq monkey_check_if_hit_floor                                     ; 33ba: f0 21       .!  :3289[1]
    bne monkey_got_index_in_animation_local2                          ; 33bc: d0 e6       ..  :328b[1]   ; ALWAYS branch

monkey_update_jump
    lda current_player_animation                                      ; 33be: ad df 09    ... :328d[1]
    cmp #monkey_jump_animation - monkey_base_animation                ; 33c1: c9 87       ..  :3290[1]
    bne monkey_check_if_hit_floor                                     ; 33c3: d0 18       ..  :3292[1]
    dec temp_top_offset                                               ; 33c5: ce 50 25    .P% :3294[1]
    lda #0                                                            ; 33c8: a9 00       ..  :3297[1]
    jsr get_solid_rock_collision_for_object_a                         ; 33ca: 20 94 28     .( :3299[1]
    bne monkey_fall                                                   ; 33cd: d0 07       ..  :329c[1]
    cpy #monkey_jump_animation - monkey_base_animation                ; 33cf: c0 87       ..  :329e[1]
    beq monkey_fall                                                   ; 33d1: f0 03       ..  :32a0[1]
    jmp monkey_got_index_in_animation                                 ; 33d3: 4c 31 33    L13 :32a2[1]

monkey_fall
    lda #monkey_fall_animation - monkey_base_animation                ; 33d6: a9 d4       ..  :32a5[1]
    sta current_player_animation                                      ; 33d8: 8d df 09    ... :32a7[1]
    ldy #monkey_animation15 - monkey_base_animation                   ; 33db: a0 97       ..  :32aa[1]
monkey_check_if_hit_floor
    lda object_has_hit_floor_flag                                     ; 33dd: ad 8f 28    ..( :32ac[1]
    bne monkey_check_for_standing_fall                                ; 33e0: d0 17       ..  :32af[1]
monkey_falling
    lda #monkey_fall_animation - monkey_base_animation                ; 33e2: a9 d4       ..  :32b1[1]
    cmp current_player_animation                                      ; 33e4: cd df 09    ... :32b3[1]
    beq monkey_got_index_in_animation_local2                          ; 33e7: f0 bb       ..  :32b6[1]
    ldx current_player_animation                                      ; 33e9: ae df 09    ... :32b8[1]
    sta current_player_animation                                      ; 33ec: 8d df 09    ... :32bb[1]
    ldy #monkey_animation18 - monkey_base_animation                   ; 33ef: a0 c4       ..  :32be[1]
    cpx #monkey_climb_down_animation - monkey_base_animation          ; 33f1: e0 49       .I  :32c0[1]
    bne monkey_got_index_in_animation_local2                          ; 33f3: d0 af       ..  :32c2[1]
    tay                                                               ; 33f5: a8          .   :32c4[1]
    jmp monkey_got_index_in_animation                                 ; 33f6: 4c 31 33    L13 :32c5[1]

monkey_check_for_standing_fall
    ldx player_move_direction_requested                               ; 33f9: ae c9 3a    ..: :32c8[1]
    bne monkey_check_change_direction                                 ; 33fc: d0 11       ..  :32cb[1]
    lda jump_requested                                                ; 33fe: ad c7 3a    ..: :32cd[1]
    beq monkey_set_standing_still                                     ; 3401: f0 2f       ./  :32d0[1]
    lda current_player_animation                                      ; 3403: ad df 09    ... :32d2[1]
    cmp #monkey_fall_animation - monkey_base_animation                ; 3406: c9 d4       ..  :32d5[1]
    beq monkey_set_standing_still                                     ; 3408: f0 28       .(  :32d7[1]
    lda #monkey_standing_fall_animation - monkey_base_animation       ; 340a: a9 7a       .z  :32d9[1]
    jmp monkey_set_animation                                          ; 340c: 4c f5 32    L.2 :32db[1]

monkey_check_change_direction
    lda #monkey_change_direction_animation - monkey_base_animation    ; 340f: a9 36       .6  :32de[1]
    cpx object_direction                                              ; 3411: ec be 09    ... :32e0[1]
    bne monkey_set_animation                                          ; 3414: d0 10       ..  :32e3[1]
    lda #monkey_walk_cycle_animation - monkey_base_animation          ; 3416: a9 29       .)  :32e5[1]
    ldx jump_requested                                                ; 3418: ae c7 3a    ..: :32e7[1]
    beq monkey_set_animation                                          ; 341b: f0 09       ..  :32ea[1]
    ldx current_player_animation                                      ; 341d: ae df 09    ... :32ec[1]
    cpx #monkey_fall_animation - monkey_base_animation                ; 3420: e0 d4       ..  :32ef[1]
    beq monkey_set_animation                                          ; 3422: f0 02       ..  :32f1[1]
    lda #monkey_jump_animation - monkey_base_animation                ; 3424: a9 87       ..  :32f3[1]
monkey_set_animation
    cmp current_player_animation                                      ; 3426: cd df 09    ... :32f5[1]
    beq monkey_update_falling_off_edge                                ; 3429: f0 1c       ..  :32f8[1]
    sta current_player_animation                                      ; 342b: 8d df 09    ... :32fa[1]
    tay                                                               ; 342e: a8          .   :32fd[1]
    jmp monkey_update_falling_off_edge                                ; 342f: 4c 16 33    L.3 :32fe[1]

monkey_set_standing_still
    lda current_player_animation                                      ; 3432: ad df 09    ... :3301[1]
    ldy #monkey_standing_still_animation - monkey_base_animation      ; 3435: a0 41       .A  :3304[1]
    sty current_player_animation                                      ; 3437: 8c df 09    ... :3306[1]
    cmp #monkey_walk_cycle_animation - monkey_base_animation          ; 343a: c9 29       .)  :3309[1]
    beq monkey_was_walking_or_changing_direction                      ; 343c: f0 04       ..  :330b[1]
    cmp #monkey_change_direction_animation - monkey_base_animation    ; 343e: c9 36       .6  :330d[1]
    bne monkey_update_falling_off_edge                                ; 3440: d0 05       ..  :330f[1]
monkey_was_walking_or_changing_direction
    ldy #monkey_animation6 - monkey_base_animation                    ; 3442: a0 3d       .=  :3311[1]
    jmp monkey_update_falling_off_edge                                ; 3444: 4c 16 33    L.3 :3313[1]

monkey_update_falling_off_edge
    ldx #0                                                            ; 3447: a2 00       ..  :3316[1]
    lda player_move_direction_requested                               ; 3449: ad c9 3a    ..: :3318[1]
    beq skip5                                                         ; 344c: f0 01       ..  :331b[1]
    inx                                                               ; 344e: e8          .   :331d[1]
skip5
    lda object_just_fallen_off_edge_direction,x                       ; 344f: bd 90 28    ..( :331e[1]
    beq monkey_got_index_in_animation                                 ; 3452: f0 0e       ..  :3321[1]
    ldy #monkey_fall_animation - monkey_base_animation                ; 3454: a0 d4       ..  :3323[1]
    sty current_player_animation                                      ; 3456: 8c df 09    ... :3325[1]
    ldy #monkey_animation16 - monkey_base_animation                   ; 3459: a0 aa       ..  :3328[1]
    cmp object_direction                                              ; 345b: cd be 09    ... :332a[1]
    beq monkey_got_index_in_animation                                 ; 345e: f0 02       ..  :332d[1]
    ldy #monkey_animation17 - monkey_base_animation                   ; 3460: a0 b7       ..  :332f[1]
monkey_got_index_in_animation
    lda #0                                                            ; 3462: a9 00       ..  :3331[1]
    sta inhibit_monkey_climb_flag                                     ; 3464: 8d d7 31    ..1 :3333[1]
    sty object_current_index_in_animation                             ; 3467: 8c d4 09    ... :3336[1]
    tya                                                               ; 346a: 98          .   :3339[1]
    ldx #<monkey_base_animation                                       ; 346b: a2 ff       ..  :333a[1]
    ldy #>monkey_base_animation                                       ; 346d: a0 30       .0  :333c[1]
    jsr set_player_spriteid_and_offset_from_animation_table           ; 346f: 20 00 22     ." :333e[1]
    lda #objectid_player                                              ; 3472: a9 00       ..  :3341[1]
    jsr update_object_a_solid_rock_collision                          ; 3474: 20 f5 25     .% :3343[1]
; start updating the tail
    lda #<monkey_tail_spriteids                                       ; 3477: a9 dd       ..  :3346[1]
    sta address1_low                                                  ; 3479: 85 70       .p  :3348[1]
    lda #>monkey_tail_spriteids                                       ; 347b: a9 30       .0  :334a[1]
    sta address1_high                                                 ; 347d: 85 71       .q  :334c[1]
; check for a tail. If the player is transitioning, it may not have a tail.
    lda #$ff                                                          ; 347f: a9 ff       ..  :334e[1]
    ldx current_player_animation                                      ; 3481: ae df 09    ... :3350[1]
    cpx #0                                                            ; 3484: e0 00       ..  :3353[1]
    beq monkey_checking_for_tail                                      ; 3486: f0 04       ..  :3355[1]
    cpx #monkey_transform_out_animation - monkey_base_animation       ; 3488: e0 16       ..  :3357[1]
    bne monkey_update_tail                                            ; 348a: d0 0b       ..  :3359[1]
monkey_checking_for_tail
    lda #0                                                            ; 348c: a9 00       ..  :335b[1]
    ldx object_spriteid                                               ; 348e: ae a8 09    ... :335d[1]
    cpx #spriteid_monkey4                                             ; 3491: e0 51       .Q  :3360[1]
    bne monkey_update_tail                                            ; 3493: d0 02       ..  :3362[1]
; top bit set with lower 7 bits = 7, so setting offset 7 into monkey_sprite_list
    lda #$87                                                          ; 3495: a9 87       ..  :3364[1]
monkey_update_tail
    ldx #<monkey_sprite_list                                          ; 3497: a2 e6       ..  :3366[1]
    ldy #>monkey_sprite_list                                          ; 3499: a0 30       .0  :3368[1]
    jsr update_player_accessory_object_animation                      ; 349b: 20 48 22     H" :336a[1]
    rts                                                               ; 349e: 60          `   :336d[1]

; *************************************************************************************
; 
; Can monkey climb?
; 
; Checks the collision map for
; 
; On Exit:
;           A and flags: $ff if monkey can climb, else $00
;        cell_x, cell_y: cell position to climb at (only valid if monkey can climb,
; A=$ff)
; 
; *************************************************************************************
can_monkey_climb
    txa                                                               ; 349f: 8a          .   :336e[1]   ; remember X,Y
    pha                                                               ; 34a0: 48          H   :336f[1]
    tya                                                               ; 34a1: 98          .   :3370[1]
    pha                                                               ; 34a2: 48          H   :3371[1]
; get top and bottom pixel position of player
    ldx #0                                                            ; 34a3: a2 00       ..  :3372[1]
    jsr find_top_and_bottom_of_object                                 ; 34a5: 20 d2 24     .$ :3374[1]
; find centre cell (vertically) of object from pixel position: (top+bottom) / 16, i.e.
; (average)/8
    lda object_top_low                                                ; 34a8: a5 74       .t  :3377[1]
    clc                                                               ; 34aa: 18          .   :3379[1]
    adc object_bottom_low                                             ; 34ab: 65 76       ev  :337a[1]
    sta cell_y                                                        ; 34ad: 85 71       .q  :337c[1]
    lda object_top_high                                               ; 34af: a5 75       .u  :337e[1]
    adc object_bottom_high                                            ; 34b1: 65 77       ew  :3380[1]
    ror                                                               ; 34b3: 6a          j   :3382[1]
    ror cell_y                                                        ; 34b4: 66 71       fq  :3383[1]
    lsr                                                               ; 34b6: 4a          J   :3385[1]
    ror cell_y                                                        ; 34b7: 66 71       fq  :3386[1]
    lsr                                                               ; 34b9: 4a          J   :3388[1]
    ror cell_y                                                        ; 34ba: 66 71       fq  :3389[1]
    lsr                                                               ; 34bc: 4a          J   :338b[1]
    ror cell_y                                                        ; 34bd: 66 71       fq  :338c[1]
    ldy cell_y                                                        ; 34bf: a4 71       .q  :338e[1]
; read $ff from collision map if out of game area
    lda #$ff                                                          ; 34c1: a9 ff       ..  :3390[1]
    sta default_collision_map_option                                  ; 34c3: 85 44       .D  :3392[1]
; 5 is the x offset to get to the rope
    lda #5                                                            ; 34c5: a9 05       ..  :3394[1]
    sta rope_x_offset                                                 ; 34c7: 8d 03 34    ..4 :3396[1]
can_monkey_climb_loop
    lda object_direction                                              ; 34ca: ad be 09    ... :3399[1]
    bmi adjust_position_because_looking_left                          ; 34cd: 30 17       0.  :339c[1]
    lda object_x_low                                                  ; 34cf: ad 50 09    .P. :339e[1]
    clc                                                               ; 34d2: 18          .   :33a1[1]
    adc rope_x_offset                                                 ; 34d3: 6d 03 34    m.4 :33a2[1]
    sta cell_x                                                        ; 34d6: 85 70       .p  :33a5[1]
    and #$f8                                                          ; 34d8: 29 f8       ).  :33a7[1]
    sta object_rope_low                                               ; 34da: 85 72       .r  :33a9[1]
    lda object_x_high                                                 ; 34dc: ad 66 09    .f. :33ab[1]
    adc #0                                                            ; 34df: 69 00       i.  :33ae[1]
    sta object_rope_high                                              ; 34e1: 85 73       .s  :33b0[1]
    jmp divide_by_eight_to_get_cells                                  ; 34e3: 4c cb 33    L.3 :33b2[1]

adjust_position_because_looking_left
    lda object_x_low                                                  ; 34e6: ad 50 09    .P. :33b5[1]
    sec                                                               ; 34e9: 38          8   :33b8[1]
    sbc rope_x_offset                                                 ; 34ea: ed 03 34    ..4 :33b9[1]
    sta cell_x                                                        ; 34ed: 85 70       .p  :33bc[1]
    and #$f8                                                          ; 34ef: 29 f8       ).  :33be[1]
    ora #7                                                            ; 34f1: 09 07       ..  :33c0[1]
    sta object_rope_low                                               ; 34f3: 85 72       .r  :33c2[1]
    lda object_x_high                                                 ; 34f5: ad 66 09    .f. :33c4[1]
    sbc #0                                                            ; 34f8: e9 00       ..  :33c7[1]
    sta object_rope_high                                              ; 34fa: 85 73       .s  :33c9[1]
divide_by_eight_to_get_cells
    lsr                                                               ; 34fc: 4a          J   :33cb[1]
    ror cell_x                                                        ; 34fd: 66 70       fp  :33cc[1]
    lsr                                                               ; 34ff: 4a          J   :33ce[1]
    ror cell_x                                                        ; 3500: 66 70       fp  :33cf[1]
    lsr                                                               ; 3502: 4a          J   :33d1[1]
    ror cell_x                                                        ; 3503: 66 70       fp  :33d2[1]
    ldx cell_x                                                        ; 3505: a6 70       .p  :33d4[1]
    jsr read_collision_map_value_for_xy                               ; 3507: 20 fa 1e     .. :33d6[1]
    cmp #collision_map_rope                                           ; 350a: c9 02       ..  :33d9[1]
    beq monkey_can_climb                                              ; 350c: f0 0d       ..  :33db[1]
    lda #2                                                            ; 350e: a9 02       ..  :33dd[1]
    cmp rope_x_offset                                                 ; 3510: cd 03 34    ..4 :33df[1]
    beq monkey_cant_climb                                             ; 3513: f0 14       ..  :33e2[1]
    sta rope_x_offset                                                 ; 3515: 8d 03 34    ..4 :33e4[1]
    jmp can_monkey_climb_loop                                         ; 3518: 4c 99 33    L.3 :33e7[1]

; set the player position to the rope position
monkey_can_climb
    lda object_rope_low                                               ; 351b: a5 72       .r  :33ea[1]
    sta object_x_low                                                  ; 351d: 8d 50 09    .P. :33ec[1]
    lda object_rope_high                                              ; 3520: a5 73       .s  :33ef[1]
    sta object_x_high                                                 ; 3522: 8d 66 09    .f. :33f1[1]
; return $ff to say we found a rope
    lda #$ff                                                          ; 3525: a9 ff       ..  :33f4[1]
    bne restore_xy_and_return_a                                       ; 3527: d0 02       ..  :33f6[1]   ; ALWAYS branch

; return $00 to say we didn't find a rope
monkey_cant_climb
    lda #0                                                            ; 3529: a9 00       ..  :33f8[1]
restore_xy_and_return_a
    sta cell_x                                                        ; 352b: 85 70       .p  :33fa[1]
    pla                                                               ; 352d: 68          h   :33fc[1]   ; recall X,Y
    tay                                                               ; 352e: a8          .   :33fd[1]
    pla                                                               ; 352f: 68          h   :33fe[1]
    tax                                                               ; 3530: aa          .   :33ff[1]
    lda cell_x                                                        ; 3531: a5 70       .p  :3400[1]
    rts                                                               ; 3533: 60          `   :3402[1]

rope_x_offset
    !byte 0                                                           ; 3534: 00          .   :3403[1]

; *************************************************************************************
toggle_load_save_dialog
    lda #$12                                                          ; 3535: a9 12       ..  :3404[1]
    sta current_text_width                                            ; 3537: 8d 09 04    ... :3406[1]
    lda which_dialog_is_active                                        ; 353a: a5 04       ..  :3409[1]
    bne remove_dialog_local1                                          ; 353c: d0 1b       ..  :340b[1]
show_load_save_dialog
    jsr show_dialog_box                                               ; 353e: 20 0a 04     .. :340d[1]
    lda #1                                                            ; 3541: a9 01       ..  :3410[1]
    sta which_dialog_is_active                                        ; 3543: 85 04       ..  :3412[1]
    ldx #<press_s_to_save_encrypted_string                            ; 3545: a2 2b       .+  :3414[1]
    ldy #>press_s_to_save_encrypted_string                            ; 3547: a0 34       .4  :3416[1]
    jsr print_encrypted_string_at_yx                                  ; 3549: 20 1c 38     .8 :3418[1]
    jsr print_2xlf_cr                                                 ; 354c: 20 50 38     P8 :341b[1]
    ldx #<press_l_to_load_encrypted_string                            ; 354f: a2 3b       .;  :341e[1]
    ldy #>press_l_to_load_encrypted_string                            ; 3551: a0 34       .4  :3420[1]
    jsr print_encrypted_string_at_yx                                  ; 3553: 20 1c 38     .8 :3422[1]
    jmp flush_input_buffers_and_zero_characters_entered               ; 3556: 4c 72 38    Lr8 :3425[1]

remove_dialog_local1
    jmp remove_dialog                                                 ; 3559: 4c 53 04    LS. :3428[1]

; 'Press S to save[0d]' EOR-encrypted with $cb
press_s_to_save_encrypted_string
    !byte $9b, $b9, $ae, $b8, $b8, $eb, $98, $eb, $bf, $a4, $eb, $b8  ; 355c: 9b b9 ae... ... :342b[1]
    !byte $aa, $bd, $ae, $c6                                          ; 3568: aa bd ae... ... :3437[1]
; 'Press L to load[0d]' EOR-encrypted with $cb
press_l_to_load_encrypted_string
    !byte $9b, $b9, $ae, $b8, $b8, $eb, $87, $eb, $bf, $a4, $eb, $a7  ; 356c: 9b b9 ae... ... :343b[1]
    !byte $a4, $aa, $af, $c6                                          ; 3578: a4 aa af... ... :3447[1]

; *************************************************************************************
update_disc_menu
    ldy new_menu_index                                                ; 357c: a4 29       .)  :344b[1]
    lda desired_menu_slots,y                                          ; 357e: b9 5c 29    .\) :344d[1]
    cmp #spriteid_icodata_disc                                        ; 3581: c9 03       ..  :3450[1]
    bne return23                                                      ; 3583: d0 42       .B  :3452[1]
    lda which_dialog_is_active                                        ; 3585: a5 04       ..  :3454[1]
    beq return23                                                      ; 3587: f0 3e       .>  :3456[1]
    cmp #1                                                            ; 3589: c9 01       ..  :3458[1]
    beq load_or_save                                                  ; 358b: f0 0e       ..  :345a[1]
    cmp #2                                                            ; 358d: c9 02       ..  :345c[1]
    beq get_filename_and_print_drive_number_prompt                    ; 358f: f0 47       .G  :345e[1]
    cmp #3                                                            ; 3591: c9 03       ..  :3460[1]
    beq test_for_drive_number_key_press_local                         ; 3593: f0 03       ..  :3462[1]
    jmp if_return_pressed_do_load_or_save                             ; 3595: 4c 57 35    LW5 :3464[1]

test_for_drive_number_key_press_local
    jmp test_for_drive_number_key_press                               ; 3598: 4c 01 35    L.5 :3467[1]

load_or_save
    lda #osfile_save                                                  ; 359b: a9 00       ..  :346a[1]
    sta osfile_action_load_or_save                                    ; 359d: 8d 97 34    ..4 :346c[1]
    jsr inkey_0                                                       ; 35a0: 20 7c 38     |8 :346f[1]
    and #caps_mask                                                    ; 35a3: 29 df       ).  :3472[1]
    cmp #'S'                                                          ; 35a5: c9 53       .S  :3474[1]
    beq ask_for_filename                                              ; 35a7: f0 07       ..  :3476[1]
    cmp #'L'                                                          ; 35a9: c9 4c       .L  :3478[1]
    bne return23                                                      ; 35ab: d0 1a       ..  :347a[1]
    dec osfile_action_load_or_save                                    ; 35ad: ce 97 34    ..4 :347c[1]
ask_for_filename
    jsr show_dialog_box                                               ; 35b0: 20 0a 04     .. :347f[1]
    lda #2                                                            ; 35b3: a9 02       ..  :3482[1]
    sta which_dialog_is_active                                        ; 35b5: 85 04       ..  :3484[1]
    ldx #<enter_filename_encrypted_string                             ; 35b7: a2 98       ..  :3486[1]
    ldy #>enter_filename_encrypted_string                             ; 35b9: a0 34       .4  :3488[1]
    jsr print_encrypted_string_at_yx                                  ; 35bb: 20 1c 38     .8 :348a[1]
    jsr print_2xlf_cr                                                 ; 35be: 20 50 38     P8 :348d[1]
    jsr turn_cursor_on                                                ; 35c1: 20 5d 38     ]8 :3490[1]
    jmp flush_input_buffers_and_zero_characters_entered               ; 35c4: 4c 72 38    Lr8 :3493[1]

return23
    rts                                                               ; 35c7: 60          `   :3496[1]

osfile_action_load_or_save
    !byte 0                                                           ; 35c8: 00          .   :3497[1]
; 'Enter filename[0d]' EOR-encrypted with $cb
enter_filename_encrypted_string
    !byte $8e, $a5, $bf, $ae, $b9, $eb, $ad, $a2, $a7, $ae, $a5, $aa  ; 35c9: 8e a5 bf... ... :3498[1]
    !byte $a6, $ae, $c6                                               ; 35d5: a6 ae c6    ... :34a4[1]

get_filename_and_print_drive_number_prompt
    lda #max_filename_len                                             ; 35d8: a9 07       ..  :34a7[1]
    jsr string_input_character                                        ; 35da: 20 fc 36     .6 :34a9[1]
    ldy characters_entered                                            ; 35dd: a4 05       ..  :34ac[1]
    beq return23                                                      ; 35df: f0 e6       ..  :34ae[1]
    ldy #6                                                            ; 35e1: a0 06       ..  :34b0[1]
save_leafname_loop
    lda string_input_buffer,y                                         ; 35e3: b9 90 0a    ... :34b2[1]
    sta save_leaf_filename,y                                          ; 35e6: 99 db 34    ..4 :34b5[1]
    dey                                                               ; 35e9: 88          .   :34b8[1]
    bpl save_leafname_loop                                            ; 35ea: 10 f7       ..  :34b9[1]
    jsr show_dialog_box                                               ; 35ec: 20 0a 04     .. :34bb[1]
    lda #3                                                            ; 35ef: a9 03       ..  :34be[1]
    sta which_dialog_is_active                                        ; 35f1: 85 04       ..  :34c0[1]
    ldx #<which_drive_encrypted_string                                ; 35f3: a2 e3       ..  :34c2[1]
    ldy #>which_drive_encrypted_string                                ; 35f5: a0 34       .4  :34c4[1]
    jsr print_encrypted_string_at_yx                                  ; 35f7: 20 1c 38     .8 :34c6[1]
    jsr print_2xlf_cr                                                 ; 35fa: 20 50 38     P8 :34c9[1]
    ldx #<press_012_or_3_encrypted_string                             ; 35fd: a2 f0       ..  :34cc[1]
    ldy #>press_012_or_3_encrypted_string                             ; 35ff: a0 34       .4  :34ce[1]
    jsr print_encrypted_string_at_yx                                  ; 3601: 20 1c 38     .8 :34d0[1]
    jmp flush_input_buffers_and_zero_characters_entered               ; 3604: 4c 72 38    Lr8 :34d3[1]

; *************************************************************************************
save_full_filename
    !text ":"                                                         ; 3607: 3a          :   :34d6[1]
save_drive_number
    !text "0.I."                                                      ; 3608: 30 2e 49... 0.I :34d7[1]
save_leaf_filename
    !text ".......", $0d                                              ; 360c: 2e 2e 2e... ... :34db[1]
; 'Which drive?[0d]' EOR-encrypted with $cb
which_drive_encrypted_string
    !byte $9c, $a3, $a2, $a8, $a3, $eb, $af, $b9, $a2, $bd, $ae, $f4  ; 3614: 9c a3 a2... ... :34e3[1]
    !byte $c6                                                         ; 3620: c6          .   :34ef[1]
; 'Press 0,1,2 or 3[0d]' EOR-encrypted with $cb
press_012_or_3_encrypted_string
    !byte $9b, $b9, $ae, $b8, $b8, $eb, $fb, $e7, $fa, $e7, $f9, $eb  ; 3621: 9b b9 ae... ... :34f0[1]
    !byte $a4, $b9, $eb, $f8, $c6                                     ; 362d: a4 b9 eb... ... :34fc[1]

test_for_drive_number_key_press
    jsr inkey_0                                                       ; 3632: 20 7c 38     |8 :3501[1]
    cmp #'4'                                                          ; 3635: c9 34       .4  :3504[1]
    bcs return24                                                      ; 3637: b0 2c       .,  :3506[1]
    cmp #'0'                                                          ; 3639: c9 30       .0  :3508[1]
    bcs drive_number_pressed                                          ; 363b: b0 0a       ..  :350a[1]
; check for shifted drive number
    cmp #'$'                                                          ; 363d: c9 24       .$  :350c[1]
    bcs return24                                                      ; 363f: b0 24       .$  :350e[1]
    cmp #'!'                                                          ; 3641: c9 21       .!  :3510[1]
    bcc return24                                                      ; 3643: 90 20       .   :3512[1]
    adc #$0f                                                          ; 3645: 69 0f       i.  :3514[1]
drive_number_pressed
    sta save_drive_number                                             ; 3647: 8d d7 34    ..4 :3516[1]
    jsr show_dialog_box                                               ; 364a: 20 0a 04     .. :3519[1]
    lda #4                                                            ; 364d: a9 04       ..  :351c[1]
    sta which_dialog_is_active                                        ; 364f: 85 04       ..  :351e[1]
    ldx #<insert_save_disk_encrypted_string                           ; 3651: a2 35       .5  :3520[1]
    ldy #>insert_save_disk_encrypted_string                           ; 3653: a0 35       .5  :3522[1]
    jsr print_encrypted_string_at_yx                                  ; 3655: 20 1c 38     .8 :3524[1]
    jsr print_2xlf_cr                                                 ; 3658: 20 50 38     P8 :3527[1]
    ldx #<and_press_return_encrypted_string                           ; 365b: a2 46       .F  :352a[1]
    ldy #>and_press_return_encrypted_string                           ; 365d: a0 35       .5  :352c[1]
    jsr print_encrypted_string_at_yx                                  ; 365f: 20 1c 38     .8 :352e[1]
    jmp flush_input_buffers_and_zero_characters_entered               ; 3662: 4c 72 38    Lr8 :3531[1]

return24
    rts                                                               ; 3665: 60          `   :3534[1]

; 'Insert save disk[0d]' EOR-encrypted with $cb
insert_save_disk_encrypted_string
    !byte $82, $a5, $b8, $ae, $b9, $bf, $eb, $b8, $aa, $bd, $ae, $eb  ; 3666: 82 a5 b8... ... :3535[1]
    !byte $af, $a2, $b8, $a0, $c6                                     ; 3672: af a2 b8... ... :3541[1]
; 'and press RETURN[0d]' EOR-encrypted with $cb
and_press_return_encrypted_string
    !byte $aa, $a5, $af, $eb, $bb, $b9, $ae, $b8, $b8, $eb, $99, $8e  ; 3677: aa a5 af... ... :3546[1]
    !byte $9f, $9e, $99, $85, $c6                                     ; 3683: 9f 9e 99... ... :3552[1]

; *************************************************************************************
if_return_pressed_do_load_or_save
    jsr inkey_0                                                       ; 3688: 20 7c 38     |8 :3557[1]
    cmp #vdu_cr                                                       ; 368b: c9 0d       ..  :355a[1]
    bne return24                                                      ; 368d: d0 d6       ..  :355c[1]
    jsr show_dialog_box                                               ; 368f: 20 0a 04     .. :355e[1]
    lda #vdu_lf                                                       ; 3692: a9 0a       ..  :3561[1]
    jsr oswrch                                                        ; 3694: 20 ee ff     .. :3563[1]   ; Write character 10
    ldx #<saving_encrypted_string                                     ; 3697: a2 f7       ..  :3566[1]
    ldy #>saving_encrypted_string                                     ; 3699: a0 35       .5  :3568[1]
; if (saving) then branch forwards
    lda osfile_action_load_or_save                                    ; 369b: ad 97 34    ..4 :356a[1]
    beq got_encrypted_string_to_show                                  ; 369e: f0 04       ..  :356d[1]
    ldx #<loading_encrypted_string                                    ; 36a0: a2 fe       ..  :356f[1]
    ldy #>loading_encrypted_string                                    ; 36a2: a0 35       .5  :3571[1]
got_encrypted_string_to_show
    jsr print_encrypted_string_at_yx_centred                          ; 36a4: 20 f3 37     .7 :3573[1]
    lda #<save_full_filename                                          ; 36a7: a9 d6       ..  :3576[1]
    sta address1_low                                                  ; 36a9: 85 70       .p  :3578[1]
    lda #>save_full_filename                                          ; 36ab: a9 34       .4  :357a[1]
    sta address1_high                                                 ; 36ad: 85 71       .q  :357c[1]
    lda osfile_action_load_or_save                                    ; 36af: ad 97 34    ..4 :357e[1]
    beq save                                                          ; 36b2: f0 1b       ..  :3581[1]
    lda #osfile_read_catalogue_info                                   ; 36b4: a9 05       ..  :3583[1]
    jsr osfile_wrapper                                                ; 36b6: 20 dc 16     .. :3585[1]
    bne show_load_save_dialog_local                                   ; 36b9: d0 11       ..  :3588[1]
    lda osfile_block_start_address_mid1                               ; 36bb: a5 7b       .{  :358a[1]
    ora osfile_block_start_address_mid2                               ; 36bd: 05 7c       .|  :358c[1]
    ora osfile_block_start_address_high                               ; 36bf: 05 7d       .}  :358e[1]
    bne wrong_start_address                                           ; 36c1: d0 06       ..  :3590[1]
    lda osfile_block_start_address_low                                ; 36c3: a5 7a       .z  :3592[1]
    cmp #$85                                                          ; 36c5: c9 85       ..  :3594[1]
    beq save_or_validated_load                                        ; 36c7: f0 24       .$  :3596[1]
wrong_start_address
    jsr show_disk_error_dialog_if_display_is_initialised              ; 36c9: 20 28 17     (. :3598[1]
show_load_save_dialog_local
    jmp show_load_save_dialog                                         ; 36cc: 4c 0d 34    L.4 :359b[1]

save
    jsr get_checksum_of_save_game_data                                ; 36cf: 20 c3 0a     .. :359e[1]
    sta save_game_checksum                                            ; 36d2: 8d eb 09    ... :35a1[1]
    ldx #0                                                            ; 36d5: a2 00       ..  :35a4[1]
    ldy #0                                                            ; 36d7: a0 00       ..  :35a6[1]
    stx osfile_block_exec_address_low                                 ; 36d9: 86 76       .v  :35a8[1]
    stx osfile_block_exec_address_mid1                                ; 36db: 86 77       .w  :35aa[1]
    lda #<save_game                                                   ; 36dd: a9 ea       ..  :35ac[1]
    sta osfile_block_start_address_low                                ; 36df: 85 7a       .z  :35ae[1]
    lda #>save_game                                                   ; 36e1: a9 09       ..  :35b0[1]
    sta osfile_block_start_address_mid1                               ; 36e3: 85 7b       .{  :35b2[1]
    lda #<level_workspace                                             ; 36e5: a9 6f       .o  :35b4[1]
    sta osfile_block_end_address_low                                  ; 36e7: 85 7e       .~  :35b6[1]
    lda #>level_workspace                                             ; 36e9: a9 0a       ..  :35b8[1]
    sta osfile_block_end_address_mid1                                 ; 36eb: 85 7f       ..  :35ba[1]
save_or_validated_load
    ldx #<save_game                                                   ; 36ed: a2 ea       ..  :35bc[1]
    ldy #>save_game                                                   ; 36ef: a0 09       ..  :35be[1]
    lda osfile_action_load_or_save                                    ; 36f1: ad 97 34    ..4 :35c0[1]
    jsr osfile_wrapper                                                ; 36f4: 20 dc 16     .. :35c3[1]
    bne show_load_save_dialog_local                                   ; 36f7: d0 d3       ..  :35c6[1]
    jsr get_checksum_of_save_game_data                                ; 36f9: 20 c3 0a     .. :35c8[1]
    cmp save_game_checksum                                            ; 36fc: cd eb 09    ... :35cb[1]
    beq check_drive_letter                                            ; 36ff: f0 05       ..  :35ce[1]
    lda #$ff                                                          ; 3701: a9 ff       ..  :35d0[1]
    sta save_game                                                     ; 3703: 8d ea 09    ... :35d2[1]
check_drive_letter
    lda save_drive_number                                             ; 3706: ad d7 34    ..4 :35d5[1]
    sec                                                               ; 3709: 38          8   :35d8[1]
    sbc #'0'                                                          ; 370a: e9 30       .0  :35d9[1]
    and #1                                                            ; 370c: 29 01       ).  :35db[1]
    bne odd_drive_number                                              ; 370e: d0 03       ..  :35dd[1]
    jsr prompt_user_to_insert_correct_disc                            ; 3710: 20 17 36     .6 :35df[1]
odd_drive_number
    jsr check_menu_keys                                               ; 3713: 20 8f 3a     .: :35e2[1]
    lda osfile_action_load_or_save                                    ; 3716: ad 97 34    ..4 :35e5[1]
    bne drive_chosen                                                  ; 3719: d0 03       ..  :35e8[1]
    jmp remove_dialog                                                 ; 371b: 4c 53 04    LS. :35ea[1]

drive_chosen
    lda #$ff                                                          ; 371e: a9 ff       ..  :35ed[1]
    sta current_level                                                 ; 3720: 85 31       .1  :35ef[1]
    lda save_game                                                     ; 3722: ad ea 09    ... :35f1[1]
    jmp select_level_a                                                ; 3725: 4c db 36    L.6 :35f4[1]

; 'Saving[0d]' EOR-encrypted with $cb
saving_encrypted_string
    !byte $98, $aa, $bd, $a2, $a5, $ac, $c6                           ; 3728: 98 aa bd... ... :35f7[1]
; 'Loading[0d]' EOR-encrypted with $cb
loading_encrypted_string
    !byte $87, $a4, $aa, $af, $a2, $a5, $ac, $c6                      ; 372f: 87 a4 aa... ... :35fe[1]
; 'Insert game disk[0d]' EOR-encrypted with $cb
insert_game_disk_encrypted_string
    !byte $82, $a5, $b8, $ae, $b9, $bf, $eb, $ac, $aa, $a6, $ae, $eb  ; 3737: 82 a5 b8... ... :3606[1]
    !byte $af, $a2, $b8, $a0, $c6                                     ; 3743: af a2 b8... ... :3612[1]

prompt_user_to_insert_correct_disc
    jsr show_dialog_box                                               ; 3748: 20 0a 04     .. :3617[1]
    ldx #<insert_game_disk_encrypted_string                           ; 374b: a2 06       ..  :361a[1]
    ldy #>insert_game_disk_encrypted_string                           ; 374d: a0 36       .6  :361c[1]
    jsr print_encrypted_string_at_yx                                  ; 374f: 20 1c 38     .8 :361e[1]
    jsr print_2xlf_cr                                                 ; 3752: 20 50 38     P8 :3621[1]
    ldx #<and_press_return_encrypted_string                           ; 3755: a2 46       .F  :3624[1]
    ldy #>and_press_return_encrypted_string                           ; 3757: a0 35       .5  :3626[1]
    jsr print_encrypted_string_at_yx                                  ; 3759: 20 1c 38     .8 :3628[1]
    jsr flush_input_buffers_and_zero_characters_entered               ; 375c: 20 72 38     r8 :362b[1]
wait_for_return
    jsr inkey_0                                                       ; 375f: 20 7c 38     |8 :362e[1]
    cmp #vdu_cr                                                       ; 3762: c9 0d       ..  :3631[1]
    bne wait_for_return                                               ; 3764: d0 f9       ..  :3633[1]
    rts                                                               ; 3766: 60          `   :3635[1]

; *************************************************************************************
show_password_entry_dialog
    lda #$12                                                          ; 3767: a9 12       ..  :3636[1]
    sta current_text_width                                            ; 3769: 8d 09 04    ... :3638[1]
    lda which_dialog_is_active                                        ; 376c: a5 04       ..  :363b[1]
    bne remove_dialog_local3                                          ; 376e: d0 13       ..  :363d[1]
show_password_entry_dialog_ready
    jsr show_dialog_box                                               ; 3770: 20 0a 04     .. :363f[1]
    ldx #<enter_password_encrypted_string                             ; 3773: a2 55       .U  :3642[1]
    ldy #>enter_password_encrypted_string                             ; 3775: a0 36       .6  :3644[1]
    jsr print_encrypted_string_at_yx                                  ; 3777: 20 1c 38     .8 :3646[1]
    jsr print_2xlf_cr                                                 ; 377a: 20 50 38     P8 :3649[1]
    jsr turn_cursor_on                                                ; 377d: 20 5d 38     ]8 :364c[1]
    jmp flush_input_buffers_and_zero_characters_entered               ; 3780: 4c 72 38    Lr8 :364f[1]

remove_dialog_local3
    jmp remove_dialog                                                 ; 3783: 4c 53 04    LS. :3652[1]

; 'Enter password[0d]' EOR-encrypted with $cb
enter_password_encrypted_string
    !byte $8e, $a5, $bf, $ae, $b9, $eb, $bb, $aa, $b8, $b8, $bc, $a4  ; 3786: 8e a5 bf... ... :3655[1]
    !byte $b9, $af, $c6                                               ; 3792: b9 af c6    ... :3661[1]

; *************************************************************************************
; 
; Password dialogue update
; 
; *************************************************************************************
update_password_dialog
    ldy new_menu_index                                                ; 3795: a4 29       .)  :3664[1]
    lda desired_menu_slots,y                                          ; 3797: b9 5c 29    .\) :3666[1]
; return if not on the password menu item
    cmp #spriteid_icodata_password                                    ; 379a: c9 08       ..  :3669[1]
    bne return25                                                      ; 379c: d0 3a       .:  :366b[1]
; return if the dialog is not active
    lda which_dialog_is_active                                        ; 379e: a5 04       ..  :366d[1]
    beq return25                                                      ; 37a0: f0 36       .6  :366f[1]
; update string entry (maximum 16 characters)
    lda #16                                                           ; 37a2: a9 10       ..  :3671[1]
    jsr string_input_character                                        ; 37a4: 20 fc 36     .6 :3673[1]
; At this point, because of the stack shenanigans in 'string_input_character', the
; input string has been entered
    ldy characters_entered                                            ; 37a7: a4 05       ..  :3676[1]
    beq no_characters_entered                                         ; 37a9: f0 1e       ..  :3678[1]
; check for developer flags
    lda developer_flags                                               ; 37ab: ad 03 11    ... :367a[1]
    and #1                                                            ; 37ae: 29 01       ).  :367d[1]
    beq load_auxdata_loop                                             ; 37b0: f0 27       .'  :367f[1]
; check only one character entered + cr
    cpy #2                                                            ; 37b2: c0 02       ..  :3681[1]
    bne load_auxdata_loop                                             ; 37b4: d0 23       .#  :3683[1]
; Look for one letter passwords (level letter)
    lda string_input_buffer                                           ; 37b6: ad 90 0a    ... :3685[1]
    cmp #first_level_letter                                           ; 37b9: c9 41       .A  :3688[1]
    bcc load_auxdata_loop                                             ; 37bb: 90 1c       ..  :368a[1]
    cmp #last_level_letter+1                                          ; 37bd: c9 52       .R  :368c[1]
    bcs load_auxdata_loop                                             ; 37bf: b0 18       ..  :368e[1]
    pha                                                               ; 37c1: 48          H   :3690[1]
    jsr remove_dialog                                                 ; 37c2: 20 53 04     S. :3691[1]
    pla                                                               ; 37c5: 68          h   :3694[1]
    jmp select_level_a                                                ; 37c6: 4c db 36    L.6 :3695[1]

no_characters_entered
    lda developer_flags                                               ; 37c9: ad 03 11    ... :3698[1]
    and #1                                                            ; 37cc: 29 01       ).  :369b[1]
    beq return25                                                      ; 37ce: f0 08       ..  :369d[1]
; remove dialog and restart game
    jsr remove_dialog                                                 ; 37d0: 20 53 04     S. :369f[1]
    lda #$ff                                                          ; 37d3: a9 ff       ..  :36a2[1]
    jmp select_level_a                                                ; 37d5: 4c db 36    L.6 :36a4[1]

return25
    rts                                                               ; 37d8: 60          `   :36a7[1]

load_auxdata_loop
    lda #<auxcode_filename                                            ; 37d9: a9 9c       ..  :36a8[1]
    sta address1_low                                                  ; 37db: 85 70       .p  :36aa[1]
    lda #>auxcode_filename                                            ; 37dd: a9 38       .8  :36ac[1]
    sta address1_high                                                 ; 37df: 85 71       .q  :36ae[1]
    ldx #<auxcode                                                     ; 37e1: a2 c0       ..  :36b0[1]
    ldy #>auxcode                                                     ; 37e3: a0 53       .S  :36b2[1]
    lda #osfile_load                                                  ; 37e5: a9 ff       ..  :36b4[1]
    jsr osfile_wrapper                                                ; 37e7: 20 dc 16     .. :36b6[1]
    beq auxcode_loaded_successfully                                   ; 37ea: f0 06       ..  :36b9[1]
    jsr prompt_user_to_insert_correct_disc                            ; 37ec: 20 17 36     .6 :36bb[1]
    jmp load_auxdata_loop                                             ; 37ef: 4c a8 36    L.6 :36be[1]

auxcode_loaded_successfully
    jsr check_password                                                ; 37f2: 20 c0 53     .S :36c1[1]
    sta check_password_level                                          ; 37f5: 8d da 36    ..6 :36c4[1]
load_sprdata_loop
    jsr load_sprdata                                                  ; 37f8: 20 6f 19     o. :36c7[1]
    beq sprdata_loaded_successfully                                   ; 37fb: f0 06       ..  :36ca[1]
    jsr prompt_user_to_insert_correct_disc                            ; 37fd: 20 17 36     .6 :36cc[1]
    jmp load_sprdata_loop                                             ; 3800: 4c c7 36    L.6 :36cf[1]

sprdata_loaded_successfully
    lda check_password_level                                          ; 3803: ad da 36    ..6 :36d2[1]
    bne select_level_a                                                ; 3806: d0 04       ..  :36d5[1]
    jmp show_password_entry_dialog_ready                              ; 3808: 4c 3f 36    L?6 :36d7[1]

check_password_level
    !byte 0                                                           ; 380b: 00          .   :36da[1]

; *************************************************************************************
select_level_a
    cmp #1                                                            ; 380c: c9 01       ..  :36db[1]
    beq remove_dialog_local2                                          ; 380e: f0 17       ..  :36dd[1]
    cmp current_level                                                 ; 3810: c5 31       .1  :36df[1]
    beq remove_dialog_local2                                          ; 3812: f0 13       ..  :36e1[1]
    tay                                                               ; 3814: a8          .   :36e3[1]
    pla                                                               ; 3815: 68          h   :36e4[1]
    pla                                                               ; 3816: 68          h   :36e5[1]
    pla                                                               ; 3817: 68          h   :36e6[1]
    pla                                                               ; 3818: 68          h   :36e7[1]
    pla                                                               ; 3819: 68          h   :36e8[1]
    pla                                                               ; 381a: 68          h   :36e9[1]
    cpy #$ff                                                          ; 381b: c0 ff       ..  :36ea[1]
    beq start_game_local                                              ; 381d: f0 05       ..  :36ec[1]
    ldx #0                                                            ; 381f: a2 00       ..  :36ee[1]
    jmp initialise_level_and_room                                     ; 3821: 4c 40 11    L@. :36f0[1]

start_game_local
    jmp start_game                                                    ; 3824: 4c 0c 11    L.. :36f3[1]

remove_dialog_local2
    jmp remove_dialog                                                 ; 3827: 4c 53 04    LS. :36f6[1]

character_too_low
    jmp character_handled                                             ; 382a: 4c 7a 37    Lz7 :36f9[1]

; *************************************************************************************
; 
; Input a character into a string
; 
; Waits for the minimum time for a key to be pressed.
; 
; If the RETURN key is pressed, the routine ends normally and the input can be
; processed. If another key (or no key) is pressed, the regular return address is
; pulled off the stack and control returns to the next routine up on the stack.
; 
; On Entry:
;     A: maximum length of string
; 
; *************************************************************************************
string_input_character
    sta max_input_length                                              ; 382d: 8d 7d 37    .}7 :36fc[1]
    jsr inkey_0                                                       ; 3830: 20 7c 38     |8 :36ff[1]
    ldy characters_entered                                            ; 3833: a4 05       ..  :3702[1]
    cmp #vdu_cr                                                       ; 3835: c9 0d       ..  :3704[1]
    beq finished_string_input                                         ; 3837: f0 63       .c  :3706[1]
    cmp #vdu_delete                                                   ; 3839: c9 7f       ..  :3708[1]
    beq delete_pressed                                                ; 383b: f0 44       .D  :370a[1]
    cmp #'-'                                                          ; 383d: c9 2d       .-  :370c[1]
    beq minus_or_equals_key_pressed                                   ; 383f: f0 24       .$  :370e[1]
    cmp #'='                                                          ; 3841: c9 3d       .=  :3710[1]
    beq minus_or_equals_key_pressed                                   ; 3843: f0 20       .   :3712[1]
    cmp #'!'                                                          ; 3845: c9 21       .!  :3714[1]
    bcc character_too_low                                             ; 3847: 90 e1       ..  :3716[1]
    cmp #'*'                                                          ; 3849: c9 2a       .*  :3718[1]
    bcs check_range_of_characters                                     ; 384b: b0 04       ..  :371a[1]
; Character is between '!' and '*' i.e. one of the shifted number keys. Add 16 to get
; ASCII number, even if SHIFT LOCK is on
    adc #$10                                                          ; 384d: 69 10       i.  :371c[1]
    bne store_character_if_room_available                             ; 384f: d0 16       ..  :371e[1]
check_range_of_characters
    cmp #'0'                                                          ; 3851: c9 30       .0  :3720[1]
    bcc character_handled                                             ; 3853: 90 56       .V  :3722[1]
    cmp #'9' + 1                                                      ; 3855: c9 3a       .:  :3724[1]
    bcc store_character_if_room_available                             ; 3857: 90 0e       ..  :3726[1]
    and #caps_mask                                                    ; 3859: 29 df       ).  :3728[1]
    cmp #'A'                                                          ; 385b: c9 41       .A  :372a[1]
    bcc character_handled                                             ; 385d: 90 4c       .L  :372c[1]
    cmp #'Z' + 1                                                      ; 385f: c9 5b       .[  :372e[1]
    bcc store_character_if_room_available                             ; 3861: 90 04       ..  :3730[1]
    bcs character_handled                                             ; 3863: b0 46       .F  :3732[1]
minus_or_equals_key_pressed
    lda #'-'                                                          ; 3865: a9 2d       .-  :3734[1]
store_character_if_room_available
    cpy max_input_length                                              ; 3867: cc 7d 37    .}7 :3736[1]
    bcs character_handled                                             ; 386a: b0 3f       .?  :3739[1]
    iny                                                               ; 386c: c8          .   :373b[1]
    cpy max_input_length                                              ; 386d: cc 7d 37    .}7 :373c[1]
    bne store_character                                               ; 3870: d0 03       ..  :373f[1]
    jsr turn_cursor_off                                               ; 3872: 20 63 38     c8 :3741[1]
store_character
    dey                                                               ; 3875: 88          .   :3744[1]
    sta string_input_buffer,y                                         ; 3876: 99 90 0a    ... :3745[1]
    jsr print_italic                                                  ; 3879: 20 66 18     f. :3748[1]
    inc characters_entered                                            ; 387c: e6 05       ..  :374b[1]
    jmp character_handled                                             ; 387e: 4c 7a 37    Lz7 :374d[1]

delete_pressed
    cpy #0                                                            ; 3881: c0 00       ..  :3750[1]
    beq character_handled                                             ; 3883: f0 26       .&  :3752[1]
    lda #vdu_left                                                     ; 3885: a9 08       ..  :3754[1]
    jsr oswrch                                                        ; 3887: 20 ee ff     .. :3756[1]   ; Write character 8
    lda #' '                                                          ; 388a: a9 20       .   :3759[1]
    jsr oswrch                                                        ; 388c: 20 ee ff     .. :375b[1]   ; Write character 32
    lda #vdu_left                                                     ; 388f: a9 08       ..  :375e[1]
    jsr oswrch                                                        ; 3891: 20 ee ff     .. :3760[1]   ; Write character 8
    dec characters_entered                                            ; 3894: c6 05       ..  :3763[1]
    jsr turn_cursor_on                                                ; 3896: 20 5d 38     ]8 :3765[1]
    jmp character_handled                                             ; 3899: 4c 7a 37    Lz7 :3768[1]

finished_string_input
    cpy #0                                                            ; 389c: c0 00       ..  :376b[1]
    beq return26                                                      ; 389e: f0 0d       ..  :376d[1]
    sta string_input_buffer,y                                         ; 38a0: 99 90 0a    ... :376f[1]
    inc characters_entered                                            ; 38a3: e6 05       ..  :3772[1]
    jsr turn_cursor_off                                               ; 38a5: 20 63 38     c8 :3774[1]
    jmp return26                                                      ; 38a8: 4c 7c 37    L|7 :3777[1]

; take the return address off the stack and return to the routine above the callee
character_handled
    pla                                                               ; 38ab: 68          h   :377a[1]
    pla                                                               ; 38ac: 68          h   :377b[1]
return26
    rts                                                               ; 38ad: 60          `   :377c[1]

max_input_length
    !byte 0                                                           ; 38ae: 00          .   :377d[1]

; *************************************************************************************
show_level_info_dialog
    lda #$11                                                          ; 38af: a9 11       ..  :377e[1]
    sta current_text_width                                            ; 38b1: 8d 09 04    ... :3780[1]
    lda which_dialog_is_active                                        ; 38b4: a5 04       ..  :3783[1]
    beq show_section_letter_dialog                                    ; 38b6: f0 07       ..  :3785[1]
    cmp #1                                                            ; 38b8: c9 01       ..  :3787[1]
    beq show_level_completion_letters_dialog                          ; 38ba: f0 2f       ./  :3789[1]
    jmp remove_dialog                                                 ; 38bc: 4c 53 04    LS. :378b[1]

show_section_letter_dialog
    jsr show_dialog_box                                               ; 38bf: 20 0a 04     .. :378e[1]
    lda #1                                                            ; 38c2: a9 01       ..  :3791[1]
    sta which_dialog_is_active                                        ; 38c4: 85 04       ..  :3793[1]
    ldx #<section_encrypted_string                                    ; 38c6: a2 b1       ..  :3795[1]
    ldy #>section_encrypted_string                                    ; 38c8: a0 37       .7  :3797[1]
    jsr print_encrypted_string_at_yx                                  ; 38ca: 20 1c 38     .8 :3799[1]
    ldy current_level                                                 ; 38cd: a4 31       .1  :379c[1]
    jsr convert_level_filename_letter_into_section_letter             ; 38cf: 20 d4 0a     .. :379e[1]
    tya                                                               ; 38d2: 98          .   :37a1[1]
    jsr print_italic                                                  ; 38d3: 20 66 18     f. :37a2[1]
    jsr print_2xlf_cr                                                 ; 38d6: 20 50 38     P8 :37a5[1]
    ldx level_specific_password_ptr                                   ; 38d9: ae db 3a    ..: :37a8[1]
    ldy level_specific_password_ptr + 1                               ; 38dc: ac dc 3a    ..: :37ab[1]
    jmp print_encrypted_string_at_yx                                  ; 38df: 4c 1c 38    L.8 :37ae[1]

; 'Section [0d]' EOR-encrypted with $cb
section_encrypted_string
    !byte $98, $ae, $a8, $bf, $a2, $a4, $a5, $eb, $c6                 ; 38e2: 98 ae a8... ... :37b1[1]

show_level_completion_letters_dialog
    jsr show_dialog_box                                               ; 38eb: 20 0a 04     .. :37ba[1]
    lda #2                                                            ; 38ee: a9 02       ..  :37bd[1]
    sta which_dialog_is_active                                        ; 38f0: 85 04       ..  :37bf[1]
    ldx #first_level_letter                                           ; 38f2: a2 41       .A  :37c1[1]
show_level_completion_letters_loop
    txa                                                               ; 38f4: 8a          .   :37c3[1]
    tay                                                               ; 38f5: a8          .   :37c4[1]
    jsr convert_section_letter_to_level_filename_letter               ; 38f6: 20 ef 0a     .. :37c5[1]
    tya                                                               ; 38f9: 98          .   :37c8[1]
    sec                                                               ; 38fa: 38          8   :37c9[1]
    sbc #first_level_letter                                           ; 38fb: e9 41       .A  :37ca[1]
    tay                                                               ; 38fd: a8          .   :37cc[1]
; check for level completion
    lda level_progress_table,y                                        ; 38fe: b9 ef 09    ... :37cd[1]
    and #$80                                                          ; 3901: 29 80       ).  :37d0[1]
    tay                                                               ; 3903: a8          .   :37d2[1]
    txa                                                               ; 3904: 8a          .   :37d3[1]
    cpy #0                                                            ; 3905: c0 00       ..  :37d4[1]
    beq got_character_to_print                                        ; 3907: f0 02       ..  :37d6[1]
; print diamond for completed level
    lda #$fe                                                          ; 3909: a9 fe       ..  :37d8[1]
got_character_to_print
    jsr print_italic                                                  ; 390b: 20 66 18     f. :37da[1]
    cpx #last_level_letter-1                                          ; 390e: e0 50       .P  :37dd[1]
    beq return27                                                      ; 3910: f0 11       ..  :37df[1]
; move forward one character
    lda #9                                                            ; 3912: a9 09       ..  :37e1[1]
    jsr oswrch                                                        ; 3914: 20 ee ff     .. :37e3[1]   ; Write character 9
    txa                                                               ; 3917: 8a          .   :37e6[1]
    inx                                                               ; 3918: e8          .   :37e7[1]
; have we reached the end of the first line of letters?
    cmp #first_level_letter + num_levels/2 - 1                        ; 3919: c9 48       .H  :37e8[1]
    bne show_level_completion_letters_loop                            ; 391b: d0 d7       ..  :37ea[1]
; move to second row of letters
    jsr print_2xlf_cr                                                 ; 391d: 20 50 38     P8 :37ec[1]
    jmp show_level_completion_letters_loop                            ; 3920: 4c c3 37    L.7 :37ef[1]

return27
    rts                                                               ; 3923: 60          `   :37f2[1]

; *************************************************************************************
print_encrypted_string_at_yx_centred
    stx address1_low                                                  ; 3924: 86 70       .p  :37f3[1]
    sty address1_high                                                 ; 3926: 84 71       .q  :37f5[1]
    ldy #0                                                            ; 3928: a0 00       ..  :37f7[1]
find_string_length_loop
    lda (address1_low),y                                              ; 392a: b1 70       .p  :37f9[1]
    eor eor_key                                                       ; 392c: 45 45       EE  :37fb[1]
    cmp #vdu_cr                                                       ; 392e: c9 0d       ..  :37fd[1]
    beq string_length_in_y                                            ; 3930: f0 03       ..  :37ff[1]
    iny                                                               ; 3932: c8          .   :3801[1]
    bne find_string_length_loop                                       ; 3933: d0 f5       ..  :3802[1]
string_length_in_y
    sty address1_low                                                  ; 3935: 84 70       .p  :3804[1]
    lda current_text_width                                            ; 3937: ad 09 04    ... :3806[1]
    sec                                                               ; 393a: 38          8   :3809[1]
    sbc #2                                                            ; 393b: e9 02       ..  :380a[1]
    sbc address1_low                                                  ; 393d: e5 70       .p  :380c[1]
    lsr                                                               ; 393f: 4a          J   :380e[1]
    tay                                                               ; 3940: a8          .   :380f[1]
    beq print_spaces_done                                             ; 3941: f0 08       ..  :3810[1]
    lda #' '                                                          ; 3943: a9 20       .   :3812[1]
print_y_spaces_loop
    jsr oswrch                                                        ; 3945: 20 ee ff     .. :3814[1]   ; Write character 32
    dey                                                               ; 3948: 88          .   :3817[1]
    bne print_y_spaces_loop                                           ; 3949: d0 fa       ..  :3818[1]
print_spaces_done
    ldy address1_high                                                 ; 394b: a4 71       .q  :381a[1]
; *************************************************************************************
; 
; Print the EOR-encrypted (with eor_key) CR-terminated string at YX. Print in italics
; iff print_in_italics_flag is non-0.
; 
; *************************************************************************************
print_encrypted_string_at_yx
    stx address1_low                                                  ; 394d: 86 70       .p  :381c[1]
    sty address1_high                                                 ; 394f: 84 71       .q  :381e[1]
    lda #<print_italic                                                ; 3951: a9 66       .f  :3820[1]
    sta print_char_target                                             ; 3953: 8d 4e 38    .N8 :3822[1]
    lda #>print_italic                                                ; 3956: a9 18       ..  :3825[1]
    sta print_char_target + 1                                         ; 3958: 8d 4f 38    .O8 :3827[1]
    lda print_in_italics_flag                                         ; 395b: a5 43       .C  :382a[1]
    bne print_char_target_set                                         ; 395d: d0 0a       ..  :382c[1]
    lda #<oswrch                                                      ; 395f: a9 ee       ..  :382e[1]
    sta print_char_target                                             ; 3961: 8d 4e 38    .N8 :3830[1]
    lda #>oswrch                                                      ; 3964: a9 ff       ..  :3833[1]
    sta print_char_target + 1                                         ; 3966: 8d 4f 38    .O8 :3835[1]
print_char_target_set
    ldy #0                                                            ; 3969: a0 00       ..  :3838[1]
print_char_loop
    lda (address1_low),y                                              ; 396b: b1 70       .p  :383a[1]
    eor eor_key                                                       ; 396d: 45 45       EE  :383c[1]
    cmp #vdu_cr                                                       ; 396f: c9 0d       ..  :383e[1]
    beq print_done                                                    ; 3971: f0 06       ..  :3840[1]
    jsr print_char                                                    ; 3973: 20 4d 38     M8 :3842[1]
    iny                                                               ; 3976: c8          .   :3845[1]
    bne print_char_loop                                               ; 3977: d0 f2       ..  :3846[1]
print_done
    lda #$cb                                                          ; 3979: a9 cb       ..  :3848[1]
    sta eor_key                                                       ; 397b: 85 45       .E  :384a[1]
    rts                                                               ; 397d: 60          `   :384c[1]

; Print the character in A. This is patched at runtime to switch between normal and
; italic text.
print_char
print_char_target = print_char+1
    jmp oswrch                                                        ; 397e: 4c ee ff    L.. :384d[1]   ; Write character

print_2xlf_cr
    lda #vdu_lf                                                       ; 3981: a9 0a       ..  :3850[1]
    jsr oswrch                                                        ; 3983: 20 ee ff     .. :3852[1]   ; Write character 10
    jsr oswrch                                                        ; 3986: 20 ee ff     .. :3855[1]   ; Write character
    lda #vdu_cr                                                       ; 3989: a9 0d       ..  :3858[1]
    jmp oswrch                                                        ; 398b: 4c ee ff    L.. :385a[1]   ; Write character 13

turn_cursor_on
    pha                                                               ; 398e: 48          H   :385d[1]
    lda #$67 ; 'g'                                                    ; 398f: a9 67       .g  :385e[1]
    pha                                                               ; 3991: 48          H   :3860[1]
    bne finish_cursor_on_off                                          ; 3992: d0 04       ..  :3861[1]   ; ALWAYS branch
turn_cursor_off
    pha                                                               ; 3994: 48          H   :3863[1]
    lda #$20 ; ' '                                                    ; 3995: a9 20       .   :3864[1]
    pha                                                               ; 3997: 48          H   :3866[1]
finish_cursor_on_off
    lda #crtc_cursor_start                                            ; 3998: a9 0a       ..  :3867[1]
    sta crtc_address_register                                         ; 399a: 8d 00 fe    ... :3869[1]
    pla                                                               ; 399d: 68          h   :386c[1]
    sta crtc_address_write                                            ; 399e: 8d 01 fe    ... :386d[1]
    pla                                                               ; 39a1: 68          h   :3870[1]
    rts                                                               ; 39a2: 60          `   :3871[1]

flush_input_buffers_and_zero_characters_entered
    ldx #0                                                            ; 39a3: a2 00       ..  :3872[1]
    stx characters_entered                                            ; 39a5: 86 05       ..  :3874[1]
    lda #osbyte_flush_buffer_class                                    ; 39a7: a9 0f       ..  :3876[1]
    inx                                                               ; 39a9: e8          .   :3878[1]
    jmp osbyte                                                        ; 39aa: 4c f4 ff    L.. :3879[1]   ; Flush all buffers (X=0), or just input buffers (X non-zero)

inkey_0
    lda #osbyte_inkey                                                 ; 39ad: a9 81       ..  :387c[1]
    ldx #0                                                            ; 39af: a2 00       ..  :387e[1]
    ldy #0                                                            ; 39b1: a0 00       ..  :3880[1]
    jsr osbyte                                                        ; 39b3: 20 f4 ff     .. :3882[1]   ; Wait for a key press within 0 centiseconds
    tya                                                               ; 39b6: 98          .   :3885[1]   ; Y is zero if key pressed; $ff if no key pressed; $1b if ESCAPE pressed
    bne return_with_zero_result                                       ; 39b7: d0 02       ..  :3886[1]
; X is the ASCII value of the key pressed (assuming Y=0)
    txa                                                               ; 39b9: 8a          .   :3888[1]
    rts                                                               ; 39ba: 60          `   :3889[1]

return_with_zero_result
    lda #0                                                            ; 39bb: a9 00       ..  :388a[1]
    rts                                                               ; 39bd: 60          `   :388c[1]

wait_one_second_then_check_keys
    lda #0                                                            ; 39be: a9 00       ..  :388d[1]
    sta vsync_counter                                                 ; 39c0: 8d 8b 17    ... :388f[1]
wait_one_second_loop
    lda vsync_counter                                                 ; 39c3: ad 8b 17    ... :3892[1]
    cmp #50                                                           ; 39c6: c9 32       .2  :3895[1]
    bcc wait_one_second_loop                                          ; 39c8: 90 f9       ..  :3897[1]
    jmp check_menu_keys                                               ; 39ca: 4c 8f 3a    L.: :3899[1]

auxcode_filename
    !text "auxcode", $0d                                              ; 39cd: 61 75 78... aux :389c[1]
sound_data1
    !word $10                                                         ; 39d5: 10 00       ..  :38a4[1]   ; channel
    !word 65524                                                       ; 39d7: f4 ff       ..  :38a6[1]   ; amplitude
    !word 2                                                           ; 39d9: 02 00       ..  :38a8[1]   ; pitch
    !word 1                                                           ; 39db: 01 00       ..  :38aa[1]   ; duration
; The envelope definitions get overwritten after initialisation - this is harmless as
; they will have been copied into the OS workspace when they were defined.
object_erase_type
envelope_1
    !byte 1                                                           ; 39dd: 01          .   :38ac[1]   ; envelope number
    !byte 3                                                           ; 39de: 03          .   :38ad[1]   ; step length (100ths of a second)
    !byte 0                                                           ; 39df: 00          .   :38ae[1]   ; pitch change per step in section 1
    !byte 0                                                           ; 39e0: 00          .   :38af[1]   ; pitch change per step in section 2
    !byte 0                                                           ; 39e1: 00          .   :38b0[1]   ; pitch change per step in section 3
    !byte 0                                                           ; 39e2: 00          .   :38b1[1]   ; number of steps in section 1
    !byte 0                                                           ; 39e3: 00          .   :38b2[1]   ; number of steps in section 2
    !byte 0                                                           ; 39e4: 00          .   :38b3[1]   ; number of steps in section 3
    !byte 3                                                           ; 39e5: 03          .   :38b4[1]   ; change of amplitude per step during attack phase
    !byte 0                                                           ; 39e6: 00          .   :38b5[1]   ; change of amplitude per step during decay phase
    !byte 0                                                           ; 39e7: 00          .   :38b6[1]   ; change of amplitude per step during sustain phase
    !byte 0                                                           ; 39e8: 00          .   :38b7[1]   ; change of amplitude per step during release phase
    !byte 64                                                          ; 39e9: 40          @   :38b8[1]   ; target of level at end of attack phase
    !byte 0                                                           ; 39ea: 00          .   :38b9[1]   ; target of level at end of decay phase
sound_data3
    !word $10                                                         ; 39eb: 10 00       ..  :38ba[1]   ; channel
    !word 1                                                           ; 39ed: 01 00       ..  :38bc[1]   ; amplitude
    !word 7                                                           ; 39ef: 07 00       ..  :38be[1]   ; pitch
    !word 100                                                         ; 39f1: 64 00       d.  :38c0[1]   ; duration
object_z_order
envelope_2
    !byte 2                                                           ; 39f3: 02          .   :38c2[1]   ; envelope number
    !byte 134                                                         ; 39f4: 86          .   :38c3[1]   ; step length (100ths of a second)
    !byte 1                                                           ; 39f5: 01          .   :38c4[1]   ; pitch change per step in section 1
    !byte 3                                                           ; 39f6: 03          .   :38c5[1]   ; pitch change per step in section 2
    !byte 5                                                           ; 39f7: 05          .   :38c6[1]   ; pitch change per step in section 3
    !byte 10                                                          ; 39f8: 0a          .   :38c7[1]   ; number of steps in section 1
    !byte 10                                                          ; 39f9: 0a          .   :38c8[1]   ; number of steps in section 2
    !byte 16                                                          ; 39fa: 10          .   :38c9[1]   ; number of steps in section 3
    !byte 0                                                           ; 39fb: 00          .   :38ca[1]   ; change of amplitude per step during attack phase
    !byte 0                                                           ; 39fc: 00          .   :38cb[1]   ; change of amplitude per step during decay phase
    !byte 0                                                           ; 39fd: 00          .   :38cc[1]   ; change of amplitude per step during sustain phase
    !byte 0                                                           ; 39fe: 00          .   :38cd[1]   ; change of amplitude per step during release phase
    !byte 0                                                           ; 39ff: 00          .   :38ce[1]   ; target of level at end of attack phase
    !byte 0                                                           ; 3a00: 00          .   :38cf[1]   ; target of level at end of decay phase
sound_data2
    !word $11                                                         ; 3a01: 11 00       ..  :38d0[1]   ; channel
    !word 2                                                           ; 3a03: 02 00       ..  :38d2[1]   ; amplitude
    !word 180                                                         ; 3a05: b4 00       ..  :38d4[1]   ; pitch
    !word 100                                                         ; 3a07: 64 00       d.  :38d6[1]   ; duration
; object_room_collision_flags is a per-object table that has:
; 
;     bit 0: object collided with left wall
;     bit 1: object collided with floor
;     bit 2: object collided with right wall
;     bit 3: object collided with ceiling
object_room_collision_flags
envelope_3
    !byte 3                                                           ; 3a09: 03          .   :38d8[1]   ; envelope number
    !byte 1                                                           ; 3a0a: 01          .   :38d9[1]   ; step length (100ths of a second)
    !byte 0                                                           ; 3a0b: 00          .   :38da[1]   ; pitch change per step in section 1
    !byte 0                                                           ; 3a0c: 00          .   :38db[1]   ; pitch change per step in section 2
    !byte 0                                                           ; 3a0d: 00          .   :38dc[1]   ; pitch change per step in section 3
    !byte 0                                                           ; 3a0e: 00          .   :38dd[1]   ; number of steps in section 1
    !byte 0                                                           ; 3a0f: 00          .   :38de[1]   ; number of steps in section 2
    !byte 0                                                           ; 3a10: 00          .   :38df[1]   ; number of steps in section 3
    !byte 100                                                         ; 3a11: 64          d   :38e0[1]   ; change of amplitude per step during attack phase
    !byte 0                                                           ; 3a12: 00          .   :38e1[1]   ; change of amplitude per step during decay phase
    !byte 0                                                           ; 3a13: 00          .   :38e2[1]   ; change of amplitude per step during sustain phase
    !byte 248                                                         ; 3a14: f8          .   :38e3[1]   ; change of amplitude per step during release phase
    !byte 126                                                         ; 3a15: 7e          ~   :38e4[1]   ; target of level at end of attack phase
    !byte 0                                                           ; 3a16: 00          .   :38e5[1]   ; target of level at end of decay phase
sound_landing2
    !word $10                                                         ; 3a17: 10 00       ..  :38e6[1]   ; channel
    !word 3                                                           ; 3a19: 03 00       ..  :38e8[1]   ; amplitude
    !word 3                                                           ; 3a1b: 03 00       ..  :38ea[1]   ; pitch
    !word 1                                                           ; 3a1d: 01 00       ..  :38ec[1]   ; duration
sound_landing1
    !word $11                                                         ; 3a1f: 11 00       ..  :38ee[1]   ; channel
    !word 0                                                           ; 3a21: 00 00       ..  :38f0[1]   ; amplitude
    !word 40                                                          ; 3a23: 28 00       (.  :38f2[1]   ; pitch
    !word 1                                                           ; 3a25: 01 00       ..  :38f4[1]   ; duration

; *************************************************************************************
; 
; Play a sound
; 
; On Extry:
;     A: Sound priority ($ff always plays, $00 won't if sound already playing is $ff)
;     YX: Address of SOUND block to play (eight bytes)
; 
; On Exit:
;     Preserves A
; 
; *************************************************************************************
play_sound_yx
    sta remember_a                                                    ; 3a27: 8d 73 39    .s9 :38f6[1]
; remember address1 on stack
    lda address1_low                                                  ; 3a2a: a5 70       .p  :38f9[1]
    pha                                                               ; 3a2c: 48          H   :38fb[1]
    lda address1_high                                                 ; 3a2d: a5 71       .q  :38fc[1]
    pha                                                               ; 3a2f: 48          H   :38fe[1]
; store YX address
    stx address1_low                                                  ; 3a30: 86 70       .p  :38ff[1]
    sty address1_high                                                 ; 3a32: 84 71       .q  :3901[1]
; exit if sound is disabled
    lda sound_enable_flag                                             ; 3a34: ad 66 39    .f9 :3903[1]
    beq finish_play_sound                                             ; 3a37: f0 4c       .L  :3906[1]
    ldy #0                                                            ; 3a39: a0 00       ..  :3908[1]
    lda (address1_low),y                                              ; 3a3b: b1 70       .p  :390a[1]
; If flush is clear, then branch forward to play sound
    and #$f0                                                          ; 3a3d: 29 f0       ).  :390c[1]
    beq no_flush                                                      ; 3a3f: f0 2c       .,  :390e[1]
; Get channel number (0-3) into X
    lda (address1_low),y                                              ; 3a41: b1 70       .p  :3910[1]
    and #3                                                            ; 3a43: 29 03       ).  :3912[1]
    tax                                                               ; 3a45: aa          .   :3914[1]
; update current sound priority as needed
    lda remember_a                                                    ; 3a46: ad 73 39    .s9 :3915[1]
    cmp sound_priority_per_channel_table,x                            ; 3a49: dd 6f 39    .o9 :3918[1]
    bcc finish_play_sound                                             ; 3a4c: 90 37       .7  :391b[1]
    sta sound_priority_per_channel_table,x                            ; 3a4e: 9d 6f 39    .o9 :391d[1]
; if sound channel is 2 or 3, branch forward
    cpx #2                                                            ; 3a51: e0 02       ..  :3920[1]
    bcs play_sound                                                    ; 3a53: b0 27       .'  :3922[1]
; if (the new sound is the same as the existing sound) then branch to play_sound
    lda address1_low                                                  ; 3a55: a5 70       .p  :3924[1]
    cmp address_of_sounds_low_table,x                                 ; 3a57: dd 67 39    .g9 :3926[1]
    bne flush_sound_buffer_X                                          ; 3a5a: d0 07       ..  :3929[1]
    lda address1_high                                                 ; 3a5c: a5 71       .q  :392b[1]
    cmp address_of_sounds_high_table,x                                ; 3a5e: dd 6b 39    .k9 :392d[1]
    beq play_sound                                                    ; 3a61: f0 19       ..  :3930[1]
; add four to X to get sound buffer number
flush_sound_buffer_X
    txa                                                               ; 3a63: 8a          .   :3932[1]
    clc                                                               ; 3a64: 18          .   :3933[1]
    adc #4                                                            ; 3a65: 69 04       i.  :3934[1]
    tax                                                               ; 3a67: aa          .   :3936[1]
    lda #osbyte_flush_buffer                                          ; 3a68: a9 15       ..  :3937[1]
    jsr osbyte                                                        ; 3a6a: 20 f4 ff     .. :3939[1]   ; Flush specific buffer X
no_flush
    lda (address1_low),y                                              ; 3a6d: b1 70       .p  :393c[1]
    and #3                                                            ; 3a6f: 29 03       ).  :393e[1]
    tax                                                               ; 3a71: aa          .   :3940[1]
; store the address of the new sound in tables
    lda address1_low                                                  ; 3a72: a5 70       .p  :3941[1]
    sta address_of_sounds_low_table,x                                 ; 3a74: 9d 67 39    .g9 :3943[1]
    lda address1_high                                                 ; 3a77: a5 71       .q  :3946[1]
    sta address_of_sounds_high_table,x                                ; 3a79: 9d 6b 39    .k9 :3948[1]
play_sound
    ldx address1_low                                                  ; 3a7c: a6 70       .p  :394b[1]
    ldy address1_high                                                 ; 3a7e: a4 71       .q  :394d[1]
    lda #osword_sound                                                 ; 3a80: a9 07       ..  :394f[1]
    jsr osword                                                        ; 3a82: 20 f1 ff     .. :3951[1]   ; SOUND command
; restore address1 from stack
finish_play_sound
    pla                                                               ; 3a85: 68          h   :3954[1]
    sta address1_high                                                 ; 3a86: 85 71       .q  :3955[1]
    pla                                                               ; 3a88: 68          h   :3957[1]
    sta address1_low                                                  ; 3a89: 85 70       .p  :3958[1]
    lda remember_a                                                    ; 3a8b: ad 73 39    .s9 :395a[1]
    rts                                                               ; 3a8e: 60          `   :395d[1]

define_envelope
    pha                                                               ; 3a8f: 48          H   :395e[1]
    lda #osword_envelope                                              ; 3a90: a9 08       ..  :395f[1]
    jsr osword                                                        ; 3a92: 20 f1 ff     .. :3961[1]   ; ENVELOPE command
    pla                                                               ; 3a95: 68          h   :3964[1]
    rts                                                               ; 3a96: 60          `   :3965[1]

sound_enable_flag
    !byte $ff                                                         ; 3a97: ff          .   :3966[1]
address_of_sounds_low_table
    !byte 0, 0, 0, 0                                                  ; 3a98: 00 00 00... ... :3967[1]
address_of_sounds_high_table
    !byte 0, 0, 0, 0                                                  ; 3a9c: 00 00 00... ... :396b[1]
sound_priority_per_channel_table
    !byte 0                                                           ; 3aa0: 00          .   :396f[1]
    !byte 0, 0, 0                                                     ; 3aa1: 00 00 00    ... :3970[1]
remember_a
    !byte 0                                                           ; 3aa4: 00          .   :3973[1]
mid_transform_sprites_table
    !byte spriteid_one_pixel_masked_out                               ; 3aa5: 00          .   :3974[1]
mid_transform_circle_sprites
    !byte spriteid_circle                                             ; 3aa6: 20              :3975[1]
    !byte spriteid_circle                                             ; 3aa7: 20              :3976[1]
    !byte $ff                                                         ; 3aa8: ff          .   :3977[1]
mid_transform_sparkles_in
    !byte spriteid_one_pixel_masked_out                               ; 3aa9: 00          .   :3978[1]
    !byte spriteid_sparkles5                                          ; 3aaa: 26          &   :3979[1]
    !byte spriteid_sparkles4                                          ; 3aab: 25          %   :397a[1]
    !byte spriteid_sparkles3                                          ; 3aac: 24          $   :397b[1]
    !byte spriteid_sparkles2                                          ; 3aad: 23          #   :397c[1]
    !byte spriteid_sparkles1                                          ; 3aae: 22          "   :397d[1]
    !byte $ff                                                         ; 3aaf: ff          .   :397e[1]
mid_transform_sparkles_out
    !byte spriteid_sparkles1                                          ; 3ab0: 22          "   :397f[1]
    !byte spriteid_sparkles2                                          ; 3ab1: 23          #   :3980[1]
    !byte spriteid_sparkles3                                          ; 3ab2: 24          $   :3981[1]
    !byte spriteid_sparkles4                                          ; 3ab3: 25          %   :3982[1]
    !byte spriteid_sparkles5                                          ; 3ab4: 26          &   :3983[1]
    !byte spriteid_one_pixel_masked_out                               ; 3ab5: 00          .   :3984[1]
    !byte $ff                                                         ; 3ab6: ff          .   :3985[1]

; During a transformation, 'object_current_index_in_animation' is the index into the
; sprite array above
update_mid_transformation
    lda object_current_index_in_animation                             ; 3ab7: ad d4 09    ... :3986[1]
    clc                                                               ; 3aba: 18          .   :3989[1]
    adc #1                                                            ; 3abb: 69 01       i.  :398a[1]
    tay                                                               ; 3abd: a8          .   :398c[1]
    lda mid_transform_sprites_table,y                                 ; 3abe: b9 74 39    .t9 :398d[1]
    cmp #$ff                                                          ; 3ac1: c9 ff       ..  :3990[1]
    bne still_playing                                                 ; 3ac3: d0 03       ..  :3992[1]
    ldy current_player_animation                                      ; 3ac5: ac df 09    ... :3994[1]
still_playing
    lda current_player_animation                                      ; 3ac8: ad df 09    ... :3997[1]
    bne check_for_point_of_changing_level                             ; 3acb: d0 25       .%  :399a[1]
    tya                                                               ; 3acd: 98          .   :399c[1]
    bne mid_transform_store_state                                     ; 3ace: d0 69       .i  :399d[1]
    lda new_player_character                                          ; 3ad0: a5 4d       .M  :399f[1]
    sta current_player_character                                      ; 3ad2: 85 48       .H  :39a1[1]
    bne got_player_character                                          ; 3ad4: d0 11       ..  :39a3[1]
    ldy #mid_transform_sparkles_out - mid_transform_sprites_table     ; 3ad6: a0 0b       ..  :39a5[1]
    sty current_player_animation                                      ; 3ad8: 8c df 09    ... :39a7[1]
    lda object_y_low                                                  ; 3adb: ad 7c 09    .|. :39aa[1]
    clc                                                               ; 3ade: 18          .   :39ad[1]
    adc #2                                                            ; 3adf: 69 02       i.  :39ae[1]
    sta object_y_low                                                  ; 3ae1: 8d 7c 09    .|. :39b0[1]
    jmp mid_transform_store_state                                     ; 3ae4: 4c 08 3a    L.: :39b3[1]

got_player_character
    lda #0                                                            ; 3ae7: a9 00       ..  :39b6[1]
    sta current_player_animation                                      ; 3ae9: 8d df 09    ... :39b8[1]
    sta object_current_index_in_animation                             ; 3aec: 8d d4 09    ... :39bb[1]
    jmp update_player                                                 ; 3aef: 4c cd 22    L." :39be[1]

check_for_point_of_changing_level
    cmp #mid_transform_sparkles_out - mid_transform_sprites_table     ; 3af2: c9 0b       ..  :39c1[1]
    bne check_for_circles_animation                                   ; 3af4: d0 2f       ./  :39c3[1]
    cpy #mid_transform_sparkles_out - mid_transform_sprites_table     ; 3af6: c0 0b       ..  :39c5[1]
    bne mid_transform_store_state                                     ; 3af8: d0 3f       .?  :39c7[1]
; this is the point at which we move to the next level. First start the transform_in
; animation
    jsr start_of_transform_in_animation                               ; 3afa: 20 58 23     X# :39c9[1]
; stack shenanigans: Remove two addresses from the stack, so we don't fill up the stack
; (taking us back to the stack level that called 'game_update')
    pla                                                               ; 3afd: 68          h   :39cc[1]
    pla                                                               ; 3afe: 68          h   :39cd[1]
    pla                                                               ; 3aff: 68          h   :39ce[1]
    pla                                                               ; 3b00: 68          h   :39cf[1]
; find the next uncompleted level
    ldy #num_levels-1                                                 ; 3b01: a0 0f       ..  :39d0[1]
find_uncompleted_level_loop
    lda level_progress_table,y                                        ; 3b03: b9 ef 09    ... :39d2[1]
    and #$80                                                          ; 3b06: 29 80       ).  :39d5[1]
    beq found_uncompleted_level                                       ; 3b08: f0 07       ..  :39d7[1]
    dey                                                               ; 3b0a: 88          .   :39d9[1]
    bpl find_uncompleted_level_loop                                   ; 3b0b: 10 f6       ..  :39da[1]
    ldy #last_level_letter                                            ; 3b0d: a0 51       .Q  :39dc[1]
    bne found_next_level                                              ; 3b0f: d0 0c       ..  :39de[1]   ; ALWAYS branch

found_uncompleted_level
    ldy current_level                                                 ; 3b11: a4 31       .1  :39e0[1]
    jsr convert_level_filename_letter_into_section_letter             ; 3b13: 20 d4 0a     .. :39e2[1]
    iny                                                               ; 3b16: c8          .   :39e5[1]
    cpy #last_level_letter                                            ; 3b17: c0 51       .Q  :39e6[1]
    bcc found_next_level                                              ; 3b19: 90 02       ..  :39e8[1]
    ldy #first_level_letter                                           ; 3b1b: a0 41       .A  :39ea[1]
found_next_level
    ldx #0                                                            ; 3b1d: a2 00       ..  :39ec[1]
    jsr convert_section_letter_to_level_filename_letter               ; 3b1f: 20 ef 0a     .. :39ee[1]
; start next level
    jmp initialise_level_and_room                                     ; 3b22: 4c 40 11    L@. :39f1[1]

check_for_circles_animation
    cpy #mid_transform_sparkles_in - mid_transform_sprites_table      ; 3b25: c0 04       ..  :39f4[1]
    bne mid_transform_store_state                                     ; 3b27: d0 10       ..  :39f6[1]
    lda #mid_transform_sprites_table - mid_transform_sprites_table    ; 3b29: a9 00       ..  :39f8[1]
    sta current_player_animation                                      ; 3b2b: 8d df 09    ... :39fa[1]
    ldy #mid_transform_circle_sprites - mid_transform_sprites_table   ; 3b2e: a0 01       ..  :39fd[1]
    lda object_y_low                                                  ; 3b30: ad 7c 09    .|. :39ff[1]
    sec                                                               ; 3b33: 38          8   :3a02[1]
    sbc #2                                                            ; 3b34: e9 02       ..  :3a03[1]
    sta object_y_low                                                  ; 3b36: 8d 7c 09    .|. :3a05[1]
mid_transform_store_state
    sty object_current_index_in_animation                             ; 3b39: 8c d4 09    ... :3a08[1]
    lda mid_transform_sprites_table,y                                 ; 3b3c: b9 74 39    .t9 :3a0b[1]
    sta object_spriteid                                               ; 3b3f: 8d a8 09    ... :3a0e[1]
    rts                                                               ; 3b42: 60          `   :3a11[1]

update_main_keys
    ldx #inkey_key_return                                             ; 3b43: a2 b6       ..  :3a12[1]
    jsr negative_inkey                                                ; 3b45: 20 cc 3a     .: :3a14[1]
    ora return_key_pressed_pending                                    ; 3b48: 05 46       .F  :3a17[1]
    sta return_key_pressed_pending                                    ; 3b4a: 85 46       .F  :3a19[1]
    ldx #inkey_key_z                                                  ; 3b4c: a2 9e       ..  :3a1b[1]
    jsr negative_inkey                                                ; 3b4e: 20 cc 3a     .: :3a1d[1]
    sta z_key_pressed                                                 ; 3b51: 8d 8d 3a    ..: :3a20[1]
    ora z_key_pressed_pending                                         ; 3b54: 05 2c       .,  :3a23[1]
    sta z_key_pressed_pending                                         ; 3b56: 85 2c       .,  :3a25[1]
    ldx #inkey_key_x                                                  ; 3b58: a2 bd       ..  :3a27[1]
    jsr negative_inkey                                                ; 3b5a: 20 cc 3a     .: :3a29[1]
    pha                                                               ; 3b5d: 48          H   :3a2c[1]
    ora x_key_pressed_pending                                         ; 3b5e: 05 2d       .-  :3a2d[1]
    sta x_key_pressed_pending                                         ; 3b60: 85 2d       .-  :3a2f[1]
    pla                                                               ; 3b62: 68          h   :3a31[1]
    ldx #0                                                            ; 3b63: a2 00       ..  :3a32[1]
    eor z_key_pressed                                                 ; 3b65: 4d 8d 3a    M.: :3a34[1]
    beq store_x_as_valid_direction_pending                            ; 3b68: f0 08       ..  :3a37[1]
    dex                                                               ; 3b6a: ca          .   :3a39[1]
    lda z_key_pressed                                                 ; 3b6b: ad 8d 3a    ..: :3a3a[1]
    bmi store_x_as_valid_direction_pending                            ; 3b6e: 30 02       0.  :3a3d[1]
    ldx #1                                                            ; 3b70: a2 01       ..  :3a3f[1]
store_x_as_valid_direction_pending
    txa                                                               ; 3b72: 8a          .   :3a41[1]
    ora valid_direction_pending                                       ; 3b73: 05 20       .   :3a42[1]
    sta valid_direction_pending                                       ; 3b75: 85 20       .   :3a44[1]
    rts                                                               ; 3b77: 60          `   :3a46[1]

update_space_etc_keys
    ldx #inkey_key_space                                              ; 3b78: a2 9d       ..  :3a47[1]
    jsr negative_inkey                                                ; 3b7a: 20 cc 3a     .: :3a49[1]
    cmp space_bar_pressed                                             ; 3b7d: c5 2b       .+  :3a4c[1]
    sta space_bar_pressed                                             ; 3b7f: 85 2b       .+  :3a4e[1]
    bne save_space_bar_state_change_pending                           ; 3b81: d0 02       ..  :3a50[1]
    lda #0                                                            ; 3b83: a9 00       ..  :3a52[1]
save_space_bar_state_change_pending
    ora space_bar_press_pending                                       ; 3b85: 05 2a       .*  :3a54[1]
    sta space_bar_press_pending                                       ; 3b87: 85 2a       .*  :3a56[1]
; store whether the left cursor key is pressed in 'z_key_pressed'
    ldx #inkey_key_left                                               ; 3b89: a2 e6       ..  :3a58[1]
    jsr negative_inkey                                                ; 3b8b: 20 cc 3a     .: :3a5a[1]
    sta z_key_pressed                                                 ; 3b8e: 8d 8d 3a    ..: :3a5d[1]
; if the left and right cursor keys are pressed together (or neither), there is no
; valid direction (set A=$00)
    ldx #inkey_key_right                                              ; 3b91: a2 86       ..  :3a60[1]
    jsr negative_inkey                                                ; 3b93: 20 cc 3a     .: :3a62[1]
    cmp z_key_pressed                                                 ; 3b96: cd 8d 3a    ..: :3a65[1]
    beq no_valid_direction                                            ; 3b99: f0 09       ..  :3a68[1]
; set A=$FF if moving left, or $01 if moving right along the toolbar
    lda z_key_pressed                                                 ; 3b9b: ad 8d 3a    ..: :3a6a[1]
    bmi menu_x_step_in_a                                              ; 3b9e: 30 06       0.  :3a6d[1]
    lda #1                                                            ; 3ba0: a9 01       ..  :3a6f[1]
    bpl menu_x_step_in_a                                              ; 3ba2: 10 02       ..  :3a71[1]   ; ALWAYS branch
no_valid_direction
    lda #0                                                            ; 3ba4: a9 00       ..  :3a73[1]
; This is a manual implementation of an auto-repeat delay, so if you hold down
; left/right a fraction of a second too long it doesn't zip all the way to the left or
; right.
menu_x_step_in_a
    cmp left_right_repeat_direction                                   ; 3ba6: c5 27       .'  :3a75[1]
    sta left_right_repeat_direction                                   ; 3ba8: 85 27       .'  :3a77[1]
; if direction changes, restart the auto-repat delay
    bne restart_auto_repeat_delay                                     ; 3baa: d0 08       ..  :3a79[1]
    lda #0                                                            ; 3bac: a9 00       ..  :3a7b[1]
    dec auto_repeat_counter                                           ; 3bae: c6 26       .&  :3a7d[1]
    bpl remember_direction_pressed                                    ; 3bb0: 10 07       ..  :3a7f[1]
    lda left_right_repeat_direction                                   ; 3bb2: a5 27       .'  :3a81[1]
restart_auto_repeat_delay
    ldx auto_repeat_delay                                             ; 3bb4: ae 8e 3a    ..: :3a83[1]
    stx auto_repeat_counter                                           ; 3bb7: 86 26       .&  :3a86[1]
remember_direction_pressed
    ora left_right_direction                                          ; 3bb9: 05 28       .(  :3a88[1]
    sta left_right_direction                                          ; 3bbb: 85 28       .(  :3a8a[1]
    rts                                                               ; 3bbd: 60          `   :3a8c[1]

z_key_pressed
    !byte 0                                                           ; 3bbe: 00          .   :3a8d[1]
auto_repeat_delay
    !byte $10                                                         ; 3bbf: 10          .   :3a8e[1]

check_menu_keys
    lda space_bar_press_pending                                       ; 3bc0: a5 2a       .*  :3a8f[1]
    sta space_flag2                                                   ; 3bc2: 8d a0 3a    ..: :3a91[1]
    lda left_right_direction                                          ; 3bc5: a5 28       .(  :3a94[1]
    sta left_right_flag_pending                                       ; 3bc7: 8d a1 3a    ..: :3a96[1]
    lda #0                                                            ; 3bca: a9 00       ..  :3a99[1]
    sta space_bar_press_pending                                       ; 3bcc: 85 2a       .*  :3a9b[1]
    sta left_right_direction                                          ; 3bce: 85 28       .(  :3a9d[1]
    rts                                                               ; 3bd0: 60          `   :3a9f[1]

space_flag2
    !byte 0                                                           ; 3bd1: 00          .   :3aa0[1]
left_right_flag_pending
    !byte 0                                                           ; 3bd2: 00          .   :3aa1[1]

read_player_movement_keys
    lda jump_requested                                                ; 3bd3: ad c7 3a    ..: :3aa2[1]
    sta jump_requested_previous_tick                                  ; 3bd6: 8d c8 3a    ..: :3aa5[1]
    lda return_key_pressed_pending                                    ; 3bd9: a5 46       .F  :3aa8[1]
    sta jump_requested                                                ; 3bdb: 8d c7 3a    ..: :3aaa[1]
    lda valid_direction_pending                                       ; 3bde: a5 20       .   :3aad[1]
    sta player_move_direction_requested                               ; 3be0: 8d c9 3a    ..: :3aaf[1]
    lda z_key_pressed_pending                                         ; 3be3: a5 2c       .,  :3ab2[1]
    sta move_left_requested                                           ; 3be5: 8d ca 3a    ..: :3ab4[1]
    lda x_key_pressed_pending                                         ; 3be8: a5 2d       .-  :3ab7[1]
    sta move_right_requested                                          ; 3bea: 8d cb 3a    ..: :3ab9[1]
    lda #0                                                            ; 3bed: a9 00       ..  :3abc[1]
    sta return_key_pressed_pending                                    ; 3bef: 85 46       .F  :3abe[1]
    sta valid_direction_pending                                       ; 3bf1: 85 20       .   :3ac0[1]
    sta z_key_pressed_pending                                         ; 3bf3: 85 2c       .,  :3ac2[1]
    sta x_key_pressed_pending                                         ; 3bf5: 85 2d       .-  :3ac4[1]
    rts                                                               ; 3bf7: 60          `   :3ac6[1]

jump_requested
    !byte 0                                                           ; 3bf8: 00          .   :3ac7[1]
jump_requested_previous_tick
    !byte 0                                                           ; 3bf9: 00          .   :3ac8[1]
; $ff for left, $01 for right, $00 for none
player_move_direction_requested
    !byte 0                                                           ; 3bfa: 00          .   :3ac9[1]
move_left_requested
    !byte 0                                                           ; 3bfb: 00          .   :3aca[1]
move_right_requested
    !byte 0                                                           ; 3bfc: 00          .   :3acb[1]

negative_inkey
    ldy #$ff                                                          ; 3bfd: a0 ff       ..  :3acc[1]
    lda #osbyte_inkey                                                 ; 3bff: a9 81       ..  :3ace[1]
    jsr osbyte                                                        ; 3c01: 20 f4 ff     .. :3ad0[1]   ; Read a specific key (or read machine type)
    txa                                                               ; 3c04: 8a          .   :3ad3[1]
    rts                                                               ; 3c05: 60          `   :3ad4[1]

level_data
}

execution_start
; The loader will have executed VDU 21 to disable VDU output. Record the current
; disable state before re-enabling it, so we can check it later as part of a copy
; protection scheme.
; This initialisation code gets overwritten by level data later on.
    lda #osbyte_read_vdu_status                                       ; 3c06: a9 75       .u
    jsr osbyte                                                        ; 3c08: 20 f4 ff     ..            ; Read VDU status byte

    ; X is VDU status byte:
    ;     bit 0=printer output enabled by a VDU 2
    ;     bit 1=scrolling disabled (cursor editing)
    ;     bit 2=paged scrolling selected
    ;     bit 3=software scrolling selected (text window)
    ;     bit 4=shadow mode selected
    ;     bit 5=text at graphics cursor (VDU 5)
    ;     bit 6=two cursor editing mode
    ;     bit 7=screen disabled via VDU 21
    txa                                                               ; 3c0b: 8a          .
    and #$80                                                          ; 3c0c: 29 80       ).
    sta initial_screen_disabled_flag                                  ; 3c0e: 8d 6e 3f    .n?
    lda #vdu_enable                                                   ; 3c11: a9 06       ..
    jsr oswrch                                                        ; 3c13: 20 ee ff     ..            ; Write character 6

; Relocation 1: Copy 512 bytes of code from &40FF to &400
    lda #<relocation1_high_copy_start                                 ; 3c16: a9 ff       ..
    sta address1_low                                                  ; 3c18: 85 70       .p
    lda #>relocation1_high_copy_start                                 ; 3c1a: a9 40       .@
    sta address1_high                                                 ; 3c1c: 85 71       .q
    lda #<wait_for_timingB_counter                                    ; 3c1e: a9 00       ..
    sta destination_address_low                                       ; 3c20: 85 72       .r
    lda #>wait_for_timingB_counter                                    ; 3c22: a9 04       ..
    sta destination_address_high                                      ; 3c24: 85 73       .s
    ldx #2                                                            ; 3c26: a2 02       ..
    beq relocation2                                                   ; 3c28: f0 10       ..             ; branch never taken
    ldy #0                                                            ; 3c2a: a0 00       ..
relocation1_loop
    lda (address1_low),y                                              ; 3c2c: b1 70       .p
    sta (destination_address_low),y                                   ; 3c2e: 91 72       .r
    iny                                                               ; 3c30: c8          .
    bne relocation1_loop                                              ; 3c31: d0 f9       ..
    inc address1_high                                                 ; 3c33: e6 71       .q
    inc destination_address_high                                      ; 3c35: e6 73       .s
    dex                                                               ; 3c37: ca          .
    bne relocation1_loop                                              ; 3c38: d0 f2       ..

; Relocation 2: Copy &2A00 bytes from &1234 to &1103. This is done more for obfuscation
; than any real requirement - we could have just loaded at &1103 in the first place.
relocation2
    lda #<pydis_start                                                 ; 3c3a: a9 34       .4
    sta address1_low                                                  ; 3c3c: 85 70       .p
    lda #>pydis_start                                                 ; 3c3e: a9 12       ..
    sta address1_high                                                 ; 3c40: 85 71       .q
    lda #<developer_flags                                             ; 3c42: a9 03       ..
    sta destination_address_low                                       ; 3c44: 85 72       .r
    lda #>developer_flags                                             ; 3c46: a9 11       ..
    sta destination_address_high                                      ; 3c48: 85 73       .s
    lda address1_high                                                 ; 3c4a: a5 71       .q
    cmp destination_address_high                                      ; 3c4c: c5 73       .s
    bne skip4                                                         ; 3c4e: d0 06       ..             ; branch always taken
    lda address1_low                                                  ; 3c50: a5 70       .p
    cmp destination_address_low                                       ; 3c52: c5 72       .r
    beq relocation3                                                   ; 3c54: f0 14       ..
skip4
    ldx #$2a ; '*'                                                    ; 3c56: a2 2a       .*
    beq relocation3                                                   ; 3c58: f0 10       ..             ; branch never taken
    ldy #0                                                            ; 3c5a: a0 00       ..
relocation2_loop
    lda (address1_low),y                                              ; 3c5c: b1 70       .p
    sta (destination_address_low),y                                   ; 3c5e: 91 72       .r
    iny                                                               ; 3c60: c8          .
    bne relocation2_loop                                              ; 3c61: d0 f9       ..
    inc address1_high                                                 ; 3c63: e6 71       .q
    inc destination_address_high                                      ; 3c65: e6 73       .s
    dex                                                               ; 3c67: ca          .
    bne relocation2_loop                                              ; 3c68: d0 f2       ..

; Relocation 3: Copy $48 bytes of code from $4088 to $0ab7
relocation3
    ldx #0                                                            ; 3c6a: a2 00       ..
relocation3_loop
    lda relocation3_high_copy_start,x                                 ; 3c6c: bd 88 40    ..@
    sta clear_most_of_save_game,x                                     ; 3c6f: 9d b7 0a    ...
    inx                                                               ; 3c72: e8          .
    cpx #relocation3_high_copy_end - relocation3_high_copy_start      ; 3c73: e0 48       .H
    bcc relocation3_loop                                              ; 3c75: 90 f5       ..

; Relocation 4: Copy $100 bytes of code from $3fcb to $0c00
    ldy #0                                                            ; 3c77: a0 00       ..
relocation4_loop
    lda relocation4_high_copy_start,y                                 ; 3c79: b9 cb 3f    ..?
    sta initialise_display,y                                          ; 3c7c: 99 00 0c    ...
    iny                                                               ; 3c7f: c8          .
    bne relocation4_loop                                              ; 3c80: d0 f7       ..

; Relocation 5: Copy $2f bytes of data from $40d0 to $0131
    ldy #0                                                            ; 3c82: a0 00       ..
relocation5_loop
    lda relocation5_high_copy_start,y                                 ; 3c84: b9 d0 40    ..@
    sta update_displayed_transformations_remaining,y                  ; 3c87: 99 31 01    .1.
    iny                                                               ; 3c8a: c8          .
    cpy #relocation5_high_copy_end - relocation5_high_copy_start      ; 3c8b: c0 2f       ./
    bne relocation5_loop                                              ; 3c8d: d0 f5       ..
; Relocation finished

    lda developer_flags                                               ; 3c8f: ad 03 11    ...
    and #8                                                            ; 3c92: 29 08       ).
    beq set_drive_and_directory                                       ; 3c94: f0 05       ..
    lda #'2'                                                          ; 3c96: a9 32       .2
    sta drive_number                                                  ; 3c98: 8d 05 3f    ..?
set_drive_and_directory
    ldx #<(drive_0_command)                                           ; 3c9b: a2 ff       ..
    ldy #>(drive_0_command)                                           ; 3c9d: a0 3e       .>
    jsr oscli                                                         ; 3c9f: 20 f7 ff     ..
    ldx #<(dir_dollar_command)                                        ; 3ca2: a2 07       ..
    ldy #>(dir_dollar_command)                                        ; 3ca4: a0 3f       .?
    jsr oscli                                                         ; 3ca6: 20 f7 ff     ..
    lda #osbyte_close_spool_exec                                      ; 3ca9: a9 77       .w
    jsr osbyte                                                        ; 3cab: 20 f4 ff     ..            ; Close any *SPOOL and *EXEC files
    lda #osbyte_read_write_escape_break_effect                        ; 3cae: a9 c8       ..
    ldx #3                                                            ; 3cb0: a2 03       ..
    ldy #0                                                            ; 3cb2: a0 00       ..
    jsr osbyte                                                        ; 3cb4: 20 f4 ff     ..            ; Write Disable ESCAPE action, clear memory on BREAK, value X=3
    lda #osbyte_read_write_first_byte_break_intercept                 ; 3cb7: a9 f7       ..
    ldx #0                                                            ; 3cb9: a2 00       ..
    ldy #0                                                            ; 3cbb: a0 00       ..
    jsr osbyte                                                        ; 3cbd: 20 f4 ff     ..            ; Write reset intercept code (opcode), value X=0
    lda #osbyte_opt                                                   ; 3cc0: a9 8b       ..
    ldx #0                                                            ; 3cc2: a2 00       ..
    ldy #0                                                            ; 3cc4: a0 00       ..
    jsr osbyte                                                        ; 3cc6: 20 f4 ff     ..            ; *OPT 0,0: Reset all options for current filing system
    lda #osbyte_set_cursor_editing                                    ; 3cc9: a9 04       ..
    ldx #1                                                            ; 3ccb: a2 01       ..
    ldy #0                                                            ; 3ccd: a0 00       ..
    jsr osbyte                                                        ; 3ccf: 20 f4 ff     ..            ; Disable cursor editing (edit keys give ASCII 135-139) (X=1)
; remember default brk and irq vectors
    lda brkv                                                          ; 3cd2: ad 02 02    ...
    sta old_brkv1                                                     ; 3cd5: 8d b1 0a    ...
    sta old_brkv2                                                     ; 3cd8: 8d b3 0a    ...
    lda brkv+1                                                        ; 3cdb: ad 03 02    ...
    sta old_brkv1+1                                                   ; 3cde: 8d b2 0a    ...
    sta old_brkv2+1                                                   ; 3ce1: 8d b4 0a    ...
    lda irq1v                                                         ; 3ce4: ad 04 02    ...
    sta old_irq1v                                                     ; 3ce7: 8d b5 0a    ...
    lda irq1v+1                                                       ; 3cea: ad 05 02    ...
    sta old_irq1v+1                                                   ; 3ced: 8d b6 0a    ...
; redefine character 254 as a diamond shape
    lda #vdu_define_character                                         ; 3cf0: a9 17       ..
    jsr oswrch                                                        ; 3cf2: 20 ee ff     ..            ; Write character 23
    lda #$fe                                                          ; 3cf5: a9 fe       ..
    jsr oswrch                                                        ; 3cf7: 20 ee ff     ..            ; Write character 254
    ldx #0                                                            ; 3cfa: a2 00       ..
define_character_fe_loop
    lda character_fe_bitmap,x                                         ; 3cfc: bd 66 3f    .f?
    jsr oswrch                                                        ; 3cff: 20 ee ff     ..            ; Write character
    inx                                                               ; 3d02: e8          .
    cpx #8                                                            ; 3d03: e0 08       ..
    bcc define_character_fe_loop                                      ; 3d05: 90 f5       ..
    lda #osbyte_set_printer_ignore                                    ; 3d07: a9 06       ..
    ldx #0                                                            ; 3d09: a2 00       ..
    jsr osbyte                                                        ; 3d0b: 20 f4 ff     ..            ; Set printer ignore character to X=0
    lda #$fe                                                          ; 3d0e: a9 fe       ..
    sta currently_loaded_level                                        ; 3d10: 85 37       .7
    lda #0                                                            ; 3d12: a9 00       ..
    sta which_dialog_is_active                                        ; 3d14: 85 04       ..
    lda #$ff                                                          ; 3d16: a9 ff       ..
    sta current_menu_index                                            ; 3d18: 85 2e       ..
; clear the display of remaining transformations
    lda #' '                                                          ; 3d1a: a9 20       .
    sta displayed_transformations_remaining                           ; 3d1c: 85 5c       .\
    sta displayed_transformations_remaining+1                         ; 3d1e: 85 5d       .]
    sta displayed_transformations_remaining+2                         ; 3d20: 85 5e       .^
    lda #$cb                                                          ; 3d22: a9 cb       ..
    sta eor_key                                                       ; 3d24: 85 45       .E
    lda #$ff                                                          ; 3d26: a9 ff       ..
    sta print_in_italics_flag                                         ; 3d28: 85 43       .C
    lda #sprite_op_flags_normal                                       ; 3d2a: a9 00       ..
    sta temp_sprite_x_offset                                          ; 3d2c: 85 3a       .:
    sta temp_sprite_y_offset                                          ; 3d2e: 85 3b       .;
    sta sprite_op_flags                                               ; 3d30: 85 15       ..
    lda #1                                                            ; 3d32: a9 01       ..
    sta sprite_reflect_flag                                           ; 3d34: 85 1d       ..
    lda #osbyte_select_adc_channels                                   ; 3d36: a9 10       ..
    ldx #0                                                            ; 3d38: a2 00       ..
    jsr osbyte                                                        ; 3d3a: 20 f4 ff     ..            ; Disable ADC channel sampling (X=0)
; define envelopes
    ldx #<envelope_1                                                  ; 3d3d: a2 ac       ..
    ldy #>envelope_1                                                  ; 3d3f: a0 38       .8
    jsr define_envelope                                               ; 3d41: 20 5e 39     ^9
    ldx #<envelope_2                                                  ; 3d44: a2 c2       ..
    ldy #>envelope_2                                                  ; 3d46: a0 38       .8
    jsr define_envelope                                               ; 3d48: 20 5e 39     ^9
    ldx #<envelope_3                                                  ; 3d4b: a2 d8       ..
    ldy #>envelope_3                                                  ; 3d4d: a0 38       .8
    jsr define_envelope                                               ; 3d4f: 20 5e 39     ^9
; initialise the 'all clear' and 'all set' tiles
    ldy #7                                                            ; 3d52: a0 07       ..
init_tiles_loop
    lda #0                                                            ; 3d54: a9 00       ..
    sta tile_all_clear_pixels,y                                       ; 3d56: 99 a1 0a    ...
    lda #$ff                                                          ; 3d59: a9 ff       ..
    sta tile_all_set_pixels,y                                         ; 3d5b: 99 a9 0a    ...
    dey                                                               ; 3d5e: 88          .
    bpl init_tiles_loop                                               ; 3d5f: 10 f3       ..
; store special spriteid used for preserving the background behind the player and the
; player's accessory
    lda #spriteid_erase_player                                        ; 3d61: a9 c7       ..
    sta object_erase_type                                             ; 3d63: 8d ac 38    ..8
    lda #spriteid_erase_player_accessory                              ; 3d66: a9 c6       ..
    sta object_erase_type + objectid_player_accessory                 ; 3d68: 8d ad 38    ..8
; set z order for the player at the midway point so that objects can appear in front or
; behind the player
    lda #$80                                                          ; 3d6b: a9 80       ..
    sta object_z_order                                                ; 3d6d: 8d c2 38    ..8
; set z order for the player accessory object as being just in front of the player
    lda #$7f                                                          ; 3d70: a9 7f       ..
    sta object_z_order + objectid_player_accessory                    ; 3d72: 8d c3 38    ..8
; seed random number generation by reading the User VIA timers
    lda user_via_t1c_l                                                ; 3d75: ad 64 fe    .d.
    sta rnd0                                                          ; 3d78: 85 06       ..
    lda user_via_t1c_h                                                ; 3d7a: ad 65 fe    .e.
    sta rnd1                                                          ; 3d7d: 85 07       ..
    lda user_via_t2c_l                                                ; 3d7f: ad 68 fe    .h.
    sta rnd2                                                          ; 3d82: 85 08       ..
    lda user_via_t2c_h                                                ; 3d84: ad 69 fe    .i.
    sta rnd3                                                          ; 3d87: 85 09       ..
    lda #1                                                            ; 3d89: a9 01       ..
    sta rnd4                                                          ; 3d8b: 85 0a       ..
; set base address for sprite rendering, $6200 is the main game area
    lda #$62 ; 'b'                                                    ; 3d8d: a9 62       .b
    sta screen_base_address_high                                      ; 3d8f: 85 4c       .L
; Check to see if VDU output was disabled (VDU 21) when we first started to execute,
; before we re-enabled output (VDU 6) ourselves.
; This could be to make the G file self-contained if it's run directly from the command
; line during development, instead of from IMOGEN
    lda initial_screen_disabled_flag                                  ; 3d91: ad 6e 3f    .n?
    bne clear_toolbar_part_of_screen                                  ; 3d94: d0 0d       ..
; VDU output wasn't disabled when we started to execute. Change to MODE 4.
    lda #vdu_set_mode                                                 ; 3d96: a9 16       ..
    jsr oswrch                                                        ; 3d98: 20 ee ff     ..            ; Write character 22
    lda #4                                                            ; 3d9b: a9 04       ..
    jsr oswrch                                                        ; 3d9d: 20 ee ff     ..            ; Write character 4
    jmp define_text_window                                            ; 3da0: 4c b9 3d    L.=

; Clear memory from $5b00 to $6200. This clears the toolbar area of the screen. The
; toolbar lives in screen memory from $5bc0 to $6200, so this routine clears a little
; before the start of screen memory, but this is OK as we are just about to load sprite
; data there anyway
clear_toolbar_part_of_screen
    lda #0                                                            ; 3da3: a9 00       ..             ; set start address to $5b00
    sta address1_low                                                  ; 3da5: 85 70       .p
    tay                                                               ; 3da7: a8          .
    ldx #>start_of_screen_memory                                      ; 3da8: a2 5b       .[
    stx address1_high                                                 ; 3daa: 86 71       .q
    ldx screen_base_address_high                                      ; 3dac: a6 4c       .L
clear_toolbar_part_of_screen_loop
    sta (address1_low),y                                              ; 3dae: 91 70       .p
    iny                                                               ; 3db0: c8          .
    bne clear_toolbar_part_of_screen_loop                             ; 3db1: d0 fb       ..
    inc address1_high                                                 ; 3db3: e6 71       .q
    cpx address1_high                                                 ; 3db5: e4 71       .q
    bne clear_toolbar_part_of_screen_loop                             ; 3db7: d0 f5       ..
; Define text window that excludes the leftmost column (left 1, bottom 31, right: 39,
; top: 0). This simplifies printing text in dialog boxes.
define_text_window
    lda #vdu_define_text_window                                       ; 3db9: a9 1c       ..
    jsr oswrch                                                        ; 3dbb: 20 ee ff     ..            ; Write character 28
    lda #1                                                            ; 3dbe: a9 01       ..
    jsr oswrch                                                        ; 3dc0: 20 ee ff     ..            ; Write character 1
    lda #$1f                                                          ; 3dc3: a9 1f       ..
    jsr oswrch                                                        ; 3dc5: 20 ee ff     ..            ; Write character 31
    lda #screen_width_minus_one                                       ; 3dc8: a9 27       .'
    jsr oswrch                                                        ; 3dca: 20 ee ff     ..            ; Write character 39
    lda #0                                                            ; 3dcd: a9 00       ..
    jsr oswrch                                                        ; 3dcf: 20 ee ff     ..            ; Write character 0
; set background text colour to 1
    lda #vdu_set_text_colour                                          ; 3dd2: a9 11       ..
    jsr oswrch                                                        ; 3dd4: 20 ee ff     ..            ; Write character 17
    lda #$81                                                          ; 3dd7: a9 81       ..
    jsr oswrch                                                        ; 3dd9: 20 ee ff     ..            ; Write character 129
; set foreground text colour to 0
    lda #vdu_set_text_colour                                          ; 3ddc: a9 11       ..
    jsr oswrch                                                        ; 3dde: 20 ee ff     ..            ; Write character 17
    lda #0                                                            ; 3de1: a9 00       ..
    jsr oswrch                                                        ; 3de3: 20 ee ff     ..            ; Write character 0
; set graphics foreground colour to 0
    lda #vdu_set_graphics_colour                                      ; 3de6: a9 12       ..
    jsr oswrch                                                        ; 3de8: 20 ee ff     ..            ; Write character 18
    lda #0                                                            ; 3deb: a9 00       ..
    jsr oswrch                                                        ; 3ded: 20 ee ff     ..            ; Write character 0
    jsr oswrch                                                        ; 3df0: 20 ee ff     ..            ; Write character
; read *TV shift setting
    ldx #0                                                            ; 3df3: a2 00       ..
    ldy #0                                                            ; 3df5: a0 00       ..
    lda #osbyte_tv                                                    ; 3df7: a9 90       ..
    jsr osbyte                                                        ; 3df9: 20 f4 ff     ..            ; *TV 0,0 turn interlace on
; remember *TV shift setting
    stx address1_low                                                  ; 3dfc: 86 70       .p             ; X is the previous screen shift setting
    jsr osbyte                                                        ; 3dfe: 20 f4 ff     ..            ; restore previous *TV setting (since we changed it in the process of reading it)
; Set CRTC registers
    lda #crtc_cursor_start                                            ; 3e01: a9 0a       ..
    sta crtc_address_register                                         ; 3e03: 8d 00 fe    ...
    lda #$20 ; ' '                                                    ; 3e06: a9 20       .
    sta crtc_address_write                                            ; 3e08: 8d 01 fe    ...
    lda #$0b                                                          ; 3e0b: a9 0b       ..             ; redundant instruction
    lda #0                                                            ; 3e0d: a9 00       ..             ; redundant instruction
; Calculate 35+tv shift and store in vertical_sync_amount_for_crtc_register
    lda #35                                                           ; 3e0f: a9 23       .#
    clc                                                               ; 3e11: 18          .
    adc address1_low                                                  ; 3e12: 65 70       ep
    sec                                                               ; 3e14: 38          8
    sbc #1                                                            ; 3e15: e9 01       ..
    sta vertical_sync_amount_for_crtc_register                        ; 3e17: 8d 0b 11    ...
    sec                                                               ; 3e1a: 38          8              ; subtract five
    sbc #5                                                            ; 3e1b: e9 05       ..
    tax                                                               ; 3e1d: aa          .
    lda #crtc_vert_sync_pos                                           ; 3e1e: a9 07       ..
    sta crtc_address_register                                         ; 3e20: 8d 00 fe    ...
    stx crtc_address_write                                            ; 3e23: 8e 01 fe    ...
    lda #crtc_screen_start_low                                        ; 3e26: a9 0d       ..
    sta crtc_address_register                                         ; 3e28: 8d 00 fe    ...
    lda #$40 ; '@'                                                    ; 3e2b: a9 40       .@
    sta crtc_address_write                                            ; 3e2d: 8d 01 fe    ...
    lda #crtc_screen_start_high                                       ; 3e30: a9 0c       ..
    sta crtc_address_register                                         ; 3e32: 8d 00 fe    ...
    lda #$0c                                                          ; 3e35: a9 0c       ..
    sta crtc_address_write                                            ; 3e37: 8d 01 fe    ...
    lda #crtc_vert_displayed                                          ; 3e3a: a9 06       ..
    sta crtc_address_register                                         ; 3e3c: 8d 00 fe    ...
    lda #$18                                                          ; 3e3f: a9 18       ..
    sta crtc_address_write                                            ; 3e41: 8d 01 fe    ...
    lda #crtc_interlace_delay                                         ; 3e44: a9 08       ..
    sta crtc_address_register                                         ; 3e46: 8d 00 fe    ...
    lda #0                                                            ; 3e49: a9 00       ..
    sta crtc_address_write                                            ; 3e4b: 8d 01 fe    ...
    asl address1_low                                                  ; 3e4e: 06 70       .p             ; Double the *TV shift amount
; Adjust two timing counters depending on the *TV shift amount
    ldy #3                                                            ; 3e50: a0 03       ..             ; Loop counter, goes twice around the loop (Y is decremented twice each time)
adjust_timing_variable_loop
    lda timingA_counter_low,y                                         ; 3e52: b9 04 11    ...
    sec                                                               ; 3e55: 38          8
    sbc address1_low                                                  ; 3e56: e5 70       .p             ; subtract twice the *TV shift amount
    sta timingA_counter_low,y                                         ; 3e58: 99 04 11    ...
    dey                                                               ; 3e5b: 88          .
    dey                                                               ; 3e5c: 88          .
    bpl adjust_timing_variable_loop                                   ; 3e5d: 10 f3       ..
; Load sprites
    lda #<sprdata_filename                                            ; 3e5f: a9 80       ..
    sta address1_low                                                  ; 3e61: 85 70       .p
    lda #>sprdata_filename                                            ; 3e63: a9 19       ..
    sta address1_high                                                 ; 3e65: 85 71       .q
    lda #osfile_read_catalogue_info                                   ; 3e67: a9 05       ..
    jsr osfile_wrapper                                                ; 3e69: 20 dc 16     ..
; Load SPRDATA file into memory so it ends just before screen memory at $5bc0.
    lda #<start_of_screen_memory                                      ; 3e6c: a9 c0       ..
    sec                                                               ; 3e6e: 38          8
    sbc osfile_block_start_address_low                                ; 3e6f: e5 7a       .z
    sta sprdata_ptr                                                   ; 3e71: 85 54       .T
    lda #>start_of_screen_memory                                      ; 3e73: a9 5b       .[
    sbc osfile_block_start_address_mid1                               ; 3e75: e5 7b       .{
    sta sprdata_ptr + 1                                               ; 3e77: 85 55       .U
    jsr load_sprdata                                                  ; 3e79: 20 6f 19     o.
; remember where sprite data is loaded
    lda sprdata_ptr                                                   ; 3e7c: a5 54       .T
    pha                                                               ; 3e7e: 48          H
    lda sprdata_ptr + 1                                               ; 3e7f: a5 55       .U
    pha                                                               ; 3e81: 48          H
; 
; Load ICODATA file into memory at address icodata
; 
; ICODATA contains the standard set of sprites for the toolbar. These are drawn once
; and stay on screen permanently, so the the memory used by ICODATA is reused.
; ICODATA also holds a developer_flags byte and the level ordering details, which is
; copied before being reused.
; 
; ICODATA is loaded at $40ff (overwriting 'block_of_code_to_live_at_0400' which has
; already been moved) where it is used, then overwritten.
; 
    ldx #<icodata                                                     ; 3e82: a2 ff       ..
    stx sprdata_ptr                                                   ; 3e84: 86 54       .T
    ldy #>icodata                                                     ; 3e86: a0 40       .@
    sty sprdata_ptr + 1                                               ; 3e88: 84 55       .U
    lda developer_flags                                               ; 3e8a: ad 03 11    ...
    and #4                                                            ; 3e8d: 29 04       ).
    bne read_icodata_using_osword_7f                                  ; 3e8f: d0 10       ..
    lda #<icodata_filename                                            ; 3e91: a9 5e       .^
    sta address1_low                                                  ; 3e93: 85 70       .p
    lda #>icodata_filename                                            ; 3e95: a9 3f       .?
    sta address1_high                                                 ; 3e97: 85 71       .q
    lda #osfile_load                                                  ; 3e99: a9 ff       ..
    jsr osfile_wrapper                                                ; 3e9b: 20 dc 16     ..
    jmp icodata_read_ok                                               ; 3e9e: 4c 0d 3f    L.?

read_icodata_using_osword_7f
    lda #39                                                           ; 3ea1: a9 27       .'             ; seek track 39
    jsr seek_track_a                                                  ; 3ea3: 20 c9 3e     .>
; write special register 'track' with value 127
    lda #$7f                                                          ; 3ea6: a9 7f       ..
    jsr set_track_special_register_to_a                               ; 3ea8: 20 d5 3e     .>
; block read three 256 byte sectors into memory at 'icodata'
    lda #$7f                                                          ; 3eab: a9 7f       ..
    ldx #<(osword_7f_block_read)                                      ; 3ead: a2 f4       ..
    ldy #>(osword_7f_block_read)                                      ; 3eaf: a0 3e       .>
    jsr osword                                                        ; 3eb1: 20 f1 ff     ..            ; Single track single density FDC command (see https://beebwiki.mdfs.net/OSWORDs)
    lda osword_7f_read_result                                         ; 3eb4: ad fe 3e    ..>
    beq read_successful                                               ; 3eb7: f0 08       ..
; read failed, seek track zero and try again
    lda #0                                                            ; 3eb9: a9 00       ..
    jsr seek_track_a                                                  ; 3ebb: 20 c9 3e     .>
    jmp read_icodata_using_osword_7f                                  ; 3ebe: 4c a1 3e    L.>

; write special register 'track' with value 39
read_successful
    lda #39                                                           ; 3ec1: a9 27       .'
    jsr set_track_special_register_to_a                               ; 3ec3: 20 d5 3e     .>
    jmp icodata_read_ok                                               ; 3ec6: 4c 0d 3f    L.?

seek_track_a
    sta osword_7f_block_seek_track                                    ; 3ec9: 8d e8 3e    ..>
    lda #$7f                                                          ; 3ecc: a9 7f       ..
    ldx #<(osword_7f_block_seek)                                      ; 3ece: a2 e1       ..
    ldy #>(osword_7f_block_seek)                                      ; 3ed0: a0 3e       .>
    jmp osword                                                        ; 3ed2: 4c f1 ff    L..            ; Single track single density FDC command (see https://beebwiki.mdfs.net/OSWORDs)

set_track_special_register_to_a
    sta osword_7f_block_write_special_register_track                  ; 3ed5: 8d f2 3e    ..>
    lda #$7f                                                          ; 3ed8: a9 7f       ..
    ldx #<(osword_7f_block_write_special_register)                    ; 3eda: a2 ea       ..
    ldy #>(osword_7f_block_write_special_register)                    ; 3edc: a0 3e       .>
    jmp osword                                                        ; 3ede: 4c f1 ff    L..            ; Single track single density FDC command (see https://beebwiki.mdfs.net/OSWORDs)

osword_7f_block_seek
    !byte 0                                                           ; 3ee1: 00          .              ; drive
    !word $ffff,     0                                                ; 3ee2: ff ff 00... ...            ; data address
    !byte 1                                                           ; 3ee6: 01          .              ; number of parameters
    !byte $69                                                         ; 3ee7: 69          i              ; command ($69=seek)
osword_7f_block_seek_track
    !byte 0                                                           ; 3ee8: 00          .
osword_7f_seek_result
    !byte 0                                                           ; 3ee9: 00          .
osword_7f_block_write_special_register
    !byte 0                                                           ; 3eea: 00          .              ; drive
    !word $ffff,     0                                                ; 3eeb: ff ff 00... ...            ; data address
    !byte 2                                                           ; 3eef: 02          .              ; number of parameters
    !byte $7a                                                         ; 3ef0: 7a          z              ; command ($7a=write special register)
    !byte $12                                                         ; 3ef1: 12          .              ; special register ($12=track)
osword_7f_block_write_special_register_track
    !byte 0                                                           ; 3ef2: 00          .
osword_7f_write_special_register_result
    !byte 0                                                           ; 3ef3: 00          .
; TODO: I think the track and sector values in this block are logical tracks and rely
; on the previous step operation, but I'm not sure. I suspect this is done entirely for
; obfuscation and has been converted to file operations in this version, but I haven't
; actually checked that.
osword_7f_block_read
    !byte 0                                                           ; 3ef4: 00          .              ; drive
    !word icodata,       0                                            ; 3ef5: ff 40 00... .@.            ; data address
    !byte 3                                                           ; 3ef9: 03          .              ; number of parameters
    !byte $53                                                         ; 3efa: 53          S              ; command ($53=read data)
    !byte $7f                                                         ; 3efb: 7f          .              ; track
    !byte $7d                                                         ; 3efc: 7d          }              ; sector
    !byte $23                                                         ; 3efd: 23          #              ; size+count ($23=3 256 byte sectors)
osword_7f_read_result
    !byte 0                                                           ; 3efe: 00          .
drive_0_command
    !text "DRIVE "                                                    ; 3eff: 44 52 49... DRI
drive_number
    !byte '0', $0d                                                    ; 3f05: 30 0d       0.
dir_dollar_command
    !text "DIR $"                                                     ; 3f07: 44 49 52... DIR
    !byte $0d                                                         ; 3f0c: 0d          .

icodata_read_ok
    lda #0                                                            ; 3f0d: a9 00       ..             ; Get the address of the first 'sprite' which is actually level ordering data
    jsr get_address_of_sprite_a                                       ; 3f0f: 20 2c 13     ,.
    stx address1_low                                                  ; 3f12: 86 70       .p
    sty address1_high                                                 ; 3f14: 84 71       .q
; Copy seventeen bytes of level ordering data into the level_ordering_table
    ldy #17                                                           ; 3f16: a0 11       ..
copy_level_ordering_table_loop
    lda (address1_low),y                                              ; 3f18: b1 70       .p
    sta level_ordering_table - 1,y                                    ; 3f1a: 99 7e 0a    .~.
    dey                                                               ; 3f1d: 88          .
    bne copy_level_ordering_table_loop                                ; 3f1e: d0 f8       ..
; read the first byte of the data. If bit 6 is set then set the developer_flags.
    lda (address1_low),y                                              ; 3f20: b1 70       .p
    and #%01000000                                                    ; 3f22: 29 40       )@
    beq skip_writing_developer_flags                                  ; 3f24: f0 07       ..
    lda (address1_low),y                                              ; 3f26: b1 70       .p
    and #%10111111                                                    ; 3f28: 29 bf       ).
    sta developer_flags                                               ; 3f2a: 8d 03 11    ...
skip_writing_developer_flags
    jsr handle_developer_mode_setup                                   ; 3f2d: 20 6f 3f     o?
    lda #osbyte_reset_soft_keys                                       ; 3f30: a9 12       ..
    jsr osbyte                                                        ; 3f32: 20 f4 ff     ..            ; Reset function keys
    jsr reset_menu_items                                              ; 3f35: 20 80 29     .)
    jsr draw_menu_icons                                               ; 3f38: 20 a8 29     .)
    lda screen_base_address_high                                      ; 3f3b: a5 4c       .L
    pha                                                               ; 3f3d: 48          H
    lda #>toolbar_screen_address                                      ; 3f3e: a9 58       .X
    sta screen_base_address_high                                      ; 3f40: 85 4c       .L
    ldx #36                                                           ; 3f42: a2 24       .$
    ldy #6                                                            ; 3f44: a0 06       ..
    lda #spriteid_icodata_box                                         ; 3f46: a9 09       ..
    jsr draw_sprite_a_at_cell_xy                                      ; 3f48: 20 4c 1f     L.
    pla                                                               ; 3f4b: 68          h
    sta screen_base_address_high                                      ; 3f4c: 85 4c       .L
    pla                                                               ; 3f4e: 68          h
    sta sprdata_ptr + 1                                               ; 3f4f: 85 55       .U
    pla                                                               ; 3f51: 68          h
    sta sprdata_ptr                                                   ; 3f52: 85 54       .T
; start in one of four random levels
    lda #3                                                            ; 3f54: a9 03       ..
    jsr get_random_number_up_to_a                                     ; 3f56: 20 a6 18     ..
    sta initial_level_number_div4                                     ; 3f59: 85 5f       ._
    jmp start_game                                                    ; 3f5b: 4c 0c 11    L..

icodata_filename
    !text "icodata", $0d                                              ; 3f5e: 69 63 6f... ico
character_fe_bitmap
    !byte %....#...                                                   ; 3f66: 08          .
    !byte %...#.#..                                                   ; 3f67: 14          .
    !byte %..#...#.                                                   ; 3f68: 22          "
    !byte %.#.....#                                                   ; 3f69: 41          A
    !byte %..#...#.                                                   ; 3f6a: 22          "
    !byte %...#.#..                                                   ; 3f6b: 14          .
    !byte %....#...                                                   ; 3f6c: 08          .
    !byte %........                                                   ; 3f6d: 00          .
initial_screen_disabled_flag
    !byte 0                                                           ; 3f6e: 00          .

handle_developer_mode_setup
    lda developer_flags                                               ; 3f6f: ad 03 11    ...
    and #1                                                            ; 3f72: 29 01       ).
    sta developer_mode_sideways_ram_is_set_up_flag                    ; 3f74: 85 5b       .[
    beq return28                                                      ; 3f76: f0 42       .B
; The following code assumes there may be a ROM image stored in sideways RAM at $8000.
; It copies 16 bytes of an empty ROM image to the start of sideways RAM. This
; overwrites any existing ROM image held in sideways RAM. Is this some copy protection,
; or a development environment?
    ldy #sideways_rom_image_source_end - sideways_rom_image_source_start - 1; 3f78: a0 0f       ..
    sei                                                               ; 3f7a: 78          x
copy_to_sideways_ram_loop1
    lda sideways_rom_image_source_start,y                             ; 3f7b: b9 bb 3f    ..?
    sta end_of_screen_memory,y                                        ; 3f7e: 99 00 80    ...
    dey                                                               ; 3f81: 88          .
    bpl copy_to_sideways_ram_loop1                                    ; 3f82: 10 f7       ..
    cli                                                               ; 3f84: 58          X
; Copy 256 bytes from quit_to_basic to $be00, and 256 bytes from $0b00 to $bf00.
    ldy #0                                                            ; 3f85: a0 00       ..
copy_to_sideways_ram_loop2
    lda quit_to_basic,y                                               ; 3f87: b9 2c 40    .,@
    sta sideways_ram_be00,y                                           ; 3f8a: 99 00 be    ...
    lda area_to_copy_to_or_from_sideways_ram,y                        ; 3f8d: b9 00 0b    ...
    sta sideways_ram_bf00,y                                           ; 3f90: 99 00 bf    ...
    iny                                                               ; 3f93: c8          .
    bne copy_to_sideways_ram_loop2                                    ; 3f94: d0 f1       ..
    lda #osbyte_read_write_escape_break_effect                        ; 3f96: a9 c8       ..
    ldx #1                                                            ; 3f98: a2 01       ..
    ldy #0                                                            ; 3f9a: a0 00       ..
    jsr osbyte                                                        ; 3f9c: 20 f4 ff     ..            ; Write Disable ESCAPE action, set normal BREAK action, value X=1
; The reset intercept code is set to 'JMP reset_code'
    lda #osbyte_read_write_first_byte_break_intercept                 ; 3f9f: a9 f7       ..
; JMP opcode
    ldx #opcode_jmp                                                   ; 3fa1: a2 4c       .L
    ldy #0                                                            ; 3fa3: a0 00       ..
    jsr osbyte                                                        ; 3fa5: 20 f4 ff     ..            ; Write reset intercept code (opcode), value X=76
    lda #osbyte_read_write_second_byte_break_intercept                ; 3fa8: a9 f8       ..
    ldx #<reset_code                                                  ; 3faa: a2 45       .E
    ldy #0                                                            ; 3fac: a0 00       ..
    jsr osbyte                                                        ; 3fae: 20 f4 ff     ..            ; Write reset intercept code (operand low), value X=69
    lda #osbyte_read_write_third_byte_break_intercept                 ; 3fb1: a9 f9       ..
    ldx #>reset_code                                                  ; 3fb3: a2 18       ..
    ldy #0                                                            ; 3fb5: a0 00       ..
    jsr osbyte                                                        ; 3fb7: 20 f4 ff     ..            ; Write reset intercept code (operand high), value X=24
return28
    rts                                                               ; 3fba: 60          `

sideways_rom_image_source_start

!pseudopc $8000 {
end_of_screen_memory
sideways_rom_image_dest
    jmp sideways_rom_return                                           ; 3fbb: 4c 08 80    L.. :8000[6]   ; language entry point

    jmp sideways_rom_return                                           ; 3fbe: 4c 08 80    L.. :8003[6]   ; service entry point

    !byte 0                                                           ; 3fc1: 00          .   :8006[6]   ; ROM type flag
    !byte $0a                                                         ; 3fc2: 0a          .   :8007[6]   ; empty copyright string

sideways_rom_return
    rts                                                               ; 3fc3: 60          `   :8008[6]   ; do nothing - return

    !byte 0, 0, 0, 0, 0, 0, 0                                         ; 3fc4: 00 00 00... ... :8009[6]   ; unused bytes
}

sideways_rom_image_source_end
relocation4_high_copy_start

!pseudopc $0c00 {
; Initialise display
; 
; 1. Set toolbar and game area colours
; 2. Initialise the system timer to interrupt at the right time to change palettes
; 3. Initialise the irq routine address
; 4. Set the crtc registers
; 
initialise_display
collision_map
    lda #$ff                                                          ; 3fcb: a9 ff       ..  :0c00[4]
    sta display_initialised_flag                                      ; 3fcd: 8d 0a 11    ... :0c02[4]
    lda pending_toolbar_colour                                        ; 3fd0: ad 5d 17    .]. :0c05[4]
    sta toolbar_colour                                                ; 3fd3: 8d 5e 17    .^. :0c08[4]
    lda pending_gameplay_area_colour                                  ; 3fd6: ad 5f 17    ._. :0c0b[4]
    sta gameplay_area_colour                                          ; 3fd9: 8d 60 17    .`. :0c0e[4]
    sei                                                               ; 3fdc: 78          x   :0c11[4]
    lda #$7f                                                          ; 3fdd: a9 7f       ..  :0c12[4]
    sta user_via_ier                                                  ; 3fdf: 8d 6e fe    .n. :0c14[4]
    lda #$c0                                                          ; 3fe2: a9 c0       ..  :0c17[4]
    sta system_via_acr                                                ; 3fe4: 8d 4b fe    .K. :0c19[4]
    lda #$ff                                                          ; 3fe7: a9 ff       ..  :0c1c[4]
    sta system_via_t2c_l                                              ; 3fe9: 8d 48 fe    .H. :0c1e[4]
    lda #$3c ; '<'                                                    ; 3fec: a9 3c       .<  :0c21[4]
    sta system_via_ier                                                ; 3fee: 8d 4e fe    .N. :0c23[4]
    lda #<irq1_routine                                                ; 3ff1: a9 a0       ..  :0c26[4]
    sta irq1v                                                         ; 3ff3: 8d 04 02    ... :0c28[4]
    lda #>irq1_routine                                                ; 3ff6: a9 17       ..  :0c2b[4]
    sta irq1v+1                                                       ; 3ff8: 8d 05 02    ... :0c2d[4]
    cli                                                               ; 3ffb: 58          X   :0c30[4]
    jsr wait_for_vsync                                                ; 3ffc: 20 8c 17     .. :0c31[4]
    jsr wait_for_vsync                                                ; 3fff: 20 8c 17     .. :0c34[4]
    lda #crtc_vert_sync_pos                                           ; 4002: a9 07       ..  :0c37[4]
    sta crtc_address_register                                         ; 4004: 8d 00 fe    ... :0c39[4]
    lda vertical_sync_amount_for_crtc_register                        ; 4007: ad 0b 11    ... :0c3c[4]
    sta crtc_address_write                                            ; 400a: 8d 01 fe    ... :0c3f[4]
    lda #crtc_screen_start_low                                        ; 400d: a9 0d       ..  :0c42[4]
    sta crtc_address_register                                         ; 400f: 8d 00 fe    ... :0c44[4]
    lda #$78 ; 'x'                                                    ; 4012: a9 78       .x  :0c47[4]
    sta crtc_address_write                                            ; 4014: 8d 01 fe    ... :0c49[4]
    lda #crtc_screen_start_high                                       ; 4017: a9 0c       ..  :0c4c[4]
    sta crtc_address_register                                         ; 4019: 8d 00 fe    ... :0c4e[4]
    lda #$0b                                                          ; 401c: a9 0b       ..  :0c51[4]
    sta crtc_address_write                                            ; 401e: 8d 01 fe    ... :0c53[4]
    lda #crtc_vert_displayed                                          ; 4021: a9 06       ..  :0c56[4]
    sta crtc_address_register                                         ; 4023: 8d 00 fe    ... :0c58[4]
    lda #$1d                                                          ; 4026: a9 1d       ..  :0c5b[4]
    sta crtc_address_write                                            ; 4028: 8d 01 fe    ... :0c5d[4]
    rts                                                               ; 402b: 60          `   :0c60[4]

}

quit_to_basic
    sei                                                               ; 402c: 78          x
    lda old_irq1v                                                     ; 402d: ad b5 0a    ...
    sta irq1v                                                         ; 4030: 8d 04 02    ...
    lda old_irq1v+1                                                   ; 4033: ad b6 0a    ...
    sta irq1v+1                                                       ; 4036: 8d 05 02    ...
    cli                                                               ; 4039: 58          X
    lda #vdu_printer_off                                              ; 403a: a9 03       ..
    jsr oswrch                                                        ; 403c: 20 ee ff     ..            ; Write character 3
    lda #vdu_set_mode                                                 ; 403f: a9 16       ..
    jsr oswrch                                                        ; 4041: 20 ee ff     ..            ; Write character 22
    lda #7                                                            ; 4044: a9 07       ..
    jsr oswrch                                                        ; 4046: 20 ee ff     ..            ; Write character 7
    lda #osbyte_set_cursor_editing                                    ; 4049: a9 04       ..
    ldx #0                                                            ; 404b: a2 00       ..
    ldy #0                                                            ; 404d: a0 00       ..
    jsr osbyte                                                        ; 404f: 20 f4 ff     ..            ; Enable cursor editing (X=0)
    lda #osbyte_read_write_escape_break_effect                        ; 4052: a9 c8       ..
    ldx #0                                                            ; 4054: a2 00       ..
    ldy #0                                                            ; 4056: a0 00       ..
    jsr osbyte                                                        ; 4058: 20 f4 ff     ..            ; Write Set normal ESCAPE action, set normal BREAK action, value X=0
    lda #osbyte_flush_buffer_class                                    ; 405b: a9 0f       ..
    ldx #0                                                            ; 405d: a2 00       ..
    jsr osbyte                                                        ; 405f: 20 f4 ff     ..            ; Flush all buffers (X=0)
    lda #0                                                            ; 4062: a9 00       ..
    sta first_byte_break_intercept                                    ; 4064: 8d 87 02    ...
    pla                                                               ; 4067: 68          h
    pla                                                               ; 4068: 68          h
    lda #'B'                                                          ; 4069: a9 42       .B
    sta address1_low                                                  ; 406b: 85 70       .p
    lda #'A'                                                          ; 406d: a9 41       .A
    sta address1_low + 1                                              ; 406f: 85 71       .q
    lda #'S'                                                          ; 4071: a9 53       .S
    sta address1_low + 2                                              ; 4073: 85 72       .r
    lda #'I'                                                          ; 4075: a9 49       .I
    sta address1_low + 3                                              ; 4077: 85 73       .s
    lda #'C'                                                          ; 4079: a9 43       .C
    sta address1_low + 4                                              ; 407b: 85 74       .t
    lda #vdu_cr                                                       ; 407d: a9 0d       ..
    sta address1_low + 5                                              ; 407f: 85 75       .u
    ldx #<(address1_low)                                              ; 4081: a2 70       .p
    ldy #>(address1_low)                                              ; 4083: a0 00       ..
    jmp oscli                                                         ; 4085: 4c f7 ff    L..

relocation3_high_copy_start

!pseudopc $0ab7 {
; *************************************************************************************
; 
; Clears $80 bytes from 'level_progress_table' to 'level_workspace'. This is almost all
; of the save game area, bar five bytes at the start which contain the level number,
; checksum, and three bytes for the ascii digits of the transformations remaining.
; These are filled in later.
; 
; *************************************************************************************
clear_most_of_save_game
    lda #0                                                            ; 4088: a9 00       ..  :0ab7[5]
    tax                                                               ; 408a: aa          .   :0ab9[5]
clear_most_of_save_game_data_loop
    sta level_progress_table,x                                        ; 408b: 9d ef 09    ... :0aba[5]
    inx                                                               ; 408e: e8          .   :0abd[5]
    cpx #$80                                                          ; 408f: e0 80       ..  :0abe[5]
    bcc clear_most_of_save_game_data_loop                             ; 4091: 90 f8       ..  :0ac0[5]
    rts                                                               ; 4093: 60          `   :0ac2[5]

; *************************************************************************************
get_checksum_of_save_game_data
    lda #0                                                            ; 4094: a9 00       ..  :0ac3[5]
    tax                                                               ; 4096: aa          .   :0ac5[5]
get_checksum_loop
    eor level_progress_table,x                                        ; 4097: 5d ef 09    ].. :0ac6[5]
    inx                                                               ; 409a: e8          .   :0ac9[5]
    cpx #$80                                                          ; 409b: e0 80       ..  :0aca[5]
    bcc get_checksum_loop                                             ; 409d: 90 f8       ..  :0acc[5]
    eor save_game                                                     ; 409f: 4d ea 09    M.. :0ace[5]
    eor #$ff                                                          ; 40a2: 49 ff       I.  :0ad1[5]
    rts                                                               ; 40a4: 60          `   :0ad3[5]

; *************************************************************************************
; 
; Convert a level filename letter into the section letter as shown in-game
; 
; The index within the level_ordering_table determines the letter returned.
; 
; On Entry:
;     Y: letter as seen in the level filename
; 
; On Exit:
;     Y: section letter (as seen in-game)
;     Preserves A, X
; 
; *************************************************************************************
convert_level_filename_letter_into_section_letter
    cpy #last_level_letter                                            ; 40a5: c0 51       .Q  :0ad4[5]
    beq return29                                                      ; 40a7: f0 26       .&  :0ad6[5]
    pha                                                               ; 40a9: 48          H   :0ad8[5]   ; remember A,X
    txa                                                               ; 40aa: 8a          .   :0ad9[5]
    pha                                                               ; 40ab: 48          H   :0ada[5]
    tya                                                               ; 40ac: 98          .   :0adb[5]
    ldx #num_levels-1                                                 ; 40ad: a2 0f       ..  :0adc[5]
find_letter_loop
    cmp level_ordering_table+1,x                                      ; 40af: dd 80 0a    ... :0ade[5]
    beq found_letter                                                  ; 40b2: f0 03       ..  :0ae1[5]
    dex                                                               ; 40b4: ca          .   :0ae3[5]
    bpl find_letter_loop                                              ; 40b5: 10 f8       ..  :0ae4[5]
found_letter
    txa                                                               ; 40b7: 8a          .   :0ae6[5]
    clc                                                               ; 40b8: 18          .   :0ae7[5]
    adc #first_level_letter                                           ; 40b9: 69 41       iA  :0ae8[5]
    tay                                                               ; 40bb: a8          .   :0aea[5]
    pla                                                               ; 40bc: 68          h   :0aeb[5]   ; recall A,X
    tax                                                               ; 40bd: aa          .   :0aec[5]
    pla                                                               ; 40be: 68          h   :0aed[5]
    rts                                                               ; 40bf: 60          `   :0aee[5]

; *************************************************************************************
; 
; Convert a section letter into the level file letter
; 
; Simple look up.
; 
; On Entry:
;     Y: section letter (as seen in-game)
; 
; On Exit:
;     Y: letter as seen in the level filename
;     Preserves A, X
; 
; *************************************************************************************
convert_section_letter_to_level_filename_letter
    cpy #last_level_letter                                            ; 40c0: c0 51       .Q  :0aef[5]
    beq return29                                                      ; 40c2: f0 0b       ..  :0af1[5]
    pha                                                               ; 40c4: 48          H   :0af3[5]
    tya                                                               ; 40c5: 98          .   :0af4[5]
    sec                                                               ; 40c6: 38          8   :0af5[5]
    sbc #first_level_letter                                           ; 40c7: e9 41       .A  :0af6[5]
    tay                                                               ; 40c9: a8          .   :0af8[5]
    lda level_ordering_table+1,y                                      ; 40ca: b9 80 0a    ... :0af9[5]
    tay                                                               ; 40cd: a8          .   :0afc[5]
    pla                                                               ; 40ce: 68          h   :0afd[5]
return29
    rts                                                               ; 40cf: 60          `   :0afe[5]

}

relocation3_high_copy_end
relocation5_high_copy_start

!pseudopc $0131 {
; Update the transformation count on screen at text position (35-37, 6). This takes
; care to update as few digits on screen as possible, probably to reduce flicker and to
; offset the relatively slow implementation of print_italic.
update_displayed_transformations_remaining
    pha                                                               ; 40d0: 48          H   :0131[3]   ; remember A,X
    txa                                                               ; 40d1: 8a          .   :0132[3]
    pha                                                               ; 40d2: 48          H   :0133[3]
    ldx #2                                                            ; 40d3: a2 02       ..  :0134[3]
digit_loop
    lda current_transformations_remaining,x                           ; 40d5: bd ec 09    ... :0136[3]
    cmp displayed_transformations_remaining,x                         ; 40d8: d5 5c       .\  :0139[3]
    beq digit_unchanged                                               ; 40da: f0 1a       ..  :013b[3]
    sta displayed_transformations_remaining,x                         ; 40dc: 95 5c       .\  :013d[3]
    lda #vdu_goto_xy                                                  ; 40de: a9 1f       ..  :013f[3]
    jsr oswrch                                                        ; 40e0: 20 ee ff     .. :0141[3]   ; Write character 31
    txa                                                               ; 40e3: 8a          .   :0144[3]
    eor #$ff                                                          ; 40e4: 49 ff       I.  :0145[3]
    sec                                                               ; 40e6: 38          8   :0147[3]
    adc #37                                                           ; 40e7: 69 25       i%  :0148[3]
    jsr oswrch                                                        ; 40e9: 20 ee ff     .. :014a[3]   ; Write character
    lda #6                                                            ; 40ec: a9 06       ..  :014d[3]
    jsr oswrch                                                        ; 40ee: 20 ee ff     .. :014f[3]   ; Write character 6
    lda displayed_transformations_remaining,x                         ; 40f1: b5 5c       .\  :0152[3]
    jsr print_italic                                                  ; 40f3: 20 66 18     f. :0154[3]
digit_unchanged
    dex                                                               ; 40f6: ca          .   :0157[3]
    cpx #$ff                                                          ; 40f7: e0 ff       ..  :0158[3]
    bne digit_loop                                                    ; 40f9: d0 da       ..  :015a[3]
    pla                                                               ; 40fb: 68          h   :015c[3]   ; recall A,X
    tax                                                               ; 40fc: aa          .   :015d[3]
    pla                                                               ; 40fd: 68          h   :015e[3]
    rts                                                               ; 40fe: 60          `   :015f[3]

}

relocation5_high_copy_end
icodata
relocation1_high_copy_start

!pseudopc $0400 {
wait_for_timingB_counter
    ldx timingB_counter_low                                           ; 40ff: ae 06 11    ... :0400[2]
    ldy timingB_counter_high                                          ; 4102: ac 07 11    ... :0403[2]
    jmp wait_for_timer_2_using_yx                                     ; 4105: 4c 91 17    L.. :0406[2]

current_text_width
    !byte $12                                                         ; 4108: 12          .   :0409[2]

show_dialog_box
    jsr wait_for_timingB_counter                                      ; 4109: 20 00 04     .. :040a[2]
; check if a dialog box is already active
    lda which_dialog_is_active                                        ; 410c: a5 04       ..  :040d[2]
    beq no_existing_dialog_box_shown                                  ; 410e: f0 29       .)  :040f[2]
    jsr turn_cursor_off                                               ; 4110: 20 63 38     c8 :0411[2]
; Replace dialog box
; Don't write to collision map
    ldx #collision_map_out_of_bounds                                  ; 4113: a2 ff       ..  :0414[2]
    stx value_to_write_to_collision_map                               ; 4115: 86 3e       .>  :0416[2]
    inx                                                               ; 4117: e8          .   :0418[2]
    stx only_ever_written_to_with_zero                                ; 4118: 86 3f       .?  :0419[2]
; choose the 'all set' tile
    lda #<tile_all_set_pixels                                         ; 411a: a9 a9       ..  :041b[2]
    sta source_sprite_memory_low                                      ; 411c: 85 40       .@  :041d[2]
    lda #>tile_all_set_pixels                                         ; 411e: a9 0a       ..  :041f[2]
    sta source_sprite_memory_high                                     ; 4120: 85 41       .A  :0421[2]
; copy_mode = 1 (simple copy)
    inx                                                               ; 4122: e8          .   :0423[2]
    stx copy_mode                                                     ; 4123: 86 42       .B  :0424[2]
    ldy #1                                                            ; 4125: a0 01       ..  :0426[2]
    lda current_text_width                                            ; 4127: ad 09 04    ... :0428[2]
    sec                                                               ; 412a: 38          8   :042b[2]
    sbc #2                                                            ; 412b: e9 02       ..  :042c[2]
    sta width_in_cells                                                ; 412d: 85 3c       .<  :042e[2]
    lda #3                                                            ; 412f: a9 03       ..  :0430[2]
    sta height_in_cells                                               ; 4131: 85 3d       .=  :0432[2]
    jsr copy_rectangle_of_memory_to_screen                            ; 4133: 20 bb 1a     .. :0434[2]
    jmp vdu_goto_0_9                                                  ; 4136: 4c 44 04    LD. :0437[2]

no_existing_dialog_box_shown
    lda #$ff                                                          ; 4139: a9 ff       ..  :043a[2]
    sta which_dialog_is_active                                        ; 413b: 85 04       ..  :043c[2]
    jsr remember_screen_memory_before_showing_dialog_box              ; 413d: 20 74 04     t. :043e[2]
    jsr plot_dialog_box                                               ; 4140: 20 cb 04     .. :0441[2]
vdu_goto_0_9
    lda #vdu_goto_xy                                                  ; 4143: a9 1f       ..  :0444[2]
    jsr oswrch                                                        ; 4145: 20 ee ff     .. :0446[2]   ; Write character 31
    lda #0                                                            ; 4148: a9 00       ..  :0449[2]
    jsr oswrch                                                        ; 414a: 20 ee ff     .. :044b[2]   ; Write character 0
    lda #9                                                            ; 414d: a9 09       ..  :044e[2]
    jmp oswrch                                                        ; 414f: 4c ee ff    L.. :0450[2]   ; Write character 9

remove_dialog
    lda which_dialog_is_active                                        ; 4152: a5 04       ..  :0453[2]
    beq return30                                                      ; 4154: f0 1c       ..  :0455[2]
; clear away the active dialog
    jsr wait_for_timingB_counter                                      ; 4156: 20 00 04     .. :0457[2]
    jsr turn_cursor_off                                               ; 4159: 20 63 38     c8 :045a[2]
    ldx #collision_map_out_of_bounds                                  ; 415c: a2 ff       ..  :045d[2]
    stx value_to_write_to_collision_map                               ; 415e: 86 3e       .>  :045f[2]
; copy_mode = 255 (just copy from memory in sequence)
    stx copy_mode                                                     ; 4160: 86 42       .B  :0461[2]
    inx                                                               ; 4162: e8          .   :0463[2]
    stx which_dialog_is_active                                        ; 4163: 86 04       ..  :0464[2]
    stx only_ever_written_to_with_zero                                ; 4165: 86 3f       .?  :0466[2]
; copy from offscreen cache of what was underneath the dialog box
    lda #<cache_of_screen_memory_under_dialog                         ; 4167: a9 30       .0  :0468[2]
    sta source_sprite_memory_low                                      ; 4169: 85 40       .@  :046a[2]
    lda #>cache_of_screen_memory_under_dialog                         ; 416b: a9 05       ..  :046c[2]
    sta source_sprite_memory_high                                     ; 416d: 85 41       .A  :046e[2]
    jmp copy_to_rectangle_of_screen_memory_from_offscreen             ; 416f: 4c 05 05    L.. :0470[2]

return30
    rts                                                               ; 4172: 60          `   :0473[2]

remember_screen_memory_before_showing_dialog_box
    lda #0                                                            ; 4173: a9 00       ..  :0474[2]   ; set screen addresses
    sta first_cell_in_row_screen_address_low                          ; 4175: 85 74       .t  :0476[2]
    sta cell_screen_address_low                                       ; 4177: 85 76       .v  :0478[2]
    lda screen_base_address_high                                      ; 4179: a5 4c       .L  :047a[2]
    sta first_cell_in_row_screen_address_high                         ; 417b: 85 75       .u  :047c[2]
    sta cell_screen_address_high                                      ; 417d: 85 77       .w  :047e[2]
; set destination address
    lda #<cache_of_screen_memory_under_dialog                         ; 417f: a9 30       .0  :0480[2]
    sta off_screen_address_low                                        ; 4181: 85 7a       .z  :0482[2]
    lda #>cache_of_screen_memory_under_dialog                         ; 4183: a9 05       ..  :0484[2]
    sta off_screen_address_high                                       ; 4185: 85 7b       .{  :0486[2]
    clc                                                               ; 4187: 18          .   :0488[2]
; set number of rows
    lda #5                                                            ; 4188: a9 05       ..  :0489[2]
    sta height_in_cells_to_write                                      ; 418a: 85 73       .s  :048b[2]
copy_row_loop
    ldx current_text_width                                            ; 418c: ae 09 04    ... :048d[2]
copy_cells_loop
    ldy #7                                                            ; 418f: a0 07       ..  :0490[2]
copy_cell_loop
    lda (cell_screen_address_low),y                                   ; 4191: b1 76       .v  :0492[2]
    sta (off_screen_address_low),y                                    ; 4193: 91 7a       .z  :0494[2]
    dey                                                               ; 4195: 88          .   :0496[2]
    bpl copy_cell_loop                                                ; 4196: 10 f9       ..  :0497[2]
; move destination to next cell along
    lda off_screen_address_low                                        ; 4198: a5 7a       .z  :0499[2]
    adc #8                                                            ; 419a: 69 08       i.  :049b[2]
    sta off_screen_address_low                                        ; 419c: 85 7a       .z  :049d[2]
    bcc skip_high_byte1                                               ; 419e: 90 03       ..  :049f[2]
    inc off_screen_address_high                                       ; 41a0: e6 7b       .{  :04a1[2]
    clc                                                               ; 41a2: 18          .   :04a3[2]
skip_high_byte1
    dex                                                               ; 41a3: ca          .   :04a4[2]
    beq move_to_next_row                                              ; 41a4: f0 0d       ..  :04a5[2]
; move source to next cell along
    lda cell_screen_address_low                                       ; 41a6: a5 76       .v  :04a7[2]
    adc #8                                                            ; 41a8: 69 08       i.  :04a9[2]
    sta cell_screen_address_low                                       ; 41aa: 85 76       .v  :04ab[2]
    bcc copy_cells_loop                                               ; 41ac: 90 e1       ..  :04ad[2]
    inc cell_screen_address_high                                      ; 41ae: e6 77       .w  :04af[2]
    clc                                                               ; 41b0: 18          .   :04b1[2]
    bcc copy_cells_loop                                               ; 41b1: 90 dc       ..  :04b2[2]
move_to_next_row
    dec height_in_cells_to_write                                      ; 41b3: c6 73       .s  :04b4[2]
    beq return31                                                      ; 41b5: f0 12       ..  :04b6[2]
; move to next screen row
    lda first_cell_in_row_screen_address_low                          ; 41b7: a5 74       .t  :04b8[2]
    adc #$40 ; '@'                                                    ; 41b9: 69 40       i@  :04ba[2]
    sta first_cell_in_row_screen_address_low                          ; 41bb: 85 74       .t  :04bc[2]
    sta cell_screen_address_low                                       ; 41bd: 85 76       .v  :04be[2]
    lda first_cell_in_row_screen_address_high                         ; 41bf: a5 75       .u  :04c0[2]
    adc #1                                                            ; 41c1: 69 01       i.  :04c2[2]
    sta first_cell_in_row_screen_address_high                         ; 41c3: 85 75       .u  :04c4[2]
    sta cell_screen_address_high                                      ; 41c5: 85 77       .w  :04c6[2]
    bcc copy_row_loop                                                 ; 41c7: 90 c3       ..  :04c8[2]
return31
    rts                                                               ; 41c9: 60          `   :04ca[2]

plot_dialog_box
    ldx #collision_map_out_of_bounds                                  ; 41ca: a2 ff       ..  :04cb[2]
    stx value_to_write_to_collision_map                               ; 41cc: 86 3e       .>  :04cd[2]
    inx                                                               ; 41ce: e8          .   :04cf[2]
    stx only_ever_written_to_with_zero                                ; 41cf: 86 3f       .?  :04d0[2]
    stx plot_move_x_high                                              ; 41d1: 8e 18 05    ... :04d2[2]
; choose the 'all set' tile
    lda #<tile_all_set_pixels                                         ; 41d4: a9 a9       ..  :04d5[2]
    sta source_sprite_memory_low                                      ; 41d6: 85 40       .@  :04d7[2]
    lda #>tile_all_set_pixels                                         ; 41d8: a9 0a       ..  :04d9[2]
    sta source_sprite_memory_high                                     ; 41da: 85 41       .A  :04db[2]
; copy_mode = 1 (simple copy)
    inx                                                               ; 41dc: e8          .   :04dd[2]
    stx copy_mode                                                     ; 41dd: 86 42       .B  :04de[2]
; draw blank background
    jsr copy_to_rectangle_of_screen_memory_from_offscreen             ; 41df: 20 05 05     .. :04e0[2]
; draw dialog box outline (calculate X plot position based on text width)
    lda current_text_width                                            ; 41e2: ad 09 04    ... :04e3[2]
    asl                                                               ; 41e5: 0a          .   :04e6[2]
    asl                                                               ; 41e6: 0a          .   :04e7[2]
    asl                                                               ; 41e7: 0a          .   :04e8[2]
    sec                                                               ; 41e8: 38          8   :04e9[2]
    sbc #1                                                            ; 41e9: e9 01       ..  :04ea[2]
    asl                                                               ; 41eb: 0a          .   :04ec[2]
    rol plot_move_x_high                                              ; 41ec: 2e 18 05    ... :04ed[2]
    asl                                                               ; 41ef: 0a          .   :04f0[2]
    sta plot_move_x_low                                               ; 41f0: 8d 17 05    ... :04f1[2]
    rol plot_move_x_high                                              ; 41f3: 2e 18 05    ... :04f4[2]
    ldy #0                                                            ; 41f6: a0 00       ..  :04f7[2]
plot_loop
    lda plot_vdu_bytes,y                                              ; 41f8: b9 15 05    ... :04f9[2]
    jsr oswrch                                                        ; 41fb: 20 ee ff     .. :04fc[2]   ; Write character
    iny                                                               ; 41fe: c8          .   :04ff[2]
    cpy #18                                                           ; 41ff: c0 12       ..  :0500[2]
    bcc plot_loop                                                     ; 4201: 90 f5       ..  :0502[2]
    rts                                                               ; 4203: 60          `   :0504[2]

copy_to_rectangle_of_screen_memory_from_offscreen
    ldx #0                                                            ; 4204: a2 00       ..  :0505[2]
    ldy #0                                                            ; 4206: a0 00       ..  :0507[2]
    lda current_text_width                                            ; 4208: ad 09 04    ... :0509[2]
    sta width_in_cells                                                ; 420b: 85 3c       .<  :050c[2]
    lda #5                                                            ; 420d: a9 05       ..  :050e[2]
    sta height_in_cells                                               ; 420f: 85 3d       .=  :0510[2]
    jmp copy_rectangle_of_memory_to_screen                            ; 4211: 4c bb 1a    L.. :0512[2]

plot_vdu_bytes
    !byte $19,   4                                                    ; 4214: 19 04       ..  :0515[2]   ; MOVE absolute
plot_move_x_low
    !byte 0                                                           ; 4216: 00          .   :0517[2]
plot_move_x_high
    !byte 0                                                           ; 4217: 00          .   :0518[2]
    !word 764                                                         ; 4218: fc 02       ..  :0519[2]   ; Y coordinate
    !byte $19,   1                                                    ; 421a: 19 01       ..  :051b[2]   ; DRAW relative
    !word 0                                                           ; 421c: 00 00       ..  :051d[2]   ; X coordinate
    !word 65380                                                       ; 421e: 64 ff       d.  :051f[2]   ; Y coordinate (-156)
    !byte $19,   5                                                    ; 4220: 19 05       ..  :0521[2]   ; DRAW absolute
    !word 0                                                           ; 4222: 00 00       ..  :0523[2]   ; X coordinate
    !word 608                                                         ; 4224: 60 02       `.  :0525[2]   ; Y coordinate
}

pydis_end
!if (' ' + '0') != $50 {
    !error "Assertion failed: ' ' + '0' == $50"
}
!if ('9' + 1) != $3a {
    !error "Assertion failed: '9' + 1 == $3a"
}
!if ('Z' + 1) != $5b {
    !error "Assertion failed: 'Z' + 1 == $5b"
}
!if (0) != $00 {
    !error "Assertion failed: 0 == $00"
}
!if (<(address1_low)) != $70 {
    !error "Assertion failed: <(address1_low) == $70"
}
!if (<(cells_per_character_row * rows_per_cell)) != $40 {
    !error "Assertion failed: <(cells_per_character_row * rows_per_cell) == $40"
}
!if (<(dir_dollar_command)) != $07 {
    !error "Assertion failed: <(dir_dollar_command) == $07"
}
!if (<(drive_0_command)) != $ff {
    !error "Assertion failed: <(drive_0_command) == $ff"
}
!if (<(osfile_block_filename_low)) != $70 {
    !error "Assertion failed: <(osfile_block_filename_low) == $70"
}
!if (<(osword_7f_block_read)) != $f4 {
    !error "Assertion failed: <(osword_7f_block_read) == $f4"
}
!if (<(osword_7f_block_seek)) != $e1 {
    !error "Assertion failed: <(osword_7f_block_seek) == $e1"
}
!if (<(osword_7f_block_write_special_register)) != $ea {
    !error "Assertion failed: <(osword_7f_block_write_special_register) == $ea"
}
!if (<(osword_read_character_block)) != $60 {
    !error "Assertion failed: <(osword_read_character_block) == $60"
}
!if (<(screen_width_in_pixels-1)) != $3f {
    !error "Assertion failed: <(screen_width_in_pixels-1) == $3f"
}
!if (<and_byte_with_mask_and_write_to_screen2) != $98 {
    !error "Assertion failed: <and_byte_with_mask_and_write_to_screen2 == $98"
}
!if (<and_press_return_encrypted_string) != $46 {
    !error "Assertion failed: <and_press_return_encrypted_string == $46"
}
!if (<auxcode) != $c0 {
    !error "Assertion failed: <auxcode == $c0"
}
!if (<auxcode_filename) != $9c {
    !error "Assertion failed: <auxcode_filename == $9c"
}
!if (<brk_handler) != $d3 {
    !error "Assertion failed: <brk_handler == $d3"
}
!if (<bytes_per_cell) != $08 {
    !error "Assertion failed: <bytes_per_cell == $08"
}
!if (<bytes_per_character_row) != $40 {
    !error "Assertion failed: <bytes_per_character_row == $40"
}
!if (<cache_of_screen_memory_under_dialog) != $30 {
    !error "Assertion failed: <cache_of_screen_memory_under_dialog == $30"
}
!if (<cat_base_animation) != $16 {
    !error "Assertion failed: <cat_base_animation == $16"
}
!if (<cat_sprite_list) != $00 {
    !error "Assertion failed: <cat_sprite_list == $00"
}
!if (<cat_tail_spriteids) != $f7 {
    !error "Assertion failed: <cat_tail_spriteids == $f7"
}
!if (<data_filename) != $72 {
    !error "Assertion failed: <data_filename == $72"
}
!if (<developer_flags) != $03 {
    !error "Assertion failed: <developer_flags == $03"
}
!if (<disk_error_encrypted_string) != $52 {
    !error "Assertion failed: <disk_error_encrypted_string == $52"
}
!if (<enter_filename_encrypted_string) != $98 {
    !error "Assertion failed: <enter_filename_encrypted_string == $98"
}
!if (<enter_password_encrypted_string) != $55 {
    !error "Assertion failed: <enter_password_encrypted_string == $55"
}
!if (<envelope_1) != $ac {
    !error "Assertion failed: <envelope_1 == $ac"
}
!if (<envelope_2) != $c2 {
    !error "Assertion failed: <envelope_2 == $c2"
}
!if (<envelope_3) != $d8 {
    !error "Assertion failed: <envelope_3 == $d8"
}
!if (<game_area_screen_address) != $00 {
    !error "Assertion failed: <game_area_screen_address == $00"
}
!if (<icodata) != $ff {
    !error "Assertion failed: <icodata == $ff"
}
!if (<icodata_filename) != $5e {
    !error "Assertion failed: <icodata_filename == $5e"
}
!if (<insert_game_disk_encrypted_string) != $06 {
    !error "Assertion failed: <insert_game_disk_encrypted_string == $06"
}
!if (<insert_save_disk_encrypted_string) != $35 {
    !error "Assertion failed: <insert_save_disk_encrypted_string == $35"
}
!if (<irq1_routine) != $a0 {
    !error "Assertion failed: <irq1_routine == $a0"
}
!if (<level_data) != $d5 {
    !error "Assertion failed: <level_data == $d5"
}
!if (<level_workspace) != $6f {
    !error "Assertion failed: <level_workspace == $6f"
}
!if (<loading_encrypted_string) != $fe {
    !error "Assertion failed: <loading_encrypted_string == $fe"
}
!if (<monkey_base_animation) != $ff {
    !error "Assertion failed: <monkey_base_animation == $ff"
}
!if (<monkey_sprite_list) != $e6 {
    !error "Assertion failed: <monkey_sprite_list == $e6"
}
!if (<monkey_tail_spriteids) != $dd {
    !error "Assertion failed: <monkey_tail_spriteids == $dd"
}
!if (<oswrch) != $ee {
    !error "Assertion failed: <oswrch == $ee"
}
!if (<press_012_or_3_encrypted_string) != $f0 {
    !error "Assertion failed: <press_012_or_3_encrypted_string == $f0"
}
!if (<press_l_to_load_encrypted_string) != $3b {
    !error "Assertion failed: <press_l_to_load_encrypted_string == $3b"
}
!if (<press_s_to_save_encrypted_string) != $2b {
    !error "Assertion failed: <press_s_to_save_encrypted_string == $2b"
}
!if (<print_italic) != $66 {
    !error "Assertion failed: <print_italic == $66"
}
!if (<pydis_start) != $34 {
    !error "Assertion failed: <pydis_start == $34"
}
!if (<relocation1_high_copy_start) != $ff {
    !error "Assertion failed: <relocation1_high_copy_start == $ff"
}
!if (<reset_code) != $45 {
    !error "Assertion failed: <reset_code == $45"
}
!if (<save_full_filename) != $d6 {
    !error "Assertion failed: <save_full_filename == $d6"
}
!if (<save_game) != $ea {
    !error "Assertion failed: <save_game == $ea"
}
!if (<saving_encrypted_string) != $f7 {
    !error "Assertion failed: <saving_encrypted_string == $f7"
}
!if (<screen_width_in_pixels) != $40 {
    !error "Assertion failed: <screen_width_in_pixels == $40"
}
!if (<section_encrypted_string) != $b1 {
    !error "Assertion failed: <section_encrypted_string == $b1"
}
!if (<sound_data1) != $a4 {
    !error "Assertion failed: <sound_data1 == $a4"
}
!if (<sound_data2) != $d0 {
    !error "Assertion failed: <sound_data2 == $d0"
}
!if (<sound_data3) != $ba {
    !error "Assertion failed: <sound_data3 == $ba"
}
!if (<sound_landing1) != $ee {
    !error "Assertion failed: <sound_landing1 == $ee"
}
!if (<sound_landing2) != $e6 {
    !error "Assertion failed: <sound_landing2 == $e6"
}
!if (<sprdata_filename) != $80 {
    !error "Assertion failed: <sprdata_filename == $80"
}
!if (<sprite_197) != $c5 {
    !error "Assertion failed: <sprite_197 == $c5"
}
!if (<sprite_erase_player) != $11 {
    !error "Assertion failed: <sprite_erase_player == $11"
}
!if (<sprite_erase_player_accessory) != $93 {
    !error "Assertion failed: <sprite_erase_player_accessory == $93"
}
!if (<start_of_screen_memory) != $c0 {
    !error "Assertion failed: <start_of_screen_memory == $c0"
}
!if (<tile_all_set_pixels) != $a9 {
    !error "Assertion failed: <tile_all_set_pixels == $a9"
}
!if (<tile_ceiling0) != $59 {
    !error "Assertion failed: <tile_ceiling0 == $59"
}
!if (<tile_floor0_top) != $19 {
    !error "Assertion failed: <tile_floor0_top == $19"
}
!if (<tile_wall_left0) != $79 {
    !error "Assertion failed: <tile_wall_left0 == $79"
}
!if (<tile_wall_right0) != $99 {
    !error "Assertion failed: <tile_wall_right0 == $99"
}
!if (<wait_for_timingB_counter) != $00 {
    !error "Assertion failed: <wait_for_timingB_counter == $00"
}
!if (<which_drive_encrypted_string) != $e3 {
    !error "Assertion failed: <which_drive_encrypted_string == $e3"
}
!if (<wizard_base_animation) != $ed {
    !error "Assertion failed: <wizard_base_animation == $ed"
}
!if (<wizard_sprite_list) != $d7 {
    !error "Assertion failed: <wizard_sprite_list == $d7"
}
!if (>(address1_low)) != $00 {
    !error "Assertion failed: >(address1_low) == $00"
}
!if (>(cells_per_character_row * rows_per_cell)) != $01 {
    !error "Assertion failed: >(cells_per_character_row * rows_per_cell) == $01"
}
!if (>(dir_dollar_command)) != $3f {
    !error "Assertion failed: >(dir_dollar_command) == $3f"
}
!if (>(drive_0_command)) != $3e {
    !error "Assertion failed: >(drive_0_command) == $3e"
}
!if (>(osfile_block_filename_low)) != $00 {
    !error "Assertion failed: >(osfile_block_filename_low) == $00"
}
!if (>(osword_7f_block_read)) != $3e {
    !error "Assertion failed: >(osword_7f_block_read) == $3e"
}
!if (>(osword_7f_block_seek)) != $3e {
    !error "Assertion failed: >(osword_7f_block_seek) == $3e"
}
!if (>(osword_7f_block_write_special_register)) != $3e {
    !error "Assertion failed: >(osword_7f_block_write_special_register) == $3e"
}
!if (>(osword_read_character_block)) != $00 {
    !error "Assertion failed: >(osword_read_character_block) == $00"
}
!if (>(screen_width_in_pixels-1)) != $01 {
    !error "Assertion failed: >(screen_width_in_pixels-1) == $01"
}
!if (>and_byte_with_mask_and_write_to_screen2) != $14 {
    !error "Assertion failed: >and_byte_with_mask_and_write_to_screen2 == $14"
}
!if (>and_press_return_encrypted_string) != $35 {
    !error "Assertion failed: >and_press_return_encrypted_string == $35"
}
!if (>auxcode) != $53 {
    !error "Assertion failed: >auxcode == $53"
}
!if (>auxcode_filename) != $38 {
    !error "Assertion failed: >auxcode_filename == $38"
}
!if (>brk_handler) != $16 {
    !error "Assertion failed: >brk_handler == $16"
}
!if (>bytes_per_cell) != $00 {
    !error "Assertion failed: >bytes_per_cell == $00"
}
!if (>bytes_per_character_row) != $01 {
    !error "Assertion failed: >bytes_per_character_row == $01"
}
!if (>cache_of_screen_memory_under_dialog) != $05 {
    !error "Assertion failed: >cache_of_screen_memory_under_dialog == $05"
}
!if (>cat_base_animation) != $2f {
    !error "Assertion failed: >cat_base_animation == $2f"
}
!if (>cat_sprite_list) != $2f {
    !error "Assertion failed: >cat_sprite_list == $2f"
}
!if (>cat_tail_spriteids) != $2e {
    !error "Assertion failed: >cat_tail_spriteids == $2e"
}
!if (>data_filename) != $12 {
    !error "Assertion failed: >data_filename == $12"
}
!if (>developer_flags) != $11 {
    !error "Assertion failed: >developer_flags == $11"
}
!if (>disk_error_encrypted_string) != $17 {
    !error "Assertion failed: >disk_error_encrypted_string == $17"
}
!if (>end_of_screen_memory) != $80 {
    !error "Assertion failed: >end_of_screen_memory == $80"
}
!if (>enter_filename_encrypted_string) != $34 {
    !error "Assertion failed: >enter_filename_encrypted_string == $34"
}
!if (>enter_password_encrypted_string) != $36 {
    !error "Assertion failed: >enter_password_encrypted_string == $36"
}
!if (>envelope_1) != $38 {
    !error "Assertion failed: >envelope_1 == $38"
}
!if (>envelope_2) != $38 {
    !error "Assertion failed: >envelope_2 == $38"
}
!if (>envelope_3) != $38 {
    !error "Assertion failed: >envelope_3 == $38"
}
!if (>game_area_screen_address) != $62 {
    !error "Assertion failed: >game_area_screen_address == $62"
}
!if (>icodata) != $40 {
    !error "Assertion failed: >icodata == $40"
}
!if (>icodata_filename) != $3f {
    !error "Assertion failed: >icodata_filename == $3f"
}
!if (>insert_game_disk_encrypted_string) != $36 {
    !error "Assertion failed: >insert_game_disk_encrypted_string == $36"
}
!if (>insert_save_disk_encrypted_string) != $35 {
    !error "Assertion failed: >insert_save_disk_encrypted_string == $35"
}
!if (>irq1_routine) != $17 {
    !error "Assertion failed: >irq1_routine == $17"
}
!if (>level_data) != $3a {
    !error "Assertion failed: >level_data == $3a"
}
!if (>level_workspace) != $0a {
    !error "Assertion failed: >level_workspace == $0a"
}
!if (>loading_encrypted_string) != $35 {
    !error "Assertion failed: >loading_encrypted_string == $35"
}
!if (>monkey_base_animation) != $30 {
    !error "Assertion failed: >monkey_base_animation == $30"
}
!if (>monkey_sprite_list) != $30 {
    !error "Assertion failed: >monkey_sprite_list == $30"
}
!if (>monkey_tail_spriteids) != $30 {
    !error "Assertion failed: >monkey_tail_spriteids == $30"
}
!if (>oswrch) != $ff {
    !error "Assertion failed: >oswrch == $ff"
}
!if (>press_012_or_3_encrypted_string) != $34 {
    !error "Assertion failed: >press_012_or_3_encrypted_string == $34"
}
!if (>press_l_to_load_encrypted_string) != $34 {
    !error "Assertion failed: >press_l_to_load_encrypted_string == $34"
}
!if (>press_s_to_save_encrypted_string) != $34 {
    !error "Assertion failed: >press_s_to_save_encrypted_string == $34"
}
!if (>print_italic) != $18 {
    !error "Assertion failed: >print_italic == $18"
}
!if (>pydis_start) != $12 {
    !error "Assertion failed: >pydis_start == $12"
}
!if (>relocation1_high_copy_start) != $40 {
    !error "Assertion failed: >relocation1_high_copy_start == $40"
}
!if (>reset_code) != $18 {
    !error "Assertion failed: >reset_code == $18"
}
!if (>save_full_filename) != $34 {
    !error "Assertion failed: >save_full_filename == $34"
}
!if (>save_game) != $09 {
    !error "Assertion failed: >save_game == $09"
}
!if (>saving_encrypted_string) != $35 {
    !error "Assertion failed: >saving_encrypted_string == $35"
}
!if (>section_encrypted_string) != $37 {
    !error "Assertion failed: >section_encrypted_string == $37"
}
!if (>sound_data1) != $38 {
    !error "Assertion failed: >sound_data1 == $38"
}
!if (>sound_data2) != $38 {
    !error "Assertion failed: >sound_data2 == $38"
}
!if (>sound_data3) != $38 {
    !error "Assertion failed: >sound_data3 == $38"
}
!if (>sound_landing1) != $38 {
    !error "Assertion failed: >sound_landing1 == $38"
}
!if (>sound_landing2) != $38 {
    !error "Assertion failed: >sound_landing2 == $38"
}
!if (>sprdata_filename) != $19 {
    !error "Assertion failed: >sprdata_filename == $19"
}
!if (>sprite_197) != $0b {
    !error "Assertion failed: >sprite_197 == $0b"
}
!if (>sprite_erase_player) != $0b {
    !error "Assertion failed: >sprite_erase_player == $0b"
}
!if (>sprite_erase_player_accessory) != $0b {
    !error "Assertion failed: >sprite_erase_player_accessory == $0b"
}
!if (>start_of_screen_memory) != $5b {
    !error "Assertion failed: >start_of_screen_memory == $5b"
}
!if (>tile_all_set_pixels) != $0a {
    !error "Assertion failed: >tile_all_set_pixels == $0a"
}
!if (>tile_ceiling0) != $1d {
    !error "Assertion failed: >tile_ceiling0 == $1d"
}
!if (>tile_floor0_top) != $1d {
    !error "Assertion failed: >tile_floor0_top == $1d"
}
!if (>tile_wall_left0) != $1d {
    !error "Assertion failed: >tile_wall_left0 == $1d"
}
!if (>tile_wall_right0) != $1d {
    !error "Assertion failed: >tile_wall_right0 == $1d"
}
!if (>toolbar_screen_address) != $58 {
    !error "Assertion failed: >toolbar_screen_address == $58"
}
!if (>wait_for_timingB_counter) != $04 {
    !error "Assertion failed: >wait_for_timingB_counter == $04"
}
!if (>which_drive_encrypted_string) != $34 {
    !error "Assertion failed: >which_drive_encrypted_string == $34"
}
!if (>wizard_base_animation) != $2c {
    !error "Assertion failed: >wizard_base_animation == $2c"
}
!if (>wizard_sprite_list) != $2c {
    !error "Assertion failed: >wizard_sprite_list == $2c"
}
!if (address1_low + 1) != $71 {
    !error "Assertion failed: address1_low + 1 == $71"
}
!if (address1_low + 2) != $72 {
    !error "Assertion failed: address1_low + 2 == $72"
}
!if (address1_low + 3) != $73 {
    !error "Assertion failed: address1_low + 3 == $73"
}
!if (address1_low + 4) != $74 {
    !error "Assertion failed: address1_low + 4 == $74"
}
!if (address1_low + 5) != $75 {
    !error "Assertion failed: address1_low + 5 == $75"
}
!if (buffer_sound_channel_0) != $04 {
    !error "Assertion failed: buffer_sound_channel_0 == $04"
}
!if (caps_mask) != $df {
    !error "Assertion failed: caps_mask == $df"
}
!if (cat_animation11 - cat_base_animation) != $84 {
    !error "Assertion failed: cat_animation11 - cat_base_animation == $84"
}
!if (cat_animation12 - cat_base_animation) != $91 {
    !error "Assertion failed: cat_animation12 - cat_base_animation == $91"
}
!if (cat_change_direction_animation - cat_base_animation) != $36 {
    !error "Assertion failed: cat_change_direction_animation - cat_base_animation == $36"
}
!if (cat_change_direction_animation_last_step - cat_base_animation) != $39 {
    !error "Assertion failed: cat_change_direction_animation_last_step - cat_base_animation == $39"
}
!if (cat_fall_animation - cat_base_animation) != $ae {
    !error "Assertion failed: cat_fall_animation - cat_base_animation == $ae"
}
!if (cat_jump_animation - cat_base_animation) != $45 {
    !error "Assertion failed: cat_jump_animation - cat_base_animation == $45"
}
!if (cat_jump_apex_animation - cat_base_animation) != $58 {
    !error "Assertion failed: cat_jump_apex_animation - cat_base_animation == $58"
}
!if (cat_standing_fall_animation - cat_base_animation) != $9e {
    !error "Assertion failed: cat_standing_fall_animation - cat_base_animation == $9e"
}
!if (cat_standing_still_animation - cat_base_animation) != $41 {
    !error "Assertion failed: cat_standing_still_animation - cat_base_animation == $41"
}
!if (cat_start_to_fall_animation - cat_base_animation) != $5f {
    !error "Assertion failed: cat_start_to_fall_animation - cat_base_animation == $5f"
}
!if (cat_transform_in_animation - cat_base_animation) != $00 {
    !error "Assertion failed: cat_transform_in_animation - cat_base_animation == $00"
}
!if (cat_transform_out_animation - cat_base_animation) != $16 {
    !error "Assertion failed: cat_transform_out_animation - cat_base_animation == $16"
}
!if (cat_transition_to_standing_still_animation - cat_base_animation) != $3d {
    !error "Assertion failed: cat_transition_to_standing_still_animation - cat_base_animation == $3d"
}
!if (cat_walk_cycle_animation - cat_base_animation) != $29 {
    !error "Assertion failed: cat_walk_cycle_animation - cat_base_animation == $29"
}
!if (cells_per_character_row) != $28 {
    !error "Assertion failed: cells_per_character_row == $28"
}
!if (cells_per_character_row-1) != $27 {
    !error "Assertion failed: cells_per_character_row-1 == $27"
}
!if (check_password) != $53c0 {
    !error "Assertion failed: check_password == $53c0"
}
!if (collision_map_length) != $f0 {
    !error "Assertion failed: collision_map_length == $f0"
}
!if (collision_map_none) != $00 {
    !error "Assertion failed: collision_map_none == $00"
}
!if (collision_map_out_of_bounds) != $ff {
    !error "Assertion failed: collision_map_out_of_bounds == $ff"
}
!if (collision_map_rope) != $02 {
    !error "Assertion failed: collision_map_rope == $02"
}
!if (collision_map_solid_rock) != $03 {
    !error "Assertion failed: collision_map_solid_rock == $03"
}
!if (colour_black) != $00 {
    !error "Assertion failed: colour_black == $00"
}
!if (colour_cyan) != $06 {
    !error "Assertion failed: colour_cyan == $06"
}
!if (colour_green) != $02 {
    !error "Assertion failed: colour_green == $02"
}
!if (colour_magenta) != $05 {
    !error "Assertion failed: colour_magenta == $05"
}
!if (colour_red) != $01 {
    !error "Assertion failed: colour_red == $01"
}
!if (colour_white) != $07 {
    !error "Assertion failed: colour_white == $07"
}
!if (colour_yellow) != $03 {
    !error "Assertion failed: colour_yellow == $03"
}
!if (crtc_cursor_start) != $0a {
    !error "Assertion failed: crtc_cursor_start == $0a"
}
!if (crtc_interlace_delay) != $08 {
    !error "Assertion failed: crtc_interlace_delay == $08"
}
!if (crtc_screen_start_high) != $0c {
    !error "Assertion failed: crtc_screen_start_high == $0c"
}
!if (crtc_screen_start_low) != $0d {
    !error "Assertion failed: crtc_screen_start_low == $0d"
}
!if (crtc_vert_displayed) != $06 {
    !error "Assertion failed: crtc_vert_displayed == $06"
}
!if (crtc_vert_sync_pos) != $07 {
    !error "Assertion failed: crtc_vert_sync_pos == $07"
}
!if (desired_menu_slots-1) != $295b {
    !error "Assertion failed: desired_menu_slots-1 == $295b"
}
!if (first_level_letter) != $41 {
    !error "Assertion failed: first_level_letter == $41"
}
!if (first_level_letter + num_levels/2 - 1) != $48 {
    !error "Assertion failed: first_level_letter + num_levels/2 - 1 == $48"
}
!if (game_area_height_cells) != $18 {
    !error "Assertion failed: game_area_height_cells == $18"
}
!if (game_area_height_cells - 1) != $17 {
    !error "Assertion failed: game_area_height_cells - 1 == $17"
}
!if (game_area_height_cells+1) != $19 {
    !error "Assertion failed: game_area_height_cells+1 == $19"
}
!if (game_area_height_cells-1) != $17 {
    !error "Assertion failed: game_area_height_cells-1 == $17"
}
!if (game_area_width_cells) != $28 {
    !error "Assertion failed: game_area_width_cells == $28"
}
!if (game_area_width_cells+1) != $29 {
    !error "Assertion failed: game_area_width_cells+1 == $29"
}
!if (game_area_width_cells-1) != $27 {
    !error "Assertion failed: game_area_width_cells-1 == $27"
}
!if (icodata) != $40ff {
    !error "Assertion failed: icodata == $40ff"
}
!if (inkey_key_escape) != $8f {
    !error "Assertion failed: inkey_key_escape == $8f"
}
!if (inkey_key_left) != $e6 {
    !error "Assertion failed: inkey_key_left == $e6"
}
!if (inkey_key_return) != $b6 {
    !error "Assertion failed: inkey_key_return == $b6"
}
!if (inkey_key_right) != $86 {
    !error "Assertion failed: inkey_key_right == $86"
}
!if (inkey_key_shift) != $ff {
    !error "Assertion failed: inkey_key_shift == $ff"
}
!if (inkey_key_space) != $9d {
    !error "Assertion failed: inkey_key_space == $9d"
}
!if (inkey_key_x) != $bd {
    !error "Assertion failed: inkey_key_x == $bd"
}
!if (inkey_key_z) != $9e {
    !error "Assertion failed: inkey_key_z == $9e"
}
!if (jmp_instruction+1) != $196d {
    !error "Assertion failed: jmp_instruction+1 == $196d"
}
!if (jmp_instruction+2) != $196e {
    !error "Assertion failed: jmp_instruction+2 == $196e"
}
!if (last_level_letter) != $51 {
    !error "Assertion failed: last_level_letter == $51"
}
!if (last_level_letter+1) != $52 {
    !error "Assertion failed: last_level_letter+1 == $52"
}
!if (last_level_letter-1) != $50 {
    !error "Assertion failed: last_level_letter-1 == $50"
}
!if (level_ordering_table - 1) != $0a7e {
    !error "Assertion failed: level_ordering_table - 1 == $0a7e"
}
!if (max_filename_len) != $07 {
    !error "Assertion failed: max_filename_len == $07"
}
!if (max_objects) != $0b {
    !error "Assertion failed: max_objects == $0b"
}
!if (max_objects-1) != $0a {
    !error "Assertion failed: max_objects-1 == $0a"
}
!if (menu_slot_count) != $11 {
    !error "Assertion failed: menu_slot_count == $11"
}
!if (menu_slot_count - 1) != $10 {
    !error "Assertion failed: menu_slot_count - 1 == $10"
}
!if (mid_transform_circle_sprites - mid_transform_sprites_table) != $01 {
    !error "Assertion failed: mid_transform_circle_sprites - mid_transform_sprites_table == $01"
}
!if (mid_transform_sparkles_in - mid_transform_sprites_table) != $04 {
    !error "Assertion failed: mid_transform_sparkles_in - mid_transform_sprites_table == $04"
}
!if (mid_transform_sparkles_out - mid_transform_sprites_table) != $0b {
    !error "Assertion failed: mid_transform_sparkles_out - mid_transform_sprites_table == $0b"
}
!if (mid_transform_sprites_table - mid_transform_sprites_table) != $00 {
    !error "Assertion failed: mid_transform_sprites_table - mid_transform_sprites_table == $00"
}
!if (monkey_animation10 - monkey_base_animation) != $4d {
    !error "Assertion failed: monkey_animation10 - monkey_base_animation == $4d"
}
!if (monkey_animation12 - monkey_base_animation) != $58 {
    !error "Assertion failed: monkey_animation12 - monkey_base_animation == $58"
}
!if (monkey_animation15 - monkey_base_animation) != $97 {
    !error "Assertion failed: monkey_animation15 - monkey_base_animation == $97"
}
!if (monkey_animation16 - monkey_base_animation) != $aa {
    !error "Assertion failed: monkey_animation16 - monkey_base_animation == $aa"
}
!if (monkey_animation17 - monkey_base_animation) != $b7 {
    !error "Assertion failed: monkey_animation17 - monkey_base_animation == $b7"
}
!if (monkey_animation18 - monkey_base_animation) != $c4 {
    !error "Assertion failed: monkey_animation18 - monkey_base_animation == $c4"
}
!if (monkey_animation6 - monkey_base_animation) != $3d {
    !error "Assertion failed: monkey_animation6 - monkey_base_animation == $3d"
}
!if (monkey_change_direction_animation - monkey_base_animation) != $36 {
    !error "Assertion failed: monkey_change_direction_animation - monkey_base_animation == $36"
}
!if (monkey_change_direction_animation_last_step - monkey_base_animation) != $39 {
    !error "Assertion failed: monkey_change_direction_animation_last_step - monkey_base_animation == $39"
}
!if (monkey_climb_animation - monkey_base_animation) != $51 {
    !error "Assertion failed: monkey_climb_animation - monkey_base_animation == $51"
}
!if (monkey_climb_down_animation - monkey_base_animation) != $49 {
    !error "Assertion failed: monkey_climb_down_animation - monkey_base_animation == $49"
}
!if (monkey_climb_idle_animation - monkey_base_animation) != $45 {
    !error "Assertion failed: monkey_climb_idle_animation - monkey_base_animation == $45"
}
!if (monkey_fall_animation - monkey_base_animation) != $d4 {
    !error "Assertion failed: monkey_fall_animation - monkey_base_animation == $d4"
}
!if (monkey_jump_animation - monkey_base_animation) != $87 {
    !error "Assertion failed: monkey_jump_animation - monkey_base_animation == $87"
}
!if (monkey_standing_fall_animation - monkey_base_animation) != $7a {
    !error "Assertion failed: monkey_standing_fall_animation - monkey_base_animation == $7a"
}
!if (monkey_standing_still_animation - monkey_base_animation) != $41 {
    !error "Assertion failed: monkey_standing_still_animation - monkey_base_animation == $41"
}
!if (monkey_transform_out_animation - monkey_base_animation) != $16 {
    !error "Assertion failed: monkey_transform_out_animation - monkey_base_animation == $16"
}
!if (monkey_walk_cycle_animation - monkey_base_animation) != $29 {
    !error "Assertion failed: monkey_walk_cycle_animation - monkey_base_animation == $29"
}
!if (num_levels-1) != $0f {
    !error "Assertion failed: num_levels-1 == $0f"
}
!if (object_collided_ceiling) != $08 {
    !error "Assertion failed: object_collided_ceiling == $08"
}
!if (object_collided_floor) != $02 {
    !error "Assertion failed: object_collided_floor == $02"
}
!if (object_collided_left_wall) != $01 {
    !error "Assertion failed: object_collided_left_wall == $01"
}
!if (object_collided_right_wall) != $04 {
    !error "Assertion failed: object_collided_right_wall == $04"
}
!if (object_z_order + objectid_player_accessory) != $38c3 {
    !error "Assertion failed: object_z_order + objectid_player_accessory == $38c3"
}
!if (objectid_old_player) != $0b {
    !error "Assertion failed: objectid_old_player == $0b"
}
!if (objectid_player) != $00 {
    !error "Assertion failed: objectid_player == $00"
}
!if (objectid_player_accessory) != $01 {
    !error "Assertion failed: objectid_player_accessory == $01"
}
!if (opcode_clc) != $18 {
    !error "Assertion failed: opcode_clc == $18"
}
!if (opcode_jmp) != $4c {
    !error "Assertion failed: opcode_jmp == $4c"
}
!if (opcode_sec) != $38 {
    !error "Assertion failed: opcode_sec == $38"
}
!if (osbyte_close_spool_exec) != $77 {
    !error "Assertion failed: osbyte_close_spool_exec == $77"
}
!if (osbyte_flush_buffer) != $15 {
    !error "Assertion failed: osbyte_flush_buffer == $15"
}
!if (osbyte_flush_buffer_class) != $0f {
    !error "Assertion failed: osbyte_flush_buffer_class == $0f"
}
!if (osbyte_inkey) != $81 {
    !error "Assertion failed: osbyte_inkey == $81"
}
!if (osbyte_opt) != $8b {
    !error "Assertion failed: osbyte_opt == $8b"
}
!if (osbyte_read_vdu_status) != $75 {
    !error "Assertion failed: osbyte_read_vdu_status == $75"
}
!if (osbyte_read_write_escape_break_effect) != $c8 {
    !error "Assertion failed: osbyte_read_write_escape_break_effect == $c8"
}
!if (osbyte_read_write_first_byte_break_intercept) != $f7 {
    !error "Assertion failed: osbyte_read_write_first_byte_break_intercept == $f7"
}
!if (osbyte_read_write_second_byte_break_intercept) != $f8 {
    !error "Assertion failed: osbyte_read_write_second_byte_break_intercept == $f8"
}
!if (osbyte_read_write_third_byte_break_intercept) != $f9 {
    !error "Assertion failed: osbyte_read_write_third_byte_break_intercept == $f9"
}
!if (osbyte_reset_soft_keys) != $12 {
    !error "Assertion failed: osbyte_reset_soft_keys == $12"
}
!if (osbyte_select_adc_channels) != $10 {
    !error "Assertion failed: osbyte_select_adc_channels == $10"
}
!if (osbyte_set_cursor_editing) != $04 {
    !error "Assertion failed: osbyte_set_cursor_editing == $04"
}
!if (osbyte_set_printer_ignore) != $06 {
    !error "Assertion failed: osbyte_set_printer_ignore == $06"
}
!if (osbyte_tv) != $90 {
    !error "Assertion failed: osbyte_tv == $90"
}
!if (osbyte_vsync) != $13 {
    !error "Assertion failed: osbyte_vsync == $13"
}
!if (osfile_block_start_address_low) != $7a {
    !error "Assertion failed: osfile_block_start_address_low == $7a"
}
!if (osfile_block_start_address_mid1) != $7b {
    !error "Assertion failed: osfile_block_start_address_mid1 == $7b"
}
!if (osfile_load) != $ff {
    !error "Assertion failed: osfile_load == $ff"
}
!if (osfile_read_catalogue_info) != $05 {
    !error "Assertion failed: osfile_read_catalogue_info == $05"
}
!if (osfile_save) != $00 {
    !error "Assertion failed: osfile_save == $00"
}
!if (osword_envelope) != $08 {
    !error "Assertion failed: osword_envelope == $08"
}
!if (osword_read_char) != $0a {
    !error "Assertion failed: osword_read_char == $0a"
}
!if (osword_sound) != $07 {
    !error "Assertion failed: osword_sound == $07"
}
!if (relocation3_high_copy_end - relocation3_high_copy_start) != $48 {
    !error "Assertion failed: relocation3_high_copy_end - relocation3_high_copy_start == $48"
}
!if (relocation4_high_copy_start) != $3fcb {
    !error "Assertion failed: relocation4_high_copy_start == $3fcb"
}
!if (relocation5_high_copy_end - relocation5_high_copy_start) != $2f {
    !error "Assertion failed: relocation5_high_copy_end - relocation5_high_copy_start == $2f"
}
!if (relocation5_high_copy_start) != $40d0 {
    !error "Assertion failed: relocation5_high_copy_start == $40d0"
}
!if (screen_width_minus_one) != $27 {
    !error "Assertion failed: screen_width_minus_one == $27"
}
!if (sideways_rom_image_source_end - sideways_rom_image_source_start - 1) != $0f {
    !error "Assertion failed: sideways_rom_image_source_end - sideways_rom_image_source_start - 1 == $0f"
}
!if (sound_priority_per_channel_table + 1) != $3970 {
    !error "Assertion failed: sound_priority_per_channel_table + 1 == $3970"
}
!if (sprite_op_flags_copy_screen) != $01 {
    !error "Assertion failed: sprite_op_flags_copy_screen == $01"
}
!if (sprite_op_flags_erase_to_bg_colour) != $02 {
    !error "Assertion failed: sprite_op_flags_erase_to_bg_colour == $02"
}
!if (sprite_op_flags_erase_to_bg_colour | sprite_op_flags_copy_screen) != $03 {
    !error "Assertion failed: sprite_op_flags_erase_to_bg_colour | sprite_op_flags_copy_screen == $03"
}
!if (sprite_op_flags_erase_to_fg_colour) != $04 {
    !error "Assertion failed: sprite_op_flags_erase_to_fg_colour == $04"
}
!if (sprite_op_flags_erase_to_fg_colour | sprite_op_flags_erase_to_bg_colour) != $06 {
    !error "Assertion failed: sprite_op_flags_erase_to_fg_colour | sprite_op_flags_erase_to_bg_colour == $06"
}
!if (sprite_op_flags_normal) != $00 {
    !error "Assertion failed: sprite_op_flags_normal == $00"
}
!if (spriteid_brazier) != $3a {
    !error "Assertion failed: spriteid_brazier == $3a"
}
!if (spriteid_cat2) != $1c {
    !error "Assertion failed: spriteid_cat2 == $1c"
}
!if (spriteid_cat_jump) != $1a {
    !error "Assertion failed: spriteid_cat_jump == $1a"
}
!if (spriteid_cat_tail1) != $12 {
    !error "Assertion failed: spriteid_cat_tail1 == $12"
}
!if (spriteid_cat_tail2) != $13 {
    !error "Assertion failed: spriteid_cat_tail2 == $13"
}
!if (spriteid_cat_tail3) != $14 {
    !error "Assertion failed: spriteid_cat_tail3 == $14"
}
!if (spriteid_cat_tail4) != $15 {
    !error "Assertion failed: spriteid_cat_tail4 == $15"
}
!if (spriteid_cat_tail5) != $16 {
    !error "Assertion failed: spriteid_cat_tail5 == $16"
}
!if (spriteid_cat_tail6) != $17 {
    !error "Assertion failed: spriteid_cat_tail6 == $17"
}
!if (spriteid_cat_tail7) != $18 {
    !error "Assertion failed: spriteid_cat_tail7 == $18"
}
!if (spriteid_cat_tail8) != $19 {
    !error "Assertion failed: spriteid_cat_tail8 == $19"
}
!if (spriteid_cat_transform1) != $10 {
    !error "Assertion failed: spriteid_cat_transform1 == $10"
}
!if (spriteid_cat_transform2) != $11 {
    !error "Assertion failed: spriteid_cat_transform2 == $11"
}
!if (spriteid_cat_walk1) != $0c {
    !error "Assertion failed: spriteid_cat_walk1 == $0c"
}
!if (spriteid_cat_walk2) != $0d {
    !error "Assertion failed: spriteid_cat_walk2 == $0d"
}
!if (spriteid_cat_walk3) != $0e {
    !error "Assertion failed: spriteid_cat_walk3 == $0e"
}
!if (spriteid_cat_walk4) != $0f {
    !error "Assertion failed: spriteid_cat_walk4 == $0f"
}
!if (spriteid_circle) != $20 {
    !error "Assertion failed: spriteid_circle == $20"
}
!if (spriteid_corner_bottom_left) != $2d {
    !error "Assertion failed: spriteid_corner_bottom_left == $2d"
}
!if (spriteid_corner_bottom_right) != $2e {
    !error "Assertion failed: spriteid_corner_bottom_right == $2e"
}
!if (spriteid_corner_top_left) != $2c {
    !error "Assertion failed: spriteid_corner_top_left == $2c"
}
!if (spriteid_corner_top_right) != $2f {
    !error "Assertion failed: spriteid_corner_top_right == $2f"
}
!if (spriteid_diamond1) != $27 {
    !error "Assertion failed: spriteid_diamond1 == $27"
}
!if (spriteid_diamond2) != $28 {
    !error "Assertion failed: spriteid_diamond2 == $28"
}
!if (spriteid_diamond3) != $29 {
    !error "Assertion failed: spriteid_diamond3 == $29"
}
!if (spriteid_diamond4) != $2a {
    !error "Assertion failed: spriteid_diamond4 == $2a"
}
!if (spriteid_diamond5) != $2b {
    !error "Assertion failed: spriteid_diamond5 == $2b"
}
!if (spriteid_erase_player) != $c7 {
    !error "Assertion failed: spriteid_erase_player == $c7"
}
!if (spriteid_erase_player_accessory) != $c6 {
    !error "Assertion failed: spriteid_erase_player_accessory == $c6"
}
!if (spriteid_erase_sparkles) != $c5 {
    !error "Assertion failed: spriteid_erase_sparkles == $c5"
}
!if (spriteid_fingertip_tile_restoration) != $1e {
    !error "Assertion failed: spriteid_fingertip_tile_restoration == $1e"
}
!if (spriteid_fire1) != $3c {
    !error "Assertion failed: spriteid_fire1 == $3c"
}
!if (spriteid_icodata_box) != $09 {
    !error "Assertion failed: spriteid_icodata_box == $09"
}
!if (spriteid_icodata_cat) != $05 {
    !error "Assertion failed: spriteid_icodata_cat == $05"
}
!if (spriteid_icodata_disc) != $03 {
    !error "Assertion failed: spriteid_icodata_disc == $03"
}
!if (spriteid_icodata_info) != $07 {
    !error "Assertion failed: spriteid_icodata_info == $07"
}
!if (spriteid_icodata_monkey) != $06 {
    !error "Assertion failed: spriteid_icodata_monkey == $06"
}
!if (spriteid_icodata_password) != $08 {
    !error "Assertion failed: spriteid_icodata_password == $08"
}
!if (spriteid_icodata_sound) != $02 {
    !error "Assertion failed: spriteid_icodata_sound == $02"
}
!if (spriteid_icodata_wizard) != $04 {
    !error "Assertion failed: spriteid_icodata_wizard == $04"
}
!if (spriteid_icon_background) != $01 {
    !error "Assertion failed: spriteid_icon_background == $01"
}
!if (spriteid_menu_item_completion_spell) != $21 {
    !error "Assertion failed: spriteid_menu_item_completion_spell == $21"
}
!if (spriteid_monkey1) != $4e {
    !error "Assertion failed: spriteid_monkey1 == $4e"
}
!if (spriteid_monkey2) != $4f {
    !error "Assertion failed: spriteid_monkey2 == $4f"
}
!if (spriteid_monkey3) != $50 {
    !error "Assertion failed: spriteid_monkey3 == $50"
}
!if (spriteid_monkey4) != $51 {
    !error "Assertion failed: spriteid_monkey4 == $51"
}
!if (spriteid_monkey5) != $52 {
    !error "Assertion failed: spriteid_monkey5 == $52"
}
!if (spriteid_monkey_climb1) != $53 {
    !error "Assertion failed: spriteid_monkey_climb1 == $53"
}
!if (spriteid_monkey_climb2) != $54 {
    !error "Assertion failed: spriteid_monkey_climb2 == $54"
}
!if (spriteid_monkey_tail1) != $46 {
    !error "Assertion failed: spriteid_monkey_tail1 == $46"
}
!if (spriteid_monkey_tail2) != $47 {
    !error "Assertion failed: spriteid_monkey_tail2 == $47"
}
!if (spriteid_monkey_tail3) != $48 {
    !error "Assertion failed: spriteid_monkey_tail3 == $48"
}
!if (spriteid_monkey_tail4) != $49 {
    !error "Assertion failed: spriteid_monkey_tail4 == $49"
}
!if (spriteid_monkey_tail5) != $4a {
    !error "Assertion failed: spriteid_monkey_tail5 == $4a"
}
!if (spriteid_monkey_tail6) != $4b {
    !error "Assertion failed: spriteid_monkey_tail6 == $4b"
}
!if (spriteid_monkey_tail7) != $4c {
    !error "Assertion failed: spriteid_monkey_tail7 == $4c"
}
!if (spriteid_monkey_tail8) != $4d {
    !error "Assertion failed: spriteid_monkey_tail8 == $4d"
}
!if (spriteid_monkey_transform1) != $44 {
    !error "Assertion failed: spriteid_monkey_transform1 == $44"
}
!if (spriteid_monkey_transform2) != $45 {
    !error "Assertion failed: spriteid_monkey_transform2 == $45"
}
!if (spriteid_one_pixel_masked_out) != $00 {
    !error "Assertion failed: spriteid_one_pixel_masked_out == $00"
}
!if (spriteid_one_pixel_set) != $1f {
    !error "Assertion failed: spriteid_one_pixel_set == $1f"
}
!if (spriteid_pointer_hand) != $1d {
    !error "Assertion failed: spriteid_pointer_hand == $1d"
}
!if (spriteid_rope1) != $55 {
    !error "Assertion failed: spriteid_rope1 == $55"
}
!if (spriteid_rope_end) != $0a {
    !error "Assertion failed: spriteid_rope_end == $0a"
}
!if (spriteid_rope_hook) != $0b {
    !error "Assertion failed: spriteid_rope_hook == $0b"
}
!if (spriteid_sparkles1) != $22 {
    !error "Assertion failed: spriteid_sparkles1 == $22"
}
!if (spriteid_sparkles2) != $23 {
    !error "Assertion failed: spriteid_sparkles2 == $23"
}
!if (spriteid_sparkles3) != $24 {
    !error "Assertion failed: spriteid_sparkles3 == $24"
}
!if (spriteid_sparkles4) != $25 {
    !error "Assertion failed: spriteid_sparkles4 == $25"
}
!if (spriteid_sparkles5) != $26 {
    !error "Assertion failed: spriteid_sparkles5 == $26"
}
!if (spriteid_wizard1) != $30 {
    !error "Assertion failed: spriteid_wizard1 == $30"
}
!if (spriteid_wizard2) != $31 {
    !error "Assertion failed: spriteid_wizard2 == $31"
}
!if (spriteid_wizard3) != $32 {
    !error "Assertion failed: spriteid_wizard3 == $32"
}
!if (spriteid_wizard4) != $33 {
    !error "Assertion failed: spriteid_wizard4 == $33"
}
!if (spriteid_wizard5) != $34 {
    !error "Assertion failed: spriteid_wizard5 == $34"
}
!if (spriteid_wizard7) != $36 {
    !error "Assertion failed: spriteid_wizard7 == $36"
}
!if (spriteid_wizard_hand) != $37 {
    !error "Assertion failed: spriteid_wizard_hand == $37"
}
!if (spriteid_wizard_transform1) != $38 {
    !error "Assertion failed: spriteid_wizard_transform1 == $38"
}
!if (spriteid_wizard_transform2) != $39 {
    !error "Assertion failed: spriteid_wizard_transform2 == $39"
}
!if (spriteid_wizard_using_object) != $35 {
    !error "Assertion failed: spriteid_wizard_using_object == $35"
}
!if (vdu_bell) != $07 {
    !error "Assertion failed: vdu_bell == $07"
}
!if (vdu_cr) != $0d {
    !error "Assertion failed: vdu_cr == $0d"
}
!if (vdu_define_character) != $17 {
    !error "Assertion failed: vdu_define_character == $17"
}
!if (vdu_define_text_window) != $1c {
    !error "Assertion failed: vdu_define_text_window == $1c"
}
!if (vdu_delete) != $7f {
    !error "Assertion failed: vdu_delete == $7f"
}
!if (vdu_enable) != $06 {
    !error "Assertion failed: vdu_enable == $06"
}
!if (vdu_goto_xy) != $1f {
    !error "Assertion failed: vdu_goto_xy == $1f"
}
!if (vdu_left) != $08 {
    !error "Assertion failed: vdu_left == $08"
}
!if (vdu_lf) != $0a {
    !error "Assertion failed: vdu_lf == $0a"
}
!if (vdu_printer_off) != $03 {
    !error "Assertion failed: vdu_printer_off == $03"
}
!if (vdu_set_graphics_colour) != $12 {
    !error "Assertion failed: vdu_set_graphics_colour == $12"
}
!if (vdu_set_mode) != $16 {
    !error "Assertion failed: vdu_set_mode == $16"
}
!if (vdu_set_text_colour) != $11 {
    !error "Assertion failed: vdu_set_text_colour == $11"
}
!if (wizard_animation11 - wizard_base_animation) != $6c {
    !error "Assertion failed: wizard_animation11 - wizard_base_animation == $6c"
}
!if (wizard_animation12 - wizard_base_animation) != $79 {
    !error "Assertion failed: wizard_animation12 - wizard_base_animation == $79"
}
!if (wizard_change_direction_animation - wizard_base_animation) != $36 {
    !error "Assertion failed: wizard_change_direction_animation - wizard_base_animation == $36"
}
!if (wizard_change_direction_animation_last_step - wizard_base_animation) != $39 {
    !error "Assertion failed: wizard_change_direction_animation_last_step - wizard_base_animation == $39"
}
!if (wizard_fall_continues_animation - wizard_base_animation) != $96 {
    !error "Assertion failed: wizard_fall_continues_animation - wizard_base_animation == $96"
}
!if (wizard_jump_animation - wizard_base_animation) != $49 {
    !error "Assertion failed: wizard_jump_animation - wizard_base_animation == $49"
}
!if (wizard_standing_fall_animation - wizard_base_animation) != $86 {
    !error "Assertion failed: wizard_standing_fall_animation - wizard_base_animation == $86"
}
!if (wizard_standing_still_animation - wizard_base_animation) != $41 {
    !error "Assertion failed: wizard_standing_still_animation - wizard_base_animation == $41"
}
!if (wizard_start_to_fall_animation - wizard_base_animation) != $59 {
    !error "Assertion failed: wizard_start_to_fall_animation - wizard_base_animation == $59"
}
!if (wizard_transform_out_animation - wizard_base_animation) != $16 {
    !error "Assertion failed: wizard_transform_out_animation - wizard_base_animation == $16"
}
!if (wizard_transition_to_standing_still_animation - wizard_base_animation) != $3d {
    !error "Assertion failed: wizard_transition_to_standing_still_animation - wizard_base_animation == $3d"
}
!if (wizard_transition_to_transforming_animation - wizard_base_animation) != $45 {
    !error "Assertion failed: wizard_transition_to_transforming_animation - wizard_base_animation == $45"
}
!if (wizard_walk_cycle_animation - wizard_base_animation) != $29 {
    !error "Assertion failed: wizard_walk_cycle_animation - wizard_base_animation == $29"
}
