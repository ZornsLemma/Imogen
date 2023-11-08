from commands import *
import acorn
import re
from common import *
acorn.bbc()

config.set_label_references(False)

constant(3, "vdu_printer_off")
constant(6, "vdu_enable")
constant(7, "vdu_bell")
constant(8, "vdu_left")
constant(10, "vdu_lf")
constant(13, "vdu_cr")
constant(17, "vdu_set_text_colour")
constant(18, "vdu_set_graphics_colour")
constant(22, "vdu_set_mode")
constant(23, "vdu_define_character")
constant(28, "vdu_define_text_window")
constant(31, "vdu_goto_xy")
constant(127, "vdu_delete")

constant(5, "osfile_read_catalogue_info")
constant(0xff, "osfile_load")

constant(320, "screen_width_in_pixels")
constant(40, "characters_per_line")

substitute_labels = {
    (0x114f,0x1297): {
        "address1_low": "filename_low",
        "address1_high": "filename_high",
    },
    (0x145d,0x1800): {
        "address1_low":  "src_sprite_address_low",
        "address1_high": "src_sprite_address_high",
        "address2_low":  "dest_sprite_address_low",
        "address2_high": "dest_sprite_address_high",
    },

    (0x183d, 0x1841): {
        "address1_low": "filename_low",
        "address1_high": "filename_high",
    },
    (0x1aa0, 0x1aae): {
        "address1_low": "filename_low",
        "address1_high": "filename_high",
    },
}

def my_label_maker(addr, context, suggestion):
    for pair in substitute_labels:
        if context in range(pair[0], pair[1]):
            dict = substitute_labels[pair]
            if suggestion[0] in dict:
                return dict[suggestion[0]]

    return suggestion

set_label_maker_hook(my_label_maker)


label(0x287, "first_byte_break_intercept")

load(0x1234, "orig/g.dat", "6502", "ac5feeac5c32a306d4a73ba393677385")
move_id = move(0x1103, 0x1234, 0x29d2) # code copies 0x2a00 bytes, but only 0x29d2 is used
move_id2 = move(0x400, 0x40ff, 295) # code copies 512 bytes, but we only have 295 bytes of actual data
move(0x131, 0x40d0, 0x2f)
move(0xc00, 0x3fcb, 0x402c-0x3fcb) # code copies 256 bytes, but this is what we actually care about
move(0xab7, 0x4088, 0x48)

entry(0x3c06, "execution_start")

# Zero page variables
label(0x0006, "rnd0")
label(0x0007, "rnd1")
label(0x0008, "rnd2")
label(0x0009, "rnd3")
label(0x000a, "rnd4")
label(0x0014, "dest_sprite_number")
label(0x0015, "sprite_op_flags")
label(0x0016, "sprite_number")
label(0x0016, "sprite_number")
label(0x0018, "sprite_x_base_low")
label(0x0019, "sprite_x_base_high")
label(0x001a, "sprite_y_base_low")
label(0x001b, "sprite_y_base_high")
label(0x001d, "sprite_reflect_flag")
label(0x004c, "screen_base_address_high")

label(0x0070, "address1_low")
label(0x0071, "address1_high")
label(0x0072, "sprite_screen_address_low")
label(0x0073, "sprite_screen_address_high")
label(0x0074, "sprite_x_pos_low")
label(0x0075, "sprite_x_pos_high")
label(0x0076, "sprite_y_pos_low")
label(0x0077, "sprite_y_pos_high")
label(0x0078, "sprite_x_offset_within_byte")
label(0x0079, "byte_offset_within_sprite")

label(0x007b, "sprite_screen_address_for_column_low")
label(0x007c, "sprite_screen_address_for_column_high")
label(0x007d, "sprite_data_byte")
label(0x007e, "address2_low")
label(0x007f, "address2_high")
label(0x0080, "mask_sprite_byte")
label(0x0081, "sprite_width")
label(0x0082, "sprite_bit")
label(0x0083, "sprite_bit_mask")
label(0x0084, "sprite_y_offset_within_character_row")
label(0x0085, "sprite_character_x_pos")
label(0x0086, "amount_sprite_is_offscreen_x")

label(0x0088, "vertical_sprite_position_is_valid_flag")

# Keypresses are checked in the IRQ routine every vsync.
# Because the main game loop can be slow, multiple vsyncs can occur, so keypresses are accumulated and stored in "pending" variables
# The main game can deal with these in the next tick.
label(0x0020, "valid_direction_pending")
label(0x002a, "space_bar_press_pending")
label(0x002b, "space_bar_pressed")
label(0x002c, "z_key_pressed_pending")
label(0x002d, "x_key_pressed_pending")
label(0x0046, "return_key_pressed_pending")

label(0x00fc, "interrupt_accumulator")

label(0x137f, "reset_sprite_flags_and_exit")
comment(0x139f, "check flags to see if we are copying to another sprite", inline=True)
comment(0x13b3, "Y=0", inline=True)
label(0x13bf, "skip_inverting_x_offset")
comment(0x13aa, "copy the first four bytes from source sprite to destination sprite (the header)")
label(0x13ac, "copy_sprite_header_loop")
label(0x13b5, "skip_copying_sprite_header_to_destination_sprite")
comment(0x13b5, "add the x and y offset in the sprite header to the sprite position")
comment(0x13b7, "read byte 0 of sprite, a start x offset", inline=True)
comment(0x13c1, "set flags based on A", inline=True)
label(0x13c6, "non_negative_offset_in_x")
comment(0x13d3, "read byte 1 of sprite, a start y offset", inline=True)
label(0x13d8, "non_negative_offset_in_y")
comment(0x13d2, "Y=1", inline=True)
comment(0x13e2, "Y=2", inline=True)
comment(0x13e3, "read sprite width in pixels - 1", inline=True)
comment(0x13e9, "read the first byte of sprite data", inline=True)
comment(0x13f6, "Take the Y position and round down to the previous character row")
comment(0x13fe, "Then multiply by eight and store in ($72)")
comment(0x1409, "Multiply by four")
comment(0x1411, "Add eight times the x position as a character row")
comment(0x141a, "Add high byte including X")
label(0x1427, "not_out_of_range")
comment(0x142e, "set Y to the horizontal offset within byte (0-7) of the sprite X position")
comment(0x1435, "set the vertical offset within a character row (0-7) of the sprite Y position")
comment(0x143b, "load X and check flags to see if we are copying the mask to a destination sprite")

