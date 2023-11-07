from commands import *

# TODO: See mono_handler and colour_handler in auxcode.asm
label(0x1765, "allow_colour_variation")
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
