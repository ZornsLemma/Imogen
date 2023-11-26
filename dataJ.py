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

load(0x3ad5, "orig/dataJ.dat", "6502", "c73d7e405d93cdcff53385132a68323b")

common_to_all()
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x3d37): {
        "l0070": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

comment(0x3af2, "check for level change (branch if not)")
label(0x3b0e, "return1")
expr(0x3bad, "exit_room_right")
comment(0x3bc3, "check for first update in room (branch if not)")
comment(0x3bc8, "check for level change (branch if not)")
label(0x3baa, "room_1_check_right_exit")
comment(0x3c7a, "check for first update in room (branch if so)")
expr(0x3c80, "objectid_player")
label(0x3ca1, "return2")
label(0x3d2d, "room_2_check_right_exit")
expr(0x3d30, "exit_room_right")
comment(0x3d3a, "check for first update in room (branch if not)")
comment(0x3d3f, "check for level change (branch if not)")
label(0x3db3, "return3")
comment(0x3df3, "check for first update in room (branch if so)")
label(0x3e04, "return4")
comment(0x3ea4, "check for first update in room (branch if not)")
comment(0x3ea9, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x3ec3, "envelope1")
label(0x3f6f, "return5")
comment(0x40a1, "check for first update in room (branch if not)")
comment(0x40a6, "check for level change (branch if not)")
comment(0x418f, "check for first update in room (branch if so)")
expr(0x4195, "objectid_player")
comment(0x41fa, "check for first update in room (branch if so)")
expr(0x4200, "objectid_old_player")
label(0x422c, "return6")
comment(0x4241, "check for first update in room (branch if not)")
ldx_ldy_jsr_define_envelope(0x4257, "envelope2")
comment(0x425a, "check for level change (branch if not)")
label(0x4332, "return7")
ldx_ldy_jsr_play_sound_yx(0x4346, "sound1")
ldx_ldy_jsr_play_sound_yx(0x434d, "sound2")
expr(0x4351, "objectid_player")
label(0x4372, "return8")
label(0x4462, "return9")
label(0x449d, "return10")

label(0x3e89, "room_3_update_handler")

# TODO: replace "+ n" with "+ objectid_*" once objects have been named
expr(0x3bee, "object_x_low + 3")
expr(0x3bf3, "object_direction + 3")
expr(0x3c72, "object_spriteid + 3")
expr(0x3c78, "object_y_low + 3")
expr(0x3d62, "object_x_low + 3")
expr(0x3d67, "object_direction + 3")
expr(0x3d6c, "object_x_low + 4")
expr(0x3d71, "object_direction + 4")
expr(0x3d76, "object_x_low + 5")
expr(0x3d7b, "object_direction + 5")
expr(0x3f44, "object_spriteid + 4")
expr(0x40cc, "object_x_low + 3")
expr(0x413d, "object_spriteid + 2")
expr(0x4187, "object_spriteid + 3")
expr(0x418d, "object_y_low + 3")
expr(0x41b2, "object_x_low + 3")
expr(0x41b5, "object_x_low + 2")
expr(0x41ba, "object_x_high + 2")
expr(0x41bd, "object_y_low + 3")
expr(0x41c0, "object_y_low + 2")
expr(0x41c5, "object_y_high + 2")
expr(0x41ca, "object_direction + 2")
expr(0x41cf, "object_spriteid + 2")
expr(0x41dc, "object_x_low + 2")
expr(0x41e6, "object_y_low + 2")
expr(0x41eb, "object_spriteid + 2")
expr(0x41f8, "object_spriteid + 2")
expr(0x4210, "object_spriteid + 2")
expr(0x421e, "object_spriteid + 2")
expr(0x429c, "object_spriteid_old + 2")
expr(0x42a2, "object_spriteid_old + 2")
expr(0x4317, "object_spriteid_old + 2")
expr(0x4336, "object_spriteid + 2")
expr(0x435f, "object_x_low + 2")
expr(0x4366, "object_x_high + 2")
expr(0x4399, "object_spriteid + 2")
expr(0x43e8, "object_x_low + 2")
expr(0x43ee, "object_x_high + 2")
expr(0x43f4, "object_y_low + 2")
expr(0x43fa, "object_y_high + 2")
expr(0x4460, "object_spriteid + 2")
expr(0x4472, "object_x_low + 2")
expr(0x4478, "object_x_high + 2")
expr(0x447e, "object_y_low + 2")
expr(0x4484, "object_y_high + 2")
expr(0x448a, "object_direction + 2")
expr(0x448f, "object_spriteid + 2")
expr(0x449b, "object_spriteid + 2")

# TODO: uncomment once sprite_dict has been populated
#expr(0x3b0a, sprite_dict)
#expr(0x3dc1, sprite_dict)
#expr(0x3def, sprite_dict)
#expr(0x3ecb, sprite_dict)
#expr(0x413b, sprite_dict)
#expr(0x41cd, sprite_dict)
#expr(0x41e9, sprite_dict)
#expr(0x41f6, sprite_dict)
#expr(0x4209, sprite_dict)
#expr(0x420e, sprite_dict)
#expr(0x4247, sprite_dict)
#expr(0x429a, sprite_dict)
#expr(0x4334, sprite_dict)
#expr(0x445e, sprite_dict)
#expr(0x448d, sprite_dict)
#expr(0x4499, sprite_dict)



result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