comment(0x1471, """*************************************************************************************

Regular sprite routines

*************************************************************************************""")
label(0x1471, "out_of_bounds_vertically2")
label(0x1477, "record_that_we_are_out_of_screen_range_vertically2")
label(0x147e, "write_one_pixel_to_the_screen2")
label(0x1498, "and_byte_with_mask_and_write_to_screen2")
label(0x14a5, "move_up_to_previous_character_row2")
label(0x14ad, "check_within_vertical_range2")
label(0x14b7, "y_coordinate_is_within_character_row2")
label(0x14c8, "byte_not_finished_yet2")
label(0x14fe, "move_to_next_column_while_rendering_reflected_about_y_axis2")
label(0x1517, "draw_sprite2")
label(0x1529, "finish_off_sprite2")

comment(0x1529, "restore the original three bytes of code (self-modifying)", inline=True)
comment(0x152b, "90 10='bcc and_byte_with_mask_and_write_to_screen2'", inline=True)
comment(0x1533, "05 82='ora sprite_bit'", inline=True)
comment(0x1540, """*************************************************************************************

Sprite routines that also copy the mask to a destination sprite (similar to code above)

*************************************************************************************""")
label(0x1540, "out_of_bounds_vertically")
label(0x154a, "record_that_we_are_out_of_screen_range_vertically")
comment(0x1557, "read byte from screen")
label(0x1551, "write_one_pixel_to_the_screen")
comment(0x1555, "update carry flag with the mask pixel", inline=True)
comment(0x1559, "read the screen pixel into Z", inline=True)
comment(0x155b, "if (screen pixel is set) then branch (this preserves carry, the mask pixel)", inline=True)
label(0x155e, "skip1")
comment(0x1564, "OR in (set) the appropriate bit and write back to screen memory")
comment(0x1566, "write byte to screen", inline=True)
label(0x1568, "move_up_to_next_pixel_row")
label(0x1574, "and_byte_with_mask_and_write_to_screen")
comment(0x1574, "AND with the mask to clear the appropriate bit and write the byte back to screen memory")
comment(0x1576, "write byte to screen", inline=True)
expr(0x1580, make_lo("screen_width_in_pixels-1"))
expr(0x1586, make_hi("screen_width_in_pixels-1"))
comment(0x1589, "check if Y coordinate is above or below the screen area", inline=True)
label(0x1593, "y_coordinate_is_within_character_row")
comment(0x1598, "copy mask byte to destination")
label(0x15ab, "byte_not_finished_yet")
comment(0x15ab, "check top bit", inline=True)
comment(0x158b, "$8000 is end of screen memory", inline=True)
comment(0x15ad, "if (sprite bit is clear) then branch (to write pixel to screen)", inline=True)
comment(0x15a1, "load next source byte from sprite")
comment(0x15a5, "set mask byte to 255", inline=True)
comment(0x15a7, "reset loop counter", inline=True)
comment(0x15af, "add set bit to mask", inline=True)
comment(0x15b1, "get next bit", inline=True)
comment(0x15b3, "if bit set then branch", inline=True)
label(0x15c3, "found_second_bit_set")
comment(0x15b5, "add clear bit to mask", inline=True)
comment(0x15b8, "if still in same character row, then branch back")
comment(0x15bc, "move up to previous character row")
comment(0x15e2, "reset to start of (i.e. bit 7 of) next byte", inline=True)
expr(0x15bf, make_lo("screen_width_in_pixels"))
expr(0x15df, "characters_per_line")
label(0x1581, "move_up_to_previous_character_row")
comment(0x15c3, "add set bit to mask")
comment(0x15c5, "check if we are done", inline=True)
comment(0x15c9, "reset sprite address")
comment(0x15d5, "move to next column")
comment(0x15de, "if we reach the right hand edge of the screen then we are done")
comment(0x15e2, "move sprite addresses on by eight to get to next character column")
decimal(0x15df)
label(0x15f3, "move_to_next_column_while_rendering_reflected_about_y_axis")
comment(0x15f3, "move within byte to next bit", inline=True)
comment(0x1611, "store the single bit within a byte we are interested in", inline=True)
comment(0x1615, "store every other bit in the byte other than the one we are interested in (it's a mask)", inline=True)
label(0x161e, "finish_off_sprite")
label(0x1623, "shift_mask_byte_loop")
label(0x1628, "write_last_byte")
#comment(0x15ad, "", inline=True)
#comment(0x15ad, "", inline=True)
#comment(0x15ad, "", inline=True)

label(0x1589, "check_within_vertical_range")
expr(0x1570, make_lo("screen_width_in_pixels"))
label(0x160c, "draw_sprite")

expr(0x1675, "characters_per_line")
expr(0x167b, make_lo("screen_width_in_pixels-1"))
expr(0x1687, "characters_per_line-1")
label(0x16f7, "skip2")


label(0x162f, "clamp_and_clip_x")
comment(0x162f, "exit if X position is 512 or more", inline=True)
comment(0x1636, "exit if Y position is 512 or more", inline=True)
comment(0x164f, "check flags2 (top bit) to see if we should clamp to the right edge")
comment(0x1653, "clamp to left edge")
comment(0x1657, "if fully off screen to the right, then pull values and return else just return")

label(0x163d, "pull_values_and_exit_sprite_op_local")
label(0x1640, "clamp_x")
label(0x165e, "sprite_clamp_x_left")
label(0x1670, "sprite_clamp_x_right")
label(0x168a, "sprite_clip_x")
comment(0x168e, "exit if fully offscreen", inline=True)
label(0x1696, "sprite_clip_x_loop")
label(0x16a5, "not_copying_to_destination_sprite")
label(0x16ce, "pull_values_and_exit_sprite_op")
decimal(0x1658)
comment(0x16a3, "set dest sprite byte to 255", inline=True)
comment(0x16aa, "get top bit", inline=True)
comment(0x16ab, "if set then branch", inline=True)
comment(0x16ad, "put clear bit into mask", inline=True)
comment(0x16af, "read next bit", inline=True)
comment(0x16b0, "put next bit into mask", inline=True)
comment(0x16b2, "loop back", inline=True)
label(0x16b5, "found_set_bit")
comment(0x16b5, "put set bit into mask", inline=True)
comment(0x16b7, "get next bit", inline=True)
comment(0x16b8, "if set then branch", inline=True)
comment(0x16ba, "put zero bit into mask", inline=True)
comment(0x16bc, "loop back", inline=True)
label(0x16bf, "found_second_set_bit")
comment(0x16bf, "put another set bit into mask", inline=True)
comment(0x16c1, "decrement loop counters", inline=True)
comment(0x16c5, "jump back if not done", inline=True)

