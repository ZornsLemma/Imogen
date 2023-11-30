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

load(0x3ad5, "orig/dataP.dat", "6502", "74d7881579d26d3ec5aa7d12bb1cf39f")

common_to_all('P')
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x3d31): {
        "l0070": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

comment(0x3af4, "check for level change (branch if not)")
label(0x3b04, "developer_mode_inactive")
label(0x3bb6, "room_1_check_right_exit")
expr(0x3bb9, "exit_room_right")
comment(0x3bd7, "check for first update in room (branch if not)")
label(0x3cae, "return1")
label(0x3d27, "room_2_check_right_exit")
expr(0x3d2a, "exit_room_right")
comment(0x3d34, "check for first update in room (branch if so)")
comment(0x3d3c, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x3d46, "envelope1")
ldx_ldy_jsr_define_envelope(0x3d4d, "envelope2")
label(0x3ea9, "return2")
ldx_ldy_jsr_play_sound_yx(0x3ed9, "sound1")
label(0x3f4a, "return3")
label(0x3fae, "return4")
ldx_ldy_jsr_play_sound_yx(0x3fb5, "sound2")
comment(0x40e2, "check for first update in room (branch if not)")
comment(0x40e7, "check for level change (branch if not)")
comment(0x4164, "check for first update in room (branch if so)")
label(0x41a4, "return5")
comment(0x41a5, "check for first update in room (branch if not)")
comment(0x41aa, "check for level change (branch if not)")
expr(0x4201, "objectid_player")
expr(0x4258, make_lo("sound1"))
expr(0x425a, make_hi("sound1"))
expr(0x42bc, "objectid_old_player")
label(0x42f2, "return6")
comment(0x4324, "check for first update in room (branch if so)")
comment(0x4339, "check for level change (branch if not)")
label(0x448f, "return7")
label(0x45bd, "return8")

label(0x3bc3, "room_1_update_handler")
label(0x404a, "room_3_update_handler")

# TODO: replace "+ n" with "+ objectid_*" once objects have been named
expr(0x3c1c, "object_spriteid + 7")
expr(0x3c56, "object_spriteid + 2")
expr(0x3c8f, "object_spriteid + 5")
expr(0x3c9b, "object_spriteid + 5")
expr(0x3ca0, "object_spriteid + 6")
expr(0x3cac, "object_spriteid + 6")
expr(0x3e20, "object_spriteid + 2")
expr(0x3e40, "object_spriteid + 2")
expr(0x3edf, "object_spriteid_old + 4")
expr(0x3ee2, "object_spriteid + 4")
expr(0x3eec, "object_spriteid + 4")
expr(0x3ef1, "object_spriteid_old + 6")
expr(0x3ef4, "object_spriteid + 6")
expr(0x3efe, "object_spriteid + 6")
expr(0x3f0d, "object_y_low + 3")
expr(0x3f10, "object_y_low + 4")
expr(0x3f1a, "object_spriteid + 3")
expr(0x3f26, "object_spriteid + 3")
expr(0x3f2f, "object_y_low + 5")
expr(0x3f32, "object_y_low + 6")
expr(0x3f3c, "object_spriteid + 5")
expr(0x3f48, "object_spriteid + 5")
expr(0x4148, "object_spriteid + 5")
expr(0x4154, "object_spriteid + 5")
expr(0x4172, "object_spriteid + 5")
expr(0x4177, "object_spriteid + 2")
expr(0x417c, "object_x_low + 2")
expr(0x4182, "object_y_low + 2")
expr(0x419f, "object_spriteid + 2")
expr(0x41f1, "object_spriteid + 3")
expr(0x4236, "object_spriteid_old + 4")
expr(0x423b, "object_spriteid + 4")
expr(0x42c7, "object_spriteid + 2")
expr(0x42eb, "object_spriteid + 2")
expr(0x437f, "object_spriteid_old + 2")
expr(0x438f, "object_spriteid_old + 2")
expr(0x440b, "object_spriteid_old + 2")
expr(0x442f, "object_spriteid + 2")
expr(0x444e, "object_x_low + 2")
expr(0x4451, "object_x_low_old + 2")
expr(0x4476, "object_y_low + 2")
expr(0x4479, "object_y_low_old + 2")
expr(0x4563, "object_x_low + 2")
expr(0x4569, "object_x_high + 2")
expr(0x456f, "object_y_low + 2")
expr(0x4575, "object_y_high + 2")
expr(0x45bb, "object_spriteid + 2")
expr(0x45cc, "object_x_low + 2")
expr(0x45d2, "object_x_high + 2")
expr(0x45d8, "object_y_low + 2")
expr(0x45de, "object_y_high + 2")
expr(0x45e3, "object_spriteid + 2")
expr(0x45e9, "object_direction + 2")

ground_fill(0x3b0e)

# TODO: uncomment once sprite_dict has been populated
#expr(0x3b0a, sprite_dict)
#expr(0x3c1a, sprite_dict)
#expr(0x3c54, sprite_dict)
#expr(0x3c8d, sprite_dict)
#expr(0x3c99, sprite_dict)
#expr(0x3c9e, sprite_dict)
#expr(0x3caa, sprite_dict)
#expr(0x3da1, sprite_dict)
#expr(0x3db8, sprite_dict)
#expr(0x3de2, sprite_dict)
#expr(0x3e1e, sprite_dict)
#expr(0x3e3e, sprite_dict)
#expr(0x3ea5, sprite_dict)
#expr(0x3edd, sprite_dict)
#expr(0x3eea, sprite_dict)
#expr(0x3eef, sprite_dict)
#expr(0x3efc, sprite_dict)
#expr(0x3f18, sprite_dict)
#expr(0x3f24, sprite_dict)
#expr(0x3f3a, sprite_dict)
#expr(0x3f46, sprite_dict)
#expr(0x401f, sprite_dict)
#expr(0x4027, sprite_dict)
#expr(0x40fd, sprite_dict)
#expr(0x4146, sprite_dict)
#expr(0x4152, sprite_dict)
#expr(0x4170, sprite_dict)
#expr(0x4175, sprite_dict)
#expr(0x419d, sprite_dict)
#expr(0x41d9, sprite_dict)
#expr(0x41ea, sprite_dict)
#expr(0x41ef, sprite_dict)
#expr(0x4234, sprite_dict)
#expr(0x4239, sprite_dict)
#expr(0x42c5, sprite_dict)
#expr(0x42cf, sprite_dict)
#expr(0x42e9, sprite_dict)
#expr(0x432d, sprite_dict)
#expr(0x437d, sprite_dict)
#expr(0x4428, sprite_dict)
#expr(0x442d, sprite_dict)
#expr(0x45b9, sprite_dict)
#expr(0x45e1, sprite_dict)



result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
