from commands import *
import acorn
import re
from common import *
from memorymanager import get_u8_runtime, get_u16_runtime, get_u16_be_runtime, RuntimeAddr
from movemanager import b2r

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

constant(0, "colour_black")
constant(1, "colour_red")
constant(2, "colour_green")
constant(3, "colour_yellow")
constant(4, "colour_blue")
constant(5, "colour_magenta")
constant(6, "colour_cyan")
constant(7, "colour_white")

constant(0, "osfile_save")
constant(5, "osfile_read_catalogue_info")
constant(0xff, "osfile_load")

constant(320, "screen_width_in_pixels")
constant(39, "screen_width_minus_one")
constant(40, "cells_per_line")          # TODO: 'per_character_row'?
constant(7, "max_filename_len")
constant(8, "rows_per_cell")
constant(8, "bytes_per_cell")
constant(320, "bytes_per_character_row")

constant(0x18, "opcode_clc")
constant(0x38, "opcode_sec")
constant(0xa9, "opcode_lda_imm")

constant(0x0b, "max_objects")

constant(0x11, "menu_slot_count") # numbered 0-$10 inclusive

constant(16, "num_levels")

constant(0xdf, "caps_mask")

# grid of 40x24x2 bits = 240 bytes
constant(240, "collision_map_length")

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

sprite_dict = {
    0x00: "spriteid_one_pixel_masked_out",
    0x01: "spriteid_icon_background",
    0x02: "spriteid_icodata_sound",
    0x03: "spriteid_icodata_disc",
    0x04: "spriteid_icodata_wizard",
    0x05: "spriteid_icodata_cat",
    0x06: "spriteid_icodata_monkey",
    0x07: "spriteid_icodata_info",
    0x08: "spriteid_icodata_password",
    0x09: "spriteid_icodata_box",
    0x0a: "spriteid_rope_end",
    0x0b: "spriteid_rope_hook",
    0x0c: "spriteid_cat_walk1",
    0x0d: "spriteid_cat_walk2",
    0x0e: "spriteid_cat_walk3",
    0x0f: "spriteid_cat_walk4",
    0x10: "spriteid_cat_transform1",
    0x11: "spriteid_cat_transform2",
    0x12: "spriteid_cat_tail1",
    0x13: "spriteid_cat_tail2",
    0x14: "spriteid_cat_tail3",
    0x15: "spriteid_cat_tail4",
    0x16: "spriteid_cat_tail5",
    0x17: "spriteid_cat_tail6",
    0x18: "spriteid_cat_tail7",
    0x19: "spriteid_cat_tail8",
    0x1a: "spriteid_cat_jump",
    0x1b: "spriteid_cat1",
    0x1c: "spriteid_cat2",
    0x1d: "spriteid_pointer_hand",
    0x1e: "spriteid_fingertip_tile_restoration",
    0x1f: "spriteid_one_pixel_set",
    0x20: "spriteid_circle",
    0x21: "spriteid_menu_item_completion_spell",
    0x22: "spriteid_sparkles1",
    0x23: "spriteid_sparkles2",
    0x24: "spriteid_sparkles3",
    0x25: "spriteid_sparkles4",
    0x26: "spriteid_sparkles5",
    0x27: "spriteid_diamond1",
    0x28: "spriteid_diamond2",
    0x29: "spriteid_diamond3",
    0x2a: "spriteid_diamond4",
    0x2b: "spriteid_diamond5",
    0x2c: "spriteid_corner_top_left",
    0x2d: "spriteid_corner_bottom_left",
    0x2e: "spriteid_corner_bottom_right",
    0x2f: "spriteid_corner_top_right",
    0x30: "spriteid_wizard1",
    0x31: "spriteid_wizard2",
    0x32: "spriteid_wizard3",
    0x33: "spriteid_wizard4",
    0x34: "spriteid_wizard5",
    0x35: "spriteid_wizard6",
    0x36: "spriteid_wizard7",
    0x37: "spriteid_wizard_hand",        # Drawn in front of wizard accessory object
    0x38: "spriteid_wizard_transform1",
    0x39: "spriteid_wizard_transform2",
    0x3a: "spriteid_brazier",
    0x3c: "spriteid_fire1",
    0x3d: "spriteid_fire2",
    0x3e: "spriteid_fire3",
    0x3f: "spriteid_fire4",
    0x40: "spriteid_fire5",
    0x41: "spriteid_fire6",
    0x42: "spriteid_fire7",
    0x43: "spriteid_fire8",
    0x44: "spriteid_monkey_transform1",
    0x45: "spriteid_monkey_transform2",
    0x46: "spriteid_monkey_tail1",
    0x47: "spriteid_monkey_tail2",
    0x48: "spriteid_monkey_tail3",
    0x49: "spriteid_monkey_tail4",
    0x4a: "spriteid_monkey_tail5",
    0x4b: "spriteid_monkey_tail6",
    0x4c: "spriteid_monkey_tail7",
    0x4d: "spriteid_monkey_tail8",
    0x4e: "spriteid_monkey1",
    0x4f: "spriteid_monkey2",
    0x50: "spriteid_monkey3",
    0x51: "spriteid_monkey4",
    0x52: "spriteid_monkey5",
    0x53: "spriteid_monkey_climb1",
    0x54: "spriteid_monkey_climb2",
    0x55: "spriteid_rope1",
    0x56: "spriteid_rope2",
    0x57: "spriteid_rope3",
    0x58: "spriteid_rope4",
    197: "spriteid_197",            # TODO: Better name
    198: "spriteid_198",            # TODO: Better name
    199: "spriteid_199",            # TODO: Better name
}

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {

    (0x114f,0x1297): {
        "address1_low": "osfile_block_filename_low",
        "address1_high": "osfile_block_filename_high",
    },
    (0x13a9, 0x140a): {
        "address1_low": "level_data_ptr_low",
        "address1_high": "level_data_ptr_high",
    },
    (0x145d,0x1800): {
        "address1_low":  "src_sprite_address_low",
        "address1_high": "src_sprite_address_high",
        "l007e":  "dest_sprite_address_low",
        "l007f": "dest_sprite_address_high",
    },
    (0x14be, 0x1801): {
        "l0072": "sprite_screen_address_low",
        "l0073": "sprite_screen_address_high",
        "l0074": "sprite_x_pos_low",
        "l0075": "sprite_x_pos_high",
        "l0076": "sprite_y_pos_low",
        "l0077": "sprite_y_pos_high",
        "l0078": "sprite_x_offset_within_byte",
        "l0079": "byte_offset_within_sprite",
        "l007b": "sprite_screen_address_for_column_low",
        "l007c": "sprite_screen_address_for_column_high",
        "l007d": "sprite_data_byte",
        "l0080": "mask_sprite_byte",
        "l0081": "sprite_width",
    },
    (0x180d, 0x1882): {
        "l0072": "osfile_block_load_address_low",
        "l0073": "osfile_block_load_address_mid1",
        "l0074": "osfile_block_load_address_mid2",
        "l0075": "osfile_block_load_address_high",
        "l0076": "osfile_block_exec_address_low",
        "l0077": "osfile_block_exec_address_mid1",
        "l0078": "osfile_block_exec_address_mid2",
        "l0079": "osfile_block_exec_address_high",
        "l007a": "osfile_block_start_address_low",
        "l007b": "osfile_block_start_address_mid1",
        "l007c": "osfile_block_start_address_mid2",
        "l007d": "osfile_block_start_address_high",
        "l007e": "osfile_block_end_address_low",
        "l007f": "osfile_block_end_address_mid1",
        "l0080": "osfile_block_end_address_mid2",
        "l0081": "osfile_block_end_address_high",
    },
    (0x183d, 0x1841): {
        "address1_low": "osfile_block_filename_low",
        "address1_high": "osfile_block_filename_high",
    },
    (0x19f4, 0x1a96): {
        "address1_low": "object_y_delta",
        "l0074": "object_top_low",
        "l0075": "object_top_high",
        "l0076": "object_bottom_low",
        "l0077": "object_bottom_high",
        "l007a": "object_top_cell_y",
        "l007b": "object_bottom_cell_y",
    },
    (0x1aa0, 0x1aae): {
        "address1_low": "osfile_block_filename_low",
        "address1_high": "osfile_block_filename_high",
    },
    (0x1bec,0x1f24): {
        "address1_low": "cell_x",
        "address1_high": "cell_y",
        "l007e": "pattern_length_cycle_counter",
        "l0072": "width_in_cells_to_write",
        "l0073": "height_in_cells_to_write",
        "l0074": "first_cell_in_row_screen_address_low",
        "l0075": "first_cell_in_row_screen_address_high",
        "l0076": "cell_screen_address_low",
        "l0077": "cell_screen_address_high",
         # TODO: Maybe rename the next two - "off_screen_address" is named based on its 'final' use in the lda (off_screen_address),y, but it may be more instructive to think of original... differently
         "l0078": "original_off_screen_address_low",
         "l0079": "original_off_screen_address_high",
         "l007a": "off_screen_address_low",
         "l007b": "off_screen_address_high",
         "l007c": "cell_x_plus_current_cell_within_row",
         "l007d": "current_row",
    },
    (0x1f25, 0x3c05): {
        "initialise_display": "collision_map",
    },
    (0x1f25, 0x1f48): {
        "address1_low": "screen_address_low",
        "address1_high": "screen_address_high",
    },
    (0x1f48, 0x1fd7): {
        "address1_low": "cell_x",
        "address1_high": "cell_y",
        "l004b": "height_counter",
        "l0072": "width_in_cells_to_write",
        "l0073": "height_in_cells_to_write",
        "l0074": "offset_within_byte",
        "l0075": "offset_within_collision_map",
    },
    (0x202b, 0x207b): {
         "temp_coordinate": "saved_x",
         "l004b": "saved_y",
    },
    (0x2331, 0x2467): {
        "address1_low": "animation_address_low",
        "address1_high": "animation_address_high",
    },
    (0x2379, 0x23fd): {
        "l0072": "temp_sprite_list_low",
        "l0073": "temp_sprite_list_high",
    },
    (0x23df, 0x23f4): {
        "l0074": "temp_spriteid",
    },

    (0x2565, 0x2680): {
        "l0080": "sprite_addr_low",
        "l0081": "sprite_addr_high",
    },
    (0x2565, 0x2a8b): {
        "address1_low": "object_left_low",
        "address1_high": "object_left_high",
        "l0072": "object_right_low",
        "l0073": "object_right_high",
        "l0074": "object_top_low",
        "l0075": "object_top_high",
        "l0076": "object_bottom_low",
        "l0077": "object_bottom_high",
        "l0078": "object_left_cell_x",
        "l0079": "object_right_cell_x",
        "l007a": "object_top_cell_y",
        "l007b": "object_bottom_cell_y",
    },
    (0x278b, 0x27ca): {
        "l007c": "player_hit_wall_on_left_flag",
        "l007d": "player_hit_wall_on_right_flag",
        "l0080": "player_height_in_cells",
    },
    (0x27c4, 0x2815): {
        "l0080": "adjustment",
    },
    (0x2816, 0x2989): {
        "l007e": "player_has_hit_ceiling_flag",
        "l007f": "player_has_hit_floor_flag",
    },
    (0x2816, 0x284f): {
        "l0080": "player_width_in_cells",
    },
    (0x284f, 0x28a0): {
        "l0080": "adjustment",
    },
    (0x28e2, 0x2a8b): {
        "l0121": "x_object_left_low",
        "l0122": "x_object_left_high",
    },
    (0x29c5,0x2a11): {
        "l007c": "player_hit_wall_on_left_flag",
        "l007d": "player_hit_wall_on_right_flag",
        "l007e": "player_has_hit_ceiling_flag",
        "l007f": "player_has_hit_floor_flag",
    },
    (0x2cb8, 0x2d3c): {
        "address1_low": "menu_item_to_use",
        "address1_high": "menu_has_changed_flag",
    },
    (0x349f, 0x3533): {
        "address1_low": "player_cell_y",
        "address1_high": "temp",
        "l0074": "object_top_low",
        "l0075": "object_top_high",
        "l0076": "object_bottom_low",
        "l0077": "object_bottom_high",
        "l007a": "object_top_cell_y",
        "l007b": "object_bottom_cell_y",
    },
    (0x3688, 0x3725): {
        "l0072": "osfile_block_load_address_low",
        "l0073": "osfile_block_load_address_mid1",
        "l0074": "osfile_block_load_address_mid2",
        "l0075": "osfile_block_load_address_high",
        "l0076": "osfile_block_exec_address_low",
        "l0077": "osfile_block_exec_address_mid1",
        "l0078": "osfile_block_exec_address_mid2",
        "l0079": "osfile_block_exec_address_high",
        "l007a": "osfile_block_start_address_low",
        "l007b": "osfile_block_start_address_mid1",
        "l007c": "osfile_block_start_address_mid2",
        "l007d": "osfile_block_start_address_high",
        "l007e": "osfile_block_end_address_low",
        "l007f": "osfile_block_end_address_mid1",
        "l0080": "osfile_block_end_address_mid2",
        "l0081": "osfile_block_end_address_high",
    },
    (0x3d3d, 0x3d41): {
        "object_sprite_mask_type": "envelope_1",
    },
}

def spriteid(start_addr, end_addr=None):
    if end_addr == None:
        end_addr = start_addr+1
    for addr in range(start_addr, end_addr):
        v = get_u8_runtime(memorymanager.RuntimeAddr(addr))
        if v in sprite_dict:
            byte(addr)
            expr(addr, sprite_dict[v])

def do_osword_7f_block_partial(addr):
    byte(addr)
    comment(addr, "drive", inline=True)
    word(addr+1, 2)
    for i in range(memory[addr+5]+1):
        byte(addr+6+i)
    comment(addr+1, "data address", inline=True)
    comment(addr+5, "number of parameters", inline=True)


# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

load(0x1234, "orig/g.dat", "6502", "ac5feeac5c32a306d4a73ba393677385")
main_code_area     = move(0x1103, 0x1234, 0x29d2)  # code copies 0x2a00 bytes, but only 0x29d2 is used
dialog_box_area    = move(0x0400, 0x40ff, 295)     # code copies 512 bytes, but we only have 295 bytes of actual data
trans_count_area   = move(0x0131, 0x40d0, 0x2f)
collision_map_area = move(0x0c00, 0x3fcb, 0x402c-0x3fcb) # code copies 256 bytes, but this is what we actually care about
level_utils_area   = move(0x0ab7, 0x4088, 0x48)
sideways_ram_area  = move(0x8000, 0x3fbb, 16)

common_to_all()

entry(0x3c06, "execution_start")

substitute_constants("sta sprite_id", 'a', sprite_dict, True)
substitute_constants("jsr draw_sprite_a_at_cell_xy", 'a', sprite_dict, True)
substitute_constants("jsr find_or_create_menu_slot_for_A", 'a', sprite_dict, True)
substitute_constants("sta sprite_op_flags", 'a', sprite_op_flags_dict, True)

# Zero page variables
label(0x0002, "error_code_on_brk")
label(0x0003, "remember_stack_pointer")
label(0x0004, "which_dialog_is_active")
label(0x0006, "rnd0")
label(0x0007, "rnd1")
label(0x0008, "rnd2")
label(0x0009, "rnd3")
label(0x000a, "rnd4")
label(0x0014, "dest_sprite_id")
label(0x0015, "sprite_op_flags")
label(0x0016, "sprite_id")
label(0x0018, "sprite_x_base_low")
label(0x0019, "sprite_x_base_high")
label(0x001a, "sprite_y_base_low")
label(0x001b, "sprite_y_base_high")
label(0x0020, "valid_direction_pending")
label(0x0025, "old_menu_index")
label(0x0026, "auto_repeat_counter")
label(0x0029, "new_menu_index")
label(0x0027, "left_right_repeat_direction")
label(0x0028, "left_right_direction")
label(0x002a, "space_bar_press_pending")
label(0x002b, "space_bar_pressed")
label(0x002c, "z_key_pressed_pending")
label(0x002d, "x_key_pressed_pending")
label(0x002e, "current_menu_index")
label(0x0037, "currently_loaded_level")
label(0x0039, "bit_mask_for_random_number_limit")
label(0x003f, "only_ever_written_to_with_zero")
label(0x0043, "print_in_italics_flag")
label(0x0044, "default_collision_map_option")
label(0x0045, "eor_key") # TODO: Is this *always* $cb in practice?
label(0x0046, "return_key_pressed_pending")
label(0x0048, "current_player_character")
label(0x0049, "temp_value")
label(0x004a, "temp_coordinate")
label(0x004c, "screen_base_address_high")
label(0x004d, "new_player_character")
label(0x0053, "player_objectid")
label(0x0054, "sprdata_ptr")
expr_label(0x55, make_add("sprdata_ptr", "1"))
label(0x0056, "temp_rope_length")
label(0x0058, "temp_sprite_address_low")
label(0x0059, "temp_sprite_address_high")
label(0x005a, "temp_sprite_offset")
label(0x005c, "displayed_transformations_remaining")
expr_label(0x005d, "displayed_transformations_remaining+1")
expr_label(0x005e, "displayed_transformations_remaining+2")
label(0x005f, "initial_level_number_div4")
label(0x0060, "backmost_object_index")
label(0x0061, "backmost_object_z_order")
label(0x0062, "num_active_objects")
label(0x0063, "temp_active_object_index")
label(0x0064, "temp_object_index")
label(0x0065, "remember_player_accessory_object_index")
label(0x0070, "address1_low")
label(0x0071, "address1_high")
label(0x0082, "sprite_bit")
label(0x0083, "sprite_bit_mask")
label(0x0084, "sprite_y_offset_within_character_row")
label(0x0085, "sprite_cell_x_pos")
label(0x0086, "amount_sprite_is_offscreen_x")
label(0x0088, "vertical_sprite_position_is_valid_flag")
label(0x00fc, "interrupt_accumulator")      # OS variable


label(0x0100, "active_objects_table")
label(0x010b, "frontmost_objects_table")
label(0x0116, "object_dealt_with_flag")
label(0x0123, "x_object_right_low")
label(0x0124, "x_object_right_high")
label(0x0125, "x_object_top_low")
label(0x0126, "x_object_top_high")
label(0x0127, "x_object_bottom_low")
label(0x0128, "x_object_bottom_high")
label(0x0129, "old_object_left_low")
label(0x012a, "old_object_left_high")
label(0x012b, "old_object_right_low")
label(0x012c, "old_object_right_high")
label(0x012d, "old_object_left_cell")
label(0x012e, "old_object_right_cell")

with trans_count_area:
    label(0x0131, "update_displayed_transformations_remaining")
    entry(0x0136, "digit_loop")
    expr(0x0140, "vdu_goto_xy")
    decimal(0x0149)
    entry(0x0157, "digit_unchanged")

label(0x0287, "first_byte_break_intercept")     # OS variable

