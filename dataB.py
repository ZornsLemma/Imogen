from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_clock",
    0xc9: "spriteid_pendulum1",
    0xca: "spriteid_pendulum2",
    0xcb: "spriteid_pendulum3",
    0xcc: "spriteid_pendulum4",
    0xcd: "spriteid_pendulum5",

    0xd1: "spriteid_clock_workings",
    0xd2: "spriteid_table",

    0xd5: "spriteid_boulder",
}

# Room 0
#constant(2, "objectid_left_mouse")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataB.dat", "6502", "879a85aaab89fe8ab2005698a0353a0b")

common_to_all()
define_level(4)

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

#comment(0x3b29, "Draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision map.", inline=True)
#comment(0x3b84, "Carve the floor, walls and ceiling into the rock")
#comment(0x3b87, "Draw tables")
#comment(0x3bae, "Draw ropes")

label(0x3b1b, "result1")

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
