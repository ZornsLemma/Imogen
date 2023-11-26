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

load(0x3ad5, "orig/dataF.dat", "6502", "5ae4be40f790e2c1de27b92942f3b2ed")

common_to_all()
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x3c49): {
        "l0070": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

label(0x3bae, "room_0_check_right_exit")
expr(0x3bb1, "exit_room_right")
label(0x3c3f, "room_1_check_right_exit")
expr(0x3c42, "exit_room_right")

label(0x3ea6, "return1")
label(0x4260, "return2")
label(0x43cf, "return3")
ldx_ldy_jsr_define_envelope(0x3c7a, "envelope1")
ldx_ldy_jsr_define_envelope(0x3c81, "envelope2")
ldx_ldy_jsr_play_sound_yx(0x3e0c, "sound1")
ldx_ldy_jsr_play_sound_yx(0x3e13, "sound2")
ldx_ldy_jsr_play_sound_yx(0x3eaf, "sound3")
comment(0x3fd3, "check for first update in room (branch if not)")
comment(0x42f8, "check for first update in room (branch if not)")
comment(0x3c5a, "check for first update in room (branch if so)")
comment(0x4245, "check for first update in room (branch if so)")
comment(0x3af1, "check for level change (branch if not)")
comment(0x3c62, "check for level change (branch if not)")
comment(0x3fd8, "check for level change (branch if not)")
comment(0x430a, "check for level change (branch if not)")
expr(0x3e86, "objectid_player")
expr(0x4375, "objectid_old_player")

# TODO: replace "+ n" with "+ objectid_*" once objects have been named
expr(0x433e, "object_x_low + 2")
expr(0x422d, "object_x_low + 5")
expr(0x4235, "object_x_low + 5")
expr(0x423b, "object_x_low + 5")
expr(0x4343, "object_x_high + 2")
expr(0x4222, "object_x_high + 5")
expr(0x4226, "object_x_high + 5")
expr(0x422a, "object_x_high + 5")
expr(0x423e, "object_x_high + 5")
expr(0x4243, "object_x_high + 5")
expr(0x43bf, "object_y_low + 2")
expr(0x3e5e, "object_y_low + 3")
expr(0x3d6a, "object_y_low + 5")
expr(0x420e, "object_y_low + 5")
expr(0x4348, "object_y_high + 2")
expr(0x400b, "object_y_high + 5")
expr(0x43b3, "object_spriteid + 2")
expr(0x43c4, "object_spriteid + 2")
expr(0x43cd, "object_spriteid + 2")
expr(0x4202, "object_spriteid + 5")
expr(0x4208, "object_direction + 5")

# TODO: uncomment once sprite_dict has been populated
#expr(0x3b09, sprite_dict)
#expr(0x3c93, sprite_dict)
#expr(0x3c9a, sprite_dict)
#expr(0x3cbb, sprite_dict)
#expr(0x3cd0, sprite_dict)
#expr(0x3ce8, sprite_dict)
#expr(0x3d1b, sprite_dict)
#expr(0x3d20, sprite_dict)
#expr(0x3dc4, sprite_dict)
#expr(0x42fe, sprite_dict)
#expr(0x432d, sprite_dict)
#expr(0x437e, sprite_dict)
#expr(0x43b1, sprite_dict)
#expr(0x43c2, sprite_dict)
#expr(0x43cb, sprite_dict)


result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
