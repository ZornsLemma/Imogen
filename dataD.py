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

load(0x3ad5, "orig/dataD.dat", "6502", "a6c16ebadab661f0361c36737da2526c")

common_to_all()
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x3ee6): {
        "l0070": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

comment(0x3af3, "check for level change (branch if not)")
label(0x3b1c, "return1")
comment(0x3c0a, "check for first update in room (branch if not)")
comment(0x3c0f, "check for level change (branch if not)")
label(0x3c4e, "return2")
expr(0x3c5b, "objectid_old_player")
label(0x3c72, "return3")
comment(0x3c73, "check for first update in room (branch if not)")
label(0x3d7d, "return4")
label(0x3e2c, "room_1_check_right_exit")
expr(0x3e2f, "exit_room_right")
label(0x3edc, "room_2_check_right_exit")
expr(0x3edf, "exit_room_right")
comment(0x3f00, "check for first update in room (branch if not)")
ldx_ldy_jsr_define_envelope(0x3f09, "envelope1")
comment(0x3f0c, "check for level change (branch if not)")
expr(0x3f80, "objectid_player_accessory")
label(0x3fd5, "return5")
ldx_ldy_jsr_play_sound_yx(0x3fdf, "sound1")
ldx_ldy_jsr_play_sound_yx(0x3fe6, "sound2")
ldx_ldy_jsr_play_sound_yx(0x3ff0, "sound3")
ldx_ldy_jsr_play_sound_yx(0x3ff7, "sound4")
comment(0x40d0, "check for first update in room (branch if not)")
ldx_ldy_jsr_define_envelope(0x40e6, "envelope2")
comment(0x40e9, "check for level change (branch if not)")
label(0x4125, "return6")
expr(0x4132, "objectid_old_player")
label(0x415b, "return7")
comment(0x41ac, "check for first update in room (branch if not)")
comment(0x41b1, "check for level change (branch if not)")
label(0x4366, "return8")

label(0x3bfc, "room_0_update_handler")
label(0x3ee9, "room_2_update_handler")
label(0x40c2, "room_3_update_handler")

# TODO: replace "+ n" with "+ objectid_*" once objects have been named
expr(0x3c70, "object_spriteid + 3")
expr(0x3cc8, "object_spriteid + 5")
expr(0x3fd3, "object_spriteid + 4")
expr(0x4142, "object_spriteid + 3")
expr(0x4316, "object_spriteid + 5")
expr(0x431c, "object_x_low + 5")
expr(0x4322, "object_y_low + 5")

# TODO: uncomment once sprite_dict has been populated
#expr(0x3b0e, sprite_dict)
#expr(0x3b18, sprite_dict)
#expr(0x3c16, sprite_dict)
#expr(0x3c40, sprite_dict)
#expr(0x3c45, sprite_dict)
#expr(0x3c69, sprite_dict)
#expr(0x3c6e, sprite_dict)
#expr(0x3c9b, sprite_dict)
#expr(0x3cb7, sprite_dict)
#expr(0x3cbc, sprite_dict)
#expr(0x3cc6, sprite_dict)
#expr(0x3caa, sprite_dict)
#expr(0x3dfa, sprite_dict)
#expr(0x3eb7, sprite_dict)
#expr(0x3f27, sprite_dict)
#expr(0x3f32, sprite_dict)
#expr(0x3f77, sprite_dict)
#expr(0x409f, sprite_dict)
#expr(0x40d6, sprite_dict)
#expr(0x4117, sprite_dict)
#expr(0x411c, sprite_dict)
#expr(0x413b, sprite_dict)
#expr(0x4140, sprite_dict)
#expr(0x41fe, sprite_dict)


result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
