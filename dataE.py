from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_duck_1",
    0xc9: "spriteid_duck_2",
    0xca: "spriteid_duck_3",
    0xcc: "spriteid_duck_transform_1",
    0xcd: "spriteid_duck_transform_2",
    0xce: "spriteid_duck_wing_1",
    0xcf: "spriteid_duck_wing_2",
    0xd0: "spriteid_duck_wing_3",
    0xd1: "spriteid_duck_toolbar",
    0xd2: "spriteid_egg",
    0xd3: "spriteid_egg_toolbar",
    0xd4: "spriteid_nest",
    0xd6: "spriteid_cache1",
    0xd7: "spriteid_small_egg_right",
    0xd8: "spriteid_small_egg_down",
    0xd9: "spriteid_small_egg_left",
    0xda: "spriteid_small_egg_upright",
    0xdb: "spriteid_large_egg_upright",
    0xdc: "spriteid_large_egg_tilted",
    0xdd: "spriteid_large_egg_sideways",
    0xde: "spriteid_cache2",
    0xdf: "spriteid_cache3",
    0xfc: "spriteid_todo", # TODO: added to make small_egg_animation_table expr happy
    0xfe: "spriteid_todo2", # TODO: added to make small_egg_animation_table expr happy
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Room 1
constant(2, "objectid_small_egg")
constant(3, "objectid_egg")

# When the egg is off-screen, this counts up every update cycle it is not visible (capping at &80). When entering the room containing the egg, the game performs (up to) this number of egg animation updates without modifying the screen, giving the effect that the egg starts exactly where it has had time to reach if it was thrown off-screen.
label(0xa6f, "level_workspace_small_egg_offscreen_time")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataE.dat", "6502", "1fd692ce17c1ae2c858ed57730c9c081")

label(0x0a13, "save_game_level_e_small_egg_status") # TODO: other uses? not checked yet - can have values 0, 1 and &ff at least, b7 seems to be a key check - value also checked against &c at 4243 - judging from 427a, 1 means 'the egg has just collided with something' (it is also set to 1 on entering level for first time) - it is set to &ff when the egg is collected (at 4213), it is set to c at 41c3 when the egg throw starts, it is set to &32 at 4262 when the egg collides with floor or big egg after being thrown, though shortly after it is set to 1 at 427c - ok, the 427c set to 1 happens when it lands, this occurs quicker when thrown at wall because it has less time to fall, the delay is more obvious when throwing at the big egg - note also that the egg has a little bit of horizontal rebound (at least when hitting wall after knocking the big egg over) - I think this covers more or less everything
constant(1, "small_egg_status_on_ground")
constant(0xc, "small_egg_status_being_thrown")
constant(0x32, "small_egg_status_falling")
constant(0xff, "small_egg_status_collected") # probably only b7 set actually matters
label(0x0a14, "save_game_level_e_room_1_egg_state") # TODO: other uses? not checked yet? egg state slightly speculative but prob right
label(0x0a15, "save_game_level_e_duck_captured_flag") # TODO: might be used for other things too, not checked yet

label(0xa73, "thrown_egg_direction")
label(0xa74, "small_egg_animation_table_index")
label(0xa75, "room_containing_small_egg") # TODO: speculation
label(0xa76, "egg_animation_index")
label(0xa77, "room_1_egg_x")
label(0xa78, "room_1_egg_y")
label(0xa7b, "duck_wing_animation_index")