with dialog_box_area:
    label(0x0400, "wait_for_timingB_counter")
    label(0x0409, "current_text_width")
    entry(0x040a)
    comment(0x040d, "check if a dialog box is already active")
    comment(0x0414, "Replace dialog box\nDon't write to collision map")
    comment(0x041b, "choose the 'all set' tile")
    expr(0x041c, make_lo("tile_all_set_pixels"))
    expr(0x0420, make_hi("tile_all_set_pixels"))
    comment(0x0423, "copy_mode = 1 (simple copy)")
    label(0x043a, "no_existing_dialog_box_shown")
    entry(0x0444, "vdu_goto_0_9")
    expr(0x0445, "vdu_goto_xy")
    entry(0x0453)
    comment(0x0457, "clear away the active dialog")
    comment(0x0461, "copy_mode = 255 (just copy from memory in sequence)")
    comment(0x0468, "copy from offscreen cache of what was underneath the dialog box")
    expr(0x0469, make_lo("cache_of_screen_memory_under_dialog"))
    expr(0x046d, make_hi("cache_of_screen_memory_under_dialog"))
    label(0x0473, "return30")
    entry(0x0474, "remember_screen_memory_before_showing_dialog_box")
    comment(0x0474, "set screen addresses", inline=True)
    comment(0x0480, "set destination address")
    expr(0x0481, make_lo("cache_of_screen_memory_under_dialog"))
    expr(0x0485, make_hi("cache_of_screen_memory_under_dialog"))
    comment(0x0489, "set number of rows")
    label(0x048d, "copy_row_loop")
    label(0x0490, "copy_cells_loop")
    label(0x0492, "copy_cell_loop")
    comment(0x0499, "move destination to next cell along")
    label(0x04a4, "skip_high_byte1")
    comment(0x04a7, "move source to next cell along")
    label(0x04b4, "move_to_next_row")
    comment(0x04b8, "move to next screen row")
    label(0x04ca, "return31")
    label(0x04cb, "plot_dialog_box")
    comment(0x04d5, "choose the 'all set' tile")
    expr(0x04d6, make_lo("tile_all_set_pixels"))
    expr(0x04da, make_hi("tile_all_set_pixels"))
    comment(0x04dd, "copy_mode = 1 (simple copy)")
    comment(0x04e0, "draw blank background")
    comment(0x04e3, "draw dialog box outline (calculate X plot position based on text width)")
    label(0x04f9, "plot_loop")

    decimal(0x0501)
    label(0x0505, "copy_to_rectangle_of_screen_memory_from_offscreen")
    label(0x0515, "plot_vdu_bytes")
    comment(0x0515, "MOVE absolute", inline=True)
    label(0x0517, "plot_move_x_low")
    label(0x0518, "plot_move_x_high")
    word(0x0519)
    decimal(0x0519)
    comment(0x0519, "Y coordinate", inline=True)
    comment(0x051b, "DRAW relative", inline=True)
    word(0x051d)
    decimal(0x051d)
    comment(0x051d, "X coordinate", inline=True)
    word(0x051f)
    decimal(0x051f)
    comment(0x051f, "Y coordinate (-156)", inline=True)
    comment(0x0521, "DRAW absolute", inline=True)
    comment(0x0523, "X coordinate", inline=True)
    word(0x0523)
    decimal(0x0523)
    comment(0x0525, "Y coordinate", inline=True)
    word(0x0525)
    decimal(0x0525)

label(0x0530, "cache_of_screen_memory_under_dialog")

label(0x09ec, "current_transformations_remaining")
label(0x09d4, "object_current_index_in_animation")
label(0x09d5, "object_current_index_in_animation+1")
label(0x09df, "current_animation")
label(0x09ea, "save_game")
label(0x09eb, "save_game_checksum")
expr_label(0x09ed, "current_transformations_remaining+1")
expr_label(0x09ee, "current_transformations_remaining+2")

label(0x0a6f, "sixteen_entry_table")
label(0x0a7f, "level_ordering_table")
label(0x0a80, "level_ordering_table+1")
label(0x0ab5, "old_irq1v")
expr_label(0x0ab6, "old_irq1v+1")
label(0x0aa1, "tile_all_clear_pixels")
# TODO: Why are there two copies of BRKV? These can probably be renamed once their use becomes clearer.
label(0xab1, "old_brkv1")
expr_label(0xab2, "old_brkv1+1")
label(0xab3, "old_brkv2")
expr_label(0xab4, "old_brkv2+1")

with level_utils_area:
    entry(0x0ab7, "clear_128_bytes_at_l09ef") # TODO: improve name as things become clearer
    entry(0x0ac3, "get_checksum_of_save_game_data")
    comment(0x0ad4, """*************************************************************************************

Convert a level filename letter into the section letter as shown in-game

The index within the level_ordering_table determines the letter returned.

On Entry:
    Y: letter as seen in the level filename

On Exit:
    Y: section letter (as seen in-game)
    Preserves A, X

*************************************************************************************""")
    entry(0x0ad4, "convert_level_filename_letter_into_section_letter")
    expr(0x0ad5, "last_level_letter")
    expr(0x0add, "num_levels-1")
    label(0x0ade, "find_letter_loop")
    label(0x0ae6, "found_letter")
    expr(0x0ae9, "first_level_letter")
    comment(0x0aef, """*************************************************************************************

Convert a section letter into the level file letter

Simple look up.

On Entry:
    Y: section letter (as seen in-game)

On Exit:
    Y: letter as seen in the level filename
    Preserves A, X

*************************************************************************************""")
    entry(0x0aef, "convert_section_letter_to_level_filename_letter")
    expr(0x0af0, "last_level_letter")
    expr(0x0af7, "first_level_letter")
    label(0x0afe, "return29")

label(0x0b11, "sprite_199")
label(0x0b93, "sprite_198")
label(0x0bc5, "sprite_197")

with collision_map_area:
    comment(0x0c00, """Initialise display

1. Set toolbar and game area colours
2. Initialise the system timer to interrupt at the right time to change palettes
3. Initialise the irq routine address
4. Set the crtc registers
""")
    entry(0x0c00, "initialise_display")

expr(0x0c27, make_lo("irq1_routine"))
expr(0x0c2c, make_hi("irq1_routine"))

