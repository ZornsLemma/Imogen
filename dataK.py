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
label(0x3b0b, "developer_mode_inactive1")
label(0x3bc4, "room_2_check_right_exit")
expr(0x3bc7, "exit_room_right")
comment(0x3bee, "check for first update in room (branch if so)")
comment(0x3bf6, "check for level change (branch if not)")
label(0x3d07, "return1")
label(0x3d2b, "developer_mode_inactive2")
comment(0x3e7c, "check for first update in room (branch if so)")
label(0x3ecb, "return2")
ldx_ldy_jsr_play_sound_yx(0x3f8c, "sound1")
ldx_ldy_jsr_play_sound_yx(0x3f93, "sound2")
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

label(0x3bd9, "room_2_update_handler")
label(0x3f56, "room_3_update_handler")
label(0x419f, "room_0_update_handler")
label(0x43a4, "room_1_update_handler")

# TODO: replace "+ n" with "+ objectid_*" once objects have been named
expr(0x3ccb, "object_direction + 5")
expr(0x3d2c, "object_spriteid + 2")
expr(0x3de0, "object_spriteid_old + 3")
expr(0x3de3, "object_spriteid + 3")
expr(0x3de6, "object_y_low + 3")
expr(0x3deb, "object_y_low + 3")
expr(0x3e02, "object_spriteid + 3")
expr(0x3e14, "object_spriteid_old + 4")
expr(0x3e17, "object_spriteid_old + 5")
expr(0x3e1a, "object_spriteid + 4")
expr(0x3e1d, "object_spriteid + 5")
expr(0x3e29, "object_y_low + 4")
expr(0x3e32, "object_y_low + 5")
expr(0x3e3e, "object_spriteid_old + 4")
expr(0x3e41, "object_spriteid_old + 5")
expr(0x3e46, "object_spriteid + 4")
expr(0x3e49, "object_spriteid + 5")
expr(0x3e5e, "object_spriteid + 5")
expr(0x3e73, "object_spriteid + 4")
expr(0x3e8f, "object_spriteid_old + 4")
expr(0x3e92, "object_spriteid_old + 5")
expr(0x3e98, "object_spriteid + 4")
expr(0x3e9b, "object_spriteid + 5")
expr(0x3eb2, "object_spriteid + 5")
expr(0x3ec9, "object_spriteid + 4")
expr(0x408a, "object_y_low + 5")
expr(0x409e, "object_x_low + 7")
expr(0x40a3, "object_y_low + 7")
expr(0x40a8, "object_spriteid + 7")
expr(0x40d1, "object_spriteid + 2")
expr(0x414b, "object_spriteid + 6")
expr(0x4155, "object_x_low + 6")
expr(0x415f, "object_y_low + 6")
expr(0x4164, "object_spriteid + 5")
expr(0x4169, "object_x_low + 5")
expr(0x4196, "object_spriteid + 5")
expr(0x419b, "object_x_low + 5")
expr(0x420b, "object_spriteid + 3")
expr(0x4236, "object_spriteid + 3")
expr(0x42b1, "object_spriteid + 2")
expr(0x42bc, "object_x_low + 2")
expr(0x42c2, "object_x_high + 2")
expr(0x42c8, "object_direction + 2")
expr(0x42ce, "object_y_low + 2")
expr(0x42d3, "object_spriteid + 2")
expr(0x42dc, "object_spriteid + 2")
expr(0x42e5, "object_spriteid + 2")
expr(0x42ed, "object_spriteid_old + 2")
expr(0x4307, "object_spriteid + 2")
expr(0x4325, "object_spriteid + 2")
expr(0x4411, "object_x_low + 3")
expr(0x4414, "object_x_high + 3")
expr(0x4439, "object_spriteid + 3")
expr(0x4459, "object_spriteid + 3")
expr(0x445f, "object_y_low + 3")
expr(0x4472, "object_y_low + 3")
expr(0x4477, "object_spriteid + 3")
expr(0x4490, "object_spriteid + 3")
expr(0x4493, "object_y_low + 3")
expr(0x4499, "object_y_low + 3")
expr(0x44e4, "object_spriteid + 3")

ground_fill(0x3b21)

# TODO: uncomment once sprite_dict has been populated
#expr(0x3b15, sprite_dict)
#expr(0x3b1d, sprite_dict)
#expr(0x3c78, sprite_dict)
#expr(0x3c8f, sprite_dict)
#expr(0x3dde, sprite_dict)
#expr(0x3e00, sprite_dict)
#expr(0x3e12, sprite_dict)
#expr(0x3e3c, sprite_dict)
#expr(0x3e44, sprite_dict)
#expr(0x3f27, sprite_dict)
#expr(0x3f34, sprite_dict)
#expr(0x3f41, sprite_dict)
#expr(0x3fe1, sprite_dict)
#expr(0x40a6, sprite_dict)
#expr(0x4162, sprite_dict)
#expr(0x4194, sprite_dict)
#expr(0x41b3, sprite_dict)
#expr(0x41c2, sprite_dict)
#expr(0x4209, sprite_dict)
#expr(0x4234, sprite_dict)
#expr(0x423e, sprite_dict)
#expr(0x42af, sprite_dict)
#expr(0x42d1, sprite_dict)
#expr(0x42da, sprite_dict)
#expr(0x42e3, sprite_dict)
#expr(0x4305, sprite_dict)
#expr(0x4380, sprite_dict)
#expr(0x4437, sprite_dict)
#expr(0x4475, sprite_dict)
#expr(0x44b6, sprite_dict)
#expr(0x44e2, sprite_dict)

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
