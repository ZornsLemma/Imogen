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

#expr(0x3b7b, sprite_dict)
#expr(0x3fa7, sprite_dict)
#expr(0x4005, sprite_dict)
#expr(0x3b08, sprite_dict)
#expr(0x40a6, sprite_dict)


result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