comment(0x1642, "calculate character x position by dividing pixel position by eight")
expr(0x167f, make_lo("screen_width_in_pixels-1"))
expr(0x1683, make_hi("screen_width_in_pixels-1"))
comment(0x167e, "set x position to the right edge (319)")
decimal(0x1675)
decimal(0x1687)
label(0x17b9, "if_vsync_elapsed_then_set_toolbar_area_palette")
comment(0x17bb, "check for vsync interrupt", inline=True)
comment(0x17c0, "reset timers")
label(0x17fa, "if_timer1_elapsed_then_set_main_area_palette")
comment(0x17fc, "check for timer1 elapsed", inline=True)
label(0x18a6, "get_random_number_up_to_a")
label(0x18a9, "generate_random_bits_loop")
comment(0x18a6, "Random Number Generator\n\nOn Entry: A must be one less than a power of two, a mask to fill in with random bits\nOn Exit: A holds a random number up to the value of A on entry")
comment(0x18a6, "store loop variable, all 1s in the lowest bits", inline=True)
comment(0x18a8, "remember mask", inline=True)
comment(0x18bf, "recall mask", inline=True)
comment(0x18bb, "update loop variable by shifting right", inline=True)
comment(0x18bd, "loop back until enough random bits are generated", inline=True)
comment(0x18c0, "AND the mask with the random bits", inline=True)
comment(0x1966, "use the value stored in the X,Y registers as an address to jump to")
label(0x1825, "change_palette_logical_colour_x_to_y")
label(0x196c, "jmp_instruction")
expr(0x1967, "jmp_instruction+1")
expr(0x196a, "jmp_instruction+2")
expr(0x196d, "0")
label(0x1966, "jmp_xy")
expr(0x11e7, make_lo("brk_handler"))
expr(0x11ec, make_hi("brk_handler"))
comment(0x16ff, "set brk handler")
comment(0x1714, "set brk handler")

label(0x3a12, "update_main_keys")
label(0x3a41, "store_x_as_valid_direction_pending")
label(0x3a47, "update_space_etc_keys") # TODO: Why does it check the left and right keys again?
label(0x3a54, "save_space_bar_state_change_pending")
label(0x3a73, "no_valid_direction")

label(0x3a8d, "z_key_pressed")
comment(0x3a71, "ALWAYS branch", inline=True)
label(0x3ac7, "jump_requested")
label(0x3ac8, "jump_requested_previous_tick")
label(0x3ac9, "player_move_direction_requested")
comment(0x3ac9, "$ff for left, $01 for right, $00 for none")
label(0x3aca, "move_left_requested")
label(0x3acb, "move_right_requested")
label(0x3c2c, "relocation1_loop")
label(0x3c3a, "relocation2")
label(0x3c5c, "relocation2_loop")
label(0x3c6a, "relocation3")
blank(0x3c6a)
comment(0x3c6a, "Relocation 3: Copy $48 bytes of code from $4088 to $0ab7")
label(0x3c6c, "relocation3_loop")
blank(0x3c77)
comment(0x3c77, "Relocation 4: Copy $100 bytes of code from $3fcb to $0c00")
label(0x3c79, "relocation4_loop")
blank(0x3c82)
comment(0x3c82, "Relocation 5: Copy $2f bytes of data from $40d0 to $0131")
label(0x3c84, "relocation5_loop")
comment(0x3c8f, "Relocation finished")
char(0x3c97)
label(0x3c9b, "set_drive_and_directory")
comment(0x3cd2, "remember brk and irq vectors")
comment(0x3cf0, "redefine character 254 as a diamond shape")
comment(0x3d1a, "clear the display of remaining transformations")
comment(0x3d3d, "define envelopes")
comment(0x3d52, "loop eight times resetting data in the printer buffer")
comment(0x3d61, "store something else now that envelopes have already been defined above?")
comment(0x3d75, "seed random number generation by reading the User VIA timers")
comment(0x3d8d, "set base address for sprite rendering, $6200 is the main game area")
label(0x110b, "vertical_sync_amount_for_crtc_register")
label(0x3f05, "drive_number")
char(0x3f05)
entry(0x3fbb, "sideways_rom_image")
comment(0x3fbb, "language entry point", inline=True)
entry(0x3fbe)
comment(0x3fbe, "service entry point", inline=True)
entry(0x3fc3)
comment(0x3fc1, "ROM type flag", inline=True)
byte(0x3fc1, 1)
comment(0x3fc2, "empty copyright string", inline=True)
comment(0x3fc3, "do nothing - return", inline=True)
comment(0x3fc4, "unused bytes", inline=True)

entry(0x12bb, "something23_TODO")
entry(0x12da, "something24_TODO")
entry(0x16d3, "brk_handler")
entry(0x1b90, "something26_TODO")

label(0x1752, "data_TODO")
expr(0x1740, make_lo("data_TODO"))
expr(0x1742, make_hi("data_TODO"))

label(0x12d9, "return1")
label(0x1376, "return2")
label(0x16cd, "return3")
label(0x178a, "return4")
label(0x17f9, "return5")
label(0x1823, "return6")
label(0x1e43, "return7")
label(0x1f2c, "return8")
label(0x21ff, "return9")
label(0x22ec, "return10")
label(0x2357, "return11")
label(0x23a8, "return12")
label(0x2659, "return13")
label(0x2692, "return14")
label(0x26e4, "return15")
label(0x271d, "return16")
label(0x276f, "return17")
label(0x2ada, "return18")
label(0x2af5, "return19")
label(0x2b64, "return20")
label(0x2b86, "return21")
label(0x3496, "return22")
label(0x3534, "return23")
label(0x36a7, "return24")
label(0x377c, "return25")
label(0x37f2, "return26")
label(0x3fba, "return27")
label(0x0afe, "return28")
label(0x0473, "return29")
label(0x04ca, "return30")


label(0x179a, "delay_loop")

expr(0x0c27, make_lo("irq1_routine"))
expr(0x0c2c, make_hi("irq1_routine"))


