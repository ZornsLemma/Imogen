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

load(0x3ad5, "orig/dataI.dat", "6502", "1e1fababdd0af0374b4e238b4aa21c77")

common_to_all('I')
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x3bdc): {
        "l0070": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

comment(0x3af1, "check for level change (branch if not)")
label(0x3b06, "developer_mode_inactive")
label(0x3bc5, "room_1_check_left_exit")
expr(0x3bc8, "exit_room_left")
label(0x3bd2, "room_1_check_right_exit")
expr(0x3bd5, "exit_room_right")
comment(0x3c79, "check for first update in room (branch if so)")
comment(0x3c81, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x3c9e, "envelope1")
ldx_ldy_jsr_define_envelope(0x3ca5, "envelope2")
expr(0x3d93, "objectid_player_accessory")
ldx_ldy_jsr_play_sound_yx(0x3dec, "sound1")
label(0x3ea8, "return1")
comment(0x3fa4, "check for first update in room (branch if not)")
comment(0x3fa9, "check for level change (branch if not)")
expr(0x4016, "objectid_old_player")
expr(0x402b, "objectid_old_player")
label(0x40c1, "return2")
comment(0x41a4, "check for first update in room (branch if not)")
comment(0x41b6, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x41d4, "envelope3")
ldx_ldy_jsr_play_sound_yx(0x4238, "sound2")
expr(0x425a, "objectid_old_player")
label(0x42f9, "return3")
comment(0x4337, "check for first update in room (branch if so)")
comment(0x434c, "check for level change (branch if not)")
expr(0x4420, "objectid_old_player")
label(0x449c, "return4")
label(0x45ef, "return5")
ldx_ldy_jsr_play_sound_yx(0x4628, "sound3")
ldx_ldy_jsr_play_sound_yx(0x462f, "sound4")

label(0x3bdf, "room_1_update_handler")
label(0x3c67, "room_2_update_handler")

# TODO: replace "+ n" with "+ objectid_*" once objects have been named
expr(0x3cc2, "object_spriteid + 3")
expr(0x3d3b, "object_spriteid + 6")
expr(0x3d4a, "object_spriteid + 5")
expr(0x3dc7, "object_spriteid + 4")
expr(0x3e0c, "object_direction + 3")
expr(0x3e16, "object_spriteid + 7")
expr(0x3e1b, "object_spriteid + 8")
expr(0x3e45, "object_y_low + 7")
expr(0x3e4a, "object_spriteid + 7")
expr(0x3e4f, "object_spriteid + 8")
expr(0x3e6d, "object_y_low + 6")
expr(0x3e73, "object_y_low + 5")
expr(0x3e76, "object_y_low + 6")
expr(0x3e79, "object_y_low_old + 6")
expr(0x3e80, "object_spriteid_old + 6")
expr(0x3e98, "object_x_low + 4")
expr(0x3e9e, "object_y_low + 4")
expr(0x3ea1, "object_direction + 4")
expr(0x3ea6, "object_x_low + 4")
expr(0x3fd0, "object_spriteid + 4")
expr(0x3fe3, "object_spriteid + 3")
expr(0x4043, "object_spriteid + 2")
expr(0x404e, "object_direction + 3")
expr(0x405c, "object_direction + 3")
expr(0x4072, "object_x_low + 4")
expr(0x407d, "object_y_low + 4")
expr(0x40a2, "object_spriteid + 2")
expr(0x40ae, "object_x_low + 2")
expr(0x40b5, "object_x_high + 2")
expr(0x40bf, "object_y_low + 2")
expr(0x41e4, "object_spriteid + 5")
expr(0x41fb, "object_spriteid + 3")
expr(0x4278, "object_direction + 3")
expr(0x4286, "object_direction + 3")
expr(0x429c, "object_x_low + 5")
expr(0x42a7, "object_y_low + 5")
expr(0x42b3, "object_spriteid + 4")
expr(0x42c5, "object_spriteid + 4")
expr(0x42ca, "object_direction + 4")
expr(0x42d5, "object_spriteid + 4")
expr(0x42da, "object_direction + 4")
expr(0x42e6, "object_x_low + 4")
expr(0x42ed, "object_x_high + 4")
expr(0x42f7, "object_y_low + 4")
expr(0x4393, "object_spriteid_old + 2")
expr(0x43a3, "object_spriteid_old + 2")
expr(0x441d, "object_spriteid_old + 2")
expr(0x443c, "object_spriteid + 2")
expr(0x445b, "object_x_low + 2")
expr(0x445e, "object_x_low_old + 2")
expr(0x4483, "object_y_low + 2")
expr(0x4486, "object_y_low_old + 2")
expr(0x4570, "object_x_low + 2")
expr(0x4576, "object_x_high + 2")
expr(0x457c, "object_y_low + 2")
expr(0x4582, "object_y_high + 2")
expr(0x45ed, "object_spriteid + 2")
expr(0x45fe, "object_x_low + 2")
expr(0x4604, "object_x_high + 2")
expr(0x460a, "object_y_low + 2")
expr(0x4610, "object_y_high + 2")
expr(0x4615, "object_spriteid + 2")
expr(0x461b, "object_direction + 2")

ground_fill(0x3b31)

# TODO: uncomment once sprite_dict has been populated
#expr(0x3b02, sprite_dict)
#expr(0x3b0c, sprite_dict)
#expr(0x3b16, sprite_dict)
#expr(0x3cc0, sprite_dict)
#expr(0x3cd3, sprite_dict)
#expr(0x3cda, sprite_dict)
#expr(0x3d06, sprite_dict)
#expr(0x3d39, sprite_dict)
#expr(0x3d48, sprite_dict)
#expr(0x3d73, sprite_dict)
#expr(0x3e14, sprite_dict)
#expr(0x3e19, sprite_dict)
#expr(0x3e48, sprite_dict)
#expr(0x3e4d, sprite_dict)
#expr(0x3e7e, sprite_dict)
#expr(0x3f49, sprite_dict)
#expr(0x3fce, sprite_dict)
#expr(0x3fe1, sprite_dict)
#expr(0x4034, sprite_dict)
#expr(0x4041, sprite_dict)
#expr(0x40a0, sprite_dict)
#expr(0x4147, sprite_dict)
#expr(0x41e2, sprite_dict)
#expr(0x41f9, sprite_dict)
#expr(0x41aa, sprite_dict)
#expr(0x4263, sprite_dict)
#expr(0x42b1, sprite_dict)
#expr(0x4340, sprite_dict)
#expr(0x4391, sprite_dict)
#expr(0x4435, sprite_dict)
#expr(0x443a, sprite_dict)
#expr(0x45eb, sprite_dict)
#expr(0x4613, sprite_dict)

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
