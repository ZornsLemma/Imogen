from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    #0x2b: "spriteid_diamond5",
    0x3b: "spriteid_ball",
    0xc8: "spriteid_mouse",
    0xc9: "spriteid_mouse_hands1",
    0xca: "spriteid_mouse_hands2",
    0xcb: "spriteid_small_ball",
    0xcc: "spriteid_zero_size1", # TODO:!? Used as a mask?
    0xcf: "spriteid_trapdoor_horizontal",
    0xd0: "spriteid_trapdoor_diagonal",
    0xd1: "spriteid_trapdoor_vertical",
    0xd2: "spriteid_saxophone1",
    0xd3: "spriteid_saxophone2",
    0xd4: "spriteid_mouse_hands3",
    0xd5: "spriteid_mouse_hands4",
    0xd6: "spriteid_baby0",
    0xd7: "spriteid_baby1",
    0xd8: "spriteid_baby2",
    0xd9: "spriteid_baby3",
    0xda: "spriteid_baby4",
    0xdb: "spriteid_baby5",
    0xdc: "spriteid_baby6",
    0xdd: "spriteid_baby7",
    0xde: "spriteid_table",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}


# Room 0
constant(2, "objectid_left_mouse")
constant(3, "objectid_right_mouse")
constant(4, "objectid_mouse_ball")
# Room 1
constant(2, "objectid_left_trapdoor")
constant(3, "objectid_right_trapdoor")
constant(4, "objectid_saxophone")
constant(5, "objectid_brazier")
# Room 2
constant(2, "objectid_baby")
constant(5, "objectid_spell")
# Room 3
constant(2, "objectid_table")
constant(3, "objectid_brazier2")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataA.dat", "6502", "df027a3ac06abfed1878eaec3d2bbe5f")

