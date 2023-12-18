from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_ring",
    0xc9: "spriteid_ring_menu_item",
    0xca: "spriteid_erase1",
    0xcb: "spriteid_left_hook",
    0xcc: "spriteid_rght_hook",
    0xcd: "spriteid_horizontal_rope",
    0xce: "spriteid_rope",
    0xcf: "spriteid_hook",
    0xd0: "spriteid_hook_with_ring",
    0xd1: "spriteid_short_rope",
    0xd2: "spriteid_boulder",
    0xd3: "spriteid_horizontal_bar",
    0xd4: "spriteid_left_bar",
    0xd5: "spriteid_right_bar",
    0xd6: "spriteid_rope_with_magnet",
    0xd7: "spriteid_short_bar",
    0xd8: "spriteid_sealion_body",
    0xd9: "spriteid_sealion_head1",
    0xda: "spriteid_sealion_head2a",
    0xdb: "spriteid_sealion_head2b",
    0xdc: "spriteid_table",
    0xdd: "spriteid_cane",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Multiple rooms
constant(2, "objectid_ring")

# Room 0
constant(3, "objectid_magnet")
constant(4, "objectid_short_bar")
constant(5, "objectid_sealion_head")

# Room 1
constant(3, "objectid_hook1")
constant(6, "objectid_hook3")

# Room 2
constant(4, "objectid_short_rope1")
constant(5, "objectid_hook2")
constant(6, "objectid_short_rope2")
constant(7, "objectid_cane")

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
    (0x412d, 0x4134): {
        "l0070": "remember_a",
    }
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

label(0x0078, "object_left_cell_x")
label(0x0079, "object_right_cell_x")

label(0x0a62, "save_game_level_p_ring_animation")
label(0x0a63, "save_game_level_p_ring_animation_step")
label(0x0a64, "save_game_level_p_ring_x_low")
label(0x0a65, "save_game_level_p_ring_x_high")
label(0x0a66, "save_game_level_p_ring_direction_without_bounces")
label(0x0a67, "save_game_level_p_ring_direction_with_bounces")
label(0x0a68, "save_game_level_p_ring_room")
label(0x0a69, "save_game_level_p_ring_y_low")
label(0x0a6a, "save_game_level_p_ring_y_high")
label(0x0a6a, "save_game_level_p_left_hook_y")          #$18 to $78
label(0x0a6a, "save_game_level_p_left_hook_speed")      #4, $fc, or 0
label(0x0a6d, "save_game_level_p_magnet_x")
label(0x0a6e, "save_game_level_p_magnet_direction")

label(0x0a71, "ring_y_position")

