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

load(0x3ad5, "orig/dataL.dat", "6502", "f2ec5b3bb96256773cc71668572493b7")

common_to_all()
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
label(0x3c90, "room_1_check_right_exit")
expr(0x3c93, "exit_room_right")
comment(0x3cbb, "check for first update in room (branch if so)")
comment(0x3cc3, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x3cf3, "envelope1")
ldx_ldy_jsr_play_sound_yx(0x3e03, "sound1")
label(0x3e59, "return1")
comment(0x3e5f, "check for first update in room (branch if not)")
comment(0x3e64, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x3e78, "envelope2")
expr(0x3ebb, "objectid_old_player")
comment(0x3f03, "check for first update in room (branch if so)")
ldx_ldy_jsr_play_sound_yx(0x3f10, "sound2")
ldx_ldy_jsr_play_sound_yx(0x3f17, "sound3")
label(0x3f1a, "return2")
label(0x3f8b, "room_2_check_right_exit")
expr(0x3f8e, "exit_room_right")
comment(0x3fd7, "check for first update in room (branch if not)")
comment(0x3fdc, "check for level change (branch if not)")
expr(0x40c6, "objectid_player_accessory")
label(0x413e, "return3")
comment(0x41ed, "check for first update in room (branch if not)")
comment(0x41f7, "check for level change (branch if not)")
label(0x434f, "return4")
comment(0x4361, "check for first update in room (branch if not)")
comment(0x4366, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x4384, "envelope3")
ldx_ldy_jsr_define_envelope(0x438b, "envelope4")
ldx_ldy_jsr_define_envelope(0x4392, "envelope5")
comment(0x43cc, "check for first update in room (branch if so)")
label(0x43d7, "return5")
ldx_ldy_jsr_play_sound_yx(0x43de, "sound4")
ldx_ldy_jsr_play_sound_yx(0x43e5, "sound5")
ldx_ldy_jsr_play_sound_yx(0x43ec, "sound6")
ldx_ldy_jsr_play_sound_yx(0x43f3, "sound7")

label(0x3bdf, "room_0_update_handler")
label(0x41d8, "room_3_update_handler")

# TODO: replace "+ n" with "+ objectid_*" once objects have been named
expr(0x3d31, "object_spriteid + 4")
expr(0x3d57, "object_spriteid + 5")
expr(0x3d61, "object_spriteid + 6")
expr(0x3dfd, "object_spriteid_old + 4")
expr(0x3e13, "object_spriteid + 3")
expr(0x3e19, "object_y_low + 5")
expr(0x3e1c, "object_y_low + 6")
expr(0x3e28, "object_y_low + 4")
expr(0x3ea0, "object_direction + 2")
expr(0x3ed0, "object_spriteid + 2")
expr(0x3eaa, "object_spriteid + 2")
expr(0x400c, "object_y_low + 2")
expr(0x400f, "object_y_low + 3")
expr(0x4117, "object_spriteid + 2")
expr(0x411e, "object_x_low + 2")
expr(0x4121, "object_x_low + 3")
expr(0x4127, "object_x_high + 2")
expr(0x412a, "object_x_high + 3")
expr(0x413c, "object_spriteid + 3")
expr(0x430c, "object_spriteid + 2")
expr(0x4317, "object_direction + 2")
expr(0x431d, "object_x_low + 2")
expr(0x4323, "object_y_low + 2")
expr(0x432c, "object_spriteid + 2")
expr(0x4341, "object_x_low + 2")
expr(0x4344, "object_x_low + 2")
expr(0x434a, "object_y_low + 2")
expr(0x434d, "object_y_low + 2")

ground_fill(0x3b16)

# TODO: uncomment once sprite_dict has been populated
#expr(0x3b08, sprite_dict)
#expr(0x3b12, sprite_dict)
#expr(0x3bca, sprite_dict)
#expr(0x3c64, sprite_dict)
#expr(0x3c7b, sprite_dict)
#expr(0x3cfb, sprite_dict)
#expr(0x3d0d, sprite_dict)
#expr(0x3d2f, sprite_dict)
#expr(0x3d55, sprite_dict)
#expr(0x3d5f, sprite_dict)
#expr(0x3d6d, sprite_dict)
#expr(0x3dfb, sprite_dict)
#expr(0x3e7c, sprite_dict)
#expr(0x3ea8, sprite_dict)
#expr(0x3ec9, sprite_dict)
#expr(0x3ece, sprite_dict)
#expr(0x425d, sprite_dict)
#expr(0x430a, sprite_dict)
#expr(0x4377, sprite_dict)


result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
