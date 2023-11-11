from commands import *


class SubstituteLabels():
    def __init__(self, substitute_labels):
        self.substitute_labels = substitute_labels

        # Create the substitute labels but with inverted dictionaries
        self.inverse_labels = {}
        for pair in self.substitute_labels:
            dict = self.substitute_labels[pair]
            inv_dict = {v: k for k, v in dict.items()}
            self.inverse_labels[pair] = inv_dict

            # HACK: also make labels lXXXX, which seems redundant, but changes the way the label_maker suggestions works
            for key in dict:
                m = re.match("l([0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F])", key)
                if m:
                    addr = int(m.group(1), 16)
                    label(addr, key)

    def substitute_label_maker(self, addr, context, suggestion):
        for pair in self.substitute_labels:
            if context in range(pair[0], pair[1]):
                dict = self.substitute_labels[pair]
                if suggestion[0] in dict:
                    return dict[suggestion[0]]

        # stop using the substitution if not in range
        for pair in self.inverse_labels:
            if context not in range(pair[0], pair[1]):
                dict = self.inverse_labels[pair]
                if suggestion[0] in dict:
                    return dict[suggestion[0]]

        return suggestion

constant(0x4c, "opcode_jmp")

# TODO: Some of these constants are not common to *all* files which currently include common (e.g. first/last_level_letter are probably not needed by data*) - may not be worth fussing with, or may be better to have different common files for different things to minimise label noise.
#
label(0x0005, "password_characters_entered")
label(0x31, "desired_level") # TODO: This is not right but let's go with it for now - the way this is used it clearly contains *a* level (as a letter, I think), but I am not quite sure what it's used for - the use at 36df suggests this is more like "current level" actually - or maybe it's more like "level_to_load"
label(0x50, "previous_room_index")
label(0x51, "previous_level") # TODO: see use at initialise_level

label(0x3c, "width_in_cells")
label(0x3d, "height_in_cells")
label(0x003e, "value_to_write_to_collision_map")

label(0x1103, "developer_flags")
label(0x005b, "developer_mode_sideways_ram_is_set_up_flag")
label(0x040a, "show_dialog_box") # TODO: guesswork
label(0x0453, "remove_dialog")
label(0x09ef, "level_progress_table")
label(0x1766, "set_toolbar_and_gameplay_area_colours")
label(0x1966, "jmp_yx")
label(0x37f3, "print_encrypted_string_at_yx_centred")
label(0x388d, "wait_one_second_then_check_keys")
label(0x3a8f, "check_cursor_left_right_and_space")

# See mono_handler and colour_handler in auxcode.asm
label(0x1765, "use_colour_flag")
label(0x175d, "pending_toolbar_colour")
label(0x175e, "toolbar_colour")
label(0x175f, "pending_gameplay_area_colour")
label(0x1760, "gameplay_area_colour")

label(0xa90, "string_input_buffer")

label(0x53c0, "auxcode")
label(0x53c0, "check_password")

# TODO: There are only 16 levels which is A-P, but we have Q as well. I hadn't realised that before. I suspect Q might be used for the "game completed" message, but that is just a guess. (Note that there is a dataQ file on disc.) It's possible last_level_letter is misnamed or it would be better to express 'Q' as last_level_letter(='P')+1. Depends how it all works in the code.
constant(0x41, "first_level_letter") # TODO: would be nice to use 'A' as constant
constant(0x51, "last_level_letter") # TODO: would be nice to use 'Q' as constant

# TODO: Use this more generally or maybe just get rid of it?
def label_word(addr, s):
    label(addr, s)
    expr_label(addr + 1, make_add(s, "1"))

label(0x3ad5, "level_data")
label_word(0x3ad7, "level_init_after_load_handler_ptr")
label_word(0x3ad9, "second_level_handler_ptr") # TODO: poor name
label_word(0x3adb, "level_name_ptr") # TODO: poor name

label(0x1988, "something13_TODO")
label(0x1a10, "something14_TODO")
label(0x2b87, "insert_character_menu_item_into_toolbar")
label(0x2be0, "remove_item_from_toolbar_menu")
label(0x12bb, "something23_TODO")
label(0x12da, "something24_TODO")
label(0x1b90, "something26_TODO")
label(0x1abb, "restore_rectangle_of_screen_memory")
label(0x1f57, "something52_TODO")
label(0x1db9, "draw_rope")
label(0x1e44, "write_value_to_a_rectangle_of_cells_in_collision_map")
label(0x28e2, "something55_TODO")
label(0x1f4c, "draw_sprite_a_at_character_xy")
label(0x1f6d, "something57_TODO")
label(0x1f5d, "something58_TODO")
label(0x2894, "something59_TODO")
label(0x1ebb, "write_a_single_value_to_cell_in_collision_map")
label(0x23a9, "play_landing_sound")

label(0x2bbd, "find_or_create_menu_slot_for_A")


label(0x1140, "initialise_level")

label(0x3adf, "level_header_data")
expr_label(0x3ae0, make_add("level_header_data", "1"))

label(0x132b, "some_data_shared_between_g_and_dataA")

# TODO: Speculative but feels quite plausible looking at the code - 'current' and 'desirable' is extra-speculative
# Room index is within the level, 0-(n-1) if the level has n rooms
label(0x1aba, "current_room_index")
label(0x30, "desired_room_index")

# TODO: Speculative - but note that dataA stores an address in its data-ish section here but never reads from it (except maybe via subroutines in g)
label(0x40, "some_data3_ptr")
expr_label(0x41, make_add("some_data3_ptr", "1"))

label(0xaa9, "eight_entry_table2")
