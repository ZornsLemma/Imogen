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

load(0x3ad5, "orig/dataP.dat", "6502", "74d7881579d26d3ec5aa7d12bb1cf39f")

common_to_all()
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
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

comment(0x3af4, "check for level change (branch if not)")
label(0x3bb6, "room_1_check_right_exit")
expr(0x3bb9, "exit_room_right")
comment(0x3bd7, "check for first update in room (branch if not)")
label(0x3cae, "return1")
label(0x3d27, "room_2_check_right_exit")
expr(0x3d2a, "exit_room_right")
comment(0x3d34, "check for first update in room (branch if so)")
comment(0x3d3c, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x3d46, "envelope1")
ldx_ldy_jsr_define_envelope(0x3d4d, "envelope2")
label(0x3ea9, "return2")
ldx_ldy_jsr_play_sound_yx(0x3ed9, "sound1")
label(0x3f4a, "return3")
label(0x3fae, "return4")
comment(0x40e2, "check for first update in room (branch if not)")
comment(0x40e7, "check for level change (branch if not)")
comment(0x4164, "check for first update in room (branch if so)")
label(0x41a4, "return5")
comment(0x41a5, "check for first update in room (branch if not)")
comment(0x41aa, "check for level change (branch if not)")
expr(0x4201, "objectid_player")
expr(0x4258, make_lo("sound1"))
expr(0x425a, make_hi("sound1"))
expr(0x42bc, "objectid_old_player")
label(0x42f2, "return6")
comment(0x4324, "check for first update in room (branch if so)")
comment(0x4339, "check for level change (branch if not)")
label(0x448f, "return7")
label(0x45bd, "return8")

#expr(0x3da1, sprite_dict)
#expr(0x3db8, sprite_dict)
#expr(0x3de2, sprite_dict)
#expr(0x401f, sprite_dict)
#expr(0x4027, sprite_dict)
#expr(0x40fd, sprite_dict)
#expr(0x41d9, sprite_dict)
#expr(0x41ea, sprite_dict)
#expr(0x432d, sprite_dict)
#expr(0x3b0a, sprite_dict)
#expr(0x3ea5, sprite_dict)
#expr(0x42cf, sprite_dict)
#expr(0x4428, sprite_dict)



result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
