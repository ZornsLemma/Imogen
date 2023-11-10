from commands import *

# TODO: Some of these constants are not common to *all* files which currently include common (e.g. first/last_level_letter are probably not needed by data*) - may not be worth fussing with, or may be better to have different common files for different things to minimise label noise.
#
label(0x31, "desired_level") # TODO: This is not right but let's go with it for now - the way this is used it clearly contains *a* level (as a letter, I think), but I am not quite sure what it's used for - the use at 36df suggests this is more like "current level" actually - or maybe it's more like "level_to_load"
label(0x51, "previous_level") # TODO: see use at initialise_level

label(0x3c, "width_in_cells")
label(0x3d, "height_in_cells")
label(0x003e, "value_to_write_to_collision_map")

label(0x1103, "developer_flags")

# TODO: See mono_handler and colour_handler in auxcode.asm
label(0x1765, "use_colour_flag")
label(0x175d, "pending_toolbar_colour")
label(0x175e, "toolbar_colour")
label(0x175f, "pending_gameplay_area_colour")
label(0x1760, "gameplay_area_colour")

label(0xa90, "string_input_buffer")

label(0x53c0, "auxcode")
label(0x53c0, "check_password")

# TODO: barking up the wrong tree, I think
#label(0x1103, "game_state_flags")
#constant(1, "game_state_flag_have_spell")

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
label(0x1abb, "something51_TODO")
label(0x1f57, "something52_TODO")
label(0x1db9, "something53_TODO")
label(0x1e44, "write_value_to_a_rectangle_in_collision_map")
label(0x28e2, "something55_TODO")
label(0x1f4c, "draw_sprite_a_at_character_xy")
label(0x1f6d, "something57_TODO")
label(0x1f5d, "something58_TODO")
label(0x2894, "something59_TODO")
label(0x1ebb, "write_a_single_value_to_collision_map")
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
