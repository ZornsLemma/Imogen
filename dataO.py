from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
#    0xc8: "spriteid_mouse",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Room 0
#constant(2, "objectid_left_mouse")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataO.dat", "6502", "ddadc2eb1bfb98e14b769a9851db5513")

common_to_all()
define_level(4)
label(0x0070, "room_exit_direction")

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
#    (0x3bd4,0x3df9): {
#        "l0070": "room_exit_direction",
#    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

label(0x3d30, "room_1_check_right_exit")
expr(0x3d33, "exit_room_right")
label(0x4108, "room_2_check_right_exit")
expr(0x410b, "exit_room_right")





result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
