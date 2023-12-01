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
    0xd2: "spriteid_rope_top_broken",
    0xd3: "spriteid_burst_balloon",
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

common_to_all('G')
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
    (0x44ad,0x44e9): {
        "l0070": "temp_player_x",
    },
}

constant(2, "objectid_bow")
constant(2, "objectid_arrow")
constant(3, "objectid_balloon1")
constant(4, "objectid_balloon1_rope")
constant(5, "objectid_balloon2")
constant(6, "objectid_balloon2_rope")
constant(5, "objectid_table")
constant(6, "objectid_table_rope")
# Room 3
constant(5, "objectid_baby")

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

# Copied from g, where it's a 'local' substituted variable
label(0x0078, "object_left_cell_x")
label(0x0079, "object_right_cell_x")

label(0x0a17, "save_game_level_g_got_bow")
label(0x0a18, "save_game_level_g_dropped_table_progress")
label(0x0a19, "save_game_level_g_baby_progress")

label(0x0a6f, "arrow_direction")
label(0x0a70, "arrow_x_position_low")
label(0x0a71, "arrow_x_position_high")
label(0x0a72, "arrow_y_position_low")
label(0x0a73, "arrow_room")
label(0x0a74, "arrow_active_flag")
label(0x0a75, "room_1_left_hand_balloon_y_position")
label(0x0a76, "room_1_right_hand_balloon_y_position")
label(0x0a77, "room_3_balloon_y_position")
label(0x0a78, "room_0_balloon_y_position")
label(0x0a79, "room_3_baby_progress")
label(0x0a7a, "room_3_baby_y_position")

label(0x38b0, "object_erase_type + objectid_balloon1_rope")
label(0x38c6, "object_z_order + objectid_balloon1_rope")
label(0x3970, "sound_priority_per_channel_table+1")
comment(0x3af2, "check for level change (branch if not)")
label(0x3b02, "developer_mode_inactive")
expr(0x3b08, sprite_dict)
label(0x3b0c, "return1")
expr(0x3b7b, sprite_dict)
label(0x3ba0, "room_2_check_right_exit")
expr(0x3ba3, "exit_room_right")
label(0x3bad, "room_2_update_handler")
comment(0x3bbb, "check for first update in room (branch if not)")
ldx_ldy_jsr_define_envelope(0x3bc4, "envelope1")
comment(0x3bc7, "check for level change (branch if not)")
label(0x3bd7, "initialise_if_room_2")
comment(0x3bdd, "initialise room 2")
ldx_ldy_jsr_define_envelope(0x3be1, "envelope2")
expr(0x3be5, sprite_dict)
expr(0x3bf4, sprite_dict)
expr(0x3bf6, "object_spriteid + objectid_table")
ldx_ldy_jsr_play_sound_yx(0x3c23, "sound1")
ldx_ldy_jsr_play_sound_yx(0x3c2a, "sound2")
ldx_ldy_jsr_play_sound_yx(0x3c5b, "sound3")
ldx_ldy_jsr_play_sound_yx(0x3c62, "sound4")
expr(0x3c9a, sprite_dict)
expr(0x3c9c, "object_spriteid + objectid_balloon1")
expr(0x3c9f, sprite_dict)
expr(0x3ca1, "object_spriteid + objectid_balloon1_rope")
label(0x3ca8, "burst_the_balloon")
expr(0x3ca9, sprite_dict)
expr(0x3cab, "object_spriteid + objectid_balloon1")
expr(0x3cae, sprite_dict)
expr(0x3cb0, "object_spriteid + objectid_balloon1_rope")
label(0x3cb7, "end_of_balloon")
expr(0x3cb9, sprite_dict)
expr(0x3cbb, "object_spriteid + objectid_balloon1")
expr(0x3cbe, sprite_dict)
expr(0x3cc0, "object_spriteid + objectid_balloon1_rope")
label(0x3cc5, "end_of_table_falling")
expr(0x3cc6, sprite_dict)
expr(0x3cc8, "object_spriteid + objectid_balloon1")
expr(0x3ccb, sprite_dict)
expr(0x3ccd, "object_spriteid + objectid_balloon1_rope")
label(0x3cd1, "update_table_and_rope_objects")
expr(0x3cd4, "objectid_table")
expr(0x3cd9, "objectid_balloon1_rope")
label(0x3d00, "return2")
label(0x3d8b, "baby_spriteids")
spriteid(0x3d8c)
spriteid(0x3d8f)
spriteid(0x3d91)
spriteid(0x3d93)
spriteid(0x3d95)
spriteid(0x3d97)
spriteid(0x3d99)
spriteid(0x3d9b)
spriteid(0x3d9d)
spriteid(0x3da0)
spriteid(0x3da3)
spriteid(0x3da6)
label(0x3da9, "room_3_update_handler")
comment(0x3db7, "check for first update in room (branch if not)")
comment(0x3dbc, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x3ddf, "envelope3")
expr(0x3de3, sprite_dict)
ldx_ldy_jsr_play_sound_yx(0x3e2b, "sound5")
expr(0x3e2f, sprite_dict)
expr(0x3e7d, make_lo("sound3"))
expr(0x3e7f, make_hi("sound3"))
expr(0x3e84, make_lo("sound4"))
expr(0x3e86, make_hi("sound4"))
expr(0x3fa7, sprite_dict)
label(0x3fd7, "room_0_update_handler")
comment(0x3ffc, "check for first update in room (branch if so)")
expr(0x4005, sprite_dict)
expr(0x400a, sprite_dict)
ldx_ldy_jsr_define_envelope(0x4015, "envelope4")
ldx_ldy_jsr_define_envelope(0x401c, "envelope5")
ldx_ldy_jsr_define_envelope(0x4023, "envelope6")
comment(0x4026, "check for level change (branch if not)")
expr(0x4037, sprite_dict)
expr(0x4059, sprite_dict)
label(0x405d, "return3")
expr(0x4087, sprite_dict)
expr(0x409d, "objectid_old_player")
expr(0x40a6, sprite_dict)
expr(0x40ab, sprite_dict)
expr(0x40c3, sprite_dict)
expr(0x413b, "objectid_old_player")
ldx_ldy_jsr_play_sound_yx(0x4161, "sound6")
ldx_ldy_jsr_play_sound_yx(0x4168, "sound7")
expr(0x4172, sprite_dict)
label(0x4186, "return4")
expr(0x419d, sprite_dict)
expr(0x419f, "object_spriteid + objectid_arrow")
expr(0x4254, sprite_dict)
label(0x4258, "return5")
expr(0x4277, sprite_dict)
expr(0x4279, "object_spriteid + objectid_arrow")
ldx_ldy_jsr_play_sound_yx(0x42a0, "sound8")
label(0x42a3, "return6")
label(0x4324, "room_1_check_right_exit")
expr(0x4327, "exit_room_right")
label(0x4331, "room_1_update_handler")
comment(0x436c, "check for first update in room (branch if not)")
comment(0x4371, "check for level change (branch if not)")
label(0x44f3, "return7")

