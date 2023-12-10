from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_whip_menu_item",
    0xc9: "spriteid_erase_1",
    0xca: "spriteid_erase_2",
    0xcb: "spriteid_whip_1",
    0xcc: "spriteid_whip_2",
    0xcd: "spriteid_whip_3",
    0xce: "spriteid_whip_4",
    0xcf: "spriteid_whip_5",
    0xd0: "spriteid_whip_hook1",
    0xd1: "spriteid_whip_hook2",
    0xd2: "spriteid_dog",
    0xd3: "spriteid_dog_raised",
    0xd4: "spriteid_dog_cower1",
    0xd5: "spriteid_dog_cower2",
    0xd6: "spriteid_erase_3",
    0xd7: "spriteid_tail1",
    0xd8: "spriteid_tail2",
    0xd9: "spriteid_tail3",
    0xda: "spriteid_tail4",
    0xdb: "spriteid_tail5",
    0xdc: "spriteid_tail6",
    0xdd: "spriteid_frog_menu_item",
    0xde: "spriteid_frog",
    0xdf: "spriteid_frog_speaking",
    0xe0: "spriteid_speak_here_sign",
    0xe1: "spriteid_top_right_hook",
    0xe2: "spriteid_top_left_hook",
    0xe3: "spriteid_horizontal_short_rope",
    0xe4: "spriteid_vertical_rope",
    0xe5: "spriteid_vertical_rope_frayed_end",
    0xe6: "spriteid_partition",
    0xe7: "spriteid_partition_end",
    0xe8: "spriteid_baby1",
    0xe9: "spriteid_baby2",
    0xea: "spriteid_baby3",
    0xeb: "spriteid_arm1",
    0xec: "spriteid_arm2",
    0xed: "spriteid_arm3",
    0xee: "spriteid_arm4",
    0xef: "spriteid_frog_leap1",
    0xf0: "spriteid_frog_leap2",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Multiple rooms
constant(3, "objectid_fire1")
constant(4, "objectid_fire2")

# Room 0
constant(2, "objectid_sparkles")

# Room 1
constant(2, "objectid_whip")
constant(3, "objectid_baby_arms")
constant(4, "objectid_rope_frayed_end")
constant(5, "objectid_partition")
constant(6, "objectid_end_of_rope")

# Room 2
constant(2, "objectid_dog")
constant(3, "objectid_dog_tail")

# Room 3
constant(2, "objectid_frog")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataL.dat", "6502", "f2ec5b3bb96256773cc71668572493b7")

