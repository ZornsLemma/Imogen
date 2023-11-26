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

#expr(0x3bca, sprite_dict)
#expr(0x3c64, sprite_dict)
#expr(0x3c7b, sprite_dict)
#expr(0x3cfb, sprite_dict)
#expr(0x3d0d, sprite_dict)
#expr(0x3d6d, sprite_dict)
#expr(0x3e7c, sprite_dict)
#expr(0x4377, sprite_dict)
#expr(0x3b08, sprite_dict)
#expr(0x3b12, sprite_dict)
#expr(0x3ec9, sprite_dict)
#expr(0x425d, sprite_dict)


result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
