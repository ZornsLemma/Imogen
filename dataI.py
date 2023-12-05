from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_stone",
    0xc9: "spriteid_cache1",
    0xca: "spriteid_stone_menu_item",
    0xcb: "spriteid_big_stone",
    0xcc: "spriteid_cache2",
    0xcd: "spriteid_cache3",
    0xce: "spriteid_seesaw",
    0xcf: "spriteid_cache4",
    0xd0: "spriteid_sword",
    0xd1: "spriteid_sword_menu_item",
    0xd2: "spriteid_sword_spin1",
    0xd3: "spriteid_sword_spin2",
    0xd4: "spriteid_sword_spin3",
    0xd5: "spriteid_sword_spin4",
    0xd6: "spriteid_left_hook",
    0xd7: "spriteid_right_hook",
    0xd8: "spriteid_horizontal_rope",
    0xd9: "spriteid_short_rope",
    0xda: "spriteid_long_rope_end1",
    0xdb: "spriteid_long_rope_end2",
    0xdc: "spriteid_rope_broken",
    0xdd: "spriteid_boulder",
    0xde: "spriteid_short_rope_end",
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

label(0x3970, "sound_priority_per_channel_table + 1")
comment(0x3af1, "check for level change (branch if not)")
expr(0x3b02, sprite_dict)
label(0x3b06, "developer_mode_inactive")
expr(0x3b0c, sprite_dict)
expr(0x3b16, sprite_dict)
ground_fill(0x3b31)
label(0x3bc5, "room_1_check_left_exit")
expr(0x3bc8, "exit_room_left")
label(0x3bd2, "room_1_check_right_exit")
expr(0x3bd5, "exit_room_right")
label(0x3bdf, "room_1_update_handler")
label(0x3c51, "trajectory_y_coordinates_table")
byte(0x3c51, 11)
decimal(0x3c51, 22)
byte(0x3c5c, 11)
label(0x3c67, "room_2_update_handler")
comment(0x3c79, "check for first update in room (branch if so)")
comment(0x3c81, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x3c9e, "envelope1")
ldx_ldy_jsr_define_envelope(0x3ca5, "envelope2")
expr(0x3cc0, sprite_dict)
expr(0x3cd3, sprite_dict)
expr(0x3cda, sprite_dict)
expr(0x3d06, sprite_dict)
expr(0x3d39, sprite_dict)
expr(0x3d48, sprite_dict)
expr(0x3d73, sprite_dict)
expr(0x3d93, "objectid_player_accessory")
ldx_ldy_jsr_play_sound_yx(0x3dec, "sound1")
expr(0x3e14, sprite_dict)
expr(0x3e19, sprite_dict)
expr(0x3e48, sprite_dict)
expr(0x3e4d, sprite_dict)
expr(0x3e7e, sprite_dict)
label(0x3ea8, "return1")
expr(0x3f49, sprite_dict)
comment(0x3fa4, "check for first update in room (branch if not)")
comment(0x3fa9, "check for level change (branch if not)")
expr(0x3fce, sprite_dict)
expr(0x3fe1, sprite_dict)
expr(0x4016, "objectid_old_player")
expr(0x402b, "objectid_old_player")
expr(0x4034, sprite_dict)
expr(0x4041, sprite_dict)
expr(0x40a0, sprite_dict)
label(0x40c1, "return2")
expr(0x4147, sprite_dict)
byte(0x4164, 2)
byte(0x4166, 2)
byte(0x4168, 2)
byte(0x416a, 2)
byte(0x416c, 2)
byte(0x416e, 2)
byte(0x4170, 2)
byte(0x4174, 2)
byte(0x4176, 2)
byte(0x4178, 2)
byte(0x417a, 2)
byte(0x417c, 2)
byte(0x417e, 2)
byte(0x4180, 2)
byte(0x4182, 2)
byte(0x4184, 2)
byte(0x4186, 2)
byte(0x4188, 2)
byte(0x418a, 2)
byte(0x418c, 2)
byte(0x418e, 2)
byte(0x4190, 2)
byte(0x4194, 2)
byte(0x4196, 2)
byte(0x4198, 2)
byte(0x419a, 2)
byte(0x419c, 2)
byte(0x419e, 2)
byte(0x41a0, 2)
comment(0x41a4, "check for first update in room (branch if not)")
expr(0x41af, sprite_dict)
comment(0x41b6, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x41d4, "envelope3")
expr(0x41d8, sprite_dict)
expr(0x41e2, sprite_dict)
expr(0x41e7, sprite_dict)
expr(0x41f9, sprite_dict)
expr(0x41fe, sprite_dict)
expr(0x41aa, sprite_dict)
ldx_ldy_jsr_play_sound_yx(0x4238, "sound2")
expr(0x425a, "objectid_old_player")
expr(0x4263, sprite_dict)
expr(0x42b1, sprite_dict)
expr(0x42c3, sprite_dict)
expr(0x42d3, sprite_dict)
label(0x42f9, "return3")
byte(0x430d, 2)
byte(0x430f, 2)
byte(0x4311, 2)
byte(0x4313, 2)
byte(0x4315, 2)
byte(0x4317, 2)
byte(0x4319, 2)
byte(0x431b, 2)
byte(0x431d, 2)
byte(0x431f, 2)
comment(0x4337, "check for first update in room (branch if so)")
expr(0x4340, sprite_dict)
expr(0x4345, sprite_dict)
comment(0x434c, "check for level change (branch if not)")
expr(0x4391, sprite_dict)
expr(0x4420, "objectid_old_player")
expr(0x4435, sprite_dict)
expr(0x443a, sprite_dict)
expr(0x444c, sprite_dict)
label(0x449c, "return4")
expr(0x45eb, sprite_dict)
label(0x45ef, "return5")
expr(0x45f1, sprite_dict)
expr(0x4613, sprite_dict)
ldx_ldy_jsr_play_sound_yx(0x4628, "sound3")
ldx_ldy_jsr_play_sound_yx(0x462f, "sound4")

# TODO: replace "+ n" with "+ objectid_*" once objects have been named
label(0x2ef4, "collectable_being_used_spriteids + 2")
label(0x38ae, "object_erase_type + 2")
label(0x38af, "object_erase_type + 3")
label(0x38b0, "object_erase_type + 4")
label(0x38b1, "object_erase_type + 5")
label(0x38b4, "object_erase_type + 8")
label(0x38c4, "object_z_order + 2")
label(0x38c6, "object_z_order + 4")
label(0x38c7, "object_z_order + 5")
label(0x38c8, "object_z_order + 6")
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


result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