with main_code_area:
    comment(0x1103, """developer_flags

    The 'developer flags byte' lives in ICODATA. When loaded, if bit 6 is set then the variable 'developer_flags' is set to this value.

    bit 0: "developer keys active", ESCAPE resets or exits the game I think, if you have the right sideways RAM set up. If the menu pointer is on one of the first four standard items (when the game is normally paused), SHIFT steps the animation forward.
    bit 1: enable a screen dump for an EPSOM compatible printer (see auxcode.asm)
    bit 2: load ICODATA directly from track 39 on the disc, rather than as a regular load. (An option for copy protection?)
    bit 3: load game data from drive 2, not drive 0
    bit 4: unused
    bit 5: unused
    bit 6: load into developer_flags variable
    bit 7: "developer mode active", toolbar is magenta""")
    label(0x1104, "timingA_counter_low")
    label(0x1105, "timingA_counter_high")
    label(0x1106, "timingB_counter_low")
    label(0x1107, "timingB_counter_high")
    label(0x1108, "timing_latch_low")
    label(0x1109, "timing_latch_high")
    label(0x110a, "display_initialised_flag")
    label(0x110b, "vertical_sync_amount_for_crtc_register")
    label(0x110c, "start_game")
    comment(0x111a, "Initialise the number of remaining transformations to 150.")
    char(0x111b)
    char(0x1120)
    char(0x1125)
    char(0x112f)
    comment(0x1132, "choose a new starting level")
    expr(0x113b, "first_level_letter")
    comment(0x1140, "TODO: this is used by e.g. dataA")
    comment(0x1140, """*************************************************************************************

Initialise level

On Entry:
    X is the room index
    Y is the level number

*************************************************************************************""")
    entry(0x1140)
    label(0x114f, "level_load_loop")
    comment(0x114f, "Load a new level if the desired_level has changed.\n\nAny time we want to load a new level, we just set the desired_level and let this code do the work. (It is a loop to allow for retries on a disk error.)")
    comment(0x1153, "if desired level is already loaded, skip forward", inline=True)
    comment(0x1155, "load level in A")
    expr(0x1159, make_lo("data_filename"))
    expr(0x115d, make_hi("data_filename"))
    expr(0x1161, make_lo("level_data"))
    expr(0x1163, make_hi("level_data"))
    expr(0x1165, "osfile_load")
    comment(0x1169, "if load successful, then skip forward", inline=True)
    label(0x1171, "level_load_successful")
    label(0x1175, "level_already_loaded")
    label(0x1186, "object_reset_loop")
    expr(0x11a9, "max_objects")
    label(0x11dd, "clear_sixteen_entry_table_loop")
    expr(0x11e7, make_lo("brk_handler"))
    expr(0x11ec, make_hi("brk_handler"))
    label(0x11f8, "display_initialised")
    comment(0x11f8, "Blank the whole screen temporarily. The toolbar is blanked out here since we are moving to a different level (we need to redraw it to remove any level specific objects obtained). When moving between rooms on the same level the toolbar doesn't change, so remains visible.")
    expr(0x11f9, "colour_black")

    label(0x1209, "same_level")
    label(0x1213, "clear_sound_priorities_loop1")
    expr(0x1226, "first_level_letter")
    comment(0x1228, """level_progress_table has:

    bits 0-2: current room number
    bit 6: if clear then override regular room number with a cheat room number (there are two cheat room numbers!)
    bit 7: set when the completion spell is obtained
""")
    label(0x1234, "skip_adding_completion_spell_to_toolbar")
    expr(0x1239, "colour_black")
    comment(0x1245, """which_dialog_is_active is non-zero when a dialog is active:

    1: save or load dialog, or section information dialog
    2: choose filename dialog, or level letters dialog
    3: which drive dialog
    4: insert save disk dialog
  255: blank dialog shown (to be overwritten by one of the above)
""")
    expr(0x124d, "first_level_letter")
    comment(0x124f, "set current room number in level progress table")
    comment(0x125b, "set YX to the address of the room initialisation code, an address found in a table at start of the level data offset by twice the room number")
    comment(0x1266, "add two to the address in YX, to get past the two initial player position bytes")
    comment(0x126f, "call the room initialisation code")
    label(0x1272, "data_filename")
    string(0x1272, 4)
    label(0x1276, "data_filename_variable_letter")
    stringcr(0x1276)
    label(0x1278, "set_player_position_for_new_room")
    expr(0x127c, "first_level_letter")
    label(0x129b, "skip_developer_mode_code1")
    comment(0x129b, "get room data address")
    comment(0x12a9, "read first byte into X and the second byte into Y. This is the player start position in cells")
    comment(0x12b6, "set player position")
    comment(0x12bb, """*************************************************************************************

Start room

*************************************************************************************""")
    comment(0x12bb, "TODO: This is called from level-specific machine code, e.g. see dataA.asm")
    entry(0x12bb)
    comment(0x12c0, "call room update for the first time")
    comment(0x12d4, "start transformation to the wizard if it's a new level")
    expr(0x12d5, "spriteid_icodata_wizard")
    label(0x12d9, "return1")
    comment(0x12da, "TODO: This is called from level-specific machine code, e.g. see dataA.asm")
    comment(0x12da, """*************************************************************************************

Game Update

On Exit:
    A: 0=player is still within game area
       1=exit room left
       2=exit room bottom
       4=exit room right
       8=exit room top

*************************************************************************************""")
    entry(0x12da)
    comment(0x12dd, "set screen colours (if not already set)")
    comment(0x12ee, "reset vsync counter")
    comment(0x12fc, "wait for vsync (if we can) before making any changes to the menu, to avoid flicker")
    label(0x12fc, "wait_for_vsync_if_we_have_time")

    label(0x1306, "no_time_to_wait")
    comment(0x1312, "update room")
    label(0x131e, "regulate_time_loop")
    comment(0x131e, "wait until five vsyncs have elapsed before continuing")
    comment(0x132c, """*************************************************************************************

Get sprite address for sprite A

    Sprites 0-196: are stored in sprdata (or icodata if loaded (*))
    Sprite 197: is stored at $0bc5
    Sprite 198: is stored at $0b93
    Sprite 199: is stored at $0b11
    Sprites 200+: are stored in level data

(*) The first entry in the ICODATA file is actually not a sprite. It contains:

      1 byte: developer_flags
      1 byte: 'R' indicating a random initial level
    16 bytes: the order of level letters

See sprite_op for the format of sprites.

On Entry:
    A: sprite id

On Exit:
    YX: address of sprite

*************************************************************************************""")
    entry(0x132c, "get_address_of_sprite_a")
    expr(0x132d, make_lo("sprite_199"))
    expr(0x132f, make_hi("sprite_199"))
    decimal(0x1331)
    expr(0x1331, "spriteid_199")
    expr(0x1335, make_lo("sprite_198"))
    expr(0x1337, make_hi("sprite_198"))
    decimal(0x1339)
    expr(0x1339, "spriteid_198")
    expr(0x133d, make_lo("sprite_197"))
    expr(0x133f, make_hi("sprite_197"))
    decimal(0x1341)
    expr(0x1341, "spriteid_197")
    decimal(0x1349)
    decimal(0x134d)
    comment(0x134e, "The first two bytes of the level data is the offset to the sprite table")
    comment(0x134e, "remember sprite number", inline=True)
    expr(0x1350, make_lo("level_data"))
    comment(0x1352, "add offset to sprite table (low)", inline=True)
    expr(0x1357, make_hi("level_data"))
    comment(0x1358, "add offset to sprite table (high)", inline=True)
    comment(0x135c, "recall sprite number", inline=True)
    comment(0x135d, "The sprite table starts with a table of 16 bit addresses, one for each sprite.\nLook up the address of the sprite by reading this table.\nSet YX to point to the base of the sprite.")
    label(0x135d, "get_sprite_address_from_sprite_table")
    label(0x1376, "return2")
    label(0x1377, "power_of_2_table")
    hexadecimal(0x1377, 8)
    label(0x137f, "reset_sprite_flags_and_exit")
    comment(0x138d, """*************************************************************************************

Sprite Plotting

Plots a sprite with a mask, optionally reflected about a vertical axis. Sprites can be any pixel width and height, can be drawn at any pixel position, and have an offset in X and Y pixels whenever drawn, which helps authoring animations.

Conventionally, sprite characters are authored looking to the right.

On Entry:
                 sprite_id: id of the sprite to plot
    sprite_x_base_low/high: X coordinate of sprite to plot (pixels)
    sprite_y_base_low/high: Y coordinate of sprite to plot (pixels)

           sprite_op_flags: These bits are mutually exclusive. If bit is set:

                            bit 0: also copy mask into sprite 'dest_sprite_id'
                            bit 1: erase the sprite from the screen (using mask)
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

    00 - draw the background colour (colour 0)
    01 - draw the foreground colour (colour 1)
    10 - don't draw a pixel (it is masked off)
    11 - finish the current column and start the next column

The behaviour of '11' shows that this is a compression scheme, where columns can finish early if they have no set pixels at the top of the sprite.

*************************************************************************************""")
    label(0x138d, "sprite_op")
    expr(0x139e, "sprite_op_flags_copy_mask")
    comment(0x139f, "check flags to see if we are copying to another sprite", inline=True)
    comment(0x13a1, "get destination sprite address")
    label(0x13ac, "copy_sprite_header_loop")
    comment(0x13b3, "Y=0", inline=True)
    label(0x13b5, "skip_copying_sprite_header_to_destination_sprite")
    comment(0x13b5, "add the x and y offset in the sprite header to the sprite position")
    comment(0x13b7, "read byte 0 of sprite, a start x offset", inline=True)
    label(0x13bf, "skip_inverting_x_offset")
    comment(0x13c1, "set flags based on A", inline=True)
    label(0x13c6, "non_negative_offset_in_x")
    comment(0x13d2, "Y=1", inline=True)
    comment(0x13d3, "read byte 1 of sprite, a start y offset", inline=True)
    label(0x13d8, "non_negative_offset_in_y")
    comment(0x13e2, "Y=2", inline=True)
    comment(0x13e3, "read sprite width in pixels - 1", inline=True)
    comment(0x13e9, "read the first byte of sprite data", inline=True)
    comment(0x13f6, "Take the Y position and round down to the previous character row")
    comment(0x13fe, "Then multiply by eight and store in ($72)")
    comment(0x13aa, "copy the first four bytes from source sprite to destination sprite (the header)")

    expr(0x1440, "sprite_op_flags_copy_mask")
    comment(0x1409, "Multiply by four")
    comment(0x1411, "Add eight times the x position as a character row")
    comment(0x141a, "Add high byte including X")
    label(0x1427, "not_out_of_range")
    comment(0x142e, "set Y to the horizontal offset within byte (0-7) of the sprite X position")
    comment(0x1435, "set the vertical offset within a character row (0-7) of the sprite Y position")
    comment(0x143b, "load X and check flags to see if we are copying the mask to a destination sprite")
    label(0x1446, "sprite_op_without_copying_mask")
    expr(0x1449, make_or("sprite_op_flags_ignore_mask", "sprite_op_flags_erase"))
    expr(0x144d, "sprite_op_flags_ignore_mask")
    comment(0x1450, """Bit 1 of sprite_op_flags is set (but not bit 2).
This erases the sprite from the screen.
This self-modifies code""")
    expr(0x1451, "opcode_clc")
    comment(0x1455, "Write JMP and_byte_with_mask_and_write_to_screen2")
    expr(0x1456, "opcode_jmp")
    expr(0x145b, make_lo("and_byte_with_mask_and_write_to_screen2"))
    expr(0x1460, make_hi("and_byte_with_mask_and_write_to_screen2"))
    ab(0x1464)
    blank(0x1466)
    comment(0x1466, "Write 'SEC; SEC'")
    label(0x1466, "write_sprite_without_mask")
    expr(0x1467, "opcode_sec")
    label(0x146e, "skip3")
    comment(0x1471, """*************************************************************************************

Regular sprite routines

*************************************************************************************""")
    label(0x1471, "out_of_bounds_vertically2")
    label(0x1477, "record_that_we_are_out_of_screen_range_vertically2")
    label(0x147e, "write_one_pixel_to_the_screen2")
    label(0x1486, "smc_sprite_opcode")
    label(0x1487, "smc_sprite_opcode+1")
    label(0x1488, "smc_sprite_opcode+2")
    label(0x1489, "smc_sprite_opcode+3")
    label(0x1498, "and_byte_with_mask_and_write_to_screen2")
    label(0x149c, "move_up_to_next_pixel_row2")
    label(0x14a5, "move_up_to_previous_character_row2")
    label(0x14ad, "check_within_vertical_range2")
    label(0x14b7, "y_coordinate_is_within_character_row2")
    label(0x14c8, "byte_not_finished_yet2")
    expr(0x14ea, "cells_per_line")
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
    label(0x1551, "write_one_pixel_to_the_screen")
    comment(0x1555, "update carry flag with the mask pixel", inline=True)
    comment(0x1557, "read byte from screen")
    comment(0x1559, "read the screen pixel into Z", inline=True)
    comment(0x155b, "if (screen pixel is set) then branch (this preserves carry, the mask pixel)", inline=True)
    label(0x155e, "skip1")
    comment(0x1564, "OR in (set) the appropriate bit and write back to screen memory")
    comment(0x1566, "write byte to screen", inline=True)
    label(0x1568, "move_up_to_next_pixel_row")
    expr(0x1570, make_lo("screen_width_in_pixels"))
    label(0x1574, "and_byte_with_mask_and_write_to_screen")
    comment(0x1574, "AND with the mask to clear the appropriate bit and write the byte back to screen memory")
    comment(0x1576, "write byte to screen", inline=True)
    expr(0x1580, make_lo("screen_width_in_pixels-1"))
    label(0x1581, "move_up_to_previous_character_row")
    expr(0x1586, make_hi("screen_width_in_pixels-1"))
    label(0x1589, "check_within_vertical_range")
    comment(0x1589, "check if Y coordinate is above or below the screen area", inline=True)
    comment(0x158b, "$8000 is end of screen memory", inline=True)
    label(0x1593, "y_coordinate_is_within_character_row")
    comment(0x1598, "copy mask byte to destination")
    comment(0x15a1, "load next source byte from sprite")
    comment(0x15a5, "set mask byte to 255", inline=True)
    comment(0x15a7, "reset loop counter", inline=True)
    label(0x15ab, "byte_not_finished_yet")
    comment(0x15ab, "check top bit", inline=True)
    comment(0x15ad, "if (sprite bit is clear) then branch (to write pixel to screen)", inline=True)
    comment(0x15af, "add set bit to mask", inline=True)
    comment(0x15b1, "get next bit", inline=True)
    comment(0x15b3, "if bit set then branch", inline=True)
    comment(0x15b5, "add clear bit to mask", inline=True)
    comment(0x15b8, "if still in same character row, then branch back")
    comment(0x15bc, "move up to previous character row")
    expr(0x15bf, make_lo("screen_width_in_pixels"))
    label(0x15c3, "found_second_bit_set")
    comment(0x15c3, "add set bit to mask")
    comment(0x15c5, "check if we are done", inline=True)
    comment(0x15c9, "reset sprite address")
    comment(0x15d5, "move to next column")
    comment(0x15de, "if we reach the right hand edge of the screen then we are done")
    expr(0x15df, "cells_per_line")
    decimal(0x15df)
    comment(0x15e2, "reset to start of (i.e. bit 7 of) next byte", inline=True)
    comment(0x15e2, "move sprite addresses on by eight to get to next cell column")
    label(0x15f3, "move_to_next_column_while_rendering_reflected_about_y_axis")
    comment(0x15f3, "move within byte to next bit", inline=True)

    label(0x160c, "draw_sprite")
    comment(0x1611, "store the single bit within a byte we are interested in", inline=True)
    comment(0x1615, "store every other bit in the byte other than the one we are interested in (it's a mask)", inline=True)
    label(0x161e, "finish_off_sprite")
    label(0x1623, "shift_mask_byte_loop")
    label(0x1628, "write_last_byte")
    label(0x162f, "clamp_and_clip_x")
    comment(0x162f, "exit if X position is 512 or more", inline=True)
    comment(0x1636, "exit if Y position is 512 or more", inline=True)
    label(0x163d, "pull_values_and_exit_sprite_op_local")
    label(0x1640, "clamp_x")
    comment(0x1642, "calculate cell x position by dividing pixel position by eight")
    comment(0x164f, "check flags2 (top bit) to see if we should clamp to the right edge")
    comment(0x1653, "clamp to left edge")
    comment(0x1657, "if fully off screen to the right, then pull values and return else just return")
    decimal(0x1658)
    expr(0x1658, "cells_per_line")
    label(0x165e, "sprite_clamp_x_left")
    label(0x1670, "sprite_clamp_x_right")
    expr(0x1675, "cells_per_line")
    decimal(0x1675)
    expr(0x167b, make_lo("screen_width_in_pixels-1"))
    comment(0x167e, "set x position to the right edge (319)")
    expr(0x167f, make_lo("screen_width_in_pixels-1"))
    expr(0x1683, make_hi("screen_width_in_pixels-1"))
    expr(0x1687, "cells_per_line-1")
    decimal(0x1687)
    label(0x168a, "sprite_clip_x")
    comment(0x168e, "exit if fully offscreen", inline=True)
    label(0x1696, "sprite_clip_x_loop")
    expr(0x169c, "sprite_op_flags_copy_mask")
    comment(0x16a3, "set dest sprite byte to 255", inline=True)
    label(0x16a5, "not_copying_to_destination_sprite")
    label(0x16aa, "read_next_source_pixel")
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
    label(0x16cd, "return3")
    label(0x16ce, "pull_values_and_exit_sprite_op")
    entry(0x16d3, "brk_handler")
    entry(0x16dc, "osfile_wrapper")
    comment(0x16d3, "Record the brk error code, but otherwise do nothing - don't return from interrupt, just restore the stack pointer and continue (!)")
    comment(0x16dc, """*************************************************************************************

OSFILE wrapper

On Entry:
     A: OSFILE action:
        $00 = save
        $05 = read catalogue
        $ff = load
    YX: address of filename

*************************************************************************************""")
    label(0x16f7, "skip_if_saving")
    comment(0x16ff, "use our brk_handler (to trap disk errors)")

    label(0x1713, "restore_brk_handler_since_osfile_is_finished")
    comment(0x1714, "reset brk handler to standard one (after disk access finished)")
    comment(0x1721, "restore stack pointer, since it may have been disrupted by a BRK during OSFILE")
    label(0x1728, "show_disk_error_dialog_if_display_is_initialised")
    comment(0x172d, "beep and show disk error dialog")
    expr(0x172e, "vdu_bell")
    expr(0x1740, make_lo("disk_error_encrypted_string"))
    expr(0x1742, make_hi("disk_error_encrypted_string"))
    label(0x174c, "no_disk_error")
    label(0x1752, "disk_error_encrypted_string")
    label(0x1761, "toolbar_colour_choices")
    expr(0x1761, "colour_yellow")
    expr(0x1762, "colour_green")
    expr(0x1763, "colour_white")
    expr(0x1764, "colour_red")
    comment(0x1766, "Set the toolbar and gameplay area colours. In mono mode both are white. In colour mode the gameplay area is cyan and the toolbar colour is toolbar_colour_choices[(level_letter - 'A') & 3].")
    entry(0x1766)
    expr(0x1767, "colour_white")
    expr(0x177b, "first_level_letter")
    expr(0x1786, "colour_cyan")
    label(0x178a, "return4")
    label(0x178b, "vsync_counter")
    entry(0x178c, "wait_for_vsync")
    # TODO: Possibly something to do with trying to avoid flicker as sprites update? Doesn't obviously look like palette change code.
    entry(0x1791, "wait_for_timer_2_using_yx")
    label(0x179a, "delay_loop")
    entry(0x17a0, "irq1_routine")
    label(0x17b9, "if_vsync_elapsed_then_set_toolbar_area_palette")
    comment(0x17bb, "check for vsync interrupt", inline=True)
    comment(0x17c0, "reset timers")
    expr(0x17ed, "colour_magenta")
    label(0x17f1, "skip_developer_mode_code2")
    label(0x17f9, "return5")
    label(0x17fa, "if_timer1_elapsed_then_set_main_area_palette")
    comment(0x17fc, "check for timer1 elapsed", inline=True)

    expr(0x1816, "colour_black")
    label(0x181a, "skip_developer_mode_code3")
    label(0x1823, "return6")
    label(0x1824, "gameplay_area_palette_set")
    label(0x1825, "change_palette_logical_colour_x_to_y")
    label(0x1830, "change_palette_loop")
    entry(0x1839, "reset_game_because_escape_pressed")
    comment(0x1845, "Assuming there is sideways RAM mapped into ROM slot 13, this copy 256 bytes from $be00 to $0c00, and 256 bytes from $bf00 to $0b00. Could this be code helping during development of the game?")
    label(0x1845, "reset_code")
    comment(0x1848, "select ROM in slot 13", inline=True)
    label(0x184d, "copy_from_rom_c_loop")
    comment(0x1862, "clear the reset vector")
    entry(0x1866, "print_italic")
    char(0x1867)
    expr(0x186a, "vdu_delete")
    expr(0x1888, "vdu_define_character")
    label(0x1893, "define_character_ff_loop")
    entry(0x18a3, "print_italic_rts")
    comment(0x18a6, """*************************************************************************************

Random Number Generator

On Entry:
    A must be one less than a power of two, a mask to fill in with random bits

On Exit:
    A holds a random number up to the value of A on entry

*************************************************************************************""")
    label(0x18a6, "get_random_number_up_to_a")
    comment(0x18a6, "store loop variable, all 1s in the lowest bits", inline=True)
    comment(0x18a8, "remember mask", inline=True)
    label(0x18a9, "generate_random_bits_loop")
    comment(0x18bb, "update loop variable by shifting right", inline=True)
    comment(0x18bd, "loop back until enough random bits are generated", inline=True)
    comment(0x18bf, "recall mask", inline=True)
    comment(0x18c0, "AND the mask with the random bits", inline=True)
    comment(0x18c3, """*************************************************************************************

Check for player leaving room

On Exit:
    A: 0=player is still within game area
       1=exit room left
       2=exit room bottom
       4=exit room right
       8=exit room top

*************************************************************************************""")
    label(0x18c3, "check_for_player_leaving_room")
    label(0x18d1, "get_delta_y")
    comment(0x18e7, "Find the average of object_true_bottom and object_bottom and convert to a cell Y value. Use this value to test if the player is off screen.")

    expr(0x1903, "game_area_height_cells")
    label(0x1906, "return_with_a_zero")
    comment(0x1909, "If the player is off the left of the game play area, this is called. It increases the X coordinate by 320 pixels. It does the same for object one, the player's accessory object. Returns with A=1.")
    label(0x1909, "increase_player_x_coordinate_to_enter_next_room")
    comment(0x1909, "object index (and loop counter)", inline=True)
    comment(0x190b, "add one screen amount to the X coordinate")
    label(0x190b, "add_to_player_x_loop")
    comment(0x191f, "If the player is off the right of the game play area, this is called. It decreases the X coordinate by 320 pixels. It does the same for object one, the player's accessory object. Returns with A=4.")
    label(0x191f, "decrease_player_x_coordinate_to_enter_next_room")
    comment(0x191f, "object index (and loop counter)", inline=True)
    label(0x1921, "subtract_from_player_x_loop")
    comment(0x192c, "Shouldn't this be sbc #1? Possible bug?")
    label(0x1937, "increase_player_y_coordinate_to_enter_next_room")
    comment(0x1937, "If the player is off the top of the game play area, this is called. It increases the Y coordinate by 192 pixels = 24*8 pixels. Does the same for object one, the player's accessory object. Returns with A=8.")
    comment(0x1939, "return if the player is moving in the correct direction (down) to get back on screen")
    comment(0x193b, "object index (and loop counter)", inline=True)
    label(0x193d, "add_to_player_y_loop")
    label(0x1951, "decrease_player_y_coordinate_to_enter_next_room")
    comment(0x1951, "If the player is off the bottom of the game play area, this is called. It reduces the Y coordinate by 192 pixels = 24*8 pixels. Does the same for object one, the player's accessory object. Returns with A=2.")
    comment(0x1953, "return if the player is moving in the correct direction (up) to get back on screen")
    comment(0x1955, "object index (and loop counter)", inline=True)
    label(0x1957, "subtract_from_player_y_loop")
    comment(0x1966, "use the value stored in the X,Y registers as an address to jump to")
    expr(0x1967, "jmp_instruction+1")
    expr(0x196a, "jmp_instruction+2")
    label(0x196c, "jmp_instruction")
    expr(0x196d, "0")
    entry(0x196f, "load_sprdata")
    expr(0x1970, make_lo("sprdata_filename"))
    expr(0x1974, make_hi("sprdata_filename"))
    expr(0x197c, "osfile_load")
    label(0x1980, "sprdata_filename")
    stringcr(0x1980)
    comment(0x1988, "TODO: this is used by e.g. dataA")
    comment(0x1988, """*************************************************************************************

Initialise or update a brazier and associated fire.

On the first update, two objects are initialised, the brazier and the fire. It chooses a direction based on whether a wall is to the left or right. It sets a random initial animation state then draws them.
On subsequent updates, the fire animation is advanced.

On Entry:
    A: object index for brazier
On Exit:
    A,X,Y are preserved

*************************************************************************************""")
    entry(0x1988)
    comment(0x1994, "initialise brazier and fire, if not changing rooms")
    comment(0x199b, "work out direction to draw brazier (left or right)")
    comment(0x19a2, "block positions and draw brazier")
    comment(0x19ae, "increment object index past the brazier to be the fire")
    comment(0x19b2, "set the fire object position")
    comment(0x19b5, "fire looks right")
    ab(0x19b7)
    label(0x19b9, "brazier_position_already_blocked_so_look_left")
    comment(0x19ba, "make the brazier solid")
    comment(0x19c0, "draw brazier reflected to look left")
    comment(0x19cc, "set fire object position")
    comment(0x19d2, "fire looks left")
    label(0x19d4, "set_fire_direction")
    label(0x19e2, "done_with_brazier_and_fire")
    label(0x19e5, "not_first_update")
    label(0x19f2, "set_fire_sprite_to_use")

    expr(0x1a03, "spriteid_fire1")
    label(0x1a07, "return_with_result")
    label(0x1a0f, "fire_object_index")
    comment(0x1a10, """*************************************************************************************

Update the level completion detection

Checks for colliding with the level completion spell collectable, adds the spell to the toolbar, and shows diamonds or sparkles as needed.

*************************************************************************************""")
    comment(0x1a10, "TODO: this is used by e.g. dataA")
    entry(0x1a10)
    comment(0x1a10, "remember inputs", inline=True)
    comment(0x1a19, "update diamond sprite to use")
    comment(0x1a22, "set diamond sprite to use")
    comment(0x1a2b, "set toolbar sprite to use for diamond spell")
    expr(0x1a2c, "spriteid_menu_item_completion_spell")
    comment(0x1a30, "early out if room has just changed")
    comment(0x1ae5, "Choose the pattern based on copy_mode")
    comment(0x1a3c, "test for collision with spell collectable")
    comment(0x1a46, "collided with level completion collectable, so mark level as completed")
    expr(0x1a4a, "first_level_letter")
    comment(0x1a4c, "got completion spell")
    comment(0x1a54, "add level completion spell to toolbar")
    label(0x1a59, "skip_adding_level_completion_spell")
    expr(0x1a5d, "spriteid_197")
    comment(0x1a66, "exit if level is completed")
    expr(0x1a6a, "first_level_letter")
    label(0x1a73, "set direction of animation")
    comment(0x1a82, "reverse direction of animation")
    label(0x1a8f, "show_sparkles")
    expr(0x1a90, "spriteid_sparkles1")
    comment(0x1a94, "A=object index")
    label(0x1a9e, "reset_offsets_and_exit")
    label(0x1aae, "remember_obj_index")
    label(0x1aaf, "remember_cell_x")
    label(0x1ab0, "remember_cell_y")
    label(0x1ab1, "diamond_sprite_index")
    spriteid(0x1ab2, 0x1aba)
    label(0x1ab2, "diamond_sprite_cycle")
    comment(0x1abb, """*************************************************************************************

Copy one or more tiles from off screen memory to a rectangular area of cells on screen. A 'tile' here means a bitmap of 8x8 pixels stored in eight bytes of memory.

On Entry:
    X and Y registers specify top left cell
    width_in_cells_to_write: width of rectangle (in cells)
    height_in_cells_to_write: height of rectangle (in cells)
    source_sprite_memory: source address data to copy to screen (top left)
    copy_mode:
        0: 2x2 pattern
        1: simple copy
        power of two: choose random tile offsets less than the power of two
        negative: strip off top bit for length of tile offsets to cycle around
    value_to_write_to_collision_map: if non-negative, write the value into the collision map using the same rectangle of cells

*************************************************************************************""")
    entry(0x1add, "row_copy_loop")
    entry(0x1ae3, "cell_copy_loop")
    comment(0x1af0, "Subtract 1; note C cleared before beq", inline=True)
    label(0x1af8, "negative_copy_mode")
    comment(0x1af8, "strip off top bit, subtract one and compare with pattern_length_counter")

    comment(0x1b0c, "Set A=%(low bit of current_row)(low bit of current column), giving a 2x2 alternating pattern.")
    entry(0x1b0c, "two_by_two_alternating_pattern")
    comment(0x1b14, """The value in A at this point is the offset from the first tile to use. We multiply this by eight to get the offset of the memory address of the tile (each tile being eight bytes), and add to the original tile address to get the final address of the tile we want to use.
(The code uses the bottom two bits of off_screen_address_high to temporarily store the high bits of the offset. These two bits are then extracted and added to the original address to get the final address).""")
    label(0x1b14, "get_final_off_screen_tile_address")
    entry(0x1b28, "copy_one_tile_loop")
    comment(0x1b31, "X was initialised with width_in_cells_to_write", inline=True)
    ab(0x1b3f)
    entry(0x1b41, "all_cells_in_row_copied")
    comment(0x1b47, "Advance first_cell_in_row_screen_address by one row and reset cell_screen_address")
    comment(0x1b49, "C is clear because beq above not taken", inline=True)
    expr(0x1b4a, make_lo(make_multiply("cells_per_line", "rows_per_cell")))
    expr(0x1b52, make_hi(make_multiply("cells_per_line", "rows_per_cell")))
    ab(0x1b57)
    label(0x1b59, "now_write_to_collision_map")
    label(0x1b64, "skip_writing_to_collision_map")
    comment(0x1b66, "cell_screen_address = screen_base_address + Y*$140 + X*8")
    entry(0x1b66, "get_screen_address_from_cell_xy")
    label(0x1b7e, "skip_high_byte2")
    label(0x1b8a, "draw_right_facing_wall_local")
    label(0x1b8d, "draw_left_wall_local")
    comment(0x1b90, "TODO: This is called from level-specific machine code, e.g. see dataA.asm")
    comment(0x1b90, """*************************************************************************************

Once the rocks of the room have been drawn, this function carves the floor, wall and ceiling tiles into the rock.

*************************************************************************************""")
    entry(0x1b90)
    comment(0x1b94, "Y is loop counter over cell rows")
    expr(0x1b95, make_subtract("game_area_height_cells", "1"))
    comment(0x1b96, "X is loop counter over cell columns")
    entry(0x1b96, "draw_rows_loop")
    expr(0x1b97, "screen_width_minus_one")
    entry(0x1b98, "draw_columns_loop")
    entry(0x1bc3, "next_cell_over")
    comment(0x1bca, """*************************************************************************************

Draw floor

On Entry:
    (X,Y): cell coordinates

*************************************************************************************""")
    entry(0x1bca, "draw_floor")
    comment(0x1bca, "remember Y", inline=True)
    comment(0x1bd0, "find tile index based on the cellX: tile index=(cellX AND 3)*2")
    comment(0x1bd7, "add address of first floor tile")
    expr(0x1bd9, make_lo("tile_floor0_top"))
    expr(0x1bdf, make_hi("tile_floor0_top"))
    comment(0x1be2, "copy tile lower six rows to screen")
    entry(0x1be4, "draw_floor_top_loop")
    comment(0x1bed, "off_screen_address += bytes_per_cell")
    expr(0x1bf1, make_lo("bytes_per_cell"))
    expr(0x1bf7, make_hi("bytes_per_cell"))
    comment(0x1bfc, "cell_screen_address += bytes_per_character_row")
    expr(0x1bfe, make_lo("bytes_per_character_row"))

    expr(0x1c04, make_hi("bytes_per_character_row"))
    blank(0x1c07)
    comment(0x1c07, "copy tile upper 6 rows to screen")
    entry(0x1c09, "draw_floor_bottom_loop")
    comment(0x1c10, "restore Y")
    comment(0x1c15, """*************************************************************************************

Draw ceiling

On Entry:
    (X,Y): cell coordinates

*************************************************************************************""")
    label(0x1c15, "draw_ceiling")
    expr(0x1c20, make_lo("tile_ceiling0"))
    expr(0x1c26, make_hi("tile_ceiling0"))
    label(0x1c2d, "copy_ceiling_tile_loop")
    comment(0x1c3b, """*************************************************************************************

Draw right facing wall, including corner pieces

On Entry:
    (X,Y): cell coordinates

*************************************************************************************""")
    label(0x1c3b, "draw_right_facing_wall")
    comment(0x1c4e, "no corner found, so the cell Y position is used to determine the tile to use")
    label(0x1c4e, "normal_right_wall_not_corner")
    comment(0x1c4f, "find the tile to use based on tile base address + (cellY and 3)*8")
    expr(0x1c56, make_lo("tile_wall_right0"))
    expr(0x1c5c, make_hi("tile_wall_right0"))
    label(0x1c61, "copy_right_wall_tile_loop")
    comment(0x1c63, "just copy the rightmost six pixels")
    binary(0x1c64)
    label(0x1c6e, "move_up_and_left_to_check_if_wall_continues1")
    label(0x1c82, "not_top_corner")
    decimal(0x1c85)
    comment(0x1c8f, "draw final corner")
    label(0x1c98, "finished_wall")
    comment(0x1c9d, """*************************************************************************************

Draw left facing wall, including corner pieces

On Entry:
    (X,Y): cell coordinates

*************************************************************************************""")
    label(0x1c9d, "draw_left_wall")
    comment(0x1ca2, "draw corner sprite")
    comment(0x1ca8, "no corner found, so the cell Y position is used to determine the tile to use")
    label(0x1ca8, "normal_left_wall_no_corner")
    expr(0x1cb0, make_lo("tile_wall_left0"))
    expr(0x1cb6, make_hi("tile_wall_left0"))
    label(0x1cbb, "copy_wall_tile_loop")
    comment(0x1cbd, "just copy the leftmost six pixels")
    binary(0x1cbe)
    label(0x1cc8, "move_up_and_left_to_check_if_wall_continues2")
    label(0x1cda, "move_to_next_row2")
    expr(0x1cdd, "game_area_height_cells")
    label(0x1cee, "not_corner")
    label(0x1cf3, "find_corner_spriteid")

    label(0x1d0b, "found_corner_spriteid")
    label(0x1d16, "return_with_result1")
    character_bitmap(0x1d19, "tile_floor0_top")
    character_bitmap(0x1d21, "tile_floor0_bottom")
    character_bitmap(0x1d29, "tile_floor1_top")
    character_bitmap(0x1d31, "tile_floor1_bottom")
    character_bitmap(0x1d39, "tile_floor2_top")
    character_bitmap(0x1d41, "tile_floor2_bottom")
    character_bitmap(0x1d49, "tile_floor3_top")
    character_bitmap(0x1d51, "tile_floor3_bottom")
    character_bitmap(0x1d59, "tile_ceiling0")
    character_bitmap(0x1d61, "tile_ceiling1")
    character_bitmap(0x1d69, "tile_ceiling2")
    character_bitmap(0x1d71, "tile_ceiling3")
    character_bitmap(0x1d79, "tile_wall_left0")
    character_bitmap(0x1d81, "tile_wall_left1")
    character_bitmap(0x1d89, "tile_wall_left2")
    character_bitmap(0x1d91, "tile_wall_left3")
    character_bitmap(0x1d99, "tile_wall_right0")
    character_bitmap(0x1da1, "tile_wall_right1")
    character_bitmap(0x1da9, "tile_wall_right2")
    character_bitmap(0x1db1, "tile_wall_right3")
    comment(0x1db9, "TODO: This is called from e.g. data")
    entry(0x1db9)
    comment(0x1db9, """*************************************************************************************

Draw rope
    The top of the rope is a rope hook, which has collision map value 3 (solid)
    The rope itself has collision map value 2 (climbable), including the rope end

On Entry:
    A: rope length
    (X,Y): cell coordinates for the top of the rope

On Exit:
    Preserves A,X,Y

*************************************************************************************""")
    comment(0x1dbe, "Don't draw the rope hook if Y is zero")
    label(0x1dc9, "draw_rope_loop")
    expr(0x1dd4, "spriteid_rope1")
    label(0x1de6, "draw_end_of_rope")
    comment(0x1dcf, "cycle through the rope sprites based on Y coordinate")
    label(0x1dda, "write_to_collision_map")
    label(0x1df0, "restore_ay_and_return")
    expr(0x1de1, "game_area_height_cells")
    comment(0x1df4, """*************************************************************************************

Clear the game area

Set all the game area pixels, and clear the collision map

*************************************************************************************""")
    label(0x1df4, "clear_game_area")
    label(0x1df7, "clear_collision_map_loop")
    expr(0x1dfc, "collision_map_length")

    expr(0x1e00, make_lo("game_area_screen_address"))
    expr(0x1e04, make_hi("game_area_screen_address"))
    expr(0x1e0a, make_hi("end_of_screen_memory"))
    label(0x1e0b, "clear_screen_game_area_loop")
    comment(0x1e17, """*************************************************************************************

Clip the given rectangle of cells to the game area (right and bottom)

The game area is a grid of 40x24 cells.

On Entry:
    X: Left cell X coordinate of rectangle
    Y: Top cell X coordinate of rectangle
    width_in_cells: Rectangle width
    height_in_cells: Rectangle height

On Exit:
    width_in_cells_to_write: Clipped rectangle width
    height_in_cells_to_write: Clipped rectangle height

*************************************************************************************""")
    entry(0x1e17, "clip_cells_to_write_to_collision_map")
    decimal(0x1e2a)
    expr(0x1e2a, "game_area_width_cells+1")
    label(0x1e2d, "clip_x")
    decimal(0x1e2e)
    expr(0x1e2e, "game_area_width_cells")
    label(0x1e33, "clipped_x_ok")
    decimal(0x1e3a)
    expr(0x1e3a, "game_area_height_cells+1")
    label(0x1e3d, "clip_y")
    decimal(0x1e3e)
    expr(0x1e3e, "game_area_height_cells")
    label(0x1e43, "return7")
    comment(0x1e44, """*************************************************************************************

Write a value to a rectangle in the collision map

On Entry:
    value_to_write_to_collision_map: Value to write
    X: Left cell X coordinate of rectangle
    Y: Top cell X coordinate of rectangle
    width_in_cells: Rectangle width
    height_in_cells: Rectangle height

On Exit:
    Preserves A,X,Y

*************************************************************************************""")
    label(0x1e4e, "write_value_to_rectangle_of_collision_map")
    comment(0x1e4e, "value is (0-3)")
    comment(0x1e53, "multiply Y by 10 and store in temp_coordinate")
    comment(0x1e5d, "divide X by 4 and add the Y coordinate, and store in Y, the byte offset in the collision map")
    comment(0x1e64, "let X be the offset within the byte for the current cell (0-3)")
    label(0x1e6a, "write_to_next_column_in_collision_map_loop")
    comment(0x1e70, "multiply input value (0-3) by four")
    comment(0x1e74, "add offset within byte in the bottom two bits")
    comment(0x1e74, "use as the offset into the bitmask2 array")
    comment(0x1e7c, "store the value to write in the 'offset_within_byte' variable")
    label(0x1e80, "write_to_next_row_in_collision_map_loop")
    comment(0x1e80, "read from current collision map", inline=True)
    comment(0x1e83, "mask out the bits for the current cell", inline=True)
    comment(0x1e86, "OR in the new bits for the cell", inline=True)
    comment(0x1e88, "write the new value back to the collision map", inline=True)
    comment(0x1e8b, "add 10 to Y to move to next row", inline=True)
    decimal(0x1e8d)
    comment(0x1e8f, "loop counter", inline=True)
    comment(0x1e95, "X is the offset within the byte to write to (0-3)")
    comment(0x1e98, "move to next byte", inline=True)
    label(0x1e9b, "try_next_cell_across")
    label(0x1ea5, "pull_and_return")
    binary(0x1ea7, 4)
    label(0x1ea7, "bitmask_of_bits_to_keep_from_collision_map_table")
    byte(0x1eab, 4)
    binary(0x1eab, 16)
    label(0x1eab, "value_to_write_into_collision_map_table")
    byte(0x1eaf, 4)
    byte(0x1eb3, 4)
    comment(0x1ebb, "TODO: this is used by e.g. dataA")
    comment(0x1ebb, """*************************************************************************************

Write a value to a single cell in the collision map

On Entry:
    A: Value to write
    X: Cell X coordinate
    Y: Cell Y coordinate

On Exit:
    Preserves A,X,Y

*************************************************************************************""")
    comment(0x1ebd, "remember value to write", inline=True)
    comment(0x1ec3, "multiply A by ten, and store in temp_coordinate")
    comment(0x1ecc, "divide X by four and add temp_coordinate. This is the offset into the collision map, stored in Y.")
    comment(0x1ed3, "store the offset within the byte in temp_coordinate (0-3)")
    comment(0x1eda, "get the value to write multiplied by four and add the offset within the byte. This is the index into the table for the value to write")
    comment(0x1ee1, "get the value to write")
    comment(0x1ee4, "store the value to write in temp_coordinate, but first put it's previous value (the offset within the byte) into X")
    comment(0x1ee8, "write the new value into the collision map, based on some bits from the old value and the new value bits being written, similar to the routine above.")
    comment(0x1ef3, "restore X,Y and A")
    label(0x1efa, "read_collision_map_value_for_xy")
    comment(0x1efa, """*************************************************************************************

Read a two bit value from the collision map at X,Y

On Entry:
    (X,Y): cell position to read the collision map

On Exit:
    A: holds value 0-3 from the collision map

*************************************************************************************""")
    expr(0x1efb, "game_area_width_cells")
    expr(0x1eff, "game_area_height_cells")

    label(0x1f06, "retry_read_collision_map")
    comment(0x1f06, "Set temp_value=10*Y")
    comment(0x1f10, "Set Y=temp_value+X/4")
    blank(0x1f17)
    entry(0x1f21, "right_shift_a_by_2x_loop")
    entry(0x1f23, "right_shift_a_by_2x")
    label(0x1f2c, "return8")
    entry(0x1f2d, "outside_game_area")
    comment(0x1f35, "next time, read from leftmost column")
    comment(0x1f3b, "next time, read from rightmost column")
    expr(0x1f3c, "game_area_width_cells-1")
    expr(0x1f3e, "game_area_width_cells")
    comment(0x1f42, "next time, read from topmost column")
    comment(0x1f48, "next time, read from bottommost column")
    expr(0x1f49, "game_area_height_cells-1")
    ab(0x1f4a)
    comment(0x1f4c, "TODO: this is used by e.g. dataA")
    comment(0x1f4c, """*************************************************************************************

Draw a sprite at a cell position

On Entry:
    A: spriteid
    (X,Y): cell coordinates

On Exit:
    Preserves A,X,Y

*************************************************************************************""")
    label(0x1f4c, "draw_sprite_a_at_cell_xy")
    comment(0x1f57, "TODO: This is called from e.g. dataA")
    comment(0x1f57, """*************************************************************************************

Draw a sprite at a cell position, and write a rectangle of values into the collision map

On Entry:
    A: spriteid
    (X,Y): cell coordinates
    value_to_write_to_collision_map: value to write
    width_in_cells: rectangle width
    height_in_cells: rectangle height

On Exit:
    Preserves A,X,Y

*************************************************************************************""")
    entry(0x1f57)
    comment(0x1f5d, "TODO: this is used by e.g. dataA")
    comment(0x1f5d, """*************************************************************************************

Set object's position based on a cell XY position

On Entry:
    A: object index
    (X,Y): cell coordinates

On Exit:
    Preserves A,X,Y

*************************************************************************************""")
    label(0x1f6c, "remember_x")
    comment(0x1f6d, """*************************************************************************************

Set object position from sprite coordinates

On Entry:
    X: object index
    (sprite_x_base, sprite_y_base): pixel position to set

On Exit:
    Preserves A,X,Y

*************************************************************************************""")
    comment(0x1f6d, "TODO: this is used by e.g. dataA")
    comment(0x1f84, """*************************************************************************************

Set the current sprite position to a cell XY plus a pixel offset

On Entry:
    (X,Y): cell coordinates (can be negative)
    temp_sprite_x_offset: Add pixel offset to the result (then reset to zero on exit)
    temp_sprite_y_offset: Add pixel offset to the result (then reset to zero on exit)

On Exit:
    (sprite_x_base, sprite_y_base): pixel position
    Preserves A,X,Y

*************************************************************************************""")
    label(0x1f84, "set_sprite_pixel_position_to_cell_xy_plus_pixel_offset")
    label(0x1f96, "positive_x_cell")
    label(0x1fa0, "positive_x_pixel")
    label(0x1fb7, "positive_y_cell")
    label(0x1fc1, "positive_y_pixel")
    comment(0x1fd7, """*************************************************************************************

Update objects

Draws and undraws objects, taking into account z-order.

The z-order values range from $00 at the front, $80 at the midpoint (where the player is) and $ff at the back.

Objects are (a) undrawn from front to back, then (b) redrawn from back to front.
Objects are not redrawn if their state remains unchanged ('inactive'), unless they need to be because there's an active object behind them.

The algorithm used to do this is:

1. Mark all objects as 'not dealt with'
2. Find the backmost object that is (a) undealt with (b) has a sprite and (c) has changed state ('active').
3. If none found (i.e. all that need to be dealt with have been), then update (copy) the state of the inactive objects and return.
4. Mark the active object as dealt with.
5. Append the object to a list of active objects.
6. Append any inactive objects that are in front of this active object. Those inactive objects are marked as 'dealt with'.
7. Goto 4 if more inactive objects were appended to the active list to deal with them and append anything in front of them.
8. Sort the active objects list from front to back.
9. Undraw the active objects (front to back).
10. Draw the active objects (back to front).
11. Goto 2.

Object state is stored in 'object_*' memory locations, and the state of the previously drawn objects is in 'object_*_old' memory locations.

*************************************************************************************""")
    entry(0x1fd7, "update_objects")
    comment(0x1fde, "mark all objects as 'not dealt with' yet")
    label(0x1fe1, "reset_object_dealt_with_flags_loop")
    expr(0x1fe6, "max_objects")
    comment(0x1fe9, "find the object that is at the back")
    label(0x1fe9, "find_backmost_object_not_dealt_with_yet")
    comment(0x1fef, "initialise the backmost object index to be $ff (nothing found yet), and at the front (z-order $00)")
    label(0x1ff5, "find_backmost_object_loop")
    comment(0x1ffa, "object doesn't count if it has no sprites")

    comment(0x2002, "check object X z-order against the best so far")
    comment(0x2009, "found new backmost object, store it's index and z-order")
    label(0x200d, "try_next_object")
    expr(0x200f, "max_objects")
    comment(0x2012, "check if we found a backmost object")
    comment(0x2016, "after dealing with all active objects, update the state of the inactive ones")
    expr(0x2017, "max_objects-1")
    label(0x2018, "update_non_active_object_state_loop")
    label(0x2020, "skip_objects_already_dealt_with")
    comment(0x2023, "restore the player held object")
    label(0x2027, "found_backmost_object")
    comment(0x2027, "mark object as dealt with", inline=True)
    comment(0x202c, "Look for active objects. If the object hasn't changed state, move to the next object")
    comment(0x2031, "append the active object to the active_objects_table")
    label(0x2039, "process_active_objects_loop")
    blank(0x2045)
    comment(0x2045, "this whole next section looks for any inactive objects that (a) are in front of and (b) intersect with the latest active object. These are added to the active object list too. This determines the drawing order.")
    label(0x2047, "loop_over_all_objects_x")
    comment(0x2048, "find inactive objects. i.e. if object x is found in the active objects table, skip it and try the next object")
    label(0x204a, "find_object_y_loop")
    comment(0x2054, "found an inactive object x. If it's in front of the backmost active object, test it for collision")
    comment(0x205b, "to resolve equal z orders, look at the index. i.e. if the object x has the same z order as the backmost active object and a smaller index, also test for collision.")
    label(0x2061, "test_for_collision")
    label(0x207d, "found_collision")
    comment(0x207f, "mark object x as dealt with")
    comment(0x2084, "append to the active objects list")
    label(0x208d, "move_to_next_object_x")
    expr(0x208f, "max_objects")
    blank(0x209a)
    comment(0x209a, "sort active objects, frontmost first")
    label(0x209e, "sort_objects_loop")
    blank(0x20a4)
    comment(0x20a4, "now find the frontmost of the active objects")
    label(0x20a6, "inner_object_loop")
    label(0x20b8, "found_an_object_further_front")
    label(0x20be, "move_to_next_active_object")
    blank(0x20c3)
    comment(0x20c3, "mark object as done")
    comment(0x20ca, "record frontmost object in table")
    blank(0x20d8)
    comment(0x20d8, "undraw objects from front to back")
    label(0x20da, "undraw_loop")
    blank(0x20e6)
    comment(0x20e6, "draw objects from back to front (aka 'painters algorithm')")
    label(0x20e7, "draw_loop")
    comment(0x20f7, """*************************************************************************************

Once an object is drawn to the screen, this remembers the current object state in "_old" variables. We use this later to detect whether the object state has changed and to undraw if needed.

*************************************************************************************""")
    label(0x20f7, "copy_object_state_to_old")

    label(0x211e, "has_object_changed_state")
    label(0x2155, "pull_result_and_return")
    label(0x2157, "undraw_object_x")
    comment(0x2159, "exit if object is not visible")
    comment(0x215e, "prepare to draw sprite")
    comment(0x2177, """based on object_sprite_mask_type:

    00 means erase,
    ff means draw without mask,
    otherwise draw normally with mask""")
    expr(0x2181, "sprite_op_flags_normal")
    ab(0x2182)
    label(0x2184, "erase_object")
    expr(0x2188, "sprite_op_flags_erase")
    ab(0x2189)
    label(0x218b, "draw_object_without_mask")
    expr(0x218f, "sprite_op_flags_ignore_mask")
    label(0x2190, "draw_or_erase_object")
    label(0x2197, "done_drawing_object")
    label(0x219a, "draw_object_x")
    comment(0x21c1, """The object_sprite_mask_type determines the sprite operation:

    $00: draw normally
    $ff: draw normally
    other value S: erase wheat's on screen, copy the mask to destination spriteid S
""")
    expr(0x21cd, make_or("sprite_op_flags_erase", "sprite_op_flags_copy_mask"))
    label(0x21d0, "draw_object_sprite")
    comment(0x21d3, "return if not the player accessory object")
    expr(0x21d4, "objectid_player_accessory")
    comment(0x21d7, "return if current player character is not the wizard")
    expr(0x21da, "spriteid_icodata_wizard")
    comment(0x21dd, "special wizard processing - if the player is carrying an accessory object, draw the wizard's hand in front of that")
    expr(0x21e0, "objectid_player")
    comment(0x21e1, "check if player state has changed")
    comment(0x21ea, "make sure the player has been dealt with first")
    label(0x21ef, "player_state_unchanged")
    label(0x21ff, "return9")

    entry(0x2200, "set_player_spriteid_and_offset_from_animation_table")
    comment(0x2200, "store YX as animation table address", inline=True)
    comment(0x2204, "load byte at offset A from table, the spriteid")
    comment(0x220a, "check if we should add offset x")
    comment(0x2210, "load next byte from table, the X offset")
    comment(0x2212, "invert offset if direction is reversed")
    comment(0x2217, "invert A if direction is left")
    comment(0x221c, "add offset in X to player position")
    label(0x221c, "add_movement_in_direction_to_player")
    label(0x2223, "skip7")
    label(0x2231, "skip8")
    comment(0x2232, "load next byte from table, the Y offset")
    comment(0x2239, "add offset in Y to player position")
    label(0x2239, "skip9")
    comment(0x2248, """*************************************************************************************

Update player accessory object animation

The player is object zero, and can have an associated 'accessory' object at index one. This is often a tail, but otherwise can be an object the wizard is carrying (e.g. the whip)

On Entry:
    A: if +ve, it's a spriteid
       if -ve, it's TODO: some kind of offset to get a spriteid?

    YX: Address of animation

*************************************************************************************""")
    entry(0x2248, "update_player_accessory_object_animation")
    comment(0x225b, "check for end of animation (loop if needed)")
    label(0x2267, "store_accessory_object_state")
    comment(0x2276, "add animation XY offset to player object position (inverted if looking left)")
    label(0x2284, "skip_invert_a")
    label(0x228b, "skip_decrement_high_byte1")
    label(0x229f, "skip_decrement_high_byte2")
    comment(0x22ae, """*************************************************************************************

Find the offset X,Y for a sprite in a list

On Entry:
    A: spriteid to search for
    temp_animation: address of list to search

On Exit:
    X: X pixel offset from animation
    Y: Y pixel offset from animation

*************************************************************************************""")
    label(0x22ae, "find_sprite_xy_offset_from_spriteid")
    ab(0x22b2)
    label(0x22b4, "list_search_loop")
    label(0x22bb, "start_search")
    label(0x22c4, "found_entry_in_list")
    entry(0x22cd, "check_for_next_player_animation")
    expr(0x22d2, sprite_dict[4])
    expr(0x22d6, sprite_dict[5])
    expr(0x22da, sprite_dict[6])
    label(0x22e0, "update_mid_transformation_local")
    label(0x22e3, "update_wizard_animation_local")
    label(0x22e6, "update_cat_animation_local")
    label(0x22e9, "update_monkey_animation_local")
    label(0x22ec, "return10")
    label(0x22ed, "transform_out_animation")
    comment(0x22ee, """*************************************************************************************

Set the base animation address for the current player type and handle any transform in/out

On Entry:
    XY: Address of start of animation data for the current player type
    A: Offset into animation data to read (usually three for the next animation step, since each animation step takes three bytes)

On Exit:
    Y: set to the current offset of player animation
    A: (for zero flag) $FF if transform in/out is in progress, $00 otherwise

*************************************************************************************""")
    entry(0x22ee, "set_base_animation_address_and_handle_transform_in_out")
    comment(0x22f2, "read next entry in animation")
    comment(0x22f9, "branch if not at the end of the animation")
    comment(0x22fb, "restart the animation")
    label(0x22fe, "not_at_end_of_animation")
    comment(0x22fe, "check for 'transform in' animation")

    label(0x2309, "not_the_transform_in_animation")
    comment(0x2309, "check for 'transform out' animation")
    comment(0x2316, "start the 'transform in' animation, having finished the 'transform out'")
    comment(0x2320, "stack shenanigans: remove the latest return address from the stack to restart the calling function")
    label(0x2325, "not_transforming_out")
    comment(0x232b, "start 'transform out' animation")
    label(0x2331, "transforming")
    label(0x2334, "not_transforming")
    comment(0x2337, """*************************************************************************************

Transform the player into a new form.

On Entry:
    A: spriteid of player character to transform into

*************************************************************************************""")
    entry(0x2337, "transform")
    comment(0x2340, "if the current menu item is to the left of the player characters, then we have just loaded a level or something, so don't play the transform sounds.")
    comment(0x2347, "play transform sounds with priority")
    expr(0x234a, make_lo("sound_data2"))
    expr(0x234c, make_hi("sound_data2"))
    expr(0x2351, make_lo("sound_data3"))
    expr(0x2353, make_hi("sound_data3"))
    label(0x2357, "return11")
    label(0x2358, "start_of_transform_in_animation")
    expr(0x2365, make_add("sound_priority_per_channel_table", "1"))
    label(0x236b, "handle_player_landing_sound")
    comment(0x237f, "wall collision found. if player was moving down at the time, we have hit the floor")
    ab(0x2390)
    label(0x2392, "player_y_is_unchanged")
    comment(0x2392, "check for player collision with floor")
    label(0x23a5, "has_landed")
    label(0x23a8, "return12")
    comment(0x23a9, "TODO: this is used by e.g. dataA")
    expr(0x23b1, make_lo("sound_landing1"))
    expr(0x23b3, make_hi("sound_landing1"))
    expr(0x23b8, make_lo("sound_landing2"))
    expr(0x23ba, make_hi("sound_landing2"))

    comment(0x23cd, "if (no player collision with the room) then branch (return)")
    label(0x242b, "recall_registers_and_return1")

    label(0x2434, "find_left_and_right_of_object")
    comment(0x2434, """*************************************************************************************

Find the left and right extents of the object

Returns both the left and right Y coordinate of the object (found using the object position, sprite offset, current sprite width, and object direction).
It also returns cell based versions of these two coordinates.

As input, pixel based 'temporary' offsets can be added to the result. 'Temporary' because they are zeroed on exit.

On Entry:
                       X: the object index to look at
        temp_left_offset: offset to add to result (zeroed on exit)
       temp_right_offset: offset to add to result (zeroed on exit)

On Exit:
             object_left: Set to object's position X + sprite offset
            object_right: Set to object's position X + sprite offset + sprite width
      object_left_cell_x: Cell X for object_left
     object_right_cell_x: Cell X for object_right
     Preserves X

*************************************************************************************""")
    comment(0x2435, "remember object index")
    comment(0x2439, "get address of current sprite for object")
    comment(0x2440, "recall object index")
    comment(0x2442, "read the sprite's X offset")
    comment(0x2446, "add sprite Y offset to object position (or if looking left, subtract the sprite Y offset), then store in object_left.")
    comment(0x2454, "update address1 based on sprite offset", inline=True)
    comment(0x2460, "get sprite width")
    comment(0x2464, "add sprite width-1 to address1 if looking right, or subtract if looking left storing result in object_right")
    comment(0x247a, "subtract sprite width")
    entry(0x247a, "subtract_sprite_width")
    entry(0x248d, "add_temporary_offsets")
    comment(0x248f, "add temporary left offset to object left position")
    comment(0x24a1, "divide by eight to get cell left position")
    comment(0x24ac, "add temporary right offset to object right position")
    comment(0x24be, "divide by eight to get cell right position")
    comment(0x24d2, """*************************************************************************************

Find the top and bottom extents of the object

Returns both the top and bottom Y coordinate of the object (found using the object position, sprite offset and current sprite height).
It also returns cell based versions of these two coordinates.

As input, pixel based 'temporary' offsets can be added to the result. 'Temporary' because they are zeroed on exit.

On Entry:
                       X: the object index to look at
         temp_top_offset: offset to add to result (zeroed on exit)
      temp_bottom_offset: offset to add to result (zeroed on exit)

On Exit:
              object_top: Set to object's position Y + sprite offset - sprite height
           object_bottom: Set to object's position Y + sprite offset
       object_top_cell_y: Cell Y for object_top
    object_bottom_cell_y: Cell Y for object_bottom

*************************************************************************************""")
    label(0x24d2, "find_top_and_bottom_of_object")
    comment(0x24d3, "remember object index")
    comment(0x24d4, "get address of current sprite for object")
    comment(0x24de, "recall object index")
    comment(0x24e0, "get sprite Y offset")
    comment(0x24e4, "add sprite Y offset to object position, store in object_bottom")
    comment(0x24f7, "read sprite height")
    comment(0x24fb, "store sprite height minus one")

    comment(0x2500, "subtract (sprite height Y minus one) to get object_top")
    comment(0x250f, "add temporary signed offset to object_top")
    comment(0x2521, "divide the bottom pixel coordinate by eight to get the cell Y")
    comment(0x252c, "add temporary signed offset to object_bottom")
    comment(0x253e, "divide the bottom pixel coordinate by eight to get the cell Y")
    comment(0x2547, "zero the temporary offsets")
    comment(0x2552, "Look for X=0 or X=11", inline=True)
    label(0x2552, "adjust_left_or_right_extent_due_to_holding_an_object")
    comment(0x255a, "if (player is not holding an object) then return")
    comment(0x255e, "get spriteid of object being held")
    comment(0x2563, "if (object being held has no sprite) then return")
    comment(0x2568, "remember old object_left and object_right coordinates (four bytes)")
    label(0x256a, "copy_coordinates_loop")
    comment(0x2573, "remember old left and right cell coordinates")
    comment(0x257d, "get held object's left/right extents")
    comment(0x2585, "looking left. If held object's left is larger than the old left, then use the old coordinates")
    comment(0x2592, "use the held object's left coordinate")
    label(0x25a4, "looking_right")
    comment(0x25a4, "looking right. If held object's right is smaller or equal to the old right, then use the old coordinates")
    comment(0x25b1, "use the held object's right coordinate")
    label(0x25c0, "reset_old_values_back_into_object_left_and_right")
    label(0x25c2, "reset_coordinates_loop")
    label(0x25d6, "return_zeroing_offsets")
    label(0x25df, "find_left_and_right_of_object_including_held_object")
    comment(0x25df, "remember temp_left and right offsets, since we will use them again to find the attached object's left/right extents")
    comment(0x25f8, "clear collision flags")

    label(0x2659, "return13")
    comment(0x265a, """*************************************************************************************

Check for player intersecting wall to the left or right

On Exit:
     player_hit_wall_on_left_flag: Flag set ($ff) if player is intersecting wall on the left side of the player
    player_hit_wall_on_right_flag: Flag set ($ff) if intersecting wall on the right side of the player

*************************************************************************************""")
    label(0x265a, "check_for_player_intersecting_wall_left_or_right")
    comment(0x265e, "store player's cell height")
    comment(0x2668, "look at collision map at each cell up the player's height, looking for a solid wall")
    comment(0x2674, "mark that no collision was found on the left side")
    label(0x2668, "loop_up_player_cells_looking_for_solid_wall")
    label(0x2676, "found_wall_on_players_left_side")
    comment(0x267a, "store player's cell height (again)")
    comment(0x2684, "look at collision map at each cell up the player's height, looking for a solid wall")
    comment(0x2690, "mark that no collision was found on the right side")
    label(0x2692, "return14")
    comment(0x2693, """*************************************************************************************

If colliding with a wall, line up next to the wall instead of going through it.

On Entry:
    l0053: object index of player?

*************************************************************************************""")
    label(0x2693, "handle_left_right_wall_collision")
    comment(0x269d, "player has hit wall on left side. Adjust player position to align with the cell next to the wall.")
    comment(0x26b7, "mark object has collided with left wall")
    label(0x26c2, "player_has_hit_wall_on_right_side")
    comment(0x26c2, "player has hit wall on right side. Adjust player position to align with the cell next to the wall.")
    comment(0x26dc, "mark object has collided with right wall")
    label(0x26e4, "return15")

    comment(0x26e5, """*************************************************************************************

Check for player intersecting floor or ceiling of the room

On Entry:
    The cell based extents of the player have been worked out previously:
          object_left_cell_x
         object_right_cell_x
           object_top_cell_y
        object_bottom_cell_y

On Exit:
      player_has_hit_floor_flag: $ff if hit, $00 otherwise
    player_has_hit_ceiling_flag: $ff if hit, $00 otherwise

*************************************************************************************""")
    label(0x26e5, "check_for_player_intersecting_floor_or_ceiling")
    comment(0x26e9, "start at top right")
    comment(0x26eb, "get player width in cells")
    label(0x26f3, "look_for_wall_along_player_top_edge_loop")
    comment(0x26f3, "loop from top right to top left looking for a wall")
    comment(0x26ff, "no collision with top edge of player")
    label(0x2701, "found_wall")
    comment(0x2705, "start at bottom right")
    comment(0x2707, "get player width in cells (again)")
    label(0x270f, "look_for_wall_along_player_bottom_edge_loop")
    comment(0x271b, "no collision with bottom edge of player")
    label(0x271d, "return16")
    label(0x271e, "handle_top_bottom_collision")
    comment(0x2728, "player has hit ceiling. Adjust player position to align with the cell below the ceiling.")
    comment(0x2742, "mark object has collided with ceiling")
    label(0x274d, "player_has_hit_floor")
    comment(0x274d, "player has hit floor. Adjust player position to align with the cell above the floor.")
    comment(0x2767, "mark object has collided with floor")
    label(0x276f, "return17")

    comment(0x2770, """*************************************************************************************

Handle player hitting the floor

On Entry:
    A: object id to test

*************************************************************************************""")
    label(0x2770, "handle_player_hitting_floor")
    comment(0x2776, "check collision of player with room")
    comment(0x2783, "don't write values to the collision map")
    comment(0x2787, "have we hit the floor?")
    comment(0x2792, "if (player hit floor) then branch")
    label(0x279c, "player_hit_floor")
    comment(0x27a8, "find the left/right extents of player without the accessory object")
    comment(0x27ab, "add one to the right pixel extent")
    comment(0x27b8, "add the left and right extents together")

    label(0x2851, "recall_registers_and_return2")
    label(0x2890, "two_byte_table_based_on_left_right_direction")
    comment(0x2894, """*************************************************************************************

Get wall collision flags for object

On Entry:
    A: object index

On Exit:
    A: A=1 means object collided with left wall
       A=2 means object collided with floor
       A=4 means object collided with right wall
       A=8 means object collided with ceiling

*************************************************************************************""")
    comment(0x2894, "TODO: this is used by e.g. dataA")
    comment(0x28e2, "TODO: this is used by e.g. dataA")
    comment(0x28e2, """*************************************************************************************

Test for a collision between two objects

Calculate if the bounding boxes of the two objects overlap.

On Entry:
    X, Y: The object indexes of two objects to test

On Exit:
    A: $ff if collision occcurs, else $00
    flags: reflect value in A
    Preserves X,Y

*************************************************************************************""")
    comment(0x28eb, "make sure we have sprites for both objects X and Y")
    comment(0x28fb, "remember extents for object x (as 'x_' versions) (copy eight bytes)")
    label(0x28fd, "copy_extents_loop")

    comment(0x2905, "retrieve index for second object (was in Y on entry), and put in X register")
    comment(0x2908, "get extents for object Y")
    comment(0x290e, "compare edges of the two objects to see if there is an overlap")
    comment(0x2942, "there is an overlap")
    label(0x2945, "return_restoring_registers")
    label(0x295b, "temp_collision_result")
    label(0x295c, "desired_menu_slots")
    expr(0x295c, sprite_dict[3])
    byte(0x295c)
    label(0x295d, "desired_menu_slots+1")
    expr(0x295d, sprite_dict[2])
    byte(0x295d)
    expr(0x295e, sprite_dict[8])
    byte(0x295e)
    expr(0x295f, sprite_dict[7])
    byte(0x295f)
    byte(0x2960)
    expr(0x2961, sprite_dict[5])
    byte(0x2961)
    expr(0x2962, sprite_dict[6])
    byte(0x2962)
    expr(0x2963, sprite_dict[4])
    byte(0x2963)
    label(0x296d, "menu_index_for_first_player_character")
    comment(0x296e, "The 'extra' menu items are level specific items after the player character items")
    label(0x296e, "menu_index_for_extra_items")
    label(0x296f, "displayed_menu_slots") # see code at c29aa which pairs this with menu_slots1
    comment(0x2980, """*************************************************************************************

Reset menu items to defaults

*************************************************************************************""")
    label(0x2980, "reset_menu_items")
    comment(0x2980, "set standard set as nine menu items (including separators)", inline=True)
    comment(0x2985, "clear desired slots from slot eight upwards")
    label(0x2988, "clear_extra_menu_slots_loop")
    comment(0x2990, "clear table of level specific collectables")
    label(0x2992, "clear_collectables_loop")
    expr(0x2993, "toolbar_collectable_spriteids+1")
    comment(0x2998, "set new menu position")
    entry(0x29a1, "draw_toolbar")
    # TODO: Inconsistent use of "toolbar" and "menu", fix up eventually - "toolbar" is probably better, but not thought much yet - also some inconsistency between "icon" and "slot", although these are arguably distinct (even if the disassembly doesn't respect it), a slot can be blank or have an icon in it - also maybe "slot" vs "index" is a bit sloppy
    comment(0x29a8, """*************************************************************************************

Update menu items (redrawing them if needed)

*************************************************************************************""")
    entry(0x29a8, "draw_menu_icons")
    comment(0x29aa, "check to see if menu icon has changed since last drawn")
    entry(0x29aa, "draw_menu_icon_loop")
    comment(0x29b2, "if the current icon to be redrawn shows the hand pointer, we unplot the hand pointer first, draw the new icon, then redraw the hand after")
    comment(0x29c1, "draw the new menu icon")
    entry(0x29c1, "menu_pointer_not_present_on_slot")
    comment(0x29c9, "If there's a blank under the pointer in the new menu, bump the pointer left until we find a non-blank slot.")
    entry(0x29c9, "find_valid_menu_slot_loop")
    entry(0x29d4, "new_menu_index_valid")
    entry(0x29d7, "draw_next_menu_slot")
    expr(0x29d9, "menu_slot_count")
    label(0x29dd, "redraw_menu_pointer_flag")
    entry(0x29de, "apply_new_menu_index")
    label(0x29ea, "return18")
    entry(0x29eb, "unplot_menu_pointer")
    comment(0x29eb, """*************************************************************************************

Unplot Menu Hand Pointer

*************************************************************************************""")
    comment(0x29ef, "remember currrent screen base address")
    comment(0x29f2, "select toolbar area for drawing")
    expr(0x29f3, make_hi("toolbar_screen_address"))
    comment(0x29f6, "find position of current menu item")
    comment(0x29f9, "erase the hand")

    comment(0x2a04, "restore the background tile where the fingertip overlaps the tile")
    comment(0x2a0f, "restore original screen base address")
    label(0x2a12, "no_menu_item_selected")
    entry(0x2a17, "plot_menu_pointer")
    comment(0x2a17, """*************************************************************************************

Plot Menu Hand Pointer

*************************************************************************************""")
    comment(0x2a1b, "remember currrent screen base address")
    comment(0x2a1e, "select toolbar area for drawing")
    expr(0x2a1f, make_hi("toolbar_screen_address"))
    comment(0x2a22, "find position of current menu item")
    comment(0x2a25, "draw the hand")
    comment(0x2a30, "restore original screen base address")
    label(0x2a33, "record_the_new_menu_item")
    entry(0x2a38, "update_menus")
    expr(0x2a53, "inkey_key_escape")
    label(0x2a60, "skip_developer_escape_key_handling")
    label(0x2a73, "not_changing_menu_position")
    label(0x2a81, "no_space_bar_pressed")
    label(0x2a9a, "clear_sound_priorities_loop2")
    expr(0x2ab1, "inkey_key_shift")
    label(0x2ab7, "skip_developer_shift_key_handling")
    label(0x2abd, "shift_key_detected")
    label(0x2aa0, "update_menu_with_game_paused")
    comment(0x2ac0, "wait for a bit", inline=True)
    label(0x2ac4, "delay_loop1")
    label(0x2acd, "over_a_player_character_or_later_on_menu")
    label(0x2ada, "return19")
    label(0x2adb, "check_for_one_of_first_four_menu_items_chosen")
    expr(0x2ae6, "spriteid_icodata_info")
    expr(0x2aea, "spriteid_icodata_password")
    expr(0x2aee, "spriteid_icodata_sound")
    expr(0x2af2, "spriteid_icodata_disc")
    label(0x2af5, "return20")
    label(0x2af6, "show_level_info_dialog_local")
    label(0x2af9, "show_password_entry_dialog_local")
    label(0x2afc, "toggle_load_save_dialog_local")
    label(0x2aff, "toggle_sound_on_off")

    comment(0x2b02, "remember current sound flag", inline=True)
    comment(0x2b06, "temporarily enable sound", inline=True)
    comment(0x2b0b, "play brief tick sound", inline=True)
    expr(0x2b0e, make_lo("sound_data1"))
    expr(0x2b10, make_hi("sound_data1"))
    comment(0x2b14, "recall current sound flag", inline=True)
    comment(0x2b15, "toggle current flag", inline=True)
    comment(0x2b17, "save new sound flag", inline=True)
    expr(0x2b22, make_hi("toolbar_screen_address"))
    expr(0x2b26, "sprite_op_flags_normal")
    label(0x2b2e, "set_normal_or_erase_mode")
    label(0x2b37, "check_if_player_character_menu_item_chosen")
    comment(0x2b37, "check menu item is in the player character range", inline=True)
    comment(0x2b43, "return if transforming-out")
    comment(0x2b49, "return if transforming-in")
    comment(0x2b52, "return if we are already this player character")
    comment(0x2b59, "reduce number of transformations left and execute transformation")
    comment(0x2b5c, "branch if no transformations remaining before decrement", inline=True) # TODO: rephrase as "branch if decrement failed"? and maybe make associated change in comment at 2c8c?
    label(0x2b64, "return21")
    label(0x2b65, "check_for_extra_menu_item_chosen")
    label(0x2b84, "skip6")
    label(0x2b86, "return22")
    comment(0x2b87, """*************************************************************************************

Insert a player character menu item into the toolbar

*************************************************************************************""")
    entry(0x2b87)
    comment(0x2b87, "remember menu item to insert", inline=True)
    comment(0x2b89, "flag that nothing has changed yet")
    comment(0x2b8d, "start at first player character, and loop until we reach the extras or we find the character")
    label(0x2b90, "find_existing_item_loop")
    comment(0x2b9d, "shuffle existing items right to make room for the new item")
    expr(0x2b9e, make_subtract("menu_slot_count", "1"))
    label(0x2ba4, "shuffle_menu_items_right_loop")
    expr(0x2ba5, "desired_menu_slots-1")
    comment(0x2bb0, "the start of the 'extra' menu items is now one to the right")
    comment(0x2bb3, "store the new item")
    comment(0x2bb8, "flag that the menu has changed")
    label(0x2bba, "return_with_flag_set_if_item_inserted")
    comment(0x2bbd, """*************************************************************************************

Find or append menu item onto toolbar

Find an existing menu slot containing A, or fill the lowest empty slot if one hasn't been found yet. Only 'extra' slots are considered after the standard set, and there are no gaps beyond this point until the end of the menu.

On Exit:
    A=0 if matching slot found or no match found and no empty slot available,
    A=$ff if empty slot found and filled with the entry value of A.
    X is the index of the slot.
    Flags reflect A on exit.

I am not sure the 'no empty slot and no match' behaviour is terribly sensible, but it should never actually happen.

*************************************************************************************""")
    entry(0x2bc6, "find_slot_loop")
    entry(0x2bd6, "empty_slot_found")
    entry(0x2bdd, "matching_slot_found_or_no_empty_slot")
    expr(0x2bd1, "menu_slot_count")
    comment(0x2be0, """*************************************************************************************

Remove a menu item from the toolbar

*************************************************************************************""")
    entry(0x2be0)
    comment(0x2be0, "remember item to remove", inline=True)
    comment(0x2be2, "flag that nothing has changed yet")
    comment(0x2be6, "start index for non-standard menu items")
    ab(0x2bf5)
    label(0x2bf7, "shuffle_menu_items_left_loop")
    comment(0x2bf7, "shuffle menu items left")

    comment(0x2c02, "make final menu slot empty")
    label(0x2c09, "return_with_flag_set_if_shuffled_left")
    entry(0x2c0c, "plot_menu_item")
    comment(0x2c11, "Save the current screen_base_address_high so we can temporarily set it to $58 to plot the menu icon. TODO: Is this just saving the old value because it's tidy/safe, or do we really not know what the old value was? I'd have naively thought we could just do lda #blah:sta screen_base_address_high at the end of this routine?")
    expr(0x2c15, make_hi("toolbar_screen_address"))
    comment(0x2c2b, "erase where menu item used to be")
    label(0x2c35, "plot_menu_item_sprites")
    comment(0x2c35, "draw background sprite")
    comment(0x2c38, "draw icon sprite")
    label(0x2c3d, "restore_variables_and_return")
    label(0x2c46, "calculate_sprite_position_for_menu_item")
    label(0x2c58, "multiply_x_by_twenty_loop")
    decimal(0x2c5a)
    label(0x2c5f, "skip_increment_high_byte")
    label(0x2c62, "finished_multiply")
    entry(0x2c67, "apply_pending_menu_motion")
    entry(0x2c70, "menu_right_pending")
    ab(0x2c7c)
    entry(0x2c7e, "menu_left_pending")
    entry(0x2c88, "no_menu_motion")
    comment(0x2c8c, "Decrement current_transformations_remaining by one, unless it's already zero. Leading digits are handled specially so they turn into spaces rather than zeroes. Carry is clear on exit iff the value was zero on entry.")
    entry(0x2c8c, "decrement_current_transformations_remaining")
    expr(0x2c95, "' ' + '0'") # TODO: not portable
    char(0x2ca0)
    char(0x2ca4)
    char(0x2caf)
    char(0x2cb5)
    char(0x2cc0)
    char(0x2cc4)
    label(0x2cca, "decrement_current_tranformations_remaining_middle_digit_now_zero")
    char(0x2cce)
    label(0x2cd4, "decrement_current_tranformations_remaining_no_borrow")
    label(0x2cd5, "decrement_current_tranformations_remaining_pla_rts")
    comment(0x2cd7, """*************************************************************************************

Animation code

*************************************************************************************""")
    label(0x2cd7, "wizard_sprite_list")

    # Wizard animations
    label(0x2ced, "wizard_transform_in_animation")

    label(0x2d03, "wizard_transform_out_animation")
    label(0x2d16, "wizard_walk_cycle_animation")
    label(0x2d23, "wizard_change_direction_animation")
    label(0x2d26, "wizard_change_direction_animation_last_step")
    label(0x2d2a, "wizard_animation6")
    label(0x2d2e, "wizard_standing_still_animation")
    label(0x2d32, "wizard_animation8")
    label(0x2d36, "wizard_jump_animation")
    label(0x2d46, "wizard_animation10")
    label(0x2d59, "wizard_animation11")
    label(0x2d66, "wizard_animation12")
    label(0x2d73, "wizard_animation13")
    label(0x2d83, "wizard_fall_animation")
    comment(0x2d9b, "toggle player direction")
    label(0x2da6, "wizard_not_changing_direction")

    label(0x2d87, "update_wizard_animation")
    expr(0x2d88, "wizard_transform_out_animation - wizard_transform_in_animation")
    expr(0x2d8d, make_lo("wizard_transform_in_animation"))
    expr(0x2d8f, make_hi("wizard_transform_in_animation"))
    comment(0x2d95, "branch if transforming")
    expr(0x2d98, "wizard_change_direction_animation_last_step - wizard_transform_in_animation")
    expr(0x2daf, "wizard_jump_animation - wizard_transform_in_animation")
    label(0x2dc0, "store_wizard_animation_state_local")
    expr(0x2dc4, "wizard_fall_animation - wizard_transform_in_animation")
    expr(0x2dc9, "wizard_animation10 - wizard_transform_in_animation")
    expr(0x2dbd, "wizard_jump_animation - wizard_transform_in_animation")
    expr(0x2dd3, "wizard_fall_animation - wizard_transform_in_animation")
    comment(0x2dd6, "check player for collision with left or right wall")
    comment(0x2dd8, "why not just lda #5?", inline=True)
    expr(0x2de5, "wizard_fall_animation - wizard_transform_in_animation")
    expr(0x2df9, "wizard_change_direction_animation - wizard_transform_in_animation")

    expr(0x2e00, "wizard_walk_cycle_animation - wizard_transform_in_animation")
    expr(0x2e0a, "wizard_fall_animation - wizard_transform_in_animation")
    expr(0x2e0e, "wizard_jump_animation - wizard_transform_in_animation")
    expr(0x2e1f, "wizard_standing_still_animation - wizard_transform_in_animation")
    expr(0x2e24, "wizard_walk_cycle_animation - wizard_transform_in_animation")
    expr(0x2e28, "wizard_change_direction_animation - wizard_transform_in_animation")
    expr(0x2e35, "wizard_animation8 - wizard_transform_in_animation")
    expr(0x2e43, "wizard_animation6 - wizard_transform_in_animation")
    expr(0x2e52, "wizard_fall_animation - wizard_transform_in_animation")
    expr(0x2e57, "wizard_animation11 - wizard_transform_in_animation")
    expr(0x2e5e, "wizard_animation12 - wizard_transform_in_animation")
    label(0x2e5f, "store_wizard_animation_state")
    expr(0x2e86, make_lo("wizard_transform_in_animation"))
    expr(0x2e88, make_hi("wizard_transform_in_animation"))
    expr(0x2ea9, "spriteid_wizard6")
    label(0x2eb5, "temp_collision_results")
    expr(0x2ebd, make_lo("wizard_sprite_list"))
    expr(0x2ebf, make_hi("wizard_sprite_list"))
    expr(0x2ede, "spriteid_wizard6")
    label(0x2ee4, "store_object_held_and_return")

    ##################################################################################################
    # Cat animations
    label(0x2ef7, "cat_tail_spriteids")
    expr(0x2ef7, "spriteid_cat_tail1")
    expr(0x2ef8, "spriteid_cat_tail2")
    expr(0x2ef9, "spriteid_cat_tail3")
    expr(0x2efa, "spriteid_cat_tail4")
    expr(0x2efb, "spriteid_cat_tail5")
    expr(0x2efc, "spriteid_cat_tail6")
    expr(0x2efd, "spriteid_cat_tail7")
    expr(0x2efe, "spriteid_cat_tail8")

    label(0x2f00, "cat_sprite_list")
    label(0x2f16, "cat_transform_in_animation")
    label(0x2fc8, "update_cat_animation")
    label(0x2f2c, "cat_transform_out_animation")
    label(0x2f3f, "cat_walk_cycle_animation")
    label(0x2f4c, "cat_change_direction_animation")
    label(0x2f4f, "cat_change_direction_animation_last_step")
    label(0x2f53, "cat_animation6")
    label(0x2f57, "cat_standing_still_animation")
    label(0x2f5b, "cat_jump_animation")
    label(0x2f6e, "cat_jump_apex_animation")
    label(0x2f75, "cat_animation10")
    label(0x2f9a, "cat_animation11")
    label(0x2fa7, "cat_animation12")
    label(0x2fb4, "cat_animation13")
    label(0x2fc4, "cat_fall_animation")
    expr(0x2fc9, "cat_transform_out_animation - cat_transform_in_animation")
    expr(0x2fce, make_lo("cat_transform_in_animation"))
    expr(0x2fd0, make_hi("cat_transform_in_animation"))
    expr(0x2fd9, "cat_change_direction_animation_last_step - cat_transform_in_animation")
    comment(0x2fdc, "toggle player direction")
    label(0x2fe7, "cat_not_changing_direction")
    expr(0x2ff0, "cat_jump_animation - cat_transform_in_animation")
    expr(0x2ffe, "cat_jump_animation - cat_transform_in_animation")

    expr(0x300a, "cat_jump_apex_animation - cat_transform_in_animation")
    expr(0x3012, "cat_jump_apex_animation - cat_transform_in_animation")
    expr(0x3020, "cat_jump_apex_animation - cat_transform_in_animation")
    expr(0x3029, "cat_animation10 - cat_transform_in_animation")
    expr(0x3033, "cat_fall_animation - cat_transform_in_animation")
    comment(0x3036, "check player for collision with left or right wall")
    comment(0x3038, "why not just lda #5?", inline=True)
    expr(0x3045, "cat_fall_animation - cat_transform_in_animation")
    expr(0x304f, "cat_animation13 - cat_transform_in_animation")
    expr(0x3059, "cat_change_direction_animation - cat_transform_in_animation")
    expr(0x3060, "cat_walk_cycle_animation - cat_transform_in_animation")
    expr(0x3067, "cat_jump_animation - cat_transform_in_animation")
    expr(0x3078, "cat_standing_still_animation - cat_transform_in_animation")
    expr(0x307c, "cat_standing_still_animation - cat_transform_in_animation")
    expr(0x3081, "cat_walk_cycle_animation - cat_transform_in_animation")
    expr(0x3085, "cat_change_direction_animation - cat_transform_in_animation")
    expr(0x3089, "cat_animation6 - cat_transform_in_animation")
    expr(0x3098, "cat_fall_animation - cat_transform_in_animation")
    expr(0x309d, "cat_animation11 - cat_transform_in_animation")
    expr(0x30a4, "cat_animation12 - cat_transform_in_animation")
    expr(0x30aa, make_lo("cat_transform_in_animation"))
    expr(0x30ac, make_hi("cat_transform_in_animation"))
    expr(0x30b6, make_lo("cat_tail_spriteids"))
    expr(0x30ba, make_hi("cat_tail_spriteids"))
    expr(0x30c3, "cat_transform_in_animation - cat_transform_in_animation")
    expr(0x30c7, "cat_transform_out_animation - cat_transform_in_animation")
    expr(0x30d0, "spriteid_cat_walk4")
    expr(0x30d6, make_lo("cat_sprite_list"))
    expr(0x30d8, make_hi("cat_sprite_list"))
    label(0x30dd, "monkey_tail_spriteids")
    expr(0x30dd, "spriteid_monkey_tail1")
    byte(0x30dd, 8)
    expr(0x30de, "spriteid_monkey_tail2")
    expr(0x30df, "spriteid_monkey_tail3")
    expr(0x30e0, "spriteid_monkey_tail4")
    expr(0x30e1, "spriteid_monkey_tail5")
    expr(0x30e2, "spriteid_monkey_tail6")
    expr(0x30e3, "spriteid_monkey_tail7")
    expr(0x30e4, "spriteid_monkey_tail8")

    for x in range(0x30e6, 0x30fd, 3):
        byte(x, 3)
    for x in range(0x30ff, 0x3113, 3):
        byte(x, 3)

    ##################################################################################################
    # Monkey animations
    label(0x30e6, "monkey_sprite_list")
    label(0x30ff, "monkey_transform_in_animation")

    label(0x3115, "monkey_transform_out_animation")
    for x in range(0x3115, 0x3127, 3):
        byte(x, 3)
    label(0x3128, "monkey_walk_cycle_animation")
    label(0x3135, "monkey_change_direction_animation")
    label(0x3138, "monkey_change_direction_animation_last_step")
    label(0x313c, "monkey_animation6")
    label(0x3140, "monkey_standing_still_animation")
    label(0x3144, "monkey_climb_idle_animation")
    label(0x3148, "monkey_climb_down_animation")
    label(0x314c, "monkey_animation10")
    label(0x3150, "monkey_climb_animation")
    label(0x3157, "monkey_animation12")
    label(0x3179, "monkey_standing_jump_animation")
    label(0x3186, "monkey_jump_animation")
    label(0x3196, "monkey_animation15")
    label(0x31a9, "monkey_animation16")
    label(0x31b6, "monkey_animation17")
    label(0x31c3, "monkey_animation18")
    label(0x31d3, "monkey_fall_animation")
    label(0x31d8, "update_monkey_animation")
    expr(0x31d9, "monkey_transform_out_animation - monkey_transform_in_animation")
    expr(0x31de, make_lo("monkey_transform_in_animation"))
    expr(0x31e0, make_hi("monkey_transform_in_animation"))
    expr(0x31e9, "monkey_change_direction_animation_last_step - monkey_transform_in_animation")
    comment(0x31ec, "toggle player direction")
    label(0x31f7, "monkey_not_changing_direction")

    expr(0x3203, "monkey_climb_animation - monkey_transform_in_animation")
    expr(0x3207, "monkey_climb_down_animation - monkey_transform_in_animation")
    expr(0x320b, "monkey_climb_idle_animation - monkey_transform_in_animation")
    expr(0x3219, "monkey_climb_animation - monkey_transform_in_animation")
    expr(0x321e, "monkey_animation10 - monkey_transform_in_animation")
    expr(0x3223, "monkey_fall_animation - monkey_transform_in_animation")
    expr(0x3239, "monkey_climb_animation - monkey_transform_in_animation")
    expr(0x3248, "monkey_climb_idle_animation - monkey_transform_in_animation")
    expr(0x324d, "monkey_animation12 - monkey_transform_in_animation")
    expr(0x3257, "monkey_climb_down_animation - monkey_transform_in_animation")
    expr(0x3260, "monkey_fall_animation - monkey_transform_in_animation")
    expr(0x327a, "monkey_standing_jump_animation - monkey_transform_in_animation")
    expr(0x3288, "monkey_standing_jump_animation - monkey_transform_in_animation")
    expr(0x3291, "monkey_jump_animation - monkey_transform_in_animation")
    expr(0x329f, "monkey_jump_animation - monkey_transform_in_animation")
    expr(0x32a6, "monkey_fall_animation - monkey_transform_in_animation")
    expr(0x32ab, "monkey_animation15 - monkey_transform_in_animation")
    expr(0x32b2, "monkey_fall_animation - monkey_transform_in_animation")
    expr(0x32bf, "monkey_animation18 - monkey_transform_in_animation")
    expr(0x32c1, "monkey_climb_down_animation - monkey_transform_in_animation")
    expr(0x32d6, "monkey_fall_animation - monkey_transform_in_animation")
    expr(0x32da, "monkey_standing_jump_animation - monkey_transform_in_animation")
    expr(0x32df, "monkey_change_direction_animation - monkey_transform_in_animation")
    expr(0x32e6, "monkey_walk_cycle_animation - monkey_transform_in_animation")
    expr(0x32f0, "monkey_fall_animation - monkey_transform_in_animation")
    expr(0x32f4, "monkey_jump_animation - monkey_transform_in_animation")

    expr(0x3305, "monkey_standing_still_animation - monkey_transform_in_animation")
    expr(0x330a, "monkey_walk_cycle_animation - monkey_transform_in_animation")
    expr(0x330e, "monkey_change_direction_animation - monkey_transform_in_animation")
    expr(0x3312, "monkey_animation6 - monkey_transform_in_animation")
    expr(0x3324, "monkey_fall_animation - monkey_transform_in_animation")
    expr(0x3329, "monkey_animation16 - monkey_transform_in_animation")
    expr(0x3330, "monkey_animation17 - monkey_transform_in_animation")
    expr(0x333b, make_lo("monkey_transform_in_animation"))
    expr(0x333d, make_hi("monkey_transform_in_animation"))
    expr(0x3347, make_lo("monkey_tail_spriteids"))
    expr(0x334b, make_hi("monkey_tail_spriteids"))
    expr(0x3358, "monkey_transform_out_animation - monkey_transform_in_animation")
    expr(0x3361, "spriteid_monkey4")
    expr(0x3367, make_lo("monkey_sprite_list"))
    expr(0x3369, make_hi("monkey_sprite_list"))

    label(0x3404, "toggle_load_save_dialog")
    label(0x340d, "show_load_save_dialog")
    expr(0x3415, make_lo("press_s_to_save_encrypted_string"))
    expr(0x3417, make_hi("press_s_to_save_encrypted_string"))
    expr(0x341f, make_lo("press_l_to_load_encrypted_string"))
    expr(0x3421, make_hi("press_l_to_load_encrypted_string"))
    label(0x3428, "remove_dialog_local1")
    comment(0x342b, "'Press S to save\\r' EOR-encrypted with $cb")
    label(0x342b, "press_s_to_save_encrypted_string")
    comment(0x343b, "'Press L to load\\r' EOR-encrypted with $cb")
    label(0x343b, "press_l_to_load_encrypted_string")
    label(0x344b, "update_disc_menu")
    expr(0x3451, "spriteid_icodata_disc")
    label(0x3467, "test_for_drive_number_key_press_local")
    label(0x346a, "load_or_save")
    expr(0x346b, "osfile_save")
    expr(0x3473, "caps_mask")
    char(0x3475)
    char(0x3479)
    label(0x347f, "ask_for_filename")
    expr(0x3487, make_lo("enter_filename_encrypted_string"))
    expr(0x3489, make_hi("enter_filename_encrypted_string"))
    label(0x3496, "return23")
    label(0x3497, "osfile_action_load_or_save")
    label(0x3498, "enter_filename_encrypted_string")
    label(0x34a7, "get_filename_and_print_drive_number_prompt")
    expr(0x34a8, "max_filename_len")
    expr(0x34c3, make_lo("which_drive_encrypted_string"))
    expr(0x34c5, make_hi("which_drive_encrypted_string"))
    expr(0x34cd, make_lo("press_012_or_3_encrypted_string"))
    expr(0x34cf, make_hi("press_012_or_3_encrypted_string"))
    # This string will be used for save and loads, but I'll use "save" here as a noun to refer to the file on disc.
    label(0x34d6, "save_full_filename")
    string(0x34d6, 1)
    label(0x34d7, "save_drive_number")
    string(0x34d7, 4)
    label(0x34db, "save_leaf_filename")
    stringcr(0x34db)
    comment(0x34e3, "'Which drive?\\r' EOR-encrypted with $cb")
    label(0x34e3, "which_drive_encrypted_string")
    comment(0x34f0, "'Press 0,1,2 or 3\\r' EOR-encrypted with $cb")
    label(0x34f0, "press_012_or_3_encrypted_string")

    label(0x3501, "test_for_drive_number_key_press")
    char(0x3505)
    char(0x3509)
    comment(0x350c, "check for shifted drive number")
    char(0x350d)
    char(0x3511)
    label(0x3516, "drive_number_pressed")
    expr(0x3521, make_lo("insert_save_disk_encrypted_string"))
    expr(0x3523, make_hi("insert_save_disk_encrypted_string"))
    expr(0x352b, make_lo("and_press_return_encrypted_string"))
    expr(0x352d, make_hi("and_press_return_encrypted_string"))
    label(0x3534, "return24")
    label(0x3535, "insert_save_disk_encrypted_string")
    label(0x3546, "and_press_return_encrypted_string")
    label(0x3557, "if_return_pressed_do_load_or_save")
    expr(0x355b, "vdu_cr")
    expr(0x3562, "vdu_lf")
    expr(0x3567, make_lo("saving_encrypted_string"))
    expr(0x3569, make_hi("saving_encrypted_string"))
    comment(0x356a, "if (saving) then branch forwards")
    expr(0x3570, make_lo("loading_encrypted_string"))
    expr(0x3572, make_hi("loading_encrypted_string"))
    label(0x3573, "got_encrypted_string_to_show")
    expr(0x3577, make_lo("save_full_filename"))
    expr(0x357b, make_hi("save_full_filename"))
    expr(0x3584, "osfile_read_catalogue_info")
    label(0x359b, "show_load_save_dialog_local")
    expr(0x35ad, make_lo("save_game"))
    expr(0x35b1, make_hi("save_game"))
    expr(0x35b5, make_lo("sixteen_entry_table"))
    expr(0x35b9, make_hi("sixteen_entry_table"))
    expr(0x35bd, make_lo("save_game"))
    expr(0x35bf, make_hi("save_game"))
    label(0x35d5, "check_drive_letter")
    char(0x35da)
    label(0x35e2, "odd_drive_number")
    label(0x35ed, "drive_chosen")
    label(0x35f7, "saving_encrypted_string")
    label(0x35fe, "loading_encrypted_string")

    label(0x3606, "insert_game_disk_encrypted_string")
    label(0x3617, "prompt_user_to_insert_correct_disc")
    expr(0x361b, make_lo("insert_game_disk_encrypted_string"))
    expr(0x361d, make_hi("insert_game_disk_encrypted_string"))
    expr(0x3625, make_lo("and_press_return_encrypted_string"))
    expr(0x3627, make_hi("and_press_return_encrypted_string"))
    label(0x362e, "wait_for_return")
    expr(0x3632, "vdu_cr")
    label(0x3636, "show_password_entry_dialog")
    expr(0x3643, make_lo("enter_password_encrypted_string"))
    expr(0x3645, make_hi("enter_password_encrypted_string"))
    label(0x3652, "remove_dialog_local3")
    label(0x3655, "enter_password_encrypted_string")
    comment(0x3664, """*************************************************************************************

Password dialogue update

*************************************************************************************""")
    label(0x3664, "update_password_dialog")
    comment(0x3669, "return if not on the password menu item")
    expr(0x366a, "spriteid_icodata_password")
    comment(0x366d, "return if the dialog is not active")
    comment(0x3671, "update string entry (maximum 16 characters)")
    decimal(0x3672)
    comment(0x3676, "At this point, because of the stack shenanigans in 'string_input_character', the input string has been entered")
    comment(0x367a, "check for developer flags")
    comment(0x3681, "check only one character entered + cr")
    comment(0x3685, "Look for one letter passwords (level letter)")
    expr(0x3689, "first_level_letter")
    expr(0x368d, "last_level_letter+1")
    label(0x3698, "no_characters_entered")
    comment(0x369f, "remove dialog and restart game")
    label(0x36a7, "return25")
    label(0x36a8, "load_auxdata_loop")
    expr(0x36a9, make_lo("auxcode_filename"))
    expr(0x36ad, make_hi("auxcode_filename"))
    expr(0x36b1, make_lo("auxcode"))
    expr(0x36b3, make_hi("auxcode"))
    expr(0x36b5, "osfile_load")
    label(0x36c1, "auxcode_loaded_successfully")
    expr(0x36c2, "check_password")
    label(0x36c7, "load_sprdata_loop")
    label(0x36d2, "sprdata_loaded_successfully")
    label(0x36da, "check_password_level")
    entry(0x36db, "select_level_a")
    label(0x36f3, "start_game_local")
    label(0x36f6, "remove_dialog_local2")
    label(0x36f9, "character_too_low")
    comment(0x36fc, """*************************************************************************************

Input a character into a string

Waits for the minimum time for a key to be pressed.

If the RETURN key is pressed, the routine ends normally and the input can be processed. If another key (or no key) is pressed, the regular return address is pulled off the stack and control returns to the next routine up on the stack.

On Entry:
    A: maximum length of string

*************************************************************************************""")
    entry(0x36fc, "string_input_character")

    expr(0x3705, "vdu_cr")
    expr(0x3709, "vdu_delete")
    char(0x370d)
    char(0x3711)
    char(0x3715)
    char(0x3719)
    comment(0x371c, "Character is between '!' and '*' i.e. one of the shifted number keys. Add 16 to get ASCII number, even if SHIFT LOCK is on")
    label(0x3720, "check_range_of_characters")
    char(0x3721)
    expr(0x3725, "'9' + 1") # TODO: not assembler independent
    expr(0x3729, "caps_mask")
    char(0x372b)
    expr(0x372f, "'Z' + 1") # TODO: not assembler independent
    label(0x3734, "minus_or_equals_key_pressed")
    char(0x3735)
    label(0x3736, "store_character_if_room_available")
    label(0x3744, "store_character")
    label(0x3750, "delete_pressed")
    expr(0x3755, "vdu_left")
    char(0x375a)
    expr(0x375f, "vdu_left")
    label(0x376b, "finished_string_input")
    label(0x377a, "character_handled")
    comment(0x377a, "take the return address off the stack and return to the routine above the callee")
    label(0x377c, "return26")
    label(0x377d, "max_input_length")
    label(0x377e, "show_level_info_dialog")
    label(0x378e, "show_section_letter_dialog")
    expr(0x3796, make_lo("section_encrypted_string"))
    expr(0x3798, make_hi("section_encrypted_string"))
    label(0x37b1, "section_encrypted_string")
    label(0x37ba, "show_level_completion_letters_dialog")
    expr(0x37c2, "first_level_letter")
    label(0x37c3, "show_level_completion_letters_loop")
    expr(0x37cb, "first_level_letter")
    comment(0x37cd, "check for level completion")
    comment(0x37d8, "print diamond for completed level")
    label(0x37da, "got_character_to_print")
    expr(0x37de, "last_level_letter-1")
    comment(0x37e1, "move forward one character")
    comment(0x37e8, "have we reached the end of the first line of letters?")
    expr(0x37e9, "first_level_letter + num_levels/2 - 1")
    comment(0x37ec, "move to second row of letters")
    label(0x37f2, "return27")
    entry(0x37f3) #print_encrypted_string_at_yx_centred
    entry(0x37f9, "find_string_length_loop")
    expr(0x37fe, "vdu_cr")

    entry(0x3804, "string_length_in_y")
    char(0x3813)
    entry(0x3814, "print_y_spaces_loop")
    comment(0x381c, "Print the EOR-encrypted (with eor_key) CR-terminated string at YX. Print in italics iff l0043 is non-0.")
    entry(0x381c, "print_encrypted_string_at_yx")
    expr(0x3821, make_lo("print_italic"))
    expr(0x3826, make_hi("print_italic"))
    expr(0x382f, make_lo("oswrch"))
    expr(0x3834, make_hi("oswrch"))
    entry(0x3838, "print_char_target_set")
    entry(0x383a, "print_char_loop")
    expr(0x383f, "vdu_cr")
    entry(0x3848, "print_done")
    comment(0x384d, "Print the character in A. This is patched at runtime to switch between normal and italic text.")
    entry(0x384d, "print_char")
    label(0x384e, "print_char_target")
    expr_label(0x384f, make_add("print_char_target", "1"))
    entry(0x3850, "print_2xlf_cr")
    expr(0x3851, "vdu_lf")
    expr(0x3859, "vdu_cr")
    entry(0x385d, "turn_cursor_on")
    ab(0x3861)
    entry(0x3863, "turn_cursor_off")
    label(0x3867, "finish_cursor_on_off")
    entry(0x3872, "flush_input_buffers_and_zero_characters_entered")
    label(0x387c, "inkey_0")
    label(0x388a, "return_with_zero_result")
    label(0x3892, "wait_one_second_loop")
    decimal(0x3896)
    label(0x389c, "auxcode_filename")
    stringcr(0x389c)
    sound(0x38a4, "sound_data1")
    comment(0x38ac, "The envelope definitions get overwritten after initialisation - this is harmless as they will have been copied into the OS workspace when they were defined.")
    envelope(0x38ac, "envelope_1")
    label(0x38ad, "object_sprite_mask_type + objectid_player_accessory")
    sound(0x38ba, "sound_data3")
    envelope(0x38c2, "envelope_2")
    sound(0x38d0, "sound_data2")
    comment(0x38d8, """object_room_collision_flags is a per-object table that has:

    bit 0: object collided with left wall
    bit 1: object collided with floor
    bit 2: object collided with right wall
    bit 3: object collided with ceiling""")
    envelope(0x38d8, "envelope_3")
    sound(0x38e6, "sound_landing2")
    sound(0x38ee, "sound_landing1")
    comment(0x38f6, """*************************************************************************************

Play a sound

On Extry:
    A: Sound priority ($ff always plays, $00 won't if sound already playing is $ff)
    YX: Address of SOUND block to play (eight bytes)

On Exit:
    Preserves A

*************************************************************************************""")
    comment(0x38f9, "remember address1 on stack")
    comment(0x38ff, "store YX address")

    comment(0x3903, "exit if sound is disabled")
    comment(0x390c, "If flush is clear, then branch forward to play sound")
    comment(0x3910, "Get channel number (0-3) into X")
    comment(0x3915, "update current sound priority as needed")
    comment(0x3920, "if sound channel is 2 or 3, branch forward")
    comment(0x3924, "if (the new sound is the same as the existing sound) then branch to play_sound")
    label(0x3932, "flush_sound_buffer_X")
    comment(0x3932, "add four to X to get sound buffer number")
    label(0x393c, "no_flush")
    comment(0x3941, "store the address of the new sound in tables")
    label(0x394b, "play_sound")
    comment(0x3954, "restore address1 from stack")
    label(0x3954, "finish_play_sound")
    entry(0x395e, "define_envelope")
    label(0x3966, "sound_enable_flag")
    label(0x3967, "address_of_sounds_low_table")
    label(0x396b, "address_of_sounds_high_table")
    label(0x3973, "remember_a")
    spriteid(0x3974, 0x3986)
    label(0x3974, "mid_transform_sprites_table")
    label(0x3975, "mid_transform_circle_sprites")
    comment(0x3986, "During a transformation, 'object_current_index_in_animation' is the index into the sprite array above and ")
    label(0x3986, "update_mid_transformation")
    expr(0x39dd, "last_level_letter")
    expr(0x39e7, "last_level_letter")
    expr(0x39eb, "first_level_letter")
    expr(0x39fe, "mid_transform_circle_sprites - mid_transform_sprites_table")

    label(0x3a12, "update_main_keys")
    expr(0x3a13, "inkey_key_return")
    expr(0x3a1c, "inkey_key_z")
    expr(0x3a28, "inkey_key_x")
    label(0x3a41, "store_x_as_valid_direction_pending")
    label(0x3a47, "update_space_etc_keys") # TODO: Why does it check the left and right keys again?
    expr(0x3a48, "inkey_key_space")
    label(0x3a54, "save_space_bar_state_change_pending")
    comment(0x3a58, "store whether the left cursor key is pressed in 'z_key_pressed'")
    expr(0x3a59, "inkey_key_left")
    comment(0x3a60, "if the left and right cursor keys are pressed together (or neither), there is no valid direction (set A=$00)")
    expr(0x3a61, "inkey_key_right")
    comment(0x3a6a, "set A=$FF if moving left, or $01 if moving right along the toolbar")
    ab(0x3a71)
    label(0x3a73, "no_valid_direction")
    entry(0x3a75, "menu_x_step_in_a")
    comment(0x3a75, "This is a manual implementation of an auto-repeat delay, so if you hold down left/right a fraction of a second too long it doesn't zip all the way to the left or right.")
    comment(0x3a79, "if direction changes, restart the auto-repat delay")
    label(0x3a83, "restart_auto_repeat_delay")
    label(0x3a88, "remember_direction_pressed")
    label(0x3a8d, "z_key_pressed")
    label(0x3a8e, "auto_repeat_delay")
    # TODO: Not yet clear exactly why we have two versions of these flags
    label(0x3aa0, "space_flag2")
    label(0x3aa1, "left_right_flag_pending")
    label(0x3aa2, "read_player_movement_keys")
    label(0x3ac7, "jump_requested")
    label(0x3ac8, "jump_requested_previous_tick")
    label(0x3ac9, "player_move_direction_requested")
    comment(0x3ac9, "$ff for left, $01 for right, $00 for none")
    label(0x3aca, "move_left_requested")
    label(0x3acb, "move_right_requested")
    label(0x3acc, "negative_inkey")
    expr_label(0x3ad6, make_add("level_data", "1"))