expr(0x3c12, "vdu_enable")
comment(0x3c06, "The loader will have executed VDU 21 to disable VDU output. Record the current disable state before re-enabling it, so we can check it later as part of a copy protection scheme.")
comment(0x3c06, "This initialisation code gets overwritten by level data later on.")
comment(0x3d91, "Check to see if VDU output was disabled (VDU 21) when we first started to execute, before we re-enabled output (VDU 6) ourselves.")
comment(0x3d91, "TODO: Is this to make the G file self-contained if it's run directly from the command line during development, instead of from IMOGEN?")
label(0x5bc0, "start_of_screen_memory")
expr(0x3e6d, make_lo("start_of_screen_memory"))
expr(0x3e74, make_hi("start_of_screen_memory"))
label(0x3f6e, "initial_screen_disabled_flag")
expr(0x3d97, "vdu_set_mode")
label(0x3da3, "clear_toolbar_part_of_screen")
comment(0x3da3, "Clear memory from $5b00 to $6200. This clears the toolbar area of the screen. The toolbar lives in screen memory from $5bc0 to $6200, so this routine clears a little before the start of screen memory, but this is OK as we are just about to load sprite data there anyway")
comment(0x3da3, "set start address to $5b00", inline=True)
label(0x3dae, "clear_toolbar_part_of_screen_loop")
comment(0x3d96, "VDU output wasn't disabled when we started to execute. Change to MODE 4.")
comment(0x3db9, "Define text window that excludes the leftmost column (left 1, bottom 31, right: 39, top: 0)", inline=True)
label(0x3db9, "define_text_window")
comment(0x3dd2, "set background text colour to 1")
comment(0x3ddc, "set foreground text colour to 0")
comment(0x3de6, "set graphics foreground colour to 0")
comment(0x3df3, "read *TV shift setting")
comment(0x3dfc, "remember *TV shift setting")
comment(0x3dfe, "restore previous *TV setting (since we changed it in the process of reading it)", inline=True)
comment(0x3e01, "Set CRTC registers")
comment(0x3e0b, "redundant", inline=True)
comment(0x3e0d, "redundant", inline=True)
comment(0x3e1a, "subtract five", inline=True)
comment(0x3e0f, "Calculate 34+tv shift and store in vertical_sync_amount_for_crtc_register")
comment(0x3e4e, "Double the *TV shift amount", inline=True)
comment(0x3e50, "Adjust two timing counters depending on the *TV shift amount")
label(0x3e52, "adjust_timing_variable_loop")
comment(0x3e50, "Loop counter, goes twice around the loop (Y is decremented twice each time)", inline=True)
comment(0x3e56, "subtract twice the *TV shift amount", inline=True)
comment(0x3e5f, "Load sprites")

blank(0x3c16)
comment(0x3c16, "Relocation 1: Copy 512 bytes of code from &40FF to &400")
label(0x40ff, "some_code_high_copy_TODO")
label(0x400, "wait_for_timingB_counter")
expr(0x3c17, make_lo("some_code_high_copy_TODO"))
expr(0x3c1b, make_hi("some_code_high_copy_TODO"))
expr(0x3c1f, make_lo("wait_for_timingB_counter"))
expr(0x3c23, make_hi("wait_for_timingB_counter"))
comment(0x3c28, "TODO: branch never taken?", inline=True)
comment(0x3c4e, "TODO: branch always taken?", inline=True)
comment(0x3c58, "TODO: branch never taken?", inline=True)
blank(0x3c3a)
comment(0x3c3a, "Relocation 2: Copy &2A00 bytes from &1234 to &1103. This is done more for obfuscation than any real requirement - we could have just loaded at &1103 in the first place.")

label(0x3eff, "drive_0_command")
label(0x3f07, "dir_dollar_command")

expr(0x3cf1, "vdu_define_character")
label(0x3f66, "character_fe_bitmap")
byte(0x3f66, 8, 1)
picture_binary(0x3f66, 8)
entry(0x3cfc, "define_character_fe_loop")

expr(0x3dba, "vdu_define_text_window")
expr(0x3dd3, "vdu_set_text_colour")
expr(0x3ddd, "vdu_set_text_colour")
expr(0x3de7, "vdu_set_graphics_colour")

entry(0x395e, "define_envelope")

constant(39, "screen_width_minus_one")
expr(0x3dc9, "screen_width_minus_one")

# TODO: This code is currently disassembled using "sprite-oriented" labels - it's not a big deal in the short term as we already understand it and can just view this subroutine as a black box, but later on it would be good (even if it means using expr() on individual labels, though I'd hope the label maker hook can work round this) to give it better labels.
entry(0x16dc, "osfile_wrapper")

expr(0x197c, "osfile_load")
label(0x1980, "sprdata_filename")
expr(0x1970, make_lo("sprdata_filename"))
expr(0x1974, make_hi("sprdata_filename"))
stringcr(0x1980)
expr(0x3e60, make_lo("sprdata_filename"))
expr(0x3e64, make_hi("sprdata_filename"))
entry(0x196f, "load_sprdata")

comment(0x3e6c, "Load 'sprdata' file into memory so it ends just before screen memory at $5bc0.")
comment(0x3e7c, "remember where sprite data is loaded")

comment(0x3e82, "Load 'icodata' file into memory at icodata")
label(0x40ff, "icodata")
expr(0x3e83, make_lo("icodata"))
expr(0x3e87, make_hi("icodata"))
label(0x3f5e, "icodata_filename")
stringcr(0x3f5e)
expr(0x3e92, make_lo("icodata_filename"))
expr(0x3e96, make_hi("icodata_filename"))

label(0x389c, "auxcode_filename")
stringcr(0x389c)
expr(0x36a9, make_lo("auxcode_filename"))
expr(0x36ad, make_hi("auxcode_filename"))
expr(0x36b5, "osfile_load")
expr(0x36b1, make_lo("auxcode"))
expr(0x36b3, make_hi("auxcode"))
expr(0x36c2, "check_password")

expr(0x3e68, "osfile_read_catalogue_info")
expr(0x3e9a, "osfile_load")

expr(0x172e, "vdu_bell")

entry(0x3ec9, "seek_track_a")

def do_osword_7f_block_partial(addr):
    byte(addr)
    comment(addr, "drive", inline=True)
    word(addr+1, 2)
    for i in range(memory[addr+5]+1):
        byte(addr+6+i)
    comment(addr+1, "data address", inline=True)
    comment(addr+5, "number of parameters", inline=True)

comment(0x3ef4, "TODO: I think the track and sector values in this block are logical tracks and rely on the previous step operation, but I'm not sure. I suspect this is done entirely for obfuscation and has been converted to file operations in this version, but I haven't actually checked that.")
label(0x3ef4, "osword_7f_block_read")
do_osword_7f_block_partial(0x3ef4)
expr(0x3ef5, "icodata")
comment(0x3efa, "command ($53=read data)", inline=True)
comment(0x3efb, "track", inline=True)
comment(0x3efc, "sector", inline=True)
comment(0x3efd, "size+count ($23=3 256 byte sectors)", inline=True)
label(0x3efe, "osword_7f_read_result")

label(0x3ee1, "osword_7f_block_seek") # TODO: poor name
do_osword_7f_block_partial(0x3ee1)
comment(0x3ee7, "command ($69=seek)", inline=True)
label(0x3ee8, "osword_7f_block_seek_track")
label(0x3ee9, "osword_7f_seek_result") # TODO: poor name

