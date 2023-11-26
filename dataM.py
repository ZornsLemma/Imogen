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

load(0x3ad5, "orig/dataM.dat", "6502", "cf3544a265bf698b8aaca937fed83e14")

common_to_all()
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x3c73): {
        "l0070": "room_exit_direction",
    },
    (0x41a9, 0x41c3): {
        "l0070": "room_exit_direction",
    }
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

comment(0x3af3, "check for level change (branch if not)")
label(0x3c69, "room_1_check_right_exit")
expr(0x3c6c, "exit_room_right")
comment(0x3cb5, "check for first update in room (branch if not)")
comment(0x3cba, "check for level change (branch if not)")
label(0x3de5, "return1")
comment(0x3de6, "check for first update in room (branch if so)")
comment(0x3dee, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x3e06, "envelope1")
ldx_ldy_jsr_define_envelope(0x3e0d, "envelope2")
ldx_ldy_jsr_define_envelope(0x3e14, "envelope3")
ldx_ldy_jsr_define_envelope(0x3e1b, "envelope4")
ldx_ldy_jsr_play_sound_yx(0x3fc5, "sound1")
ldx_ldy_jsr_play_sound_yx(0x3fcc, "sound2")
ldx_ldy_jsr_play_sound_yx(0x3fde, "sound3")
ldx_ldy_jsr_play_sound_yx(0x3fe5, "sound4")
label(0x4017, "return2")
comment(0x402e, "check for first update in room (branch if not)")
comment(0x4033, "check for level change (branch if not)")
comment(0x411c, "check for first update in room (branch if so)")
label(0x412d, "return3")
label(0x41b9, "room_2_check_right_exit")
expr(0x41bc, "exit_room_right")
label(0x41dd, "return4")
comment(0x41f8, "check for first update in room (branch if so)")
comment(0x420d, "check for level change (branch if not)")
expr(0x42fa, "objectid_old_player")
label(0x4370, "return5")
label(0x447f, "return6")


#expr(0x3bbe, sprite_dict)
#expr(0x3bc4, sprite_dict)
#expr(0x3bd5, sprite_dict)
#expr(0x3bdb, sprite_dict)
#expr(0x3e23, sprite_dict)
#expr(0x3e35, sprite_dict)
#expr(0x3e4d, sprite_dict)
#expr(0x3e79, sprite_dict)
#expr(0x41a2, sprite_dict)
#expr(0x4503, sprite_dict)
#expr(0x4201, sprite_dict)
#expr(0x3b04, sprite_dict)
#expr(0x430f, sprite_dict)


result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
