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

load(0x3ad5, "orig/dataO.dat", "6502", "ddadc2eb1bfb98e14b769a9851db5513")

common_to_all()
define_level(4)
label(0x0070, "room_exit_direction")

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
#    (0x3bd4,0x3df9): {
#        "l0070": "room_exit_direction",
#    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

comment(0x3af4, "check for level change (branch if not)")
comment(0x3bdc, "check for first update in room (branch if not)")
comment(0x3be1, "check for level change (branch if not)")
label(0x3c91, "return1")
label(0x3d30, "room_1_check_right_exit")
expr(0x3d33, "exit_room_right")
comment(0x3d6f, "check for first update in room (branch if so)")
ldx_ldy_jsr_define_envelope(0x3d7b, "envelope1")
comment(0x3d98, "check for level change (branch if not)")
expr(0x3e9a, "objectid_old_player")
ldx_ldy_jsr_play_sound_yx(0x3f24, "sound1")
label(0x3f27, "return2")
label(0x4001, "return3")
comment(0x4035, "check for first update in room (branch if not)")
label(0x4082, "return4")
label(0x4108, "room_2_check_right_exit")
expr(0x410b, "exit_room_right")
comment(0x4123, "check for first update in room (branch if not)")
ldx_ldy_jsr_define_envelope(0x412c, "envelope2")
comment(0x413e, "check for level change (branch if not)")
expr(0x41a4, "objectid_old_player")
expr(0x41dc, "objectid_player_accessory")
expr(0x420a, "objectid_old_player_accessory")
ldx_ldy_jsr_play_sound_yx(0x4227, "sound2")
ldx_ldy_jsr_play_sound_yx(0x422e, "sound3")
label(0x42cc, "return5")
comment(0x434e, "check for first update in room (branch if not)")
ldx_ldy_jsr_define_envelope(0x4357, "envelope3")
comment(0x435a, "check for level change (branch if not)")
label(0x4461, "return6")
ldx_ldy_jsr_play_sound_yx(0x446b, "sound4")

#expr(0x3bb7, sprite_dict)
#expr(0x3d09, sprite_dict)
#expr(0x4056, sprite_dict)
#expr(0x3d7f, sprite_dict)
#expr(0x3d8c, sprite_dict)
#expr(0x3b23, sprite_dict)
#expr(0x41ad, sprite_dict)
#expr(0x3e2b, sprite_dict)
#expr(0x42af, sprite_dict)




result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
