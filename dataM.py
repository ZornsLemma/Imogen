from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_left_hook",
    0xc9: "spriteid_right_hook",
    0xca: "spriteid_horizontal_rope",
    0xcb: "spriteid_long_rope",
    0xcc: "spriteid_short_rope",
    0xcd: "spriteid_frayed_rope_end",
    0xce: "spriteid_tall_block",
    0xcf: "spriteid_erase1",
    0xd0: "spriteid_hamster_legs_1",
    0xd1: "spriteid_hamster_legs_2",
    0xd2: "spriteid_hamster_legs_3",
    0xd3: "spriteid_hamster_legs_4",
    0xd4: "spriteid_erase2",
    0xd5: "spriteid_flying_hamster_jam",
    0xd6: "spriteid_hamster_jam",
    0xd7: "spriteid_hamster_looking_back",
    0xd8: "spriteid_tulip_bulb_menu_item",
    0xd9: "spriteid_tulip_bulb",
    0xda: "spriteid_erase3",
    0xdb: "spriteid_sign",
    0xdc: "spriteid_tulip_head",
    0xdd: "spriteid_tulip_stalk",
    0xde: "spriteid_tulip_flower3",
    0xdf: "spriteid_tulip_flower2",
    0xe0: "spriteid_tulip_flower1",
    0xe1: "spriteid_short_rope_to_block1",
    0xe2: "spriteid_short_rope_to_block2",
    0xe3: "spriteid_long_rope_to_block",
    0xe4: "spriteid_hamster_body",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Room 0
constant(2, "objectid_sparkles")
constant(3, "objectid_fire2")

# Room 1
constant(2, "objectid_rope_end")
constant(3, "objectid_block")
constant(4, "objectid_rope_to_block")
constant(5, "objectid_hamster_feet")
constant(6, "objectid_tulip_head")
constant(7, "objectid_hamster_body")

# Room 2
constant(6, "objectid_tulip_bulb")

# Room 3
constant(2, "objectid_fire1")
constant(3, "objectid_fire2")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataM.dat", "6502", "cf3544a265bf698b8aaca937fed83e14")