comment(0x3af4, "check for level change (branch if not)")
label(0x3b04, "developer_mode_inactive")
expr(0x3b0a, sprite_dict)
ground_fill(0x3b0e)
label(0x3b2a, "draw_rock_in_top_corner_cells")
label(0x3bb6, "room_1_check_right_exit")
expr(0x3bb9, "exit_room_right")
label(0x3bc3, "room_1_update_handler")
comment(0x3bd7, "check for first update in room (branch if not)")
expr(0x3c1a, sprite_dict)
expr(0x3c1c, "object_spriteid + objectid_cane")
expr(0x3c21, "object_z_order + objectid_cane")
expr(0x3c54, sprite_dict)
expr(0x3c56, "object_spriteid + objectid_ring")
comment(0x3c63, "unused code")
entry(0x3c63)
expr(0x3c6b, sprite_dict)
expr(0x3c6d, "object_spriteid + objectid_ring")
expr(0x3c8d, sprite_dict)
expr(0x3c8f, "object_spriteid + objectid_hook2")
expr(0x3c99, sprite_dict)
expr(0x3c9b, "object_spriteid + objectid_hook2")
expr(0x3c9e, sprite_dict)
expr(0x3ca0, "object_spriteid + objectid_hook3")
expr(0x3cac, "object_spriteid + objectid_hook3")
label(0x3cae, "return1")
expr(0x3caa, sprite_dict)
label(0x3d27, "room_2_check_right_exit")
expr(0x3d2a, "exit_room_right")
comment(0x3d34, "check for first update in room (branch if so)")
comment(0x3d3c, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x3d46, "envelope1")
ldx_ldy_jsr_define_envelope(0x3d4d, "envelope2")
expr(0x3d89, "object_z_order + objectid_short_rope1")
expr(0x3d9a, "object_z_order + objectid_short_rope2")
expr(0x3da1, sprite_dict)
expr(0x3db8, sprite_dict)
expr(0x3de2, sprite_dict)
expr(0x3e1e, sprite_dict)
expr(0x3e20, "object_spriteid + objectid_ring")
expr(0x3e3e, sprite_dict)
expr(0x3e40, "object_spriteid + objectid_ring")
expr(0x3ea5, sprite_dict)
label(0x3ea9, "return2")
ldx_ldy_jsr_play_sound_yx(0x3ed9, "sound1")
expr(0x3edd, sprite_dict)
expr(0x3edf, "object_spriteid_old + objectid_short_rope1")
expr(0x3ee2, "object_spriteid + objectid_short_rope1")
expr(0x3eea, sprite_dict)
expr(0x3eec, "object_spriteid + objectid_short_rope1")
expr(0x3eef, sprite_dict)
expr(0x3ef1, "object_spriteid_old + objectid_short_rope2")
expr(0x3ef4, "object_spriteid + objectid_short_rope2")
expr(0x3efc, sprite_dict)
expr(0x3efe, "object_spriteid + objectid_short_rope2")
expr(0x3f0d, "object_y_low + objectid_hook1")
expr(0x3f10, "object_y_low + objectid_short_rope1")
expr(0x3f18, sprite_dict)
expr(0x3f1a, "object_spriteid + objectid_hook1")
expr(0x3f24, sprite_dict)
expr(0x3f26, "object_spriteid + objectid_hook1")
expr(0x3f2f, "object_y_low + objectid_hook2")
expr(0x3f32, "object_y_low + objectid_short_rope2")
expr(0x3f3a, sprite_dict)
expr(0x3f3c, "object_spriteid + objectid_hook2")
expr(0x3f46, sprite_dict)
expr(0x3f48, "object_spriteid + objectid_hook2")
label(0x3f4a, "return3")
label(0x3fae, "return4")
ldx_ldy_jsr_play_sound_yx(0x3fb5, "sound2")
expr(0x401f, sprite_dict)
expr(0x4027, sprite_dict)
label(0x404a, "room_3_update_handler")
comment(0x40e2, "check for first update in room (branch if not)")
comment(0x40e7, "check for level change (branch if not)")
expr(0x40fd, sprite_dict)
expr(0x4146, sprite_dict)
expr(0x4148, "object_spriteid + objectid_sealion_head")
expr(0x4152, sprite_dict)
expr(0x4154, "object_spriteid + objectid_sealion_head")
comment(0x4164, "check for first update in room (branch if so)")
expr(0x4170, sprite_dict)
expr(0x4172, "object_spriteid + objectid_sealion_head")
expr(0x4175, sprite_dict)
expr(0x4177, "object_spriteid + objectid_ring")
expr(0x417c, "object_x_low + objectid_ring")
expr(0x4182, "object_y_low + objectid_ring")
expr(0x4187, "object_z_order + objectid_ring")
expr(0x419d, sprite_dict)
expr(0x419f, "object_spriteid + objectid_ring")
label(0x41a4, "return5")
comment(0x41a5, "check for first update in room (branch if not)")
expr(0x41d9, sprite_dict)
expr(0x41ea, sprite_dict)
expr(0x41ef, sprite_dict)
expr(0x41f1, "object_spriteid + objectid_magnet")
expr(0x41f6, "object_z_order + objectid_short_bar")
comment(0x41aa, "check for level change (branch if not)")
expr(0x4201, "objectid_player")
expr(0x4234, sprite_dict)
expr(0x4236, "object_spriteid_old + objectid_short_bar")
expr(0x4239, sprite_dict)
expr(0x423b, "object_spriteid + objectid_short_bar")
expr(0x4258, make_lo("sound1"))
expr(0x425a, make_hi("sound1"))
expr(0x4279, "sound_priority_per_channel_table+1")
expr(0x42bc, "objectid_old_player")
expr(0x42c5, sprite_dict)
expr(0x42c7, "object_spriteid + objectid_ring")
expr(0x42cf, sprite_dict)
expr(0x42e9, sprite_dict)
expr(0x42eb, "object_spriteid + objectid_ring")
expr(0x42f0, "object_z_order + objectid_ring")
label(0x42f2, "return6")
byte(0x42f3)
label(0x42f3, "ring_animations")
byte(0x42f4)
byte(0x42f5, 2)
label(0x42f5, "ring_animation1")
byte(0x42f7, 2)
byte(0x42f9, 2)
byte(0x42fb, 2)
byte(0x42fd, 2)
byte(0x42ff, 2)
byte(0x4301, 2)
byte(0x4303, 2)
byte(0x4305, 2)
byte(0x4307)
byte(0x4308, 2)
label(0x4308, "ring_animation2")
byte(0x430a, 2)
byte(0x430c, 2)
byte(0x430e, 2)
byte(0x4310, 2)
byte(0x4312, 2)
byte(0x4315, 2)
label(0x4315, "ring_animation3")
byte(0x4318, 2)
label(0x4318, "ring_animation4")
byte(0x431b, 2)
label(0x431b, "ring_animation5")
byte(0x431d, 2)
byte(0x431f, 2)
byte(0x4321, 2)
comment(0x4324, "check for first update in room (branch if so)")
expr(0x432d, sprite_dict)
expr(0x4332, sprite_dict)
comment(0x4339, "check for level change (branch if not)")
expr(0x4372, "objectid_ring")
expr(0x437d, sprite_dict)
expr(0x437f, "object_spriteid_old + objectid_ring")
expr(0x438f, "object_spriteid_old + objectid_ring")
expr(0x43b0, sprite_dict)
expr(0x43f0, "objectid_ring")
expr(0x440b, "object_spriteid_old + objectid_ring")
expr(0x4428, sprite_dict)
expr(0x442d, sprite_dict)
expr(0x442f, "object_spriteid + objectid_ring")
expr(0x4444, sprite_dict)
expr(0x444e, "object_x_low + objectid_ring")
expr(0x4451, "object_x_low_old + objectid_ring")
expr(0x4476, "object_y_low + objectid_ring")
expr(0x4479, "object_y_low_old + objectid_ring")
label(0x448f, "return7")
expr(0x4563, "object_x_low + objectid_ring")
expr(0x4569, "object_x_high + objectid_ring")
expr(0x456f, "object_y_low + objectid_ring")
expr(0x4575, "object_y_high + objectid_ring")
expr(0x45b9, sprite_dict)
expr(0x45bb, "object_spriteid + objectid_ring")
label(0x45bd, "return8")
expr(0x45bf, sprite_dict)
expr(0x45c1, "object_erase_type + objectid_ring")
expr(0x45c6, "object_z_order + objectid_ring")
expr(0x45cc, "object_x_low + objectid_ring")
expr(0x45d2, "object_x_high + objectid_ring")
expr(0x45d8, "object_y_low + objectid_ring")
expr(0x45de, "object_y_high + objectid_ring")
expr(0x45e1, sprite_dict)
expr(0x45e3, "object_spriteid + objectid_ring")
expr(0x45e9, "object_direction + objectid_ring")


result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
