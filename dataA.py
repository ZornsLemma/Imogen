from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_mouse",
    0xc9: "spriteid_mouse_hands1",
    0xca: "spriteid_mouse_hands2",
    0xcb: "spriteid_small_ball",
    0xcc: "spriteid_erase1", #
    0xcd: "spriteid_erase2", # The 'erase' sprites are used to record the contents of the screen before the associated normal sprite is drawn, so it can be erased by drawing the erase sprite
    0xce: "spriteid_erase3", #
    0xcf: "spriteid_trapdoor_horizontal",
    0xd0: "spriteid_trapdoor_diagonal",
    0xd1: "spriteid_trapdoor_vertical",
    0xd2: "spriteid_saxophone",
    0xd3: "spriteid_saxophone_menu_item",
    0xd4: "spriteid_mouse_hands3",
    0xd5: "spriteid_mouse_hands4",
    0xd6: "spriteid_baby_walk_cycle_0",
    0xd7: "spriteid_baby_walk_cycle_1",
    0xd8: "spriteid_baby_walk_cycle_2",
    0xd9: "spriteid_baby_walk_cycle_3",
    0xda: "spriteid_baby_stunned",
    0xdb: "spriteid_baby_shrug",
    0xdc: "spriteid_baby_dead",
    0xdd: "spriteid_baby_smile",
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


constant(0x1d, "max_mouse_ball_animation_position") # 0-0x1d inclusive
constant(0x88, "mouse_ball_left_x_base")
constant(0xc0, "mouse_ball_right_x_base")
constant(0x53, "mouse_ball_top_y_base")
constant(6, "player_collision_flag_baby")
constant(0x80, "player_collision_flag_mouse_ball")
constant(0xa, "table_min_x")
constant(0x16, "table_max_x")
constant(0x6c, "baby_min_pixel_x")
constant(0x88, "trapdoor_left_x")
constant(0xb8, "trapdoor_right_x")
constant(0xd4, "baby_max_pixel_x")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataA.dat", "6502", "df027a3ac06abfed1878eaec3d2bbe5f")

common_to_all('A')
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

comment(0x3d21, """This table is indexed by a function of mouse_ball_position (it's not directly indexed
to exploit the symmetry of the animation). Each table entry consists of four bytes:
0) left mouse hands sprite ID
1) right mouse hands sprite ID
2) ball X offset (applied to mouse_ball_left_x_base or mouse_ball_right_x_base depending on mouse_ball_position)
3) ball Y offset (applied to mouse_ball_top_y_base)""")

blank(0x3be4)
stars(0x3be4, """Room 0 update

Room 0 has two mice throwing a ball back and forth.""")


stars(0x3dfc, """Room 1 update

Room 1 has a trapdoor which opens when the wizard stands on it holding the saxophone.""")


stars(0x42f8, """Room 3 update

Room 3 has a table which can be pushed to the left or right side of the screen.""")


stars(0x407f, """Room 2 update

Room 2 has the spell, guarded by a baby.""")


stars(0x3f8b, """Use copy_rectangle_of_memory_to_screen repeatedly to create a pseudo-circle shape -
room 2 (the baby/spell room) has one of these in each corner.

On Entry:
    X and Y registers specify top left cell of pseudo-circle
    Everything else except {width,height}_in_cells_to_write as for
        copy_rectangle_of_memory_to_screen

On Exit:
    Preserves X,Y""")

def mouse_and_ball(addr):
    byte(addr+2,2)
    spriteid(addr)
    spriteid(addr+1)
    decimal(addr+2)
    decimal(addr+3)

for i in range(3): # TODO: Add a convenience function for this? Maybe in py8dis?
    byte(0x3eee+i)

label(0x09ff, "save_game_level_a_room1_trapdoor_open_flag")
label(0x0a00, "save_game_level_a_saxophone_collected_flag")
label(0x0a01, "save_game_level_a_table_x_position")
label(0x0a02, "save_game_level_a_table_x_speed") # $ff, 0 or 1
label(0x0a03, "save_game_level_a_room_2_baby_pixel_x_coordinate")
label(0x0a04, "save_game_level_a_room_2_baby_direction")

label(0x0a6f, "mouse_ball_animation_position")  # This runs from 0-$1d inclusive starting at 0 far left, reaching far right at $10 and returning to far left at $1d.
label(0x0a70, "baby_pixel_x_coordinate")
label(0x0a71, "baby_pixel_x_speed")
label(0x0a72, "baby_animation")
label(0x0a73, "baby_animation_step")

