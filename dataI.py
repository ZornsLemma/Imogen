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

load(0x3ad5, "orig/dataI.dat", "6502", "1e1fababdd0af0374b4e238b4aa21c77")

common_to_all()
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x3bdc): {
        "l0070": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

comment(0x3af1, "check for level change (branch if not)")
label(0x3bc5, "room_1_check_left_exit")
expr(0x3bc8, "exit_room_left")
label(0x3bd2, "room_1_check_right_exit")
expr(0x3bd5, "exit_room_right")
comment(0x3c79, "check for first update in room (branch if so)")
comment(0x3c81, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x3c9e, "envelope1")
ldx_ldy_jsr_define_envelope(0x3ca5, "envelope2")
expr(0x3d93, "objectid_player_accessory")
ldx_ldy_jsr_play_sound_yx(0x3dec, "sound1")
label(0x3ea8, "return1")
comment(0x3fa4, "check for first update in room (branch if not)")
comment(0x3fa9, "check for level change (branch if not)")
expr(0x4016, "objectid_old_player")
expr(0x402b, "objectid_old_player")
label(0x40c1, "return2")
comment(0x41a4, "check for first update in room (branch if not)")
comment(0x41b6, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x41d4, "envelope3")
ldx_ldy_jsr_play_sound_yx(0x4238, "sound2")
expr(0x425a, "objectid_old_player")
label(0x42f9, "return3")
comment(0x4337, "check for first update in room (branch if so)")
comment(0x434c, "check for level change (branch if not)")
expr(0x4420, "objectid_old_player")
label(0x449c, "return4")
label(0x45ef, "return5")
ldx_ldy_jsr_play_sound_yx(0x4628, "sound3")

#expr(0x3cd3, sprite_dict)
#expr(0x3cda, sprite_dict)
#expr(0x3d06, sprite_dict)
#expr(0x3f49, sprite_dict)
#expr(0x4147, sprite_dict)
#expr(0x41aa, sprite_dict)
#expr(0x4340, sprite_dict)
#expr(0x3b02, sprite_dict)
#expr(0x3b0c, sprite_dict)
#expr(0x3b16, sprite_dict)
#expr(0x4034, sprite_dict)
#expr(0x4263, sprite_dict)
#expr(0x4435, sprite_dict)
#expr(0x3d73, sprite_dict)

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
