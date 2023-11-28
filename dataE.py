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
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Room 1
constant(2, "objectid_something_maybe_small_thrown_egg") # TODO: guessing
constant(3, "objectid_egg")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataE.dat", "6502", "1fd692ce17c1ae2c858ed57730c9c081")

label(0x0a13, "save_game_level_e_holding_egg_flag") # TODO: other uses? not checked yet
label(0x0a14, "save_game_level_e_room_1_egg_state") # TODO: other uses? not checked yet? egg state slightly speculative but prob right
label(0x0a15, "save_game_level_e_duck_captured_flag") # TODO: might be used for other things too, not checked yet

label(0xa76, "egg_animation_index")
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
entry(0x44cb, "not_end_of_egg_animation_sequence")

expr(0x3b07, "spriteid_duck_toolbar")
entry(0x3b0b, "developer_mode_not_active")
expr(0x3b11, "spriteid_egg_mask_toolbar")
entry(0x3b15, "dont_have_egg")
expr(0x3b1d, "spriteid_duck_toolbar")
entry(0x3b21, "duck_not_captured_yet")

label(0x3eb8, "update_bird")
expr(0x3b24, "jmp_for_update_extra_player_character + 1")
expr(0x3b29, "jmp_for_update_extra_player_character + 2")
expr(0x3b22, make_lo("update_bird"))
expr(0x3b27, make_hi("update_bird"))
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
comment(0x444c, "Table of animations for the egg. There are three bytes per entry. First byte is a sprite ID. Second and third bytes of each entry are signed (X,Y) position offsets, added to a77 and a78 respectively. This seems to control sprite and probably X/Y poss of object 3, the egg. Each animation is terminated with an extra zero byte.")
blank(0x444d)
blank(0x4451)
blank(0x4455)
blank(0x4462)
blank(0x4466)

# TODO: Ideally this table would be formatted something like this, but the formatting of py8dis is limited atm.
#egg_animations_table
#    !byte 0
#    !byte spriteid_large_egg_upright ,   0, 0
#    !byte 0                                                ; terminator
#
#    !byte spriteid_large_egg_tilted  ,   0, 0
#    !byte 0                                                ; terminator
#
#    !byte spriteid_large_egg_tilted  ,  -8, 0
#    !byte spriteid_large_egg_sideways,  -8, 8
#    !byte spriteid_large_egg_sideways,  -4, 4
#    !byte spriteid_large_egg_sideways,  -4, 4
#    !byte 0                                                ; terminator
#
#    !byte spriteid_large_egg_sideways,   0, 8
#    !byte 0                                                ; terminator
#
#    !byte spriteid_large_egg_sideways,   0, 0
#    !byte 0                                                ; terminator


comment(0x4450, "terminator", inline=True)
comment(0x4454, "terminator", inline=True)
comment(0x4461, "terminator", inline=True)
comment(0x4465, "terminator", inline=True)
comment(0x4469, "terminator", inline=True)
expr(0x444d, sprite_dict)
for i in range(0x444d, 0x4469):
    byte(i)
expr(0x4451, sprite_dict)
expr(0x4455, sprite_dict)
expr(0x4458, sprite_dict)
expr(0x445b, sprite_dict)
expr(0x445e, sprite_dict)
expr(0x4462, sprite_dict)
expr(0x4466, sprite_dict)
#for i in range(8): # TODO GUESS LIMIT
#    addr = 0x444c + i*4
#    uint(addr, 3)
#    expr(addr+1, sprite_dict) # TODO: 0 should probably be left as 0 not treated as a sprite ID - see code at 44c3
label(0x444c, "egg_animations_table")
entry(0x4501, "room_1_not_this_room3")
label(0x444c+5, "egg_animation_subseq2")
label(0x444c+9, "egg_animation_subseq1")
label(0x444c+0x16, "egg_animation_subseq3")
expr(0x4507, make_subtract("egg_animation_subseq1", "egg_animations_table"))
expr(0x44d8, make_subtract("egg_animation_subseq2", "egg_animations_table"))
expr(0x452f, make_subtract("egg_animation_subseq3", "egg_animations_table"))
entry(0x4538, "new_egg_animation_index_in_y")

comment(0x45a1, "Returns with some flag in Z; if Z is set, Y contains a new egg animation index")
entry(0x45a1, "something_to_do_with_egg_animation")
comment(0x45ad, "TODO: Why not lda object_spriteid+2? And similarly for following lda abs,x")
expr(0x45ae, "objectid_something_maybe_small_thrown_egg")
entry(0x45d2, "restore_a_and_return")
label(0x45d6, "saved_a")

entry(0x3eb8)

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