# TODO: With developer_flags, set the start room to go to?
label(0x3add, "room_index_cheat1")
label(0x3ade, "room_index_cheat2")

# Startup code
comment(0x3c06, "The loader will have executed VDU 21 to disable VDU output. Record the current disable state before re-enabling it, so we can check it later as part of a copy protection scheme.")
comment(0x3c06, "This initialisation code gets overwritten by level data later on.")
expr(0x3c12, "vdu_enable")
blank(0x3c16)
comment(0x3c16, "Relocation 1: Copy 512 bytes of code from &40FF to &400")
expr(0x3c17, make_lo("relocation1_high_copy_start"))
expr(0x3c1b, make_hi("relocation1_high_copy_start"))
expr(0x3c1f, make_lo("wait_for_timingB_counter"))
expr(0x3c23, make_hi("wait_for_timingB_counter"))
comment(0x3c28, "branch never taken", inline=True)
label(0x3c2c, "relocation1_loop")
blank(0x3c3a)
label(0x3c3a, "relocation2")
comment(0x3c3a, "Relocation 2: Copy &2A00 bytes from &1234 to &1103. This is done more for obfuscation than any real requirement - we could have just loaded at &1103 in the first place.")
expr(0x3cf1, "vdu_define_character")
entry(0x3cfc, "define_character_fe_loop")
expr(0x3c3b, make_lo("pydis_start"))
expr(0x3c3f, make_hi("pydis_start"))
expr(0x3c43, make_lo("developer_flags"))
expr(0x3c47, make_hi("developer_flags"))
comment(0x3c4e, "branch always taken", inline=True)
label(0x3c56, "skip4")
comment(0x3c58, "branch never taken", inline=True)
label(0x3c5c, "relocation2_loop")
label(0x3c6a, "relocation3")
blank(0x3c6a)
comment(0x3c6a, "Relocation 3: Copy $48 bytes of code from $4088 to $0ab7")
label(0x3c6c, "relocation3_loop")
expr(0x3c74, make_subtract("relocation3_high_copy_end", "relocation3_high_copy_start"))
blank(0x3c77)
comment(0x3c77, "Relocation 4: Copy $100 bytes of code from $3fcb to $0c00")
label(0x3c79, "relocation4_loop")
expr(0x3c7a, "relocation4_high_copy_start")
blank(0x3c82)
comment(0x3c82, "Relocation 5: Copy $2f bytes of data from $40d0 to $0131")
label(0x3c84, "relocation5_loop")
expr(0x3c85, "relocation5_high_copy_start")
expr(0x3c8c, make_subtract("relocation5_high_copy_end", "relocation5_high_copy_start"))
comment(0x3c8f, "Relocation finished")
blank(0x3c8f)
char(0x3c97)
label(0x3c9b, "set_drive_and_directory")
comment(0x3cd2, "remember default brk and irq vectors")
comment(0x3cf0, "redefine character 254 as a diamond shape")