# TODO: replace "+ n" with "+ objectid_*" once objects have been named
label(0x38ae, "object_erase_type + 2")
label(0x38b1, "object_erase_type + 5")
label(0x38c4, "object_z_order + 2")
label(0x38c5, "object_z_order + 3")
label(0x38c7, "object_z_order + objectid_baby")
expr(0x3dea, "object_x_low + 5")
expr(0x3e31, "object_spriteid + 2")
expr(0x3ec2, "object_spriteid + objectid_baby")
expr(0x3eda, "object_y_low + objectid_baby")
expr(0x3ee3, "object_y_low + objectid_baby")
expr(0x3ef0, "object_y_low + objectid_baby")
expr(0x403e, "object_y_high + 2")
expr(0x405b, "object_spriteid + 2")
expr(0x4089, "object_spriteid_old + 2")
expr(0x40ad, "object_spriteid + 2")
expr(0x40bb, "object_spriteid_old + 2")
expr(0x4138, "object_spriteid_old + 2")
expr(0x4157, "object_spriteid + 2")
expr(0x4174, "object_spriteid + 2")
expr(0x41e2, "object_x_low + 2")
expr(0x41e8, "object_x_low + 2")
expr(0x41eb, "object_x_high + 2")
expr(0x41f0, "object_x_high + 2")
expr(0x41f6, "object_x_low + 2")
expr(0x41fc, "object_x_low + 2")
expr(0x41ff, "object_x_high + 2")
expr(0x4204, "object_x_high + 2")
expr(0x4207, "object_x_low + 2")
expr(0x420d, "object_x_high + 2")
expr(0x4213, "object_y_low + 2")
expr(0x4256, "object_spriteid + 2")
expr(0x425d, "object_x_low + 2")
expr(0x4263, "object_x_high + 2")
expr(0x4269, "object_y_low + 2")
expr(0x426e, "object_y_high + 2")
expr(0x4274, "object_direction + 2")

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
