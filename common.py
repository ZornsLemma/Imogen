from commands import *

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

# TODO: There are only 16 levels which is A-P, but we have Q as well. I hadn't realised that before. I suspect Q might be used for the "game completed" message, but that is just a guess. (Note that there is a dataQ file on disc.) It's possible last_level_letter is misnamed or it would be better to express 'Q' and last_level_letter(='P')+1. Depends how it all works in the code.
constant(0x41, "first_level_letter") # TODO: would be nice to use 'A' as constant
constant(0x51, "last_level_letter") # TODO: would be nice to use 'Q' as constant
