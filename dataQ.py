from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
#    0xc8: "spriteid_mouse",
}

# Room 0
#constant(2, "objectid_left_mouse")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataQ.dat", "6502", "dff117f00b8f8cbd07939320d753fcdf")

common_to_all('Q')

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3af1, 0x3c0f): {
        "l0070": "message_address_low",
        "l0071": "message_address_high",
        "l0072": "message_offset_low",
        "l0073": "screen_y_offset_within_cell",
    },
    (0x3c14, 0x3ca3): {
        "l0070": "bitmap_address_low",
        "l0071": "bitmap_address_high",
        "l0072": "screen_address1_low",
        "l0073": "screen_address1_high",
    },
    (0x3cc9, 0x3ce2): {
        "l0070": "screen_address_low",
        "l0071": "screen_address_high",
    },
    (0x42e6, 0x42f1): {
        "l0070": "filename_address_low",
        "l0071": "filename_address_high",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

# Labels copied from g.py
constant(7, "colour_white")
expr_label(0x0055, make_add("sprdata_ptr", "1"))
label(0x002e, "current_menu_index")
label(0x0054, "sprdata_ptr")
#label(0x0ab1, "old_brkv1")
#expr_label(0x0ab2, "old_brkv1+1")
entry(0x16dc, "osfile_wrapper")
label(0x178b, "vsync_counter")
entry(0x178c, "wait_for_vsync")
entry(0x1839, "reset_game_because_escape_pressed")
label(0x3617, "prompt_user_to_insert_correct_disc")
entry(0x381c, "print_encrypted_string_at_yx")
label(0x3ca6, "copyright_message")
expr(0x3c70, make_lo("copyright_message"))
expr(0x3c72, make_hi("copyright_message"))
word(0x3ad7)
expr(0x3ad7, "level_specific_update_ptr")
word(0x3ad5)
expr(0x3ae5, "colour_white")
label(0x387c, "inkey_0")
label(0x2980, "reset_menu_items")
label(0x29a8, "draw_menu_icons")
label(0x431b, "icodata_filename")
ri(0x42cf)
ri(0x42d2)
label(0x296f, "displayed_menu_slots")

# Regular labels
constant(0x8f, "inkey_key_escape")
constant(0xc6, "inkey_up_cursor")

comment(0x3ae4, "make toolbar palette white so all text appears white")
comment(0x3aec, "wait 2 seconds")
decimal(0x3aed)
expr(0x3b06, make_lo("encoded_message"))
expr(0x3b0a, make_hi("encoded_message"))
label(0x3b24, "get_next_character")
comment(0x3b28, "read next character of message")
comment(0x3b2a, "decode character")
comment(0x3b36, "reduce ASCII character to index starting at zero")
comment(0x3b3d, "multiply index by eight")
comment(0x3b44, "add $3d0c to get address of character definition")
expr(0x3b45, make_lo("character_definitions"))
expr(0x3b4b, make_hi("character_definitions"))
comment(0x3b4e, "copy character definition")
label(0x3b50, "copy_character_loop")
label(0x3b5c, "copy_to_screen_loop")
comment(0x3b62, "copy byte of character to the screen")
label(0x3b67, "skip_write_to_screen")
comment(0x3b6f, "move screen address up one character row")
label(0x3b80, "move_forwards_8_pixels")
label(0x3b93, "end_of_message_local")
label(0x3b96, "end_of_line")
comment(0x3ba6, "move down two character rows")
expr(0x3c04, "inkey_up_cursor")
label(0x3c0a, "wait_four_vsyncs_loop")
label(0x3c14, "copy_the_end_bitmap_to_screen")
decimal(0x3c15)
label(0x3c39, "copy_loop")
label(0x3cc9, "clear_screen")
label(0x3cd7, "clear_screen_loop")
label(0x3ce3, "check_for_escape_pressed_in_developer_mode")
expr(0x3cef, "inkey_key_escape")
comment(0x3cf5, "reset game")
label(0x3cfb, "character")
byte(0x3cfb, 8)
label(0x3d03, "unused1")
label(0x3d0c, "character_definitions")
label(0x3ffc, "encoded_message")
comment(0x42ad, "this code waits for a keypress then starts a new game, but it is never called. Instead there is a deliberate infinite loop above, forcing the user to reset the machine.")
decimal(0x42ae)
label(0x42b9, "wait_for_keypress_loop")
label(0x42c9, "clear_menu_slots_loop")
label(0x42e6, "load_icodata_loop")
expr(0x42e7, make_lo("icodata_filename"))
expr(0x42eb, make_hi("icodata_filename"))
label(0x42aa, "the_end_loop")
label(0x4301, "reset_menus_and_start_new_game")
label(0x4323, "icodata_load_address_low")
label(0x4324, "icodata_load_address_high")
label(0x4325, "wait_for_a_vsyncs")
label(0x432a, "wait_loop")
comment(0x3c47, "clear text and graphics windows")
comment(0x3c4c, "change background colour to black (logical colour 0)")
comment(0x3c56, "change foreground colour to white (logical colour 1)")
comment(0x3c60, "set cursor position to (3, 20)")
comment(0x3c6f, "show copyright message")
comment(0x3c76, "set text window to (left, bottom, right, top) = (1, 31, 39, 9)")
comment(0x3c8f, "reset background colour to logical colour 1")
comment(0x3c99, "reset foreground colour to logical colour 0")
label(0x4330, "the_end_bitmap")
expr(0x3c20, make_lo("the_end_bitmap"))
expr(0x3c27, make_hi("the_end_bitmap"))
comment(0x3c19, "copy bitmap to screen")
blank(0x3d03)
label(0x42ad, "unused2")
label(0x3afd, "display_full_message_loop")
comment(0x3af1, "start the scrolling message")
label(0x3bbb, "entry_point_for_scrolling_message")
comment(0x3b5e, "skip when we reach the end of screen memory, i.e. $8000")
label(0x3c11, "display_full_message_loop_local")
label(0x3bca, "skip_to_next_line_of_message")
label(0x3bd8, "end_of_message")
ri(0x3bda)
label(0x3be4, "move_up_one_pixel")
comment(0x3bef, "move up one character row")
label(0x3bfc, "check_for_up_arrow_in_developer_mode")
comment(0x3c0a, "wait until four vsyncs have passed and repeat")
label(0x007c, "character_definition_low")
label(0x007d, "character_definition_high")

for i in range(0x3d0c, 0x3ffc):
    picture_binary(i)
    byte(i)
    if ((i-0x3d0c) & 7) == 0:
        blank(i)

for i in range(0x4330, 0x46f0):
    byte(i)
    picture_binary(i)

blank(0x46f0)
comment(0x46f0, "unused: remenants of a BASIC program")

password_addr = 0x3ffc
password = get_password(password_addr, 0)
password = password.replace("[0d]", "[0d]\n")
comment(password_addr, "Encrypted scrolling message:\n\n'" + password + "'\n\nEOR-encrypted with $cb")

password_addr = 0x3ca6
password = get_password(password_addr)
comment(password_addr, "'" + password + "' EOR-encrypted with $cb")

entry(0x3ad9)
label(0x3cfa, "return1")
entry(0x42ad)


result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