comment(0x3af4, "if level is unchanged, skip forwards")
comment(0x3af8, "if not in developer mode, skip forwards")
comment(0x3afd, "add the saxophone menu item to the toolbar (due to being in developer mode)")
ri(0x3b02)
entry(0x3b04, "developer_mode_not_active")
comment(0x3b04, "check the saxophone collected flag. The user can choose during the course of a game to enter the password to continue playing this level having previously got the saxophone. Or indeed may have just loaded a previously saved game.")
comment(0x3b09, "add the saxophone menu item to the toolbar (due to having collected it on a previous visit to the level)")
label(0x3b0e, "set_ground_fill_2x2_as_source_sprite")
expr(0x3b0f, make_lo("ground_fill_2x2_top_left"))
expr(0x3b13, make_hi("ground_fill_2x2_top_left"))
comment(0x3bd1, "start main game loop for room 1")
expr(0x3bda, "exit_room_right")
entry(0x3be4, "room0_update_handler")
entry(0x3bec, "room0_first_update")
entry(0x3bf7, "level_unchanged")
ldx_ldy_jsr_define_envelope(0x3c01, "envelope1")
comment(0x3c04, "Perform shared initialisation for both mice")
comment(0x3c0e, "Set up the left mouse")
expr(0x3c22, "objectid_left_mouse")
expr(0x3c27, sprite_dict)
comment(0x3c30, "Set up the right mouse")
expr(0x3c48, "objectid_right_mouse")
expr(0x3c52, sprite_dict)
comment(0x3c5b, "Set up the ball")
expr(0x3c5c, "objectid_mouse_ball")
expr(0x3c6b, sprite_dict)
entry(0x3c74, "move_mouse_ball_if_room_0_local")
entry(0x3c77, "bump_and_wrap_mouse_ball_position")
expr(0x3c7c, make_add("max_mouse_ball_animation_position", "1"))
entry(0x3c81, "no_wrap_needed")
comment(0x3c8a, "Play the mouse ball sounds at positions 0 and $f")
ri(0x3c91)
entry(0x3c91, "play_mouse_ball_sounds")
expr(0x3c94, make_lo("mouse_ball_sound1"))
expr(0x3c96, make_hi("mouse_ball_sound1"))
expr(0x3c9b, make_lo("mouse_ball_sound2"))
expr(0x3c9d, make_hi("mouse_ball_sound2"))
expr(0x3ca2, make_lo("mouse_ball_sound3"))
expr(0x3ca4, make_hi("mouse_ball_sound3"))
entry(0x3ca8, "move_mouse_ball_if_room_0")
ab(0x3cb7)
entry(0x3cb9, "mouse_ball_position_ge_8")
comment(0x3cc0, "Multiply by 4 because each table entry is 4 bytes.")
entry(0x3cc3, "set_mouse_hand_and_ball_sprites_from_left")
comment(0x3cc6, "Set the mouse sprites as a pair of values in the table")
expr(0x3cc7, "object_spriteid + objectid_left_mouse")
expr(0x3cce, "object_spriteid + objectid_right_mouse")
expr(0x3cd1, "mouse_ball_left_x_base")
ab(0x3cd7)
entry(0x3cd9, "mouse_ball_position_ge_0xf") # TODO: this name kind of ignores the possibility of fall through to this label
ab(0x3cdf)
entry(0x3ce1, "mouse_ball_position_ge_0x17")
comment(0x3ce4, "Multiply by 4 because each table entry is 4 bytes.")
entry(0x3ce7, "set_mouse_hand_and_ball_sprites_from_right")
expr(0x3ceb, "object_spriteid + objectid_right_mouse")
expr(0x3cf2, "object_spriteid + objectid_left_mouse")
expr(0x3cf5, "mouse_ball_right_x_base")
entry(0x3cfb, "finish_mouse_ball_movement")
expr(0x3cfc, make_add("object_x_low", "objectid_mouse_ball"))
expr(0x3cff, "mouse_ball_top_y_base")
expr(0x3d06, make_add("object_y_low", "objectid_mouse_ball"))
expr(0x3d09, "spriteid_small_ball")
expr(0x3d0b, make_add("object_spriteid", "objectid_mouse_ball"))
comment(0x3d12, "Check for player-ball collision")
expr(0x3d13, "objectid_player")
expr(0x3d15, "objectid_mouse_ball")
expr(0x3d1c, "player_collision_flag_mouse_ball")
entry(0x3d20, "return1")
entry(0x3d21, "mouse_hand_sprites_and_ball_movement_table")
mouse_and_ball(0x3d21)
mouse_and_ball(0x3d25)
mouse_and_ball(0x3d29)
mouse_and_ball(0x3d2d)
mouse_and_ball(0x3d31)
mouse_and_ball(0x3d35)
mouse_and_ball(0x3d39)
expr(0x3dd8, "exit_room_left")
entry(0x3de2, "room_1_check_bottom_exit")
expr(0x3de5, "exit_room_bottom")
entry(0x3def, "room_1_check_right_exit")
expr(0x3df2, "exit_room_right")
entry(0x3dfc, "room1_update_handler")
entry(0x3e11, "level_unchanged2")
ldx_ldy_jsr_define_envelope(0x3e1b, "envelope2")
comment(0x3e1e, "Set up the objects for the two trapdoors.")
expr(0x3e23, "objectid_left_trapdoor")
expr(0x3e30, "objectid_right_trapdoor")
comment(0x3e3e, "Set up the collision map for the two trapdoors.")
comment(0x3e43, "Set up the trapdoor collision map if they are closed.")
entry(0x3e55, "set_up_open_trapdoor_collision_map")
entry(0x3e69, "room1_initial_setup_done")
entry(0x3e6c, "room1_not_first_update")
comment(0x3e6f, "branch if trapdoor fully open", inline=True)
comment(0x3e71, "branch if trapdoor partially open", inline=True)
comment(0x3e73, "The trapdoor is closed.")
comment(0x3e79, "Is the player holding something?")
comment(0x3e7d, "Yes. Is the player standing over the trapdoor? The player's Y coordinate is not checked here, but there's a check below to see if the wizard is colliding with rock (which can only mean standing on the ground, including the closed trapdoors). The trapdoors don't open if the wizard is jumping in the air")
expr(0x3e7e, make_add("object_x_high", "objectid_player"))
expr(0x3e83, make_add("object_x_low", "objectid_player"))
expr(0x3e86, "trapdoor_left_x")
expr(0x3e8a, "trapdoor_right_x")
comment(0x3e8d, "Yes. Is the player colliding with solid rock? (We probably 'should' only check for collision below the player, but in practice the other directions aren't possible.)")
comment(0x3e92, "This is the state of the player as currently drawn on the screen, before being updated in the current game tick.")
expr(0x3e93, "objectid_old_player")
comment(0x3e99, "Yes, so we need to open the trapdoor. Remove the closed trapdoor from the collision map.")
comment(0x3eac, "Add the two open trapdoors to the collision map.")
entry(0x3ec1, "increment_trapdoor_open_flag")
comment(0x3ecf, "This is the trapdoor opening sound")
entry(0x3ed2, "skip_play_sound")
entry(0x3ed4, "new_room1_trapdoor_open_flag_in_y")
entry(0x3ed7, "set_room1_trapdoor_sprites_if_required")
comment(0x3ee2, "Use sprite index 2 (vertical) if room1_trapdoor_open_flag is $ff")
entry(0x3ee4, "adjusted_room1_trapdoor_open_flag_in_y_is_ge_0")
expr(0x3ee8, "object_spriteid + objectid_left_trapdoor")
expr(0x3eeb, "object_spriteid + objectid_right_trapdoor")
entry(0x3eed, "return2")
label(0x3eee, "trapdoor_sprite_table")
expr(0x3eee, "spriteid_trapdoor_horizontal")
expr(0x3eef, "spriteid_trapdoor_diagonal")
expr(0x3ef0, "spriteid_trapdoor_vertical")
entry(0x3ef1, "play_sound12")
ldx_ldy_jsr_play_sound_yx(0x3ef7, "sound1")
ldx_ldy_jsr_play_sound_yx(0x3efe, "sound2")
entry(0x3f02, "room1_saxophone_and_brazier_handler")
expr(0x3f08, "objectid_brazier")
expr(0x3f16, "spriteid_saxophone_menu_item")
expr(0x3f18, make_add("toolbar_collectable_spriteids", "1"))
expr(0x3f1b, "spriteid_saxophone")
expr(0x3f1d, make_add("collectable_spriteids", "1"))
ldx_ldy_jsr_define_envelope(0x3f26, "envelope3")
comment(0x3f34, "The player has not collected the saxophone, so place it in the lower left of the room.")
expr(0x3f3d, "objectid_saxophone")
expr(0x3f48, sprite_dict)
expr(0x3f4d, "spriteid_saxophone")
entry(0x3f51, "return3")
entry(0x3f52, "not_first_room_update")
expr(0x3f56, "spriteid_saxophone_menu_item")
ldx_ldy_jsr_play_sound_yx(0x3f5f, "saxophone_sound")
entry(0x3f62, "dont_play_saxophone_sound")
expr(0x3f6e, "spriteid_saxophone")
expr(0x3f70, "object_spriteid + objectid_saxophone")
comment(0x3f72, "This is the state of the player as currently drawn on the screen, before being updated in the current game tick.")
expr(0x3f73, "objectid_old_player")
expr(0x3f75, "objectid_saxophone")
comment(0x3f7b, "Collect the saxophone.")
expr(0x3f83, "object_spriteid + objectid_saxophone")
entry(0x3f8a, "return6")
entry(0x3f8b, "copy_pseudo_circle_to_screen")
label(0x3fd5, "copy_pseudo_circle_to_screen_saved_x")
label(0x3fd6, "copy_pseudo_circle_to_screen_saved_y")
expr(0x3fe7, make_lo("tile_all_set_pixels"))
expr(0x3feb, make_hi("tile_all_set_pixels"))
expr(0x3ff3, "copy_mode_simple")
expr(0x4048, "exit_room_top")
label(0x4052, "baby_spriteid_data")
spriteid(0x4052, 0x407f, True)
label(0x4057, "baby_spriteid_smile")
label(0x405f, "baby_spriteid_stunned")
label(0x406b, "baby_spriteid_shrug")
label(0x4073, "baby_spriteid_none")
label(0x4074, "baby_spriteid_walk3")
label(0x407d, "baby_spriteid_dead")
entry(0x407f, "room2_update_handler")
ri(0x4084)
ri(0x4086)
ri(0x4088)
expr(0x4093, "objectid_spell")
expr(0x40a3, make_subtract("baby_spriteid_dead", "baby_spriteid_data"))
entry(0x40b2, "have_valid_baby_properties_in_axy")
entry(0x40c1, "room2_update_handler_not_new_level")
expr(0x40c8, make_lo("envelope2"))
expr(0x40ca, make_hi("envelope2"))
expr(0x40d7, "objectid_baby")
expr(0x40dc, sprite_dict)
expr(0x40de, make_add("object_erase_type", "objectid_baby"))
entry(0x40e0, "room2_update_second_part_local")
label(0x40e3, "room2_update_handler_temp")
entry(0x40e4, "room2_not_first_update")
expr(0x40e8, make_subtract("baby_spriteid_dead", "baby_spriteid_data"))
entry(0x40ee, "baby_not_dead")
comment(0x40f4, "if at the end of one animation, start the same one (loop) or a new one")
entry(0x40f7, "have_specific_baby_spriteid")
expr(0x4101, make_subtract("baby_spriteid_dead", "baby_spriteid_data"))
expr(0x4105, "objectid_player")
expr(0x410a, "objectid_baby")
comment(0x4111, "set flags to reflect value in set flags to reflect value in A", inline=True)
expr(0x4116, "player_collision_flag_baby")
expr(0x4125, make_subtract("baby_spriteid_walk3", "baby_spriteid_data"))
entry(0x412b, "baby_spriteid_index_if_baby_spriteid_data_is_zero_set")
entry(0x412e, "player_not_collided_with_baby")
comment(0x412e, "Y contains the baby animation step")
expr(0x412f, make_subtract("baby_spriteid_none", "baby_spriteid_data"))
expr(0x4133, make_subtract("baby_spriteid_smile", "baby_spriteid_data"))
entry(0x4137, "check_for_using_saxophone")
expr(0x4141, "spriteid_saxophone_menu_item")
expr(0x4147, make_subtract("baby_spriteid_shrug", "baby_spriteid_data"))
comment(0x4156, "set baby dead")
expr(0x4157, make_subtract("baby_spriteid_dead", "baby_spriteid_data"))
entry(0x415e, "player_not_using_saxophone")
expr(0x415f, make_subtract("baby_spriteid_stunned", "baby_spriteid_data"))
comment(0x4162, "start walk cycle")
entry(0x4167, "baby_not_stunned")
ri(0x416a)
expr(0x417d, "baby_max_pixel_x")
ab(0x4182)
blank(0x4184)
entry(0x4184, "baby_pixel_x_speed_negative")
expr(0x4185, "baby_min_pixel_x")
ab(0x418a)
blank(0x418c)
label(0x418c, "baby_pixel_x_coordinate_is_max_or_min")
expr(0x418d, make_subtract("baby_spriteid_smile", "baby_spriteid_data"))
comment(0x4194, "reverse baby direction")
entry(0x4194, "baby_pixel_x_coordinate_outside_min_max")
entry(0x419f, "baby_pixel_x_coordinate_within_min_max")
entry(0x41ae, "move_baby")
entry(0x41c1, "baby_direction_negative")
entry(0x41c9, "baby_pixel_x_coordinate_updated")
expr(0x41d3, make_subtract("baby_spriteid_dead", "baby_spriteid_data"))
comment(0x41d6, "This is the dead baby sound")
entry(0x41d9, "room2_update_second_part")
expr(0x41e3, make_subtract("baby_spriteid_dead", "baby_spriteid_data"))
expr(0x41f4, make_subtract("baby_spriteid_dead", "baby_spriteid_data"))
comment(0x41f7, "Add the baby to the collision map.")
entry(0x420c, "update_collision_map_for_baby")
comment(0x420c, "When the baby is killed, remove the baby from the collision map and add it at its new position.")
entry(0x4224, "baby_direction_negative2")
entry(0x4235, "set_baby_object_properties")
expr(0x4236, "objectid_baby")
entry(0x424c, "return5")
expr(0x42ee, "exit_room_left")
entry(0x42f8, "room3_update_handler")
expr(0x42fe, "objectid_brazier2")
comment(0x4323, "Set table_x_position to left side of screen")
expr(0x4324, "table_min_x")
ab(0x432d)
entry(0x432f, "set_table_x_position_to_right_side")
expr(0x4330, "table_max_x")
entry(0x4339, "table_x_position_update_finished") # if any...
ldx_ldy_jsr_define_envelope(0x4343, "envelope4")
expr(0x4347, "objectid_table")
expr(0x4349, "spriteid_table")
expr(0x434e, sprite_dict)
entry(0x4352, "add_table_to_collision_map_if_room_3_local")
entry(0x4355, "return4_local")
entry(0x4358, "room3_not_first_update")
expr(0x4367, "table_max_x")
expr(0x436e, "object_collided_right_wall")
expr(0x4377, "objectid_player")
expr(0x4379, "objectid_table")
ab(0x4384)
entry(0x4386, "table_at_max_x_position")
expr(0x438a, "object_collided_left_wall")
expr(0x4393, "objectid_player")
expr(0x4395, "objectid_table")
entry(0x43a0, "move_table")
expr(0x43ad, "table_min_x")
expr(0x43b1, "table_max_x")
entry(0x43b4, "moving_table_hit_wall")
expr(0x43cc, make_add("sound_priority_per_channel_table","1"))
entry(0x43ce, "ready_to_play_table_hit_wall_sound")
entry(0x43d4, "moving_table_not_hit_wall")
ldx_ldy_jsr_play_sound_yx(0x43e0, "some_sound4")
entry(0x43e3, "remove_table_from_collision_map_at_old_table_x_position")
entry(0x43f6, "add_table_to_collision_map_if_room_3")
comment(0x43fc, "Add the table to the collision map and set its object position.")
expr(0x4411, "objectid_table")
entry(0x4415, "return4")
sound(0x446e, "mouse_ball_sound3")
sound(0x4476, "mouse_ball_sound2")
sound(0x447e, "mouse_ball_sound1")
tile_bitmap2x2(0x4486, "ground_fill_2x2")
comment(0x448e, "Note that the next three tiles are all identical. This is done because the 'tiling' code in copy_rectangle_of_memory_to_screen for copy_mode=1 uses a 2x2 tiling arrangement.")