comment(0x3d1a, "clear the display of remaining transformations")
char(0x3d1b)
comment(0x3d3d, "define envelopes")
expr(0x3d3e, make_lo("envelope_1"))
expr(0x3d40, make_hi("envelope_1"))
expr(0x3d45, make_lo("envelope_2"))
expr(0x3d47, make_hi("envelope_2"))
expr(0x3d4c, make_lo("envelope_3"))
expr(0x3d4e, make_hi("envelope_3"))
comment(0x3d52, "initialise the 'all clear' and 'all set' tiles")
label(0x3d54, "init_tiles_loop")
comment(0x3d61, "store special spriteid used for preserving the background behind the player and the player's accessory?")
expr(0x3d62, "spriteid_199")
expr(0x3d67, "spriteid_198")
comment(0x3d6b, "set z order for the player at the midway point so that objects can appear in front or behind the player")
comment(0x3d70, "set z order for the player accessory object as being just in front of the player")
expr(0x3d73, "object_z_order+1")
comment(0x3d75, "seed random number generation by reading the User VIA timers")
comment(0x3d8d, "set base address for sprite rendering, $6200 is the main game area")
comment(0x3d91, "Check to see if VDU output was disabled (VDU 21) when we first started to execute, before we re-enabled output (VDU 6) ourselves.")
comment(0x3d91, "TODO: Is this to make the G file self-contained if it's run directly from the command line during development, instead of from IMOGEN?")
comment(0x3d96, "VDU output wasn't disabled when we started to execute. Change to MODE 4.")
expr(0x3d97, "vdu_set_mode")
label(0x3da3, "clear_toolbar_part_of_screen")
comment(0x3da3, "Clear memory from $5b00 to $6200. This clears the toolbar area of the screen. The toolbar lives in screen memory from $5bc0 to $6200, so this routine clears a little before the start of screen memory, but this is OK as we are just about to load sprite data there anyway")
comment(0x3da3, "set start address to $5b00", inline=True)
expr(0x3da9, make_hi("start_of_screen_memory"))
label(0x3dae, "clear_toolbar_part_of_screen_loop")
comment(0x3db9, "Define text window that excludes the leftmost column (left 1, bottom 31, right: 39, top: 0). This simplifies printing text in dialog boxes.")
label(0x3db9, "define_text_window")
expr(0x3dba, "vdu_define_text_window")
expr(0x3dc9, "screen_width_minus_one")
comment(0x3dd2, "set background text colour to 1")
expr(0x3dd3, "vdu_set_text_colour")
comment(0x3ddc, "set foreground text colour to 0")
expr(0x3ddd, "vdu_set_text_colour")
comment(0x3de6, "set graphics foreground colour to 0")
expr(0x3de7, "vdu_set_graphics_colour")
comment(0x3df3, "read *TV shift setting")
comment(0x3dfc, "remember *TV shift setting")
comment(0x3dfe, "restore previous *TV setting (since we changed it in the process of reading it)", inline=True)

