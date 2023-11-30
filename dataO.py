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

common_to_all('O')
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
label(0x3b0a, "developer_mode_inactive1")
comment(0x3bdc, "check for first update in room (branch if not)")
comment(0x3be1, "check for level change (branch if not)")
label(0x3c34, "developer_mode_inactive2")
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
label(0x41ca, "developer_mode_inactive3")
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
ldx_ldy_jsr_play_sound_yx(0x4472, "sound5")

label(0x3bcc, "room_0_update_handler")
label(0x3d61, "room_1_update_handler")
label(0x4115, "room_2_update_handler")

# TODO: replace "+ n" with "+ objectid_*" once objects have been named
expr(0x3c08, "object_x_low + 4")
expr(0x3c0d, "object_spriteid + 4")
expr(0x3c62, "object_y_low + 4")
expr(0x3dfb, "object_spriteid_old + 2")
expr(0x3e0b, "object_spriteid_old + 2")
expr(0x3e83, "object_spriteid_old + 2")
expr(0x3ebd, "object_spriteid + 2")
expr(0x3ee3, "object_x_low + 2")
expr(0x3ee6, "object_x_low_old + 2")
expr(0x3f08, "object_y_low + 2")
expr(0x3f0b, "object_y_low_old + 2")
expr(0x3fb0, "object_x_low + 2")
expr(0x3fb6, "object_x_high + 2")
expr(0x3fbc, "object_y_low + 2")
expr(0x3fff, "object_spriteid + 2")
expr(0x4010, "object_x_low + 2")
expr(0x4016, "object_x_high + 2")
expr(0x401c, "object_y_low + 2")
expr(0x4028, "object_spriteid + 2")
expr(0x402e, "object_direction + 2")
expr(0x4080, "object_spriteid + 4")
expr(0x417e, "object_spriteid + 4")
expr(0x41b4, "object_spriteid + 4")
expr(0x4236, "object_x_low + 2")
expr(0x423c, "object_x_high + 2")
expr(0x4261, "object_x_low + 2")
expr(0x4264, "object_x_low + 6")
expr(0x4267, "object_x_high + 2")
expr(0x426a, "object_x_high + 6")
expr(0x426d, "object_y_low + 2")
expr(0x4270, "object_y_low + 6")
expr(0x4273, "object_direction + 2")
expr(0x4276, "object_direction + 6")
expr(0x427f, "object_spriteid + 6")
expr(0x4284, "object_spriteid + 5")
expr(0x4291, "object_spriteid + 5")
expr(0x4297, "object_x_low + 5")
expr(0x429d, "object_x_high + 5")
expr(0x42a3, "object_y_low + 5")
expr(0x42a9, "object_direction + 5")
expr(0x42b3, "object_x_low + 5")
expr(0x42b9, "object_x_low + 5")
expr(0x42bc, "object_x_high + 5")
expr(0x42c1, "object_x_high + 5")
expr(0x42c4, "object_y_low + 5")
expr(0x42ca, "object_y_low + 5")
expr(0x43d5, "object_spriteid + 3")
expr(0x43de, "object_spriteid + 4")
expr(0x445f, "object_spriteid + 2")

ground_fill(0x3b27)

# TODO: uncomment once sprite_dict has been populated
#expr(0x3b23, sprite_dict)
#expr(0x3bb7, sprite_dict)
#expr(0x3c0b, sprite_dict)
#expr(0x3d09, sprite_dict)
#expr(0x3d7f, sprite_dict)
#expr(0x3d8c, sprite_dict)
#expr(0x3df9, sprite_dict)
#expr(0x3e2b, sprite_dict)
#expr(0x3ebb, sprite_dict)
#expr(0x3ffd, sprite_dict)
#expr(0x4056, sprite_dict)
#expr(0x417c, sprite_dict)
#expr(0x41ad, sprite_dict)
#expr(0x41b2, sprite_dict)
#expr(0x4282, sprite_dict)
#expr(0x42af, sprite_dict)
#expr(0x43dc, sprite_dict)
#expr(0x445d, sprite_dict)




result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