common_to_all('M')
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
label(0x3afe, "developer_mode_inactive")
expr(0x3b04, sprite_dict)
ground_fill(0x3b08)
expr(0x3bbe, sprite_dict)
expr(0x3bc4, sprite_dict)
expr(0x3bd5, sprite_dict)
expr(0x3bdb, sprite_dict)
label(0x3bf0, "room_0_update_handler")
label(0x3c69, "room_1_check_right_exit")
expr(0x3c6c, "exit_room_right")
comment(0x3cb5, "check for first update in room (branch if not)")
comment(0x3cba, "check for level change (branch if not)")
expr(0x3d01, "object_erase_type + objectid_hamster_feet")
expr(0x3db6, "object_x_low + objectid_hamster_feet")
expr(0x3db9, "object_x_low + objectid_hamster_body")
expr(0x3dbf, "object_y_low + objectid_hamster_feet")
expr(0x3dc2, "object_y_low + objectid_hamster_body")
expr(0x3dc8, "object_direction + objectid_hamster_feet")
expr(0x3dcb, "object_direction + objectid_hamster_body")
expr(0x3de0, "object_spriteid + objectid_hamster_feet")
expr(0x3de3, "object_spriteid + objectid_hamster_body")
label(0x3de5, "return1")
comment(0x3de6, "check for first update in room (branch if so)")
comment(0x3dee, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x3e06, "envelope1")
ldx_ldy_jsr_define_envelope(0x3e0d, "envelope2")
ldx_ldy_jsr_define_envelope(0x3e14, "envelope3")
ldx_ldy_jsr_define_envelope(0x3e1b, "envelope4")
expr(0x3e23, sprite_dict)
expr(0x3e35, sprite_dict)
expr(0x3e4d, sprite_dict)
expr(0x3e61, sprite_dict)
expr(0x3e63, "object_spriteid + objectid_rope_end")
expr(0x3e79, sprite_dict)
expr(0x3e9c, sprite_dict)
expr(0x3e9e, "object_spriteid + objectid_block")
expr(0x3ea1, sprite_dict)
expr(0x3ea3, "object_erase_type + objectid_block")
expr(0x3eb4, sprite_dict)
expr(0x3eb6, "object_spriteid + objectid_rope_to_block")
expr(0x3f2f, sprite_dict)
expr(0x3f31, "object_spriteid_old + objectid_rope_to_block")
expr(0x3f34, "object_spriteid + objectid_rope_to_block")
expr(0x3f37, sprite_dict)
expr(0x3f39, "object_spriteid_old + objectid_rope_end")
expr(0x3f65, sprite_dict)
expr(0x3f67, "object_spriteid_old + objectid_rope_to_block")
expr(0x3f6a, sprite_dict)
expr(0x3f6c, "object_spriteid + objectid_rope_to_block")
expr(0x3f6f, sprite_dict)
expr(0x3f71, "object_spriteid_old + objectid_rope_end")
ldx_ldy_jsr_play_sound_yx(0x3fc5, "sound1")
ldx_ldy_jsr_play_sound_yx(0x3fcc, "sound2")
ldx_ldy_jsr_play_sound_yx(0x3fde, "sound3")
ldx_ldy_jsr_play_sound_yx(0x3fe5, "sound4")
expr(0x3ff8, "object_y_low + objectid_rope_end")
expr(0x4012, "object_y_low + objectid_block")
expr(0x4015, "object_y_low + objectid_rope_to_block")
label(0x4017, "return2")
ldx_ldy_jsr_play_sound_yx(0x4020, "sound5")
comment(0x402e, "check for first update in room (branch if not)")
comment(0x4033, "check for level change (branch if not)")
expr(0x4084, "object_x_low + objectid_tulip_head")
expr(0x4089, "object_x_high + objectid_tulip_head")
expr(0x408c, "object_spriteid + objectid_tulip_head")
expr(0x4091, "object_direction + objectid_tulip_head")
expr(0x40a0, "object_erase_type + objectid_tulip_head")
expr(0x40b6, "object_y_low + objectid_tulip_head")
expr(0x40b9, sprite_dict)
expr(0x40bb, "object_spriteid + objectid_tulip_head")
expr(0x40be, sprite_dict)
expr(0x40c0, "object_spriteid_old + objectid_tulip_head")
expr(0x40ca, "object_spriteid + objectid_tulip_head")
expr(0x40cf, "object_y_low + objectid_tulip_head")
expr(0x40d2, "object_spriteid + objectid_tulip_head")
expr(0x40d5, "object_spriteid_old + objectid_tulip_head")
expr(0x40da, "object_y_low + objectid_tulip_head")
expr(0x40dd, "object_y_low_old + objectid_tulip_head")
expr(0x40e2, sprite_dict)
expr(0x40e4, "object_spriteid_old + objectid_tulip_head")
expr(0x40e7, "object_y_low + objectid_tulip_head")
expr(0x4108, "object_y_low + objectid_tulip_head")
comment(0x411c, "check for first update in room (branch if so)")
label(0x412d, "return3")
expr(0x41a2, sprite_dict)
label(0x41b9, "room_2_check_right_exit")
expr(0x41bc, "exit_room_right")
label(0x41dd, "return4")
label(0x41de, "room_2_update_handler")
comment(0x41f8, "check for first update in room (branch if so)")
expr(0x4201, sprite_dict)
comment(0x420d, "check for level change (branch if not)")
expr(0x426e, sprite_dict)
expr(0x4270, "object_spriteid_old + objectid_tulip_bulb")
expr(0x4280, "object_spriteid_old + objectid_tulip_bulb")
expr(0x42f7, "object_spriteid_old + objectid_tulip_bulb")
expr(0x42fa, "objectid_old_player")
expr(0x430f, sprite_dict)
expr(0x4314, sprite_dict)
expr(0x4316, "object_spriteid + objectid_tulip_bulb")
expr(0x4335, "object_x_low + objectid_tulip_bulb")
expr(0x4338, "object_x_low_old + objectid_tulip_bulb")
expr(0x4357, "object_y_low + objectid_tulip_bulb")
expr(0x435a, "object_y_low_old + objectid_tulip_bulb")
label(0x4370, "return5")
expr(0x4382, sprite_dict)
expr(0x4384, "object_spriteid + objectid_tulip_bulb")
expr(0x442e, "object_x_low + objectid_tulip_bulb")
expr(0x4434, "object_x_high + objectid_tulip_bulb")
expr(0x443a, "object_y_low + objectid_tulip_bulb")
expr(0x447b, sprite_dict)
expr(0x447d, "object_spriteid + objectid_tulip_bulb")
label(0x447f, "return6")
expr(0x4483, "object_erase_type + objectid_tulip_bulb")
expr(0x448e, "object_x_low + objectid_tulip_bulb")
expr(0x4494, "object_x_high + objectid_tulip_bulb")
expr(0x449a, "object_y_low + objectid_tulip_bulb")
expr(0x449d, sprite_dict)
expr(0x449f, "object_spriteid + objectid_tulip_bulb")
expr(0x44a5, "object_direction + objectid_tulip_bulb")
expr(0x4503, sprite_dict)
label(0x4539, "room_3_update_handler")
expr(0x3ea8, "object_z_order + objectid_block")
expr(0x3ebb, "object_z_order + objectid_rope_to_block")
expr(0x3d06, "object_z_order + objectid_hamster_feet")
expr(0x3cff, sprite_dict)
expr(0x40a5, "object_z_order + objectid_tulip_head")
expr(0x4481, sprite_dict)
expr(0x4488, "object_z_order + objectid_tulip_bulb")
expr(0x3d0b, "object_z_order + objectid_hamster_body")

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