label(0x3eea, "osword_7f_block_write_special_register") # TODO: poor name
do_osword_7f_block_partial(0x3eea)
comment(0x3ef0, "command ($7a=write special register)", inline=True)
comment(0x3ef1, "special register ($12=track)", inline=True)
label(0x3ef2, "osword_7f_block_write_special_register_track")
label(0x3ef3, "osword_7f_write_special_register_result")

entry(0x3ed5, "set_track_special_register_to_a")
entry(0x3ea1, "read_icodata_using_osword_7f")

comment(0x132c, """Get sprite address for sprite A

Sprites 0-196: stored in sprdata
Sprite 197: is stored at $0bc5
Sprite 198: is stored at $0b93
Sprite 199: is stored at $0b11
Sprite 200+: stored in level data
""")
label(0x0b11, "sprite_199")
label(0x0b93, "sprite_198")
label(0x0bc5, "sprite_197")
expr(0x132d, make_lo("sprite_199"))
expr(0x132f, make_hi("sprite_199"))
decimal(0x1331)
expr(0x1335, make_lo("sprite_198"))
expr(0x1337, make_hi("sprite_198"))
decimal(0x1339)
expr(0x133d, make_lo("sprite_197"))
expr(0x133f, make_hi("sprite_197"))
decimal(0x1341)
decimal(0x1349)
entry(0x132c, "get_address_of_sprite_a")
label(0x135d, "get_sprite_address_from_sprite_table")
comment(0x134e, "The first two bytes of the level data is the offset to the sprite table")
comment(0x134e, "remember sprite number", inline=True)
comment(0x1352, "add offset to sprite table (low)", inline=True)
comment(0x1358, "add offset to sprite table (high)", inline=True)
comment(0x135c, "recall sprite number", inline=True)
decimal(0x134d)

label(0x1272, "data_filename")
label(0x1276, "data_filename_variable_letter")
string(0x1272, 4)
stringcr(0x1276)
expr(0x1159, make_lo("data_filename"))
expr(0x115d, make_hi("data_filename"))
expr(0x1165, "osfile_load")
label(0x3ad5, "level_data")
expr_label(0x3ad6, make_add("level_data", "1"))
expr(0x1161, make_lo("level_data"))
expr(0x1163, make_hi("level_data"))
expr(0x1350, make_lo("level_data"))
expr(0x1357, make_hi("level_data"))

label(0x1377, "power_of_2_table")
hexadecimal(0x1377, 8)

entry(0x3814, "print_y_spaces_loop")

entry(0x36fc, "string_input") # TODO: Something like this
char(0x3475)
char(0x3479)
char(0x3505)
char(0x3509)
char(0x350d)
char(0x3511)
char(0x370d)
char(0x3711)
char(0x3715)
char(0x3719)
char(0x3721)
char(0x375a)
char(0x3813)
expr(0x3755, "vdu_left")
expr(0x375f, "vdu_left")
expr(0x3725, "'9' + 1") # TODO: not assembler independent
char(0x372b)
expr(0x372f, "'Z' + 1") # TODO: not assembler independent
label(0x387c, "inkey_0")
label(0x3acc, "negative_inkey")
label(0x362e, "wait_for_return")
expr(0x3632, "vdu_cr")
expr(0x3709, "vdu_delete")
constant(0xdf, "caps_mask")
expr(0x3473, "caps_mask")
expr(0x3729, "caps_mask")
expr(0x355b, "vdu_cr")
expr(0x3562, "vdu_lf")
expr(0x3705, "vdu_cr")

entry(0x40a, "save_or_restore_screen_under_dialog_box") # TODO: guesswork
entry(0x444, "vdu_goto_0_9")
expr(0x445, "vdu_goto_xy")

entry(0x453, "something_TODO")
# TODO: DELETE? entry(0x3fbb, "something2_TODO")

comment(0x3fcb, """Initialise display

1. Set toolbar and game area colours
2. Initialise the system timer to interrupt at the right time to change palettes
3. Initialise the irq routine address
4. Set the crtc registers
""")
entry(0x3fcb, "initialise_display")
label(0x3fcb, "initialise_display_high_copy_start")
comment(0x1df4, "TODO: Is this code deliberately trashing the code at initialise_display?")
comment(0x1e80, "TODO: What's going on with the modification to initialise_display here? Is it copy protection/obfuscation or is there something else going on?")
comment(0x1ebb, "TODO: What's going on with the modification to initialise_display here? Is it copy protection/obfuscation or is there something else going on?")

entry(0x402c, "quit_to_basic")
for i in range(5):
    char(0x406a+i*4)
expr(0x407e, "vdu_cr")
expr(0x4040, "vdu_set_mode")
expr(0x403b, "vdu_printer_off")

entry(0x4088, "clear_128_bytes_at_l09ef") # TODO: improve name as things become clearer
label(0x4088, "clear_128_bytes_at_l09ef_high_copy_start")
label(0x4088+0x48, "clear_128_bytes_at_l09ef_high_copy_end")
expr(0x3c74, make_subtract("clear_128_bytes_at_l09ef_high_copy_end", "clear_128_bytes_at_l09ef_high_copy_start"))

entry(0x4094, "something6_TODO")
entry(0x40a5, "convert_level_number_to_letter") # TODO: guesswork but something like this - probably not right though
entry(0x40c0, "convert_level_letter_to_number") # TODO: guesswork but something like this - probably not right though

comment(0x40d0, "Update the transformation count on screen at text position (35-37, 6). This takes care to update as few digits on screen as possible, probably to reduce flicker and to offset the relatively slow implementation of print_italic.")
label(0x9ec, "current_transformations_remaining")
expr_label(0x9ed, "current_transformations_remaining+1")
expr_label(0x9ee, "current_transformations_remaining+2")
label(0x5c, "displayed_transformations_remaining")
expr_label(0x5d, "displayed_transformations_remaining+1")
expr_label(0x5e, "displayed_transformations_remaining+2")
decimal(0x149)
# TODO: From a py8dis POV, this code feels wrong/confusing. entry() and label() behave different with how the label is placed. This works, but I am not sure it's by design. Maybe it is, it's been a while and I haven't had any coffee yet...
entry(0x40d0, "update_displayed_transformations_remaining")
label(0x40d0, "update_displayed_transformations_remaining_high_copy_start")
label(0x40d0+0x2f, "update_displayed_transformations_remaining_high_copy_end")
expr(0x3c8c, make_subtract("update_displayed_transformations_remaining_high_copy_end", "update_displayed_transformations_remaining_high_copy_start"))
expr(0x140, "vdu_goto_xy")
expr(0x3c85, "update_displayed_transformations_remaining_high_copy_start")
entry(0x136, "digit_loop")
entry(0x157, "digit_unchanged")
char(0x3d1b)
comment(0x2c8c, "Decrement current_transformations_remaining by one, unless it's already zero. Leading digits are handled specially so they turn into spaces rather than zeroes. Carry is clear on exit iff the value was zero on entry.")
entry(0x2c8c, "decrement_current_transformations_remaining")
expr(0x2c95, "' ' + '0'") # TODO: not portable
label(0x2cd5, "decrement_current_tranformations_remaining_pla_rts")
label(0x2cca, "decrement_current_tranformations_remaining_middle_digit_now_zero")
char(0x2ca0)
char(0x2ca4)
char(0x2caf)
char(0x2cb5)
char(0x2cc0)
char(0x2cce)
label(0x2cd4, "decrement_current_tranformations_remaining_no_borrow")
comment(0x2b5c, "branch if no transformations remaining before decrement", inline=True) # TODO: rephrase as "branch if decrement failed"? and maybe make associated change in comment at 2c8c?
comment(0x2337, "Transform the player into a new form.")
entry(0x2337, "transform")