comment(0x3e01, "Set CRTC registers")
comment(0x3e0b, "redundant", inline=True)
comment(0x3e0d, "redundant", inline=True)
comment(0x3e0f, "Calculate 34+tv shift and store in vertical_sync_amount_for_crtc_register")
comment(0x3e1a, "subtract five", inline=True)
comment(0x3e4e, "Double the *TV shift amount", inline=True)
comment(0x3e50, "Adjust two timing counters depending on the *TV shift amount")
comment(0x3e50, "Loop counter, goes twice around the loop (Y is decremented twice each time)", inline=True)
label(0x3e52, "adjust_timing_variable_loop")
comment(0x3e56, "subtract twice the *TV shift amount", inline=True)
comment(0x3e5f, "Load sprites")
expr(0x3e60, make_lo("sprdata_filename"))
expr(0x3e64, make_hi("sprdata_filename"))
expr(0x3e68, "osfile_read_catalogue_info")
comment(0x3e6c, "Load 'sprdata' file into memory so it ends just before screen memory at $5bc0.")
expr(0x3e6d, make_lo("start_of_screen_memory"))
expr(0x3e74, make_hi("start_of_screen_memory"))
comment(0x3e7c, "remember where sprite data is loaded")
comment(0x3e82, """
Load 'icodata' file into memory at icodata

ICODATA contains the standard set of sprites for the toolbar. These are drawn once and stay on screen permanently, so the the memory used by ICODATA is reused.
ICODATA also holds a developer_flags byte and the level ordering details, which is copied before being reused.

ICODATA is loaded at $40ff (overwriting 'block_of_code_to_live_at_0400' which has already been moved) where it is used, then overwritten.
""")
expr(0x3e83, make_lo("icodata"))
expr(0x3e87, make_hi("icodata"))
expr(0x3e92, make_lo("icodata_filename"))
expr(0x3e96, make_hi("icodata_filename"))
expr(0x3e9a, "osfile_load")
entry(0x3ea1, "read_icodata_using_osword_7f")
comment(0x3ea1, "seek track 39", inline=True)
decimal(0x3ea2)
comment(0x3ea6, "write special register 'track' with value 127")
comment(0x3eab, "block read three 256 byte sectors into memory at 'icodata'")
comment(0x3eb9, "read failed, seek track zero and try again")
label(0x3ec1, "read_successful")
comment(0x3ec1, "write special register 'track' with value 39")
decimal(0x3ec2)
entry(0x3ec9, "seek_track_a")
entry(0x3ed5, "set_track_special_register_to_a")
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
comment(0x3ef4, "TODO: I think the track and sector values in this block are logical tracks and rely on the previous step operation, but I'm not sure. I suspect this is done entirely for obfuscation and has been converted to file operations in this version, but I haven't actually checked that.")
label(0x3ef4, "osword_7f_block_read")
do_osword_7f_block_partial(0x3ef4)
expr(0x3ef5, "icodata")
comment(0x3efa, "command ($53=read data)", inline=True)
comment(0x3efb, "track", inline=True)
comment(0x3efc, "sector", inline=True)
comment(0x3efd, "size+count ($23=3 256 byte sectors)", inline=True)
label(0x3efe, "osword_7f_read_result")
label(0x3eff, "drive_0_command")


