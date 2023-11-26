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

load(0x3ad5, "orig/dataK.dat", "6502", "8cdca3e68b752622cd596db68f24d8c4")

common_to_all()
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x3bce): {
        "l0070": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

comment(0x3af6, "check for level change (branch if not)")
label(0x3bc4, "room_2_check_right_exit")
expr(0x3bc7, "exit_room_right")
comment(0x3bee, "check for first update in room (branch if so)")
comment(0x3bf6, "check for level change (branch if not)")
label(0x3d07, "return1")
comment(0x3e7c, "check for first update in room (branch if so)")
label(0x3ecb, "return2")
ldx_ldy_jsr_play_sound_yx(0x3f8c, "sound1")
comment(0x4044, "check for first update in room (branch if not)")
comment(0x4049, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x4071, "envelope1")
label(0x419d, "return3")
comment(0x41ad, "check for first update in room (branch if not)")
comment(0x41d0, "check for level change (branch if not)")
expr(0x422b, "objectid_old_player")
comment(0x42e7, "check for first update in room (branch if so)")
label(0x4327, "return4")
comment(0x43ef, "check for first update in room (branch if not)")
comment(0x43f4, "check for level change (branch if not)")
comment(0x4481, "check for first update in room (branch if so)")
comment(0x449b, "check for first update in room (branch if so)")
expr(0x44ad, "objectid_old_player_accessory")

#expr(0x3c78, sprite_dict)
#expr(0x3c8f, sprite_dict)
#expr(0x3f27, sprite_dict)
#expr(0x3f34, sprite_dict)
#expr(0x3f41, sprite_dict)
#expr(0x3fe1, sprite_dict)
#expr(0x4380, sprite_dict)
#expr(0x44b6, sprite_dict)
#expr(0x41b3, sprite_dict)
#expr(0x41c2, sprite_dict)
#expr(0x3b15, sprite_dict)
#expr(0x3b1d, sprite_dict)
#expr(0x423e, sprite_dict)

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