label(0x48, "current_player_character")
label(0x4d, "new_player_character")

comment(0x111a, "Initialise the number of remaining transformations to 150.")
char(0x111b)
char(0x1120)
char(0x1125)
char(0x2cc4)

entry(0x1866, "print_italic")
char(0x1867)
expr(0x186a, "vdu_delete")
expr(0x1888, "vdu_define_character")
label(0x1893, "define_character_ff_loop")
entry(0x18a3, "print_italic_rts")
# TODO: Could use a named constant for character $ff - ditto character $fe I guess

entry(0x17a0, "irq1_routine")
entry(0x1839, "something11_TODO")
entry(0x18c3, "something12_TODO")
entry(0x1988, "something13_TODO")
entry(0x1a10, "something14_TODO")
entry(0x1b8a, "something15_TODO")
# TODO: DELETE? entry(0x1d99, "something16_TODO")
entry(0x1fd7, "something16_TODO")
entry(0x2200, "something17_TODO")
entry(0x2248, "something18_TODO")
entry(0x22cd, "something19_TODO")
entry(0x2a38, "something20_TODO")
entry(0x2b87, "something21_TODO")
entry(0x2be0, "something22_TODO")
# TODO: DELETE entry(0x35f7, "something23_TODO")

label(0x31, "desired_level") # TODO: This is not right but let's go with it for now - the way this is used it clearly contains *a* level (as a letter, I think), but I am not quite sure what it's used for - the use at 36df suggests this is more like "current level" actually - or maybe it's more like "level_to_load"
label(0x37, "currently_loaded_level")
label(0x51, "previous_level") # TODO: see use at initialise_level
label(0x1175, "level_already_loaded")
label(0x36da, "check_password_level")
entry(0x36db, "select_level_a")
comment(0x114f, "TODO: Why do we check desired_level against currently_loaded_level in this loop? The loop kind of makes sense as a retry if disc error sort of thing, but I don't see why we'd ever have the wrong level loaded or something like that. It still doesn't feel quite right, but could this maybe be some leftover hint of a tape version?")
entry(0x1186, "level_reset_loop")
entry(0x11dd, "clear_sixteen_entry_table1")
comment(0x11f8, "Blank the whole screen temporarily. TODO: Note that when flipping from screen to screen during play, the toolbar is not blanked, but it is here. Is this just cosmetic or is there a technical reason for this?")

entry(0x29a1, "draw_toolbar") # TODO: plausible guess
# TODO: barking up wrong tree entry(0x1df4, "draw_gameplay_area") # TODO: plausible guess
# TODO: Inconsistent use of "toolbar" and "menu", fix up eventually - "toolbar" is probably better, but not thought much yet - also some inconsistency between "icon" and "slot", although these are arguably distinct (even if the disassembly doesn't respect it), a slot can be blank or have an icon in it - also maybe "slot" vs "index" is a bit sloppy
entry(0x29a8, "draw_menu_icons")
entry(0x29d7, "draw_next_menu_slot")
label(0x29dd, "redraw_menu_pointer_flag")
entry(0x29c1, "menu_pointer_not_present_on_slot")
comment(0x29c9, "If there's a blank under the pointer in the new menu, bump the pointer left until we find a non-blank slot.")
entry(0x29c9, "find_valid_menu_slot_loop")
entry(0x29d4, "new_menu_index_valid")
constant(0x11, "menu_slot_count") # numbered 0-$10 inclusive
expr(0x29d9, "menu_slot_count")
entry(0x29aa, "draw_menu_icon_loop")

entry(0x2c0c, "plot_menu_icon")
comment(0x2c11, "Save the current screen_base_address_high so we can temporarily set it to $58 to plot the menu icon. TODO: Is this just saving the old value because it's tidy/safe, or do we really not know what the old value was? I'd have naively thought we could just do lda #blah:sta screen_base_address_high at the end of this routine?")

comment(0x3f78, "The following code assumes there may be a ROM image stored in sideways RAM at $8000. It copies 16 bytes of an empty ROM image to the start of sideways RAM. This overwrites any existing ROM image held in sideways RAM. Is this some copy protection, or a development environment?")
label(0x3f7b, "copy_to_sideways_ram_loop")
comment(0x3f85, "Copy 256 bytes from quit_to_basic to $be00, and 256 bytes from $0b00 to $bf00. ")
comment(0x3f9f, "The reset intercept code is set to 'JMP $1845'")
comment(0x3fa1, "JMP opcode")
expr(0x3fab, make_lo("reset_code"))
expr(0x3fb4, make_hi("reset_code"))
comment(0x1845, "Assuming there is sideways RAM mapped into ROM slot 13, this copy 256 bytes from $be00 to $0c00, and 256 bytes from $bf00 to $0b00. Could this be code helping during development of the game?")
comment(0x1848, "select ROM in slot 13", inline=True)
comment(0x1862, "clear the reset vector")
label(0x184d, "copy_from_rom_c_loop")
label(0x1845, "reset_code")
label(0x1103, "copy_protection_flag")

expr(0xaf0, "last_level_letter")
expr(0xaf7, "first_level_letter")
expr(0xae9, "first_level_letter")
expr(0x37c2, "first_level_letter")
expr(0x37cb, "first_level_letter")
expr(0x1226, "first_level_letter")
expr(0x124d, "first_level_letter")
expr(0x127c, "first_level_letter")
expr(0x1a4a, "first_level_letter")
expr(0x39dd, "last_level_letter")
expr(0x39e7, "last_level_letter")
expr(0x39eb, "first_level_letter")
expr(0x113b, "first_level_letter")
expr(0x112f, "last_level_letter+1")
expr(0x1a6a, "first_level_letter")
expr(0x177b, "first_level_letter")