label(0x3f05, "drive_number")
char(0x3f05)
label(0x3f07, "dir_dollar_command")
label(0x3f0d, "icodata_read_ok")
comment(0x3f0d, "Get the address of the first 'sprite' which is actually level ordering data", inline=True)
comment(0x3f16, "Copy seventeen bytes of level ordering data into the level_ordering_table")
decimal(0x3f17)
label(0x3f18, "copy_level_ordering_table_loop")
expr(0x3f1b, make_subtract("level_ordering_table", 1))
comment(0x3f20, "read the first byte of the data. If bit 6 is set then set the developer_flags.")
binary(0x3f23)
binary(0x3f29)
label(0x3f2d, "skip_writing_developer_flags")
expr(0x3f3f, make_hi("toolbar_screen_address"))
decimal(0x3f43)
comment(0x3f54, "start in one of four random levels")
label(0x3f5e, "icodata_filename")
stringcr(0x3f5e)
label(0x3f66, "character_fe_bitmap")
byte(0x3f66, 8, 1)
picture_binary(0x3f66, 8)
label(0x3f6e, "initial_screen_disabled_flag")
entry(0x3f6f, "handle_developer_mode_setup")
comment(0x3f78, "The following code assumes there may be a ROM image stored in sideways RAM at $8000. It copies 16 bytes of an empty ROM image to the start of sideways RAM. This overwrites any existing ROM image held in sideways RAM. Is this some copy protection, or a development environment?")
expr(0x3f79, "sideways_rom_image_source_end - sideways_rom_image_source_start - 1")
label(0x3f7b, "copy_to_sideways_ram_loop")
comment(0x3f85, "Copy 256 bytes from quit_to_basic to $be00, and 256 bytes from $0b00 to $bf00. ")
comment(0x3f9f, "The reset intercept code is set to 'JMP $1845'")
comment(0x3fa1, "JMP opcode")
expr(0x3fa2, "opcode_jmp")
expr(0x3fab, make_lo("reset_code"))
expr(0x3fb4, make_hi("reset_code"))
label(0x3fba, "return28")
label(0x3fbb, "sideways_rom_image_source_start")
entry(0x3fbe)
byte(0x3fc1, 1)
entry(0x3fc3)

