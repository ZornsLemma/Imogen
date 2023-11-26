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

load(0x3ad5, "orig/dataH.dat", "6502", "3d927ff3b282f49da420b7573be7935b")

common_to_all()
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3df8,0x3e30): {
        "l0070": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

comment(0x3af3, "check for level change (branch if not)")
comment(0x3bc1, "check for first update in room (branch if so)")
comment(0x3bc9, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x3bd3, "envelope1")
expr(0x3c4a, "objectid_player")
ldx_ldy_jsr_play_sound_yx(0x3ce5, "sound1")
label(0x3d49, "return1")
label(0x3e08, "room_1_check_left_exit")
expr(0x3e0b, "exit_room_left")
label(0x3e15, "room_1_check_right_exit")
expr(0x3e18, "exit_room_right")
comment(0x3ed4, "check for first update in room (branch if not)")
comment(0x3ed9, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x3efd, "envelope2")
ldx_ldy_jsr_play_sound_yx(0x3fb8, "sound2")
ldx_ldy_jsr_play_sound_yx(0x3fbf, "sound3")
ldx_ldy_jsr_play_sound_yx(0x3fc6, "sound4")
label(0x4008, "return2")
comment(0x40d6, "check for first update in room (branch if so)")
comment(0x40de, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x40e8, "envelope3")
expr(0x41dc, make_lo("sound1"))
expr(0x41de, make_hi("sound1"))
ldx_ldy_jsr_play_sound_yx(0x41fe, "sound5")
label(0x420d, "return3")
comment(0x4253, "check for first update in room (branch if so)")
label(0x43b4, "return4")
label(0x441c, "return5")

#expr(0x3b80, sprite_dict)
#expr(0x3b87, sprite_dict)
#expr(0x3c17, sprite_dict)
#expr(0x3c27, sprite_dict)
#expr(0x3df1, sprite_dict)
#expr(0x408d, sprite_dict)
#expr(0x4425, sprite_dict)
#expr(0x4430, sprite_dict)
#expr(0x4440, sprite_dict)
#expr(0x4453, sprite_dict)

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
