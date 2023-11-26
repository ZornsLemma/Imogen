from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
#    0xc8: "spriteid_mouse",
    0xd1: "spriteid_duck_toolbar",
    0xd2: "spriteid_egg_toolbar",
    0xd3: "spriteid_egg_mask_toolbar", # TODO: "mask" is a guess
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Room 0
#constant(2, "objectid_left_mouse")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataE.dat", "6502", "1fd692ce17c1ae2c858ed57730c9c081")

label(0x0a13, "save_game_level_e_holding_egg_flag") # TODO: other uses? not checked yet
label(0x0a15, "save_game_level_e_duck_captured_flag") # TODO: might be used for other things too, not checked yet

common_to_all()
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x4449): {
        "l0070": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

label(0x3cd3, "room_2_check_right_exit")
expr(0x3cd6, "exit_room_right")
label(0x443f, "room_1_check_right_exit")
expr(0x4442, "exit_room_right")

expr(0x3b07, "spriteid_duck_toolbar")
entry(0x3b0b, "developer_mode_not_active")
expr(0x3b11, "spriteid_egg_mask_toolbar")
entry(0x3b15, "dont_have_egg")
expr(0x3b1d, "spriteid_duck_toolbar")
entry(0x3b21, "duck_not_captured_yet")

label(0x3eb8, "some_table")
expr(0x3b22, make_lo("some_table"))
expr(0x3b27, make_hi("some_table"))
label(0x460c, "source_sprite_data")
expr(0x3b2c, make_lo("source_sprite_data"))
expr(0x3b30, make_hi("source_sprite_data"))

comment(0x3cee, "check for first update in room (branch if not)")
comment(0x3cfa, "check for level change (branch if not)")
expr(0x3d48, "objectid_old_player")
label(0x3df6, "return1")
comment(0x40dd, "check for first update in room (branch if so)")
ldx_ldy_jsr_define_envelope(0x40f6, "envelope1")
comment(0x40f9, "check for level change (branch if not)")
expr(0x41f3, "objectid_old_player")
label(0x4230, "return2")
label(0x431c, "return3")
ldx_ldy_jsr_play_sound_yx(0x4385, "sound1")
label(0x4388, "return4")
comment(0x446a, "check for first update in room (branch if not)")
comment(0x446f, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x44a9, "envelope2")
ldx_ldy_jsr_play_sound_yx(0x4524, "sound2")
ldx_ldy_jsr_play_sound_yx(0x452b, "sound3")
label(0x45a0, "return5")

# TODO: replace "+ n" with "+ objectid_*" once objects have been named
expr(0x3d27, "object_y_low + 4")
expr(0x3d2a, "object_y_low + 5")
expr(0x3d2f, "object_y_high + 4")
expr(0x3d32, "object_y_high + 5")
expr(0x3d58, "object_spriteid + 4")
expr(0x3d5b, "object_spriteid + 5")
expr(0x3db8, "object_spriteid + 4")
expr(0x3dc1, "object_spriteid + 5")
expr(0x3dd7, "object_x_high + 4")
expr(0x3ddb, "object_x_high + 4")
expr(0x3ddf, "object_x_high + 4")
expr(0x3de2, "object_x_low + 4")
expr(0x3de5, "object_x_low + 5")
expr(0x3de8, "object_x_high + 4")
expr(0x3deb, "object_x_high + 5")
expr(0x3df1, "object_direction + 4")
expr(0x3df4, "object_direction + 5")
expr(0x414a, "object_spriteid + 2")
expr(0x4169, "object_spriteid_old + 2")
expr(0x4179, "object_spriteid_old + 2")
expr(0x41d2, "object_spriteid + 2")
expr(0x41f0, "object_spriteid_old + 2")
expr(0x420f, "object_spriteid + 2")
expr(0x428b, "object_spriteid + 2")
expr(0x42c4, "object_x_low + 2")
expr(0x42ca, "object_x_high + 2")
expr(0x42d0, "object_y_low + 2")
expr(0x431a, "object_spriteid + 2")
expr(0x4321, "object_x_low + 2")
expr(0x4327, "object_x_high + 2")
expr(0x432d, "object_y_low + 2")
expr(0x4332, "object_y_high + 2")
expr(0x4338, "object_direction + 2")
expr(0x434f, "object_y_low + 2")
expr(0x4352, "object_y_low_old + 2")
expr(0x435a, "object_x_low + 2")
expr(0x435e, "object_x_low_old + 2")
expr(0x4363, "object_x_high + 2")
expr(0x4366, "object_x_high_old + 2")
expr(0x44b4, "object_x_high + 3")
expr(0x44b7, "object_y_high + 3")
expr(0x455e, "object_spriteid + 3")
expr(0x4564, "object_x_low + 3")
expr(0x456a, "object_y_low + 3")

# TODO: uncomment once sprite_dict has been populated
#expr(0x40e6, sprite_dict)
#expr(0x420d, sprite_dict)
#expr(0x4318, sprite_dict)
#expr(0x3d56, sprite_dict)
#expr(0x4167, sprite_dict)

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