common_to_all('L')
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x3c98): {
        "l0070": "room_exit_direction",
    },
    (0x3f7d, 0x3f93): {
        "l0070": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

comment(0x3aef, "check for level change (branch if not)")
label(0x3b02, "developer_mode_inactive")
expr(0x3b08, sprite_dict)
expr(0x3b12, sprite_dict)
ground_fill(0x3b16)
label(0x3b32, "draw_top_and_bottom_rows_of_rock")
expr(0x3bca, sprite_dict)
label(0x3bdf, "room_0_update_handler")
expr(0x3be9, "objectid_fire1")
expr(0x3bef, "objectid_fire2")
expr(0x3bfa, "objectid_sparkles")
expr(0x3c64, sprite_dict)
expr(0x3c7b, sprite_dict)
label(0x3c90, "room_1_check_right_exit")
expr(0x3c93, "exit_room_right")
label(0x3c9b, "baby_arm_animations")
byte(0x3c9c, 2)
expr(0x3c9c, sprite_dict)
label(0x3c9c, "baby_arm_animation1")
byte(0x3c9f, 2)
expr(0x3c9f, sprite_dict)
label(0x3c9f, "baby_arm_animation2")
byte(0x3ca1, 2)
expr(0x3ca1, sprite_dict)
byte(0x3ca3, 2)
expr(0x3ca3, sprite_dict)
byte(0x3ca5, 2)
expr(0x3ca5, sprite_dict)
byte(0x3ca7, 2)
expr(0x3ca7, sprite_dict)
byte(0x3ca9, 2)
expr(0x3ca9, sprite_dict)
byte(0x3cab, 2)
expr(0x3cab, sprite_dict)
byte(0x3cad, 2)
expr(0x3cad, sprite_dict)
byte(0x3cb0, 2)
expr(0x3cb0, sprite_dict)
label(0x3cb0, "baby_arm_animation3")
byte(0x3cb2, 2)
expr(0x3cb2, sprite_dict)
byte(0x3cb4, 2)
expr(0x3cb4, sprite_dict)
byte(0x3cb6, 2)
expr(0x3cb6, sprite_dict)
byte(0x3cb8, 2)
expr(0x3cb8, sprite_dict)
comment(0x3cbb, "check for first update in room (branch if so)")
label(0x3cbb, "room_1_update_handler")
comment(0x3cc3, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x3cf3, "envelope1")
expr(0x3cfb, sprite_dict)
expr(0x3d0d, sprite_dict)
expr(0x3d2f, sprite_dict)
expr(0x3d31, "object_spriteid + objectid_rope_frayed_end")
expr(0x3d55, sprite_dict)
expr(0x3d57, "object_spriteid + objectid_partition")
expr(0x3d5f, sprite_dict)
expr(0x3d61, "object_spriteid + objectid_end_of_rope")
expr(0x3d6d, sprite_dict)
expr(0x3dfb, sprite_dict)
expr(0x3dfd, "object_spriteid_old + objectid_rope_frayed_end")
ldx_ldy_jsr_play_sound_yx(0x3e03, "sound1")
#expr(0x3e13, "object_spriteid + objectid_baby_arms")
expr(0x3e19, "object_y_low + objectid_partition")
expr(0x3e1c, "object_y_low + objectid_end_of_rope")
label(0x3e59, "return1")
spriteid(0x3e5a, 0x3e5f)
label(0x3e5a, "whip_animation")
comment(0x3e5f, "check for first update in room (branch if not)")
label(0x3e5f, "update_whip")
comment(0x3e64, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x3e78, "envelope2")
expr(0x3e7c, sprite_dict)
expr(0x3ea0, "object_direction + objectid_whip")
expr(0x3ea8, sprite_dict)
label(0x3eaf, "not_first_update_whip")
expr(0x3ebb, "objectid_old_player")
expr(0x3ec9, sprite_dict)
expr(0x3ece, sprite_dict)
expr(0x3ed0, "object_spriteid + objectid_whip")
expr(0x3eaa, "object_spriteid + objectid_whip")
comment(0x3f03, "check for first update in room (branch if so)")
ldx_ldy_jsr_play_sound_yx(0x3f10, "sound2")
ldx_ldy_jsr_play_sound_yx(0x3f17, "sound3")
label(0x3f1a, "return2")
label(0x3f8b, "room_2_check_right_exit")
expr(0x3f8e, "exit_room_right")
label(0x3f96, "dog_animations")
byte(0x3f97)
expr(0x3f97, sprite_dict)
label(0x3f97, "dog_animation_normal")
byte(0x3f98, 3)
expr(0x3f9b, sprite_dict)
label(0x3f9b, "dog_animation_cower_in_place")
byte(0x3f9c, 3)
byte(0x3f9f)
expr(0x3f9f, sprite_dict)
label(0x3f9f, "dog_animation_push")
byte(0x3fa2)
expr(0x3fa2, sprite_dict)
byte(0x3fa5)
expr(0x3fa5, sprite_dict)
byte(0x3fa8)
expr(0x3fa8, sprite_dict)
byte(0x3fab)
expr(0x3fab, sprite_dict)
byte(0x3fae)
expr(0x3fae, sprite_dict)
byte(0x3fb1)
expr(0x3fb1, sprite_dict)
byte(0x3fb4)
expr(0x3fb4, sprite_dict)
byte(0x3fb8)
expr(0x3fb8, sprite_dict)
label(0x3fb8, "dog_animation_back_up")
byte(0x3fbb)
expr(0x3fbb, sprite_dict)
byte(0x3fbe)
expr(0x3fbe, sprite_dict)
byte(0x3fc1)
expr(0x3fc1, sprite_dict)
byte(0x3fc4)
expr(0x3fc4, sprite_dict)
byte(0x3fc7)
expr(0x3fc7, sprite_dict)
byte(0x3fca)
expr(0x3fca, sprite_dict)
byte(0x3fcd)
expr(0x3fcd, sprite_dict)
spriteid(0x3fd1, 0x3fd7)
label(0x3fd1, "dog_tail_animation")
comment(0x3fd7, "check for first update in room (branch if not)")
label(0x3fd7, "room_2_update_handler")
comment(0x3fdc, "check for level change (branch if not)")
expr(0x400c, "object_y_low + objectid_dog")
expr(0x400f, "object_y_low + objectid_dog_tail")
expr(0x40c6, "objectid_player_accessory")
expr(0x4117, "object_spriteid + objectid_dog")
expr(0x411e, "object_x_low + objectid_dog")
expr(0x4121, "object_x_low + objectid_dog_tail")
expr(0x4127, "object_x_high + objectid_dog")
expr(0x412a, "object_x_high + objectid_dog_tail")
expr(0x413c, "object_spriteid + objectid_dog_tail")
label(0x413e, "return3")
byte(0x41a4)
label(0x41a4, "frog_animations")
expr(0x41a5, sprite_dict)
label(0x41a5, "frog_idle_animation")
byte(0x41a6, 2)
byte(0x41a8)
expr(0x41a9, sprite_dict)
label(0x41a9, "frog_speaking_animation")
expr(0x41ac, sprite_dict)
byte(0x41ad, 2)
expr(0x41af, sprite_dict)
byte(0x41b0, 2)
expr(0x41b2, sprite_dict)
byte(0x41b3, 2)
byte(0x41b5)
label(0x41b6, "frog_leap_animation")
label(0x41d8, "room_3_update_handler")
expr(0x41e2, "objectid_fire1")
expr(0x41e9, "objectid_fire2")
comment(0x41ed, "check for first update in room (branch if not)")
comment(0x41f7, "check for level change (branch if not)")
byte(0x41aa, 2)
expr(0x425d, sprite_dict)
expr(0x430a, sprite_dict)
expr(0x430c, "object_spriteid + objectid_frog")
expr(0x4317, "object_direction + objectid_frog")
expr(0x431d, "object_x_low + objectid_frog")
expr(0x4323, "object_y_low + objectid_frog")
expr(0x432c, "object_spriteid + objectid_frog")
expr(0x4341, "object_x_low + objectid_frog")
expr(0x4344, "object_x_low + objectid_frog")
expr(0x434a, "object_y_low + objectid_frog")
expr(0x434d, "object_y_low + objectid_frog")
label(0x434f, "return4")
spriteid(0x435c, 0x435c+5)
label(0x435c, "frog_animation")
comment(0x4361, "check for first update in room (branch if not)")
label(0x4361, "update_frog")
comment(0x4366, "check for level change (branch if not)")
expr(0x4377, sprite_dict)
ldx_ldy_jsr_define_envelope(0x4384, "envelope3")
ldx_ldy_jsr_define_envelope(0x438b, "envelope4")
ldx_ldy_jsr_define_envelope(0x4392, "envelope5")
comment(0x43cc, "check for first update in room (branch if so)")
label(0x43d7, "return5")
ldx_ldy_jsr_play_sound_yx(0x43de, "sound4")
ldx_ldy_jsr_play_sound_yx(0x43e5, "sound5")
ldx_ldy_jsr_play_sound_yx(0x43ec, "sound6")
ldx_ldy_jsr_play_sound_yx(0x43f3, "sound7")

for i in range(0x41b6, 0x41d5, 3):
    expr(i, sprite_dict)
    byte(i+1, 2)

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
