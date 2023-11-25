from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
#    0xc8: "spriteid_mouse",
    0xd1: "spriteid_duck_toolbar",
    0xd2: "spriteid_egg_toolbar",
    0xd3: "spriteid_egg_mask_toolbar", # TODO: "mask" is a guess
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Room 0
#constant(2, "objectid_left_mouse")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataE.dat", "6502", "1fd692ce17c1ae2c858ed57730c9c081")

label(0x0a13, "save_game_level_e_holding_egg_flag") # TODO: other uses? not checked yet
label(0x0a15, "save_game_level_e_duck_captured_flag") # TODO: might be used for other things too, not checked yet

common_to_all()
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x4449): {
        "l0070": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

label(0x3cd3, "room_2_check_right_exit")
expr(0x3cd6, "exit_room_right")
label(0x443f, "room_1_check_right_exit")
expr(0x4442, "exit_room_right")

expr(0x3b07, "spriteid_duck_toolbar")
entry(0x3b0b, "developer_mode_not_active")
expr(0x3b11, "spriteid_egg_mask_toolbar")
entry(0x3b15, "dont_have_egg")
expr(0x3b1d, "spriteid_duck_toolbar")
entry(0x3b21, "duck_not_captured_yet")

label(0x3eb8, "some_table")
expr(0x3b22, make_lo("some_table"))
expr(0x3b27, make_hi("some_table"))
label(0x460c, "source_sprite_data")
expr(0x3b2c, make_lo("source_sprite_data"))
expr(0x3b30, make_hi("source_sprite_data"))




result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
