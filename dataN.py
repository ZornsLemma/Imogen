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

load(0x3ad5, "orig/dataN.dat", "6502", "b5b25b774079156e08f37276f6956e13")

common_to_all('N')
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3f18,0x403e): {
        "l0070": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

comment(0x3af7, "check for level change (branch if not)")
label(0x3b07, "developer_mode_inactive1")
comment(0x3c05, "check for first update in room (branch if not)")
comment(0x3c0a, "check for level change (branch if not)")
label(0x3ce5, "developer_mode_inactive2")
label(0x3d38, "return1")
comment(0x3d3a, "check for first update in room (branch if so)")
comment(0x3d42, "check for level change (branch if not)")
ldx_ldy_jsr_play_sound_yx(0x3dfb, "sound1")
comment(0x3e6e, "check for first update in room (branch if so)")
label(0x3e84, "return2")
label(0x3e92, "return3")
label(0x3f28, "room_1_check_right_exit")
expr(0x3f2b, "exit_room_right")
label(0x4034, "room_2_check_bottom_exit")
expr(0x4037, "exit_room_bottom")
comment(0x4066, "check for first update in room (branch if not)")
ldx_ldy_jsr_define_envelope(0x406f, "envelope1")
ldx_ldy_jsr_define_envelope(0x4076, "envelope2")
comment(0x4079, "check for level change (branch if not)")
ldx_ldy_jsr_play_sound_yx(0x4167, "sound2")
ldx_ldy_jsr_play_sound_yx(0x416e, "sound3")
label(0x4177, "return4")
comment(0x4193, "check for first update in room (branch if so)")
ldx_ldy_jsr_play_sound_yx(0x41e2, "sound4")
label(0x42ee, "return5")
label(0x4354, "return6")
comment(0x4409, "check for first update in room (branch if not)")
ldx_ldy_jsr_define_envelope(0x4412, "envelope3")
expr(0x445b, "objectid_old_player")
expr(0x4499, "objectid_player_accessory")
comment(0x44d9, "check for first update in room (branch if so)")
expr(0x44f0, make_lo("sound4"))
expr(0x44f2, make_hi("sound4"))
label(0x4508, "return7")

label(0x3bf7, "room_0_update_handler")
label(0x3f35, "room_1_update_handler")
label(0x4058, "room_2_update_handler")
label(0x43fb, "room_3_update_handler")

# TODO: replace "+ n" with "+ objectid_*" once objects have been named
expr(0x3c48, "object_x_low + 7")
expr(0x3d20, "object_spriteid + 9")
expr(0x3d27, "object_spriteid + 7")
expr(0x3d2d, "object_y_low + 7")
expr(0x3d36, "object_spriteid + 8")
expr(0x3da6, "object_spriteid + 10")
expr(0x3dcb, "object_spriteid + 4")
expr(0x3dd5, "object_spriteid + 5")
expr(0x3df3, "object_spriteid_old + 10")
expr(0x3e02, "object_y_low + 4")
expr(0x3e0c, "object_spriteid_old + 10")
expr(0x3e20, "object_y_low + 4")
expr(0x3e23, "object_y_low + 5")
expr(0x3e2f, "object_y_low + 10")
expr(0x42ec, "object_spriteid + 2")
expr(0x42f4, "object_x_low + 2")
expr(0x42fa, "object_x_high + 2")
expr(0x4300, "object_y_low + 2")
expr(0x4306, "object_y_high + 2")
expr(0x430b, "object_spriteid + 2")
expr(0x444a, "object_spriteid + 4")
expr(0x446b, "object_spriteid + 4")
expr(0x4478, "object_spriteid + 3")
expr(0x44b0, "object_x_high + 3")
expr(0x44b6, "object_y_low + 3")
expr(0x44bc, "object_y_high + 3")
expr(0x44c2, "object_direction + 3")
expr(0x44c7, "object_spriteid + 3")
expr(0x44aa, "object_x_low + 3")

ground_fill(0x3b11)

# TODO: uncomment once sprite_dict has been populated
#expr(0x3b0d, sprite_dict)
#expr(0x3c28, sprite_dict)
#expr(0x3d71, sprite_dict)
#expr(0x3d83, sprite_dict)
#expr(0x3da4, sprite_dict)
#expr(0x3dc9, sprite_dict)
#expr(0x3dd3, sprite_dict)
#expr(0x3df1, sprite_dict)
#expr(0x3e0a, sprite_dict)
#expr(0x3efe, sprite_dict)
#expr(0x3f69, sprite_dict)
#expr(0x3ffd, sprite_dict)
#expr(0x4009, sprite_dict)
#expr(0x4013, sprite_dict)
#expr(0x401d, sprite_dict)
#expr(0x42ea, sprite_dict)
#expr(0x4309, sprite_dict)
#expr(0x43cb, sprite_dict)
#expr(0x43dc, sprite_dict)
#expr(0x43e6, sprite_dict)
#expr(0x4416, sprite_dict)
#expr(0x4448, sprite_dict)
#expr(0x4469, sprite_dict)
#expr(0x446e, sprite_dict)
#expr(0x4476, sprite_dict)
#expr(0x4482, sprite_dict)
#expr(0x44a2, sprite_dict)
#expr(0x44c5, sprite_dict)



result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