comment(0x1766, "Set the toolbar and gameplay area colours. In mono mode both are white. In colour mode the gameplay area is cyan and the toolbar colour is toolbar_colour_choices[(level_letter - 'A') & 3].")
entry(0x1766, "set_toolbar_and_gameplay_area_colours")
label(0x1761, "toolbar_colour_choices")
constant(0, "black")
constant(1, "red")
constant(2, "green")
constant(3, "yellow")
constant(6, "cyan")
constant(7, "white")
expr(0x1761, "yellow")
expr(0x1762, "green")
expr(0x1763, "white")
expr(0x1764, "red")
expr(0x1767, "white")
expr(0x1786, "cyan")
expr(0x11f9, "black")
expr(0x1239, "black")

def negative_constant(c, s):
    assert c < 0
    constant(c & 0xff, s)
negative_constant(-113, "inkey_key_escape")
negative_constant(-1, "inkey_key_shift")
negative_constant(-74, "inkey_key_return")
negative_constant(-98, "inkey_key_z")
negative_constant(-67, "inkey_key_x")
negative_constant(-99, "inkey_key_space")
negative_constant(-26, "inkey_key_left")
negative_constant(-122, "inkey_key_right")
expr(0x2a53, "inkey_key_escape")
expr(0x2ab1, "inkey_key_shift")
expr(0x3a13, "inkey_key_return")
expr(0x3a1c, "inkey_key_z")
expr(0x3a28, "inkey_key_x")
expr(0x3a48, "inkey_key_space")
expr(0x3a59, "inkey_key_left")
expr(0x3a61, "inkey_key_right")
# TODO: What does the shift key do in the game? Or Escape?

# TODO: Don't know what the byte means yet, but the code structure makes it clear this is indexed by level number
label(0x9ef, "byte_per_level_table1")

entry(0x1140, "initialise_level") # TODO: guessing, but seems plausible

label(0xab5, "old_irq1v")
expr_label(0xab6, "old_irq1v+1")

entry(0x178c, "wait_for_vsync")

# TODO: Why are there two copies of BRKV? These can probably be renamed once their use becomes clearer.
label(0xab1, "old_brkv1")
expr_label(0xab2, "old_brkv1+1")
label(0xab3, "old_brkv2")
expr_label(0xab4, "old_brkv2+1")

comment(0x38ac, "The envelope definitions get overwritten after initialisation - this is harmless as they will have been copied into the OS workspace when they were defined.")
byte(0x38ac, 14)
decimal(0x38ac, 14)
label(0x38ac+14, "some_data1_TODO")
byte(0x38c2, 14)
decimal(0x38c2, 14)
label(0x38c2+14, "some_data2_TODO")
byte(0x38d8, 14)
decimal(0x38d8, 14)
label(0x38d8+14, "some_data3_TODO")
expr(0x3d3e, make_lo("envelope_1"))
expr(0x3d40, make_hi("envelope_1"))
expr(0x3d45, make_lo("envelope_2"))
expr(0x3d47, make_hi("envelope_2"))
expr(0x3d4c, make_lo("envelope_3"))
expr(0x3d4e, make_hi("envelope_3"))

# TODO: Temporary names, of course
label(0xaa1, "eight_entry_table1")
label(0xaa9, "eight_entry_table2")
label(0x1104, "timingA_counter_low")
label(0x1105, "timingA_counter_high")
label(0x1106, "timingB_counter_low")
label(0x1107, "timingB_counter_high")
label(0x1108, "timing_latch_low")
label(0x1109, "timing_latch_high")
label(0x110a, "display_initialised_flag")
label(0x2ee9, "four_entry_table2") # TODO: write only, at least in 'g' itself?
label(0x396f, "four_entry_table3_maybe_sound") # TODO: possibly something to do with sound??
label(0xa6f, "sixteen_entry_table1")
label(0xa7f, "sixteen_entry_table2")
expr(0x3f1b, make_subtract("sixteen_entry_table2", 1))
label(0x295c, "desired_menu_slots") # sub_c2980 initialises elements 9 inclusive to $11 exclusive, but elsewhere we do access lower elements
label(0x296f, "displayed_menu_slots") # see code at c29aa which pairs this with menu_slots1
# sub_c2157 uses all of these tables in parallel, so presumably they share the same size - represented here by 'x'
# TODO: These tables seem to occur in pairs (copy or cmp) so I've renamed them to use a/b names to try to tie the pairs together.
label(0x9b3, "x_entry_table9b")
label(0x95b, "x_entry_table2b")
label(0x971, "x_entry_table5b")
label(0x987, "x_entry_table6b")
label(0x966, "x_entry_table5a")
label(0x97c, "x_entry_table6a")
label(0x992, "x_entry_table7a")
label(0x99d, "x_entry_table7b")
label(0x9a8, "x_entry_table9a")
label(0x9be, "x_entry_table10a")
label(0x9c9, "x_entry_table10b")
label(0x38ac, "x_entry_table12") # TODO: Re-uses envelope_1, need to resolve label clash
label(0x38ac, "envelope_1")
label(0x38c2, "envelope_2")
label(0x38d8, "envelope_3")
label(0x950, "x_entry_table2a")

entry(0x3f6f, "probably_copy_protection_TODO")
# TODO: DELETE? expr(0x3f73, "game_state_flag_have_spell")

constant(3, "menu_action_file") # TODO: plausible guess
expr(0x3451, "menu_action_file")
expr(0x2af2, "menu_action_file")

label(0x29, "new_menu_index")
label(0x2e, "current_menu_index")
label(0x25, "another_menu_index")
entry(0x29de, "apply_new_menu_index")
entry(0x29ea, "apply_new_menu_index_rts")
entry(0x3a75, "menu_x_step_in_a")
comment(0x3a75, "TODO: This looks like a manual implementation of an auto-repeat delay, so if you hold down left/right a fraction of a second too long it doesn't zip all the way to the left or right.")
# TODO: Not yet clear exactly why we have two versions of these flags
label(0x3aa0, "space_flag2")
label(0x28, "left_right_flag")
label(0x3aa1, "left_right_flag2")
label(0x27, "left_right_repeat_flag")
entry(0x2c67, "apply_pending_menu_motion")
entry(0x2c88, "no_menu_motion")
entry(0x2c7e, "menu_left_pending")
entry(0x2c70, "menu_right_pending")
comment(0x2c7c, "always branch", inline=True)
entry(0x29eb, "unplot_menu_pointer") # TODO: plausible guess - hmm, losing faith in this
entry(0x2a17, "plot_menu_pointer") # TODO: plausible guess - ditto


