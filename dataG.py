from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_balloon",
    0xc9: "spriteid_rope_end1",
    0xca: "spriteid_bow",
    0xcb: "spriteid_bow_menu_item",
    0xcc: "spriteid_arrow",
    0xcd: "spriteid_cache1",
    0xce: "spriteid_table",
    0xcf: "spriteid_cache2",
    0xd0: "spriteid_rope_bottom",
    0xd1: "spriteid_rope_top",
    0xd2: "spriteid_blob",
    0xd3: "spriteid_bits",
    0xd4: "spriteid_baby",
    0xd5: "spriteid_baby_surprise",
    0xd6: "spriteid_baby_fall",
    0xd7: "spriteid_baby_dead",
    0xd8: "spriteid_wood_block",
    0xd9: "spriteid_baby_smile",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Room 0
#constant(2, "objectid_left_mouse")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataG.dat", "6502", "fa09abf27f4e659e91ca57c63c2f2034")

common_to_all()
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x432e): {
        "l0070": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

comment(0x3af2, "check for level change (branch if not)")
label(0x3b02, "developer_mode_inactive")
label(0x3b0c, "return1")
label(0x3ba0, "room_2_check_right_exit")
expr(0x3ba3, "exit_room_right")
comment(0x3bbb, "check for first update in room (branch if not)")
ldx_ldy_jsr_define_envelope(0x3bc4, "envelope1")
comment(0x3bc7, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x3be1, "envelope2")
ldx_ldy_jsr_play_sound_yx(0x3c23, "sound1")
ldx_ldy_jsr_play_sound_yx(0x3c2a, "sound2")
ldx_ldy_jsr_play_sound_yx(0x3c5b, "sound3")
ldx_ldy_jsr_play_sound_yx(0x3c62, "sound4")
label(0x3d00, "return2")
comment(0x3db7, "check for first update in room (branch if not)")
comment(0x3dbc, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x3ddf, "envelope3")
ldx_ldy_jsr_play_sound_yx(0x3e2b, "sound5")
expr(0x3e7d, make_lo("sound3"))
expr(0x3e7f, make_hi("sound3"))
expr(0x3e84, make_lo("sound4"))
expr(0x3e86, make_hi("sound4"))
comment(0x3ffc, "check for first update in room (branch if so)")
ldx_ldy_jsr_define_envelope(0x4015, "envelope4")
ldx_ldy_jsr_define_envelope(0x401c, "envelope5")
ldx_ldy_jsr_define_envelope(0x4023, "envelope6")
comment(0x4026, "check for level change (branch if not)")
label(0x405d, "return3")
expr(0x409d, "objectid_old_player")
expr(0x413b, "objectid_old_player")
ldx_ldy_jsr_play_sound_yx(0x4161, "sound6")
ldx_ldy_jsr_play_sound_yx(0x4168, "sound7")
label(0x4186, "return4")
label(0x4258, "return5")
ldx_ldy_jsr_play_sound_yx(0x42a0, "sound8")
label(0x42a3, "return6")
label(0x4324, "room_1_check_right_exit")
expr(0x4327, "exit_room_right")
comment(0x436c, "check for first update in room (branch if not)")
comment(0x4371, "check for level change (branch if not)")
label(0x44f3, "return7")

label(0x3bad, "room_2_update_handler")
label(0x3da9, "room_3_update_handler")
label(0x3fd7, "room_0_update_handler")
label(0x4331, "room_1_update_handler")

# TODO: replace "+ n" with "+ objectid_*" once objects have been named
expr(0x41e2, "object_x_low + 2")
expr(0x41e8, "object_x_low + 2")
expr(0x41f6, "object_x_low + 2")
expr(0x41fc, "object_x_low + 2")
expr(0x4207, "object_x_low + 2")
expr(0x425d, "object_x_low + 2")
expr(0x3dea, "object_x_low + 5")
expr(0x41eb, "object_x_high + 2")
expr(0x41f0, "object_x_high + 2")
expr(0x41ff, "object_x_high + 2")
expr(0x4204, "object_x_high + 2")
expr(0x420d, "object_x_high + 2")
expr(0x4263, "object_x_high + 2")
expr(0x4213, "object_y_low + 2")
expr(0x4269, "object_y_low + 2")
expr(0x3eda, "object_y_low + 5")
expr(0x3ee3, "object_y_low + 5")
expr(0x3ef0, "object_y_low + 5")
expr(0x403e, "object_y_high + 2")
expr(0x426e, "object_y_high + 2")
expr(0x3e31, "object_spriteid + 2")
expr(0x405b, "object_spriteid + 2")
expr(0x40ad, "object_spriteid + 2")
expr(0x4157, "object_spriteid + 2")
expr(0x4174, "object_spriteid + 2")
expr(0x419f, "object_spriteid + 2")
expr(0x4256, "object_spriteid + 2")
expr(0x4279, "object_spriteid + 2")
expr(0x3c9c, "object_spriteid + 3")
expr(0x3cab, "object_spriteid + 3")
expr(0x3cbb, "object_spriteid + 3")
expr(0x3cc8, "object_spriteid + 3")
expr(0x3ca1, "object_spriteid + 4")
expr(0x3cb0, "object_spriteid + 4")
expr(0x3cc0, "object_spriteid + 4")
expr(0x3ccd, "object_spriteid + 4")
expr(0x3bf6, "object_spriteid + 5")
expr(0x3ec2, "object_spriteid + 5")
expr(0x4089, "object_spriteid_old + 2")
expr(0x40bb, "object_spriteid_old + 2")
expr(0x4138, "object_spriteid_old + 2")
expr(0x4274, "object_direction + 2")
label(0x38ae, "object_erase_type+2")
label(0x38b0, "object_erase_type+4")
label(0x38b1, "object_erase_type+5")
label(0x38c4, "object_z_order+2")
label(0x38c5, "object_z_order+3")
label(0x38c6, "object_z_order+4")
label(0x38c7, "object_z_order+5")

expr(0x3b08, sprite_dict)
expr(0x3b7b, sprite_dict)
expr(0x3bf4, sprite_dict)
expr(0x3c9a, sprite_dict)
expr(0x3c9f, sprite_dict)
expr(0x3ca9, sprite_dict)
expr(0x3cae, sprite_dict)
expr(0x3cb9, sprite_dict)
expr(0x3cbe, sprite_dict)
expr(0x3cc6, sprite_dict)
expr(0x3ccb, sprite_dict)
expr(0x3e2f, sprite_dict)
expr(0x3fa7, sprite_dict)
expr(0x4005, sprite_dict)
expr(0x4059, sprite_dict)
expr(0x4087, sprite_dict)
expr(0x40a6, sprite_dict)
expr(0x40ab, sprite_dict)
expr(0x4172, sprite_dict)
expr(0x419d, sprite_dict)
expr(0x4254, sprite_dict)
expr(0x4277, sprite_dict)


result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
