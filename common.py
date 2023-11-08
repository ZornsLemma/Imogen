from commands import *

# TODO: Some of these constants are not common to *all* files which currently include common (e.g. first/last_level_letter are probably not needed by data*) - may not be worth fussing with, or may be better to have different common files for different things to minimise label noise.

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

label(0x12bb, "something23_TODO")
label(0x12da, "something24_TODO")