label(0x3fcb, "sideways_rom_image_source_end")
label(0x3fcb, "relocation4_high_copy_start")

entry(0x402c, "quit_to_basic")
expr(0x403b, "vdu_printer_off")
expr(0x4040, "vdu_set_mode")
for i in range(5):
    char(0x406a+i*4)
expr(0x407e, "vdu_cr")
label(0x4088, "relocation3_high_copy_start")
label(0x4088+0x48, "relocation3_high_copy_end")

comment(0x40d0, "Update the transformation count on screen at text position (35-37, 6). This takes care to update as few digits on screen as possible, probably to reduce flicker and to offset the relatively slow implementation of print_italic.")
label(0x40d0, "relocation5_high_copy_start")
label(0x40ff, "relocation5_high_copy_end")
label(0x40ff, "icodata")
label(0x40ff, "relocation1_high_copy_start")

label(0x58c0, "toolbar_screen_address")

label(0x5bc0, "start_of_screen_memory")
label(0x8000, "end_of_screen_memory")

label(0x6200, "game_area_screen_address")

with sideways_ram_area:
    entry(0x8000, "sideways_rom_image_dest")
    comment(0x8000, "language entry point", inline=True)
    comment(0x8003, "service entry point", inline=True)
    comment(0x8006, "ROM type flag", inline=True)
    comment(0x8007, "empty copyright string", inline=True)
    label(0x8008, "sideways_rom_return")
    comment(0x8008, "do nothing - return", inline=True)
    comment(0x8009, "unused bytes", inline=True)

##################################################################################################
sprite_addr = [ 0x2cd7, 0x2cda, 0x2cdd, 0x2ce0, 0x2ce3, 0x2ce6, 0x2ce9,
                0x2cf0, 0x2cf3, 0x2cf6, 0x2cf9, 0x2cfc, 0x2cff, 0x2d2e, 0x2d03, 0x2d06, 0x2d09, 0x2d0c, 0x2d0f, 0x2d12, 0x2d16,
                0x2d19, 0x2d1c, 0x2d1f, 0x2d23, 0x2d26, 0x2d2a, 0x2d32, 0x2d36, 0x2d39, 0x2d3c, 0x2d3f, 0x2d42, 0x2d46, 0x2d49,
                0x2d4c, 0x2d4f, 0x2d52, 0x2d55, 0x2d59, 0x2d5c, 0x2d5f, 0x2d62, 0x2d66, 0x2d69, 0x2d6c, 0x2d6f, 0x2d73, 0x2d76,
                0x2d79, 0x2d7c, 0x2d7f, 0x2d83,

                0x2f00, 0x2f03, 0x2f06, 0x2f09, 0x2f0c, 0x2f0f, 0x2f12, 0x2f19, 0x2f1c, 0x2f1f, 0x2f22, 0x2f25, 0x2f28, 0x2f2c,
                0x2f2f, 0x2f32, 0x2f35, 0x2f38, 0x2f3b, 0x2f3f, 0x2f42, 0x2f45, 0x2f48, 0x2f4c, 0x2f4f, 0x2f53, 0x2f57, 0x2f5b,
                0x2f5e, 0x2f61, 0x2f64, 0x2f67, 0x2f6a, 0x2f6e, 0x2f71, 0x2f75, 0x2f78, 0x2f7b, 0x2f7e, 0x2f81, 0x2f84, 0x2f87,
                0x2f8a, 0x2f8d, 0x2f90, 0x2f93, 0x2f96, 0x2f9a, 0x2f9d, 0x2fa0, 0x2fa3, 0x2fa7, 0x2faa, 0x2fad, 0x2fb0, 0x2fb4,
                0x2fb7, 0x2fba, 0x2fbd, 0x2fc0, 0x2fc4,


                0x30e6, 0x30e9, 0x30ec, 0x30ef, 0x30f2, 0x30f5, 0x30f8, 0x30fb,
                0x3102, 0x3105, 0x3108, 0x310b, 0x310e, 0x3111, 0x3115, 0x3118, 0x311b, 0x311e, 0x3121, 0x3124, 0x3128, 0x312b,
                0x312e, 0x3131, 0x3135, 0x3138, 0x313c, 0x3140, 0x3144, 0x3148, 0x314c, 0x3150, 0x3153, 0x3157, 0x315a, 0x315d,
                0x3160, 0x3163, 0x3166, 0x3169, 0x316c, 0x316f, 0x3172, 0x3175, 0x3179, 0x317c, 0x317f, 0x3182, 0x3186, 0x3189,
                0x318c, 0x318f, 0x3192, 0x3196, 0x3199, 0x319c, 0x319f, 0x31a2, 0x31a5, 0x31a9, 0x31ac, 0x31af, 0x31b2, 0x31b6,
                0x31b9, 0x31bc, 0x31bf, 0x31c3, 0x31c6, 0x31c9, 0x31cc, 0x31cf, 0x31d3,
                ]

for i in sprite_addr:
    v = get_u8_runtime(memorymanager.RuntimeAddr(i))
    expr(i, sprite_dict[v])

#for i in range(0x30e6, 0x30ff):
#    v = get_u8_runtime(memorymanager.RuntimeAddr(i))
#    if v >= 0x40 and v < 0x60:
#        print(hex(i))
#        expr(i, sprite_dict[v])

# Look for pushing or pulling multiple registers to comment them
sequences = {
    (0x48, 0x8a, 0x48, 0x98, 0x48): "remember A,X,Y",       # pha:txa:pha:tya:pha
    (0x68, 0xa8, 0x68, 0xaa, 0x68): "recall A,X,Y",         # ply:tay:pla:tax:pla
    (0x8a, 0x48, 0x98, 0x48): "remember X,Y",               # txa:pha:tya:pha
    (0x68, 0xa8, 0x68, 0xaa): "recall X,Y",                 # ply:tay:pla:tax
    (0x48, 0x8a, 0x48): "remember A,X",                     # pha:txa:pha
    (0x68, 0xaa, 0x68): "recall A,X",                       # pla:tax:pla
    (0x48, 0x98, 0x48): "remember A,Y",                     # pha:tya:pha
    (0x68, 0xa8, 0x68): "recall A,Y",                       # ply:tay:pla
}

bin_range = range(0x1234, 0x4225)
bin_addr = bin_range[0]
while bin_addr < bin_range[-1]:
    for s in sequences:

        # Look for match in bytes in binary file against sequences
        offset = 0
        for j in s:
            if (bin_addr + offset) >= bin_range[-1]:
                break
            v = get_u8_binary(memorymanager.BinaryAddr(bin_addr + offset))
            if v != j:
                break
            offset += 1

        if offset == len(s):
            comment(b2r(memorymanager.BinaryAddr(bin_addr)), sequences[s], inline=True)
            bin_addr += len(s)-1
            break
    bin_addr += 1


# TODO: Temp reference code for EOR-decrypting in Python:
# s="$9b, $b9, $ae, $b8, $b8, $eb, $fb, $e7, $fa, $e7, $f9, $eb, $a4, $b9, $eb, $f8, $c6"
# [chr(0xcb ^ int(x.strip()[1:],16)) for x in s.split(",")]

# Keypresses are checked in the IRQ routine every vsync.
# Because the main game loop can be slow, multiple vsyncs can occur, so keypresses are accumulated and stored in "pending" variables
# The main game can deal with these in the next tick.


print("""; *************************************************************************************
;
; Imogen disassembly
; by SteveF and TobyLobster, 2023
;
; *************************************************************************************

; *************************************************************************************
;
; Memory map
; ----------
;   0100-012e: object data (object extents etc)
;   0131-0160: code to print transformations left
;   0400-0527: dialog box code
;   0530-07ff: cache of screen memory under the dialog box
;   0950-0ab5: data
;   0ab7-0aff: level utils code
;   0b11-0bec: special sprite data (sprites 197, 198, 199)
;   0c00-0c60: collision map
;   1103-3ad4: main code
;   3ad5-4ad3: 'data*' file (level code/data) (it starts as initialisation code at first before being overwritten by a level)
;   4ad8-5bbf: 'sprdata' file (main sprites) OR
;   53c0-578a: 'auxcode' file (for password / cheat codes support)
;   5bc0-7fff: screen memory
;
; *************************************************************************************
""")

go()

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