print("""; *************************************************************************************
;
; Level A: SAXOPHOBIA
;
; Save game variables:
;
;     save_game_level_a_room1_trapdoor_open_flag                     ($09ff):
;               0: closed
;               1: partway open
;             $ff: taken
;
;     save_game_level_a_saxophone_collected_flag                     ($0a00):
;               0: untouched
;             $ff: taken
;
;     save_game_level_a_table_x_position                             ($0a01):
;             $0a: leftmost position
;             $16: rightmost position
;             (cell based X position)
;
;     save_game_level_a_table_x_speed                                ($0a02):
;               0: not moving
;               1: moving right
;             $ff: moving left
;
;     save_game_level_a_room_2_baby_pixel_x_coordinate               ($0a03):
;
;     save_game_level_a_room_2_baby_direction                        ($0a04):
;               0: not moving
;               1: moving right
;             $ff: moving left
;
; Solution:
;
;   1. Climb between the mice and time the climb to get above the ball.
;   2. Exit to the right by bouncing off the right mouse's head.
;   3. Walk to the right over the trapdoor.
;   4. Drop down and as the cat bump into the table to slide it to the left.
;   5. Jump onto the table and out of the room, to the left.
;   6. Collect the saxophone, and make your way back to the trapdoor.
;   7. Hold the saxophone to drop through the trapdoor.
;   8. As the cat, jump onto the baby's ledge and as the wizard quickly use the saxophone
;      to stun/kill? the baby.
;   9. Collect the spell.
;
; *************************************************************************************
""")

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