comment(0x138d, """*************************************************************************************

Sprite Plotting

Plots a sprite with a mask, optionally reflected about a vertical axis. Sprites can be any pixel width and height, can be drawn at any pixel position, and have an offset in X and Y pixels whenever drawn, which helps authoring animations.

Conventionally, sprite characters are authored looking to the right.

On Entry:
             sprite_number: id of the sprite to plot
    sprite_x_base_low/high: X coordinate of sprite to plot (pixels)
    sprite_y_base_low/high: Y coordinate of sprite to plot (pixels)

           sprite_op_flags: These bits are mutually exclusive. If bit is set:

                            bit 0: also copy mask into sprite 'dest_sprite_number'
                            bit 1: erase the sprite from the screen (with mask)
                            bit 2: write to the screen without a mask
                            bits 3-7: unused

       sprite_reflect_flag: bit 7: draw sprite reflected ('looking left')

On Exit:
    Preserves A,X,Y

Notes:

Sprites are stored after a sprite table that hold the two byte offset to the sprite data itself.
Each sprite stores a four byte header, containing:

    <signed byte>   offset x to start drawing the sprite relative to sprite_x_base
    <signed byte>   offset y to start drawing the sprite relative to sprite_y_base
    <unsigned byte> width of sprite in pixels
    <unsigned byte> height of sprite in pixels

Sprite pixels are then stored in the following bytes, starting with the bottom left pixel and moving up the sprite. Columns are stored from left to right.

Each pixel is encoded in two bits:

    00 - draw the background colour (black)
    01 - draw the foreground colour
    10 - don't draw a pixel (it is masked off)
    11 - finish the current column and start the next column

The behaviour of '11' shows that this is compression scheme, where columns can finish early if they have no set pixels at the top of the sprite.

*************************************************************************************""")
label(0x138d, "sprite_op")
comment(0x13a1, "get destination sprite address")
label(0x1446, "sprite_op_without_copying_mask")
comment(0x1450, """Bit 1 of sprite_op_flags is set (but not bit 2).
This erases the sprite from the screen.
This self-modifies code""")
comment(0x1450, "Write CLC", inline=True)
comment(0x1455, "Write JMP and_byte_with_mask_and_write_to_screen2", inline=True)
comment(0x1464, "ALWAYS branch", inline=True)
blank(0x1466)
comment(0x1466, "Write 'SEC; SEC'", inline=True)
label(0x1466, "write_sprite_without_mask")
label(0x146e, "skip3")
label(0x1486, "smc_sprite_opcode")
label(0x1487, "smc_sprite_opcode+1")
label(0x1488, "smc_sprite_opcode+2")
label(0x1489, "smc_sprite_opcode+3")
label(0x2c46, "calculate_sprite_position_for_menu_item")
label(0x2c58, "multiply_x_by_twenty_loop")
decimal(0x2c5a)
label(0x2c62, "finished_multiply")
label(0x2c5f, "skip_increment_high_byte")
comment(0x135d, "The sprite table starts with a table of 16 bit addresses, one for each sprite.\nLook up the address of the sprite by reading this table.\nSet ($58) to point to the base of the table.\nSet YX to point to the base of the sprite.")
label(0x54, "sprdata_ptr")
expr_label(0x55, make_add("sprdata_ptr", "1"))

# TODO: Possibly something to do with trying to avoid flicker as sprites update? Doesn't obviously look like palette change code.
entry(0x1791, "wait_for_timer_2_using_yx")

entry(0x385d, "turn_cursor_on")
entry(0x3863, "turn_cursor_off")

# This seems to be a 16-bit word.
label(0x3c, "some_word")
expr_label(0x3d, make_add("some_word", "1"))

label(0x34a7, "get_filename_and_print_drive_number_prompt")
# This string will be used for save and loads, but I'll use "save" here as a noun to refer to the file on disc.
label(0x34d6, "save_full_filename")
string(0x34d6, 1)
label(0x34d7, "save_drive_number")
string(0x34d7, 4)
label(0x34db, "save_leaf_filename")
stringcr(0x34db)
comment(0x34e3, "'Which drive?\\r' EOR-encrypted with $cb")
label(0x34e3, "which_drive_encrypted_string")
expr(0x34c3, make_lo("which_drive_encrypted_string"))
expr(0x34c5, make_hi("which_drive_encrypted_string"))
comment(0x34f0, "'Press 0,1,2 or 3\\r' EOR-encrypted with $cb")
label(0x34f0, "press_012_or_3_encrypted_string")
expr(0x34cd, make_lo("press_012_or_3_encrypted_string"))
expr(0x34cf, make_hi("press_012_or_3_encrypted_string"))
expr(0x383f, "vdu_cr")
constant(7, "max_filename_len")
expr(0x34a8, "max_filename_len")
comment(0x342b, "'Press S to save\\r' EOR-encrypted with $cb")
label(0x342b, "press_s_to_save_encrypted_string")
comment(0x343b, "'Press L to load\\r' EOR-encrypted with $cb")
label(0x343b, "press_l_to_load_encrypted_string")
expr(0x3415, make_lo("press_s_to_save_encrypted_string"))
expr(0x3417, make_hi("press_s_to_save_encrypted_string"))
expr(0x341f, make_lo("press_l_to_load_encrypted_string"))
expr(0x3421, make_hi("press_l_to_load_encrypted_string"))
# TODO: Temp reference code for EOR-decrypting in Python:
# s="$9b, $b9, $ae, $b8, $b8, $eb, $fb, $e7, $fa, $e7, $f9, $eb, $a4, $b9, $eb, $f8, $c6"
# [chr(0xcb ^ int(x.strip()[1:],16)) for x in s.split(",")]

comment(0x384d, "Print the character in A. This is patched at runtime to switch between normal and italic text.")
entry(0x384d, "print_char")
label(0x384e, "print_char_target")
expr_label(0x384f, make_add("print_char_target", "1"))
entry(0x3850, "print_2xlf_cr")
expr(0x3821, make_lo("print_italic"))
expr(0x3826, make_hi("print_italic"))
expr(0x382f, make_lo("oswrch"))
expr(0x3834, make_hi("oswrch"))

comment(0x381c, "Print the EOR-encrypted (with eor_key) CR-terminated string at YX. Print in italics iff l0043 is non-0.")
entry(0x381c, "print_encrypted_string_at_yx")
label(0x45, "eor_key") # TODO: Is this *always* $cb in practice?

# TODO: Mention l0005 in name until we know why
entry(0x3872, "flush_input_buffers_and_zero_l0005")

# TODO: Not probing deeper as this may be sprite-related
entry(0x474, "stash_data_pointed_to_by_l0076_at_530_maybe")

go()

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