common_to_all('E')
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
    (0x40f9, 0x433a): { # TODO: these are in fact probably the same for the entire file and don't need this mechanism
        "l0a70": "thrown_egg_x_low",
        "l0a71": "thrown_egg_x_high",
        "l0a72": "thrown_egg_y_low",
    },
    (0x45a1, 0x45d5): {
        "l0070": "object_left_low",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

label(0x3cd3, "room_2_check_right_exit")
expr(0x3cd6, "exit_room_right")
label(0x443f, "room_1_check_right_exit")
expr(0x4442, "exit_room_right")
entry(0x448d, "egg_on_floor") # TODO: guess
entry(0x44cb, "not_end_of_egg_animation_sequence")

expr(0x3b02, "small_egg_status_collected")

expr(0x3b07, "spriteid_duck_toolbar")
entry(0x3b0b, "developer_mode_not_active")
expr(0x3b11, "spriteid_egg_toolbar")
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
comment(0x4099, "TODO: table with entries in groups of three bytes, probably similar to the table in the other level")
comment(0x40dd, "check for first update in room (branch if so)")
ldx_ldy_jsr_define_envelope(0x40f6, "envelope1")
comment(0x40f9, "check for level change (branch if not)")
comment(0x414c, "Update the egg position repeatedly (without updating the screen) to catch up on any missed animation between it being thrown off screen and now when we are going to see it again. Note that small_egg_animation_update will set the offscreen time to 0 if there is nothing else to do, so this loop doesn't do unnecessary work.")
entry(0x414c, "small_egg_animation_catch_up_loop")
expr(0x411e, "small_egg_status_on_ground")
entry(0x4192, "return2_local")
entry(0x4195, "have_small_egg")
expr(0x4196, "spriteid_egg_toolbar")
expr(0x415c, "objectid_small_egg")
expr(0x41c2, "small_egg_status_being_thrown")
expr(0x41d5, "objectid_small_egg")
entry(0x41dd, "small_egg_in_room") # TODO: true-ish I think but not 100% clear how this interacts with the code being for room0 yet we do a generic check against desired_room_index
expr(0x41f3, "objectid_old_player")
entry(0x4231, "small_egg_animation_update")
expr(0x4244, "small_egg_status_being_thrown")
entry(0x4251, "small_egg_thrown_left")
expr(0x4261, "small_egg_status_falling")
entry(0x426a, "small_egg_not_being_thrown")
expr(0x426b, "small_egg_status_falling")
expr(0x426f, "objectid_small_egg")
comment(0x4278, "branch if not collided with anything", inline=True)
expr(0x427b, "small_egg_status_on_ground")
entry(0x427f, "small_egg_not_falling")
ab(0x424f)
entry(0x4254, "small_egg_temp_left_right_offset_set")
label(0x4230, "return2")
comment(0x428d, "get the X offset from the animation table")
entry(0x429b, "egg_thrown_to_right")
comment(0x4296, "the egg has been thrown left, so negate the X offset from the animation table")
comment(0x429d, "set flags based on A", inline=True)
comment(0x429b, "Set X to the high byte of the X offset")
entry(0x42a2, "adding_positive_value_to_x")
comment(0x42a2, "Add 16-bit offset in XA to thrown_egg_x.")
comment(0x42b0, "Get the Y offset from the animation table and add it to thrown_egg_y_low. This is an 8-bit value so no need to mess around with high byte.")
expr(0x42d9, "small_egg_status_being_thrown")
label(0x431c, "return3")
entry(0x431d, "update_object_properties_for_small_egg")
ldx_ldy_jsr_play_sound_yx(0x4385, "sound1")
label(0x4388, "return4")
comment(0x446a, "check for first update in room (branch if not)")
comment(0x446f, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x44a9, "envelope2")
ldx_ldy_jsr_play_sound_yx(0x4524, "sound2")
ldx_ldy_jsr_play_sound_yx(0x452b, "sound3")
label(0x45a0, "return5")

entry(0x40e5, "room0_first_update")
entry(0x4166, "skip_small_egg_setup")
entry(0x416e, "room0_not_first_update")
expr(0x40eb, sprite_dict)
comment(0x4102, "branch if have collected egg", inline=True)
comment(0x413e, "branch if have collected egg", inline=True)
comment(0x4181, "branch if have collected egg", inline=True)
comment(0x418a, "The egg is off screen for this update, so increment the offscreen time (capping at &880 so its position can be correctly updated when it next appears on screen.")
expr(0x4212, "small_egg_status_collected")

label(0x3ce0, "room_2_update_handler")
entry(0x3d3a, "room_2_not_first_update")

label(0x3e96, "room_3_update_handler")
comment(0x40cf, "The small egg starts in room 0 but it can move between rooms, either by being carried by the player or by being thrown. Its position updating is always handled by room_0_update_handler wherever it is.")
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

comment(0x4099, "Table of animations for TODO: what?. There are three bytes per entry. First byte is a sprite ID. Second and third bytes of each entry are signed (X,Y) position offsets, added to a77 and a78 respectively. This seems to control sprite and probably X/Y poss of object TODO. Each animation is terminated with an extra zero byte.")
label(0x4099, "small_egg_animation_table")
label(0x4099+1, "small_egg_animation_table_subseq2") # TODO: 411d uses this offset, but shares it with holding_egg_flag - I wonder if this is a micro-optimisation and 1 vs 0 in holding_egg_flag are equivalent
label(0x4099+5, "small_egg_animation_table_subseq1")
for i in range(0x4099, 0x40cf):
    byte(i)
expr(0x41c7, make_subtract("small_egg_animation_table_subseq1", "small_egg_animation_table"))
expr(0x409a, sprite_dict)
expr(0x40a1, sprite_dict)
expr(0x40a5, sprite_dict)
expr(0x40a8, sprite_dict)
expr(0x40ab, sprite_dict)
expr(0x40ae, sprite_dict)
expr(0x40b1, sprite_dict)
expr(0x40b4, sprite_dict)
expr(0x40b7, sprite_dict)
expr(0x40ba, sprite_dict)
expr(0x40be, sprite_dict)
expr(0x40be, sprite_dict)
expr(0x40c1, sprite_dict)
expr(0x40c4, sprite_dict)
expr(0x40c7, sprite_dict)
expr(0x40cb, sprite_dict)

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
label(0x444c+0x1a, "egg_animation_subseq4")
expr(0x4507, make_subtract("egg_animation_subseq1", "egg_animations_table"))
expr(0x4492, make_subtract("egg_animation_subseq4", "egg_animations_table"))
expr(0x4492, make_subtract("egg_animation_subseq4", "egg_animations_table"))
expr(0x4534, make_subtract("egg_animation_subseq4", "egg_animations_table"))
expr(0x44d8, make_subtract("egg_animation_subseq2", "egg_animations_table"))
expr(0x452f, make_subtract("egg_animation_subseq3", "egg_animations_table"))
entry(0x4538, "new_egg_animation_index_in_y")
entry(0x4551, "finish_setting_up_egg")

comment(0x45a1, "Preserves Y. A is 0 or $ff on exit depending on something. Flags reflect A on exit.")
entry(0x45a1, "something_to_do_with_egg_animation")
comment(0x45ad, "TODO: Why not lda object_spriteid+2? And similarly for following lda abs,x")
expr(0x45ae, "objectid_small_egg")
entry(0x45d2, "load_a_and_return")
label(0x45d6, "return_a")
label(0x45d7, "saved_y")
expr(0x42dd, "objectid_small_egg")

# TODO: These are copied carelessly from g.py, need to make these available consistently to all code
# in a sensible way.
label(0x70, "object_left_low")
label(0x71, "object_left_high")
label(0x72, "object_right_low")
label(0x73, "object_right_high")
label(0x78, "object_left_cell_x")
label(0x79, "object_right_cell_x")

comment(0x3b40, "This table is 0-terminated")
label(0x3b40, "duck_wing_animation_table")
for i in range(0x3b40, 0x3b44):
    expr(i, sprite_dict)

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
expr(0x414a, "object_spriteid + objectid_small_egg")
expr(0x4169, "object_spriteid_old + objectid_small_egg")
expr(0x4179, "object_spriteid_old + objectid_small_egg")
expr(0x41d2, "object_spriteid + objectid_small_egg")
expr(0x41f0, "object_spriteid_old + objectid_small_egg")
expr(0x420f, "object_spriteid + objectid_small_egg")
expr(0x428b, "object_spriteid + objectid_small_egg")
expr(0x42c4, "object_x_low + objectid_small_egg")
expr(0x42ca, "object_x_high + objectid_small_egg")
expr(0x42d0, "object_y_low + objectid_small_egg")
expr(0x431a, "object_spriteid + objectid_small_egg")
expr(0x4321, "object_x_low + objectid_small_egg")
expr(0x4327, "object_x_high + objectid_small_egg")
expr(0x432d, "object_y_low + objectid_small_egg")
expr(0x4332, "object_y_high + objectid_small_egg")
expr(0x4338, "object_direction + objectid_small_egg")
expr(0x434f, "object_y_low + objectid_small_egg")
expr(0x4352, "object_y_low_old + objectid_small_egg")
expr(0x435a, "object_x_low + objectid_small_egg")
expr(0x435e, "object_x_low_old + objectid_small_egg")
expr(0x4363, "object_x_high + objectid_small_egg")
expr(0x4366, "object_x_high_old + objectid_small_egg")
expr(0x44b4, "object_x_high + objectid_egg")
expr(0x44b7, "object_y_high + objectid_egg")
expr(0x455e, "object_spriteid + objectid_egg")
expr(0x4564, "object_x_low + objectid_egg")
expr(0x456a, "object_y_low + objectid_egg")

ground_fill(0x3b2b)

expr(0x3d56, sprite_dict)
expr(0x40e6, sprite_dict)
expr(0x4167, sprite_dict)
expr(0x420d, sprite_dict)
expr(0x4318, sprite_dict)

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