common_to_all()
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3bd4,0x3df9): {
        "l0070": "room_exit_direction",
    },
    (0x43a0,0x43e5): {
        "l0070": "old_table_x_position", # used during sliding
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

expr(0x40de, make_add("object_sprite_mask_type", "objectid_baby"))
expr(0x3ff3, "copy_mode_simple")

comment(0x3d21, """This table is indexed by a function of mouse_ball_position (it's not directly indexed
to exploit the symmetry of the animation). Each table entry consists of four bytes:
0) left mouse hands sprite ID
1) right mouse hands sprite ID
2) ball X offset (applied to mouse_ball_left_x_base or mouse_ball_right_x_base depending on
   mouse_ball_position)
3) ball Y offset (applied to mouse_ball_top_y_base)""")
entry(0x3d21, "mouse_hand_sprites_and_ball_movement_table")
def mouse_and_ball(addr):
    byte(addr+2,2)
    spriteid(addr)
    spriteid(addr+1)
    decimal(addr+2)
    decimal(addr+3)

mouse_and_ball(0x3d21)
mouse_and_ball(0x3d25)
mouse_and_ball(0x3d29)
mouse_and_ball(0x3d2d)
mouse_and_ball(0x3d31)
mouse_and_ball(0x3d35)
mouse_and_ball(0x3d39)

label(0x4052, "baby_spriteid_data")
label(0x4057, "baby_spriteid_subseq2")
label(0x405f, "baby_spriteid_subseq5")
label(0x406b, "baby_spriteid_subseq3")
label(0x4073, "baby_spriteid_subseq6")
label(0x4074, "baby_spriteid_subseq7")
label(0x407d, "baby_spriteid_subseq4")
expr(0x40a3, make_subtract("baby_spriteid_subseq4", "baby_spriteid_data"))
expr(0x4133, make_subtract("baby_spriteid_subseq2", "baby_spriteid_data"))
expr(0x418d, make_subtract("baby_spriteid_subseq2", "baby_spriteid_data"))
expr(0x415f, make_subtract("baby_spriteid_subseq5", "baby_spriteid_data"))
expr(0x4147, make_subtract("baby_spriteid_subseq3", "baby_spriteid_data"))
expr(0x412f, make_subtract("baby_spriteid_subseq6", "baby_spriteid_data"))
expr(0x40e8, make_subtract("baby_spriteid_subseq4", "baby_spriteid_data"))
expr(0x4101, make_subtract("baby_spriteid_subseq4", "baby_spriteid_data"))
expr(0x4157, make_subtract("baby_spriteid_subseq4", "baby_spriteid_data"))
expr(0x41d3, make_subtract("baby_spriteid_subseq4", "baby_spriteid_data"))
expr(0x41e3, make_subtract("baby_spriteid_subseq4", "baby_spriteid_data"))
expr(0x41f4, make_subtract("baby_spriteid_subseq4", "baby_spriteid_data"))
expr(0x4125, make_subtract("baby_spriteid_subseq7", "baby_spriteid_data"))
entry(0x40ee, "not_at_last_baby_spriteid_entry")
spriteid(0x4052, 0x407f, True)
expr(0x3d09, "spriteid_small_ball")

comment(0x4084, "redundant instruction", inline=True)
comment(0x4086, "redundant instruction", inline=True)
comment(0x4088, "redundant instruction", inline=True)

expr(0x3b0f, make_lo("ground_fill_2x2_top_left"))
expr(0x3b13, make_hi("ground_fill_2x2_top_left"))
expr(0x3fe7, make_lo("tile_all_set_pixels"))
expr(0x3feb, make_hi("tile_all_set_pixels"))
tile_bitmap2x2(0x4486, "ground_fill_2x2")
comment(0x448e, "Note that the next three tiles are all identical. This is done because the 'tiling' code in copy_rectangle_of_memory_to_screen for copy_mode=1 uses a 2x2 tiling arrangement.")


comment(0x3af4, "if level is unchanged, skip forwards")
comment(0x3af8, "if not in developer mode, skip forwards")
entry(0x3b04, "developer_mode_not_active")
label(0x3b0e, "set_ground_fill_2x2_as_source_sprite")
comment(0x3afd, "add the saxophone menu item to the toolbar (due to being in developer mode)")
comment(0x3b09, "add the saxophone menu item to the toolbar (due to having collected it on a previous visit to the level)")

comment(0x3b02, "redundant instruction", inline=True)
comment(0x3b04, "check the saxophone collected flag. The user can choose during the course of a game to enter the password to continue playing this level having previously got the saxophone. Or indeed may have just loaded a previously saved game.")
label(0xa00, "saxophone_collected_flag")

label(0xa6f, "mouse_ball_animation_position") # This runs from 0-$1d inclusive starting at 0 far left, reaching far right at $10 and returning to far left at $1d.
blank(0x3be4)
comment(0x3bd1, "start main game loop for room 1")
comment(0x3be4, """*************************************************************************************

Room 0 update

Room 0 has two mice throwing a ball back and forth.

*************************************************************************************""")
entry(0x3be4, "room0_update_handler")
entry(0x3bec, "room0_first_update")
entry(0x3bf7, "level_unchanged")
entry(0x3c77, "bump_and_wrap_mouse_ball_position")
constant(0x1d, "max_mouse_ball_animation_position") # 0-0x1d inclusive
expr(0x3c7c, make_add("max_mouse_ball_animation_position", "1"))
entry(0x3c81, "no_wrap_needed")
entry(0x3ca8, "move_mouse_ball_if_room_0")
entry(0x3c74, "move_mouse_ball_if_room_0_local")
sound(0x447e, "mouse_ball_sound1")
sound(0x4476, "mouse_ball_sound2")
sound(0x446e, "mouse_ball_sound3")
comment(0x3c8a, "Play the mouse ball sounds at positions 0 and $f")
comment(0x3c91, "redundant", inline=True)
entry(0x3c91, "play_mouse_ball_sounds")
expr(0x3c94, make_lo("mouse_ball_sound1"))
expr(0x3c96, make_hi("mouse_ball_sound1"))
expr(0x3c9b, make_lo("mouse_ball_sound2"))
expr(0x3c9d, make_hi("mouse_ball_sound2"))
expr(0x3ca2, make_lo("mouse_ball_sound3"))
expr(0x3ca4, make_hi("mouse_ball_sound3"))
constant(0x88, "mouse_ball_left_x_base")
constant(0xc0, "mouse_ball_right_x_base")
constant(0x53, "mouse_ball_top_y_base")
expr(0x3cd1, "mouse_ball_left_x_base")
expr(0x3cf5, "mouse_ball_right_x_base")
expr(0x3cff, "mouse_ball_top_y_base")
entry(0x3d20, "return1")
comment(0x3c04, "Perform shared initialisation for both mice")
comment(0x3c0e, "Set up the left mouse")
comment(0x3c30, "Set up the right mouse")
comment(0x3c5b, "Set up the ball")
expr(0x3c6b, "spriteid_zero_size1")
ab(0x3cb7)
ab(0x3cdf)
comment(0x3cc0, "Multiply by 4 because each table entry is 4 bytes.")
entry(0x3cb9, "mouse_ball_position_ge_8")
entry(0x3cc3, "set_mouse_hand_and_ball_sprites_from_left")
entry(0x3ce7, "set_mouse_hand_and_ball_sprites_from_right")
entry(0x3cd9, "mouse_ball_position_ge_0xf") # TODO: this name kind of ignores the possibility of fall through to this label
entry(0x3ce1, "mouse_ball_position_ge_0x17")
comment(0x3ce4, "Multiply by 4 because each table entry is 4 bytes.")
comment(0x3cc6, "Set the mouse sprites as a pair of values in the table")
ab(0x3cd7)
entry(0x3cfb, "finish_mouse_ball_movement")
expr(0x3d06, make_add("object_y_low", "objectid_mouse_ball"))
expr(0x3cfc, make_add("object_x_low", "objectid_mouse_ball"))
expr(0x3d0b, make_add("object_spriteid", "objectid_mouse_ball"))
comment(0x3d12, "Check for player-ball collision")
expr(0x3d13, "objectid_player")
expr(0x3d15, "objectid_mouse_ball")
constant(6, "player_collision_flag_baby")
constant(0x80, "player_collision_flag_mouse_ball")
expr(0x3d1c, "player_collision_flag_mouse_ball")
expr(0x4116, "player_collision_flag_baby")

comment(0x3dfc, """*************************************************************************************

Room 1 update

Room 1 has a trapdoor which opens when the wizard stands on it holding the saxophone.

*************************************************************************************""")
entry(0x3dfc, "room1_update_handler")
entry(0x3e6c, "room1_not_first_update")
entry(0x3e11, "level_unchanged2")
label(0x9ff, "room1_trapdoor_open_flag")
label(0x3eee, "trapdoor_sprite_table") # TODO: Include "animation" in name? But not sure if this is different from "real" animations like animal tails
for i in range(3): # TODO: Add a convenience function for this? Maybe in py8dis?
    byte(0x3eee+i)
comment(0x3e6f, "branch if trapdoor fully open", inline=True)
comment(0x3e71, "branch if trapdoor partially open", inline=True)
comment(0x3e73, "The trapdoor is closed.")
comment(0x3e79, "Is the player holding something?")
comment(0x3e7d, "Yes. Is the player standing over the trapdoor? TODO: Do we check the player's Y coordinate? I guess not needed as the wizard can't jump and other characters can't hold things.")
comment(0x3e8d, "Yes. Is the player colliding with solid rock? (We probably 'should' only check for collision below the player, but in practice the other directions aren't possible.)")
expr(0x3e7e, make_add("object_x_high", "objectid_player"))
expr(0x3e83, make_add("object_x_low", "objectid_player"))
constant(0x88, "trapdoor_left_x")
constant(0xb8, "trapdoor_right_x")
expr(0x3e86, "trapdoor_left_x")
expr(0x3e8a, "trapdoor_right_x")
comment(0x3e99, "Yes, so we need to open the trapdoor. Remove the closed trapdoor from the collision map.")
comment(0x3eac, "Add the two open trapdoors to the collision map.")
expr(0x3f18, make_add("toolbar_collectable_spriteids", "1"))
expr(0x3f1d, make_add("collectable_spriteids", "1"))
expr(0x3bda, "exit_room_right")

# TODO: slight guesswork
expr(0x3f08, "objectid_brazier")
entry(0x3f52, "not_first_room_update")
entry(0x3f62, "dont_play_saxophone_sound")
expr(0x3f6e, "spriteid_saxophone1")
expr(0x3f56, "spriteid_saxophone2")
expr(0x4141, "spriteid_saxophone2")
expr(0x3f1b, "spriteid_saxophone1")
expr(0x3c22, "objectid_left_mouse")
expr(0x3c48, "objectid_right_mouse")
expr(0x3c5c, "objectid_mouse_ball")
expr(0x3cc7, "object_spriteid + objectid_left_mouse")
expr(0x3cce, "object_spriteid + objectid_right_mouse")
expr(0x3ceb, "object_spriteid + objectid_right_mouse")
expr(0x3cf2, "object_spriteid + objectid_left_mouse")
expr(0x3ee8, "object_spriteid + objectid_left_trapdoor")
expr(0x3eeb, "object_spriteid + objectid_right_trapdoor")
# TODO expr_label(0x9ac, "object_spriteid + objectid_mouse_ball")
entry(0x3e69, "room1_initial_setup_done")
expr(0x4377, "objectid_player")
expr(0x4379, "objectid_table")
label(0xa02, "table_x_speed") # probably -1 ($ff), 0 or 1
entry(0x4355, "return4_local")
entry(0x4415, "return4")

expr(0x3e23, "objectid_left_trapdoor")
expr(0x3e30, "objectid_right_trapdoor")
comment(0x3e1e, "Set up the objects for the two trapdoors.")
comment(0x3e3e, "Set up the collision map for the two trapdoors.")
comment(0x3e43, "Set up the trapdoor collision map if they are closed.")
entry(0x3e55, "set_up_open_trapdoor_collision_map")
entry(0x3eed, "return2")
entry(0x3ed4, "new_room1_trapdoor_open_flag_in_y")
entry(0x3ed7, "set_room1_trapdoor_sprites_if_required")
entry(0x3ee4, "adjusted_room1_trapdoor_open_flag_in_y_is_ge_0")
entry(0x3ef1, "play_some_sound1_then_some_sound2")
comment(0x3ecf, "TODO: Pretty confident this is the trapdoor opening sound, but this is called elsewhere so don't want to rename subroutine yet")
comment(0x3ee2, "Use sprite index 2 (vertical) if room1_trapdoor_open_flag is $ff")
entry(0x3ec1, "increment_trapdoor_open_flag")
entry(0x3ed2, "skip_play_sound")

# TODO: I think room1_trapdoor_open_flag can have values $ff, 0 and 1 - just possibly this
# increments to add a time delay to the trapdoor visibly opening, but that's a guess at this point.
# Looking at Colin's YT video frame by frame, I think there are states: fully closed, both open at
# an angle, right fully open while left is still at an angle and both fully open. Not entirely sure
# if both open at an angle is a single state or two states with rhs one opening first. (Timestamp in
# video ~ 17:54.) Looking at the code at 3ee4 I suspect any left-vs-right difference is just me
# stepping through the frames and in reality we are "supposed" to see symmetric movement
# - non-0 means open (see 3e3e), I suspect 1 means "partly open" (note that room1_update_handler
# will force it to $ff if it's non-0 during setup, presumably to handle cases where the user
# switched level while the trapdoor was opening)
expr(0x3eee, "spriteid_trapdoor_horizontal")
expr(0x3eef, "spriteid_trapdoor_diagonal")
expr(0x3ef0, "spriteid_trapdoor_vertical")

entry(0x3f02, "room1_saxophone_and_brazier_handler")
expr(0x3f16, "spriteid_saxophone2")
comment(0x3f34, "The player has not collected the saxophone, so place it in the lower left of the room.")
expr(0x3f3d, "objectid_saxophone")
expr(0x3f48, "spriteid_zero_size1")
expr(0x3f4d, "spriteid_saxophone1")
entry(0x3f51, "return3")
comment(0x3f7b, "Collect the saxophone.")
expr(0x3f70, "object_spriteid + objectid_saxophone")
comment(0x3f72, "This is the state of the player as currently drawn on the screen, before being updated in the current game tick.")
expr(0x3f73, "objectid_old_player")
expr(0x3f75, "objectid_saxophone")
expr(0x3f83, "object_spriteid + objectid_saxophone")
entry(0x3f8a, "return6")
comment(0x3e92, "This is the state of the player as currently drawn on the screen, before being updated in the current game tick.")
expr(0x3e93, "objectid_old_player")

comment(0x42f8, """*************************************************************************************

Room 3 update

Room 3 has a table which can be pushed to the left or right side of the screen.

*************************************************************************************""")
entry(0x42f8, "room3_update_handler")
expr(0x42fe, "objectid_brazier2")
entry(0x4358, "room3_not_first_update")
expr(0x4349, "spriteid_table")
expr(0x434e, "spriteid_zero_size1")
expr(0x4347, "objectid_table")
expr(0x4048, "exit_room_top")
expr(0x436e, "object_collided_right_wall")
expr(0x438a, "object_collided_left_wall")
ab(0x4384)
entry(0x4352, "add_table_to_collision_map_if_room_3_local")
comment(0x43fc, "Add the table to the collision map and set its object position.")
expr(0x4411, "objectid_table")
entry(0x43e3, "remove_table_from_collision_map_at_old_table_x_position")
entry(0x43b4, "moving_table_hit_wall")
entry(0x43d4, "moving_table_not_hit_wall")
entry(0x43ce, "ready_to_play_table_hit_wall_sound")
entry(0x43a0, "move_table")
entry(0x43f6, "add_table_to_collision_map_if_room_3")
constant(0xa, "table_min_x")
constant(0x16, "table_max_x")
expr(0x43ad, "table_min_x")
expr(0x4324, "table_min_x")
expr(0x4367, "table_max_x")
expr(0x43b1, "table_max_x")
expr(0x4330, "table_max_x")
entry(0x4386, "table_at_max_x_position")
expr(0x4393, "objectid_player")
expr(0x4395, "objectid_table")

comment(0x407f, """*************************************************************************************

Room 2 update

Room 2 has the spell, guarded by a baby.

*************************************************************************************""")
label(0x0a03, "save_game_level_a_room_2_baby_pixel_x_coordinate")
label(0x0a04, "save_game_level_a_room_2_baby_direction")
entry(0x407f, "room2_update_handler")
expr(0x4093, "objectid_spell")
entry(0x40b2, "have_valid_baby_properties_in_axy")
entry(0x40c1, "room2_update_handler_not_new_level")
expr(0x40d7, "objectid_baby")
expr(0x40dc, "spriteid_zero_size1")
entry(0x40e0, "room2_update_second_part_local")
entry(0x412b, "baby_spriteid_index_if_baby_spriteid_data_is_zero_set")
entry(0x41ae, "move_baby")
entry(0x41c1, "baby_direction_negative")
comment(0x41c1, "TODO: This doesn't seem to be subtracting from baby_pixel_x_coordinate, suggesting 'baby_direction' is not quite what I thought")
expr(0x3dd8, "exit_room_left")
entry(0x3de2, "room_1_check_bottom_exit")
expr(0x3de5, "exit_room_bottom")
entry(0x3def, "room_1_check_right_exit")
expr(0x3df2, "exit_room_right")
entry(0x40e4, "room2_not_first_update")
expr(0x4105, "objectid_player")
expr(0x410a, "objectid_baby")
entry(0x424c, "return5")
label(0x40e3, "room2_update_handler_temp")
comment(0x4111, "set flags to reflect value in set flags to reflect value in A", inline=True)
entry(0x412e, "player_not_collided_with_baby")
comment(0x412e, "Y contains an index into baby_spriteid_data")
entry(0x4137, "dont_adjust_baby_spriteid_index")
entry(0x415e, "player_not_using_saxophone")
entry(0x4167, "not_at_subseq5")
comment(0x416a, "redundant", inline=True)
entry(0x418c, "baby_pixel_x_coordinate_is_max_or_min") # TODO: speculative
constant(0x6c, "baby_min_pixel_x") # TODO: name is probably not quite right, given at 418a we branch if *less* than this
expr(0x4185, "baby_min_pixel_x")
entry(0x419f, "baby_pixel_x_coordinate_within_min_max")
entry(0x4184, "baby_pixel_x_speed_negativbe")
ab(0x4182)
ab(0x418a)
entry(0x4194, "baby_pixel_x_coordinate_outside_min_max")
entry(0x41c9, "baby_pixel_x_coordinate_updated")
label(0xa70, "baby_pixel_x_coordinate") # TODO: speculative
label(0xa71, "baby_pixel_x_speed") # TODO: speculative
constant(0xd4, "baby_max_pixel_x")
expr(0x417d, "baby_max_pixel_x")
label(0xa73, "baby_sprite_index")
entry(0x4235, "set_baby_object_properties")
comment(0x40f4, "TODO: I suspect what happens here is that there are multiple animation sequences and 0 means 'jump to a new sequence, identified by baby_sprite_index_if...'")
label(0xa72, "baby_spriteid_index_if_baby_spriteid_data_is_zero")
entry(0x40f7, "have_specific_baby_spriteid")
entry(0x41d9, "room2_update_second_part")
comment(0x41f7, "Add the baby to the collision map.")
entry(0x420c, "update_collision_map_for_baby") # TODO?
comment(0x420c, "Remove the baby from the collision map (TODO: at its old position?) and add it at its new position. TODO: Looking at the change in Y position and the change in width/heigh, I suspect this is handling the baby being killed and falling flat")
entry(0x4224, "baby_direction_negative2")

expr(0x42ee, "exit_room_left")

ldx_ldy_jsr_play_sound_yx(0x3ef7, "some_sound1")
ldx_ldy_jsr_play_sound_yx(0x3efe, "some_sound2")
ldx_ldy_jsr_play_sound_yx(0x3f5f, "saxophone_sound")
ldx_ldy_jsr_play_sound_yx(0x43e0, "some_sound4")

expr(0x43cc, make_add("sound_priority_per_channel_table","1"))

# TODO: envelope1/2/4 share the same envelope number (6) - maybe we should adopt a convention of using labels like envelopeA6b -> level A, OS env number 6, a/b/c/d suffix indicates competing envelopes for that OS env number
ldx_ldy_jsr_define_envelope(0x3c01, "envelope1")
ldx_ldy_jsr_define_envelope(0x3e1b, "envelope2")
ldx_ldy_jsr_define_envelope(0x3f26, "envelope3")
ldx_ldy_jsr_define_envelope(0x4343, "envelope4")
expr(0x40c8, make_lo("envelope2"))
expr(0x40ca, make_hi("envelope2"))

# TODO: All this table_x_position stuff is speculative
label(0xa01, "table_x_position")
entry(0x432f, "set_table_x_position_to_right_side")
comment(0x4323, "Set table_x_position to left side of screen")
entry(0x4339, "table_x_position_update_finished") # if any...
ab(0x432d)

comment(0x3f8b, """*************************************************************************************

Use copy_rectangle_of_memory_to_screen repeatedly to create a pseudo-circle shape -
room 2 (the baby/spell room) has one of these in each corner.

On Entry:
    X and Y registers specify top left cell of pseudo-circle
    Everything else except {width,height}_in_cells_to_write as for
        copy_rectangle_of_memory_to_screen

On Exit:
    Preserves X,Y

*************************************************************************************""")
entry(0x3f8b, "copy_pseudo_circle_to_screen")
label(0x3fd5, "copy_pseudo_circle_to_screen_saved_x")
label(0x3fd6, "copy_pseudo_circle_to_screen_saved_y")

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
