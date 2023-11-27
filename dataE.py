from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
#    0xc8: "spriteid_mouse",
    0xd1: "spriteid_duck_toolbar",
    0xd2: "spriteid_egg_toolbar",
    0xd3: "spriteid_egg_mask_toolbar", # TODO: "mask" is a guess
    0xdb: "spriteid_large_egg_upright",
    0xdc: "spriteid_large_egg_tilted",
    0xdd: "spriteid_large_egg_sideways",
    0xf8: "spriteid_something", # TODO: just added to make room_1_data_table expr() happy for now
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Room 1
constant(3, "objectid_egg")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataE.dat", "6502", "1fd692ce17c1ae2c858ed57730c9c081")

label(0x0a13, "save_game_level_e_holding_egg_flag") # TODO: other uses? not checked yet
label(0x0a14, "save_game_level_e_something_room_1")
label(0x0a15, "save_game_level_e_duck_captured_flag") # TODO: might be used for other things too, not checked yet

label(0xa76, "room_1_data_table_index")
label(0xa77, "room_1_egg_x")
label(0xa78, "room_1_egg_y")

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

label(0x3ce0, "room_2_update_handler")
label(0x3e96, "room_3_update_handler")
label(0x40cf, "room_0_update_handler")
label(0x446a, "room_1_update_handler")

entry(0x44bc, "room_1_not_first_update")
entry(0x449f, "room_1_not_this_room1")
entry(0x4493, "room_1_axy_set")
comment(0x4484, "set flags based on A", inline=True)
entry(0x44b9, "room_1_not_this_room2")
label(0x38af, "envelope_1_pitch_change_per_step_section_2") # TODO?
comment(0x444c, "TODO: seems to be three bytes per entry. First byte is a sprite ID. Second and third bytes of each entry appear to be added to a77 and a78 respectively. This seems to control sprite and probably X/Y poss of object 3 - the egg? But the sprite IDs only work if I assume each entry is four bytes, so I've got something wrong here. They don't even work then - I'm clearly halfway there, but this is not right.")
for i in range(8): # TODO GUESS LIMIT
    addr = 0x444c + i*4
    uint(addr, 3)
    expr(addr+1, sprite_dict)
label(0x444c, "room_1_data_table")
entry(0x4501, "room_1_not_this_room3")

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
expr(0x44b4, "object_x_high + objectid_egg")
expr(0x44b7, "object_y_high + objectid_egg")
expr(0x455e, "object_spriteid + objectid_egg")
expr(0x4564, "object_x_low + objectid_egg")
expr(0x456a, "object_y_low + objectid_egg")

# TODO: uncomment once sprite_dict has been populated
#expr(0x3d56, sprite_dict)
#expr(0x40e6, sprite_dict)
#expr(0x4167, sprite_dict)
#expr(0x420d, sprite_dict)
#expr(0x4318, sprite_dict)

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
