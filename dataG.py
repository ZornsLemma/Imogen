from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_balloon",
    0xc9: "spriteid_rope_end1",
    0xca: "spriteid_bow",
    0xcb: "spriteid_bow_menu_item",
    0xcc: "spriteid_arrow",
    0xcd: "spriteid_erase_cache1",
    0xce: "spriteid_table",
    0xcf: "spriteid_erase_cache2",
    0xd0: "spriteid_rope_bottom",
    0xd1: "spriteid_rope_top",
    0xd2: "spriteid_rope_top_broken",
    0xd3: "spriteid_burst_balloon",
    0xd4: "spriteid_baby",
    0xd5: "spriteid_baby_surprise",
    0xd6: "spriteid_baby_fall",
    0xd7: "spriteid_baby_dead",
    0xd8: "spriteid_wood_block",
    0xd9: "spriteid_baby_push",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Room 0
#constant(2, "objectid_left_mouse")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataG.dat", "6502", "fa09abf27f4e659e91ca57c63c2f2034")

common_to_all('G')
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x432e): {
        "l0070": "room_exit_direction",
    },
    (0x44ad,0x44e9): {
        "l0070": "temp_player_x",
    },
}

constant(2, "objectid_bow")
constant(2, "objectid_arrow")
constant(3, "objectid_balloon1")
constant(4, "objectid_balloon1_rope")
constant(5, "objectid_balloon2")
constant(6, "objectid_balloon2_rope")
constant(5, "objectid_table")
constant(6, "objectid_table_rope")
# Room 3
constant(5, "objectid_baby")

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

# Copied from g, where it's a 'local' substituted variable
label(0x0078, "object_left_cell_x")
label(0x0079, "object_right_cell_x")

label(0x0a17, "save_game_level_g_got_bow_or_arrow_in_flight_progress")
label(0x0a18, "save_game_level_g_dropped_table_progress")
label(0x0a19, "save_game_level_g_baby_progress")

label(0x0a6f, "arrow_direction")
label(0x0a70, "arrow_x_position_low")
label(0x0a71, "arrow_x_position_high")
label(0x0a72, "arrow_y_position_low")
label(0x0a73, "arrow_room")
label(0x0a74, "arrow_active_progress")
label(0x0a75, "room_1_left_hand_balloon_y_position")
label(0x0a76, "room_1_right_hand_balloon_y_position")
label(0x0a77, "room_3_balloon_y_position")
label(0x0a78, "room_0_balloon_y_position")
label(0x0a79, "room_3_baby_animation_step")
label(0x0a7a, "room_3_baby_y_position")

label(0x38b0, "object_erase_type + objectid_balloon1_rope")
label(0x38c6, "object_z_order + objectid_balloon1_rope")
label(0x3970, "sound_priority_per_channel_table+1")
comment(0x3af2, "check for level change (branch if not)")
label(0x3b02, "developer_mode_inactive")
expr(0x3b08, sprite_dict)
label(0x3b0c, "return1")
expr(0x3b7b, sprite_dict)
label(0x3ba0, "room_2_check_right_exit")
expr(0x3ba3, "exit_room_right")
label(0x3bad, "room_2_update_handler")
comment(0x3bbb, "check for first update in room (branch if not)")
ldx_ldy_jsr_define_envelope(0x3bc4, "envelope1")
comment(0x3bc7, "check for level change (branch if not)")
label(0x3bd7, "initialise_if_room_2")
comment(0x3bdd, "initialise room 2")
ldx_ldy_jsr_define_envelope(0x3be1, "envelope2")
expr(0x3be5, sprite_dict)
expr(0x3bf1, "object_z_order + objectid_balloon1")
expr(0x3bf4, sprite_dict)
expr(0x3bf6, "object_spriteid + objectid_table")
label(0x3bfb, "return2_local")
label(0x3bfe, "update_table_not_first_update")
comment(0x3c11, "check for arrow colliding with balloon")
expr(0x3c12, "objectid_arrow")
expr(0x3c14, "objectid_balloon1")
ldx_ldy_jsr_play_sound_yx(0x3c23, "sound1")
ldx_ldy_jsr_play_sound_yx(0x3c2a, "sound2")
label(0x3c30, "start_dropping_table")
label(0x3c35, "continue_dropping_table")
comment(0x3c3f, "finished dropping table")
label(0x3c47, "table_dropping_in_progress")
comment(0x3c4f, "are we in room 2? branch if not")
comment(0x3c55, "play table landing sounds")
ldx_ldy_jsr_play_sound_yx(0x3c5b, "sound3")
ldx_ldy_jsr_play_sound_yx(0x3c62, "sound4")
label(0x3c65, "write_fallen_table_to_collision_map")
comment(0x3c7c, "read collision map and skip if already written")
label(0x3c86, "update_balloon_bursting")
expr(0x3c9a, sprite_dict)
expr(0x3c9c, "object_spriteid + objectid_balloon1")
expr(0x3c9f, sprite_dict)
expr(0x3ca1, "object_spriteid + objectid_balloon1_rope")
label(0x3ca8, "burst_the_balloon")
expr(0x3ca9, sprite_dict)
expr(0x3cab, "object_spriteid + objectid_balloon1")
expr(0x3cae, sprite_dict)
expr(0x3cb0, "object_spriteid + objectid_balloon1_rope")
label(0x3cb7, "end_of_balloon")
expr(0x3cb9, sprite_dict)
expr(0x3cbb, "object_spriteid + objectid_balloon1")
expr(0x3cbe, sprite_dict)
expr(0x3cc0, "object_spriteid + objectid_balloon1_rope")
label(0x3cc5, "end_of_table_falling")
expr(0x3cc6, sprite_dict)
expr(0x3cc8, "object_spriteid + objectid_balloon1")
expr(0x3ccb, sprite_dict)
expr(0x3ccd, "object_spriteid + objectid_balloon1_rope")
label(0x3cd1, "update_table_and_rope_objects")
expr(0x3cd4, "objectid_table")
expr(0x3cd9, "objectid_balloon1_rope")
label(0x3d00, "return2")
label(0x3d01, "dropped_table_y")
comment(0x3d8b, "Baby animations. Each frame of animation is two bytes, the first byte for the sprite id and the second for the Y offset. Each animation is zero terminated.")
label(0x3d8b, "baby_animations")
label(0x3d8c, "baby_holding_rope_animation")
spriteid(0x3d8c)
label(0x3d8f, "baby_push_animation")
spriteid(0x3d8f)
spriteid(0x3d91)
spriteid(0x3d93)
spriteid(0x3d95)
spriteid(0x3d97)
spriteid(0x3d99)
spriteid(0x3d9b)
spriteid(0x3d9d)
label(0x3da0, "baby_surprise_animation")
spriteid(0x3da0)
label(0x3da3, "baby_fall_animation")
spriteid(0x3da3)
label(0x3da6, "baby_dead_animation")
spriteid(0x3da6)
label(0x3da9, "room_3_update_handler")
comment(0x3db7, "check for first update in room (branch if not)")
comment(0x3dbc, "check for level change (branch if not)")
comment(0x3dc2, "initialise baby progress, or set the baby progress to done if enough if in mid animation")
expr(0x3dc3, "baby_holding_rope_animation - baby_animations")
expr(0x3dca, "baby_holding_rope_animation - baby_animations")
expr(0x3dce, "baby_dead_animation - baby_animations")
label(0x3dcf, "initialise_baby_progress")
label(0x3dd5, "same_level_new_room")
comment(0x3dd5, "branch if not in room 3")
comment(0x3ddb, "define envelope for room 3")
ldx_ldy_jsr_define_envelope(0x3ddf, "envelope3")
comment(0x3de2, "set X position of baby and erase sprite")
expr(0x3de3, sprite_dict)
expr(0x3de5, "object_erase_type + objectid_baby")
expr(0x3dea, "object_x_low + objectid_baby")
label(0x3dec, "nothing_to_initialise")
label(0x3def, "room_3_update_not_first_update")
comment(0x3def, "increment the animation step, and loop if at end")
ri(0x3df9)
comment(0x3dfd, "set current step to start of baby animation")
label(0x3e00, "got_next_animation_step_in_y")
expr(0x3e04, "baby_holding_rope_animation - baby_animations")
expr(0x3e08, "baby_fall_animation - baby_animations")
label(0x3e0e, "baby_is_holding_rope")
comment(0x3e14, "check for arrow-baby collision")
expr(0x3e15, "objectid_baby")
expr(0x3e1a, "objectid_arrow")
comment(0x3e25, "got arrow baby collision")
ldx_ldy_jsr_play_sound_yx(0x3e2b, "sound5")
comment(0x3e2e, "hide arrow")
expr(0x3e2f, sprite_dict)
expr(0x3e31, "object_spriteid + objectid_arrow")
comment(0x3e33, "mark bow as being available to fire")
comment(0x3e38, "set baby y position, surprised, about to fall")
expr(0x3e3e, "baby_surprise_animation - baby_animations")
expr(0x3e40, "baby_fall_animation - baby_animations")
label(0x3e47, "check_for_player_baby_collision")
comment(0x3e52, "check for collision")
expr(0x3e53, "objectid_baby")
expr(0x3e58, "objectid_player")
comment(0x3e63, "collision_found")
expr(0x3e69, "baby_push_animation - baby_animations")
label(0x3e6d, "baby_is_falling")
expr(0x3e7d, make_lo("sound3"))
expr(0x3e7f, make_hi("sound3"))
expr(0x3e84, make_lo("sound4"))
expr(0x3e86, make_hi("sound4"))
label(0x3e8a, "skip_sound_since_not_in_room_3")
expr(0x3e8b, "baby_dead_animation - baby_animations")
label(0x3e92, "reset_sound_priorities_if_in_room_3")
label(0x3ea7, "set_baby_animation_step_to_y")
comment(0x3eab, "add y offset at current animation step")
label(0x3eb5, "set_baby_object_sprite_if_in_room_3")
expr(0x3ec2, "object_spriteid + objectid_baby")
expr(0x3ec8, "baby_dead_animation - baby_animations")
expr(0x3ece, "object_z_order + objectid_baby")
expr(0x3ed4, "baby_holding_rope_animation - baby_animations")
expr(0x3eda, "object_y_low + objectid_baby")
label(0x3edf, "set_baby_y_position")
expr(0x3ee3, "object_y_low + objectid_baby")
label(0x3ee8, "baby_is_dead")
expr(0x3eeb, "object_z_order + objectid_baby")
expr(0x3ef0, "object_y_low + objectid_baby")
label(0x3f0c, "update_room_3_bits")
expr(0x3f21, "baby_holding_rope_animation - baby_animations")
label(0x3f3c, "temp_remember_animation_step")
expr(0x3fa7, sprite_dict)
label(0x3fd7, "room_0_update_handler")
ri(0x3fdc)
ri(0x3fde)
ri(0x3fe0)
comment(0x3ffc, "check for first update in room (branch if so)")
label(0x4004, "initialise_room_0")
expr(0x4005, sprite_dict)
expr(0x400a, sprite_dict)
ldx_ldy_jsr_define_envelope(0x4015, "envelope4")
ldx_ldy_jsr_define_envelope(0x401c, "envelope5")
ldx_ldy_jsr_define_envelope(0x4023, "envelope6")
comment(0x4026, "check for level change (branch if not)")
comment(0x402c, "new level. If arrow is in flight (non_zero), then stop it, and mark we have got the bow ($ff).")
label(0x4036, "no_level_change")
expr(0x4037, sprite_dict)
expr(0x4039, "object_erase_type + objectid_bow")
expr(0x403e, "object_y_high + objectid_bow")
comment(0x4045, "position bow in room 0")
expr(0x4059, sprite_dict)
expr(0x405b, "object_spriteid + objectid_bow")
label(0x405d, "return3")
comment(0x405e, "If returning to a room where the arrow is in flight, then play the arrow's flight in a loop until done")
label(0x405e, "fast_forward_arrow_progress")
comment(0x4062, "arrow is in the air. Check: Is it in the current room? Branch if not.")
comment(0x4069, "update arrow object in the current room")
label(0x406c, "arrow_in_flight_loop")
expr(0x407c, "objectid_arrow")
label(0x4086, "got_bow")
expr(0x4087, sprite_dict)
expr(0x4089, "object_spriteid_old + objectid_bow")
label(0x408b, "return4_local")
label(0x408e, "update_arrow_active_progress_local")
label(0x4091, "room_0_not_first_update")
comment(0x4091, "Check if the arrow is still in the room (branch if not)")
comment(0x4096, "return if not in room 0")
comment(0x409c, "check for player and bow collision, return if none")
expr(0x409d, "objectid_old_player")
expr(0x409f, "objectid_bow")
comment(0x40a5, "add bow to toolbar")
expr(0x40a6, sprite_dict)
comment(0x40aa, "remove bow object's sprite")
expr(0x40ab, sprite_dict)
expr(0x40ad, "object_spriteid + objectid_bow")
comment(0x40af, "decrement value to $ff, meaning the bow is in the posession of the player and the arrow is not flying through the air")
label(0x40b5, "update_arrow")
expr(0x40bb, "object_spriteid_old + objectid_bow")
comment(0x40c2, "check if player is using the bow. Branch if not.")
expr(0x40c3, sprite_dict)
comment(0x40c9, "check if player just started using the bow this frame. Branch if not. Otherwise decrement X to 255.")
label(0x40cf, "store_bow_just_used_flag")
ab(0x40ec)
blank(0x40ee)
label(0x40ee, "arrow_is_available_to_fire")
label(0x40f3, "arrow_just_fired")
comment(0x40fb, "Arrow just fired: set the arrow room to the current room")
comment(0x4100, "arrow is fired in the same direction as the player")
comment(0x4106, "arrow position is set to the player accessory position (i.e. the bow position)")
comment(0x4118, "count the arrow in flight progress")
comment(0x411d, "position the actual arrow object")
expr(0x4121, "objectid_arrow")
label(0x4125, "arrow_is_in_current_room")
label(0x4134, "check_for_player_bow_collision")
expr(0x4138, "object_spriteid_old + objectid_bow")
expr(0x413b, "objectid_old_player")
expr(0x413d, "objectid_bow")
expr(0x4144, "objectid_bow")
expr(0x4157, "object_spriteid + objectid_bow")
label(0x415b, "play_arrow_fired_sound")
ldx_ldy_jsr_play_sound_yx(0x4161, "sound6")
ldx_ldy_jsr_play_sound_yx(0x4168, "sound7")
label(0x416b, "update_arrow_collision_sound_local")
label(0x4171, "player_collided_with_bow")
expr(0x4172, sprite_dict)
expr(0x4174, "object_spriteid + objectid_bow")
label(0x417e, "update_arrow_active_progress")
label(0x4186, "return4")
label(0x4187, "player_just_started_using_bow_flag")
label(0x4188, "arrow_just_fired_flag")
label(0x4189, "bow_or_arrow_spriteid")
label(0x418a, "update_arrow_wall_collision")
expr(0x4196, "objectid_arrow")
comment(0x419c, "arrow hit wall. Hide arrow, and reset arrow in flight progress")
expr(0x419d, sprite_dict)
expr(0x419f, "object_spriteid + objectid_arrow")
comment(0x41a4, "set flag to indicate the player has the bow/arrow")
label(0x41ac, "move_arrow_in_arrow_direction")
comment(0x41b3, "invert A. [since A=8 at this point, could just 'lda #f8' here instead]")
label(0x41b8, "skip_invert_if_arrow_moving_left")
comment(0x41b8, "sign extend arrow velocity in A to 16 bit 'XA' value")
label(0x41bf, "add_offset_to_arrow_object_position")
expr(0x41d1, "objectid_arrow")
expr(0x41d6, "objectid_arrow")
comment(0x41dc, "move arrow")
expr(0x41e2, "object_x_low + objectid_arrow")
expr(0x41e8, "object_x_low + objectid_arrow")
expr(0x41eb, "object_x_high + objectid_arrow")
expr(0x41f0, "object_x_high + objectid_arrow")
label(0x41f5, "arrow_going_left")
expr(0x41f6, "object_x_low + objectid_arrow")
expr(0x41fc, "object_x_low + objectid_arrow")
expr(0x41ff, "object_x_high + objectid_arrow")
expr(0x4204, "object_x_high + objectid_arrow")
label(0x4206, "copy_arrow_position")
expr(0x4207, "object_x_low + objectid_arrow")
expr(0x420d, "object_x_high + objectid_arrow")
expr(0x4213, "object_y_low + objectid_arrow")
expr(0x4218, "objectid_arrow")
expr(0x4219, "objectid_arrow")
comment(0x421d, "check arrow direction, and check if off the edge of the room")
comment(0x4222, "check if arrow is off the right edge of the room")
expr(0x4225, "game_area_width_cells")
comment(0x4228, "subtract 320 from the arrow x position and increment the arrow room number to move it one room to the right")
label(0x423e, "check_if_arrow_is_off_the_left_edge_of_the_room")
comment(0x4242, "add 320 to the arrow x position and decrement the arrow room number to move it one room to the left")
label(0x4253, "hide_arrow_object_sprite")
expr(0x4254, sprite_dict)
expr(0x4256, "object_spriteid + objectid_arrow")
label(0x4258, "return5")
label(0x4259, "set_arrow_object")
expr(0x425d, "object_x_low + objectid_arrow")
expr(0x4263, "object_x_high + objectid_arrow")
expr(0x4269, "object_y_low + objectid_arrow")
expr(0x426e, "object_y_high + objectid_arrow")
expr(0x4274, "object_direction + objectid_arrow")
expr(0x4277, sprite_dict)
expr(0x4279, "object_spriteid + objectid_arrow")
expr(0x427e, "object_z_order + objectid_arrow")
label(0x4281, "update_arrow_collision_sound")
expr(0x4294, "objectid_arrow")
comment(0x429a, "arrow thud")
ldx_ldy_jsr_play_sound_yx(0x42a0, "sound8")
label(0x42a3, "return6")
label(0x4324, "room_1_check_right_exit")
expr(0x4327, "exit_room_right")
label(0x4331, "room_1_update_handler")
comment(0x436c, "check for first update in room (branch if not)")
comment(0x4371, "check for level change (branch if not)")
expr(0x4396, sprite_dict)
expr(0x439e, sprite_dict)
label(0x43b0, "return_with_balloon_position_in_xy_local")
comment(0x43c2, "move player down four pixels")
label(0x43f0, "move_balloon_down_with_player")
label(0x43d8, "move_down_by_smaller_amounts_until_no_collision_loop")
expr(0x43de, "objectid_player")
ri(0x43fc)
expr(0x440c, "objectid_player")
label(0x4418, "move_balloon_upwards")
label(0x442b, "store_ballon_y")
comment(0x4377, "new level. Set the balloon to the topmost position")
label(0x437d, "set_balloon_and_rope_end_object_positions")
label(0x43ad, "update_balloon_object_if_in_room_local")
label(0x43b3, "update_balloon_not_first_update")
label(0x3bf8, "update_balloon_bursting_local")
label(0x3f2d, "store_min_balloon_y")
label(0x4366, "update_balloon")
label(0x44f4, "inhibit_monkey_climb_flag_local")
label(0x4448, "update_balloon_object_if_in_room")
comment(0x445e, "update collision map")
label(0x449b, "clear_final_collisions_map_cell")
label(0x44a0, "return_with_balloon_position_in_xy")
label(0x44a7, "downwards_movement_while_player_is_holding_balloon")
label(0x44a8, "balloon_cell_x")
label(0x44a9, "balloon_pixel_y")
label(0x44aa, "balloon_min_pixel_y")
label(0x44ab, "balloon_objectid")
label(0x44ac, "rope_end_objectid")
label(0x44ad, "check_if_monkey_can_climb")
expr(0x44b5, "spriteid_icodata_monkey")
expr(0x44e0, "monkey_climb_animation - monkey_base_animation")
expr(0x44e4, "monkey_climb_idle_animation - monkey_base_animation")
expr(0x44e8, "monkey_climb_down_animation - monkey_base_animation")
label(0x44eb, "stop_monkey_from_climbing")
label(0x44f3, "return7")

print("""; *************************************************************************************
;
; Level G: 'BALLOONACY'
;
; Save game variables:
;
;     save_game_level_g_got_bow_or_arrow_in_flight_progress ($0a17):
;               0: not got bow
;              1+: arrow is in flight
;             $ff: bow is ready to fire arrow
;
;     save_game_level_g_dropped_table_progress ($0a18):
;               0: table suspended
;              1+: table falling (y position)
;             $ff: table fully fallen
;
;     save_game_level_g_baby_progress ($0a19):
;               0: not started
;              1+: animations in progress
;             $ff: dead
;
; Solution:
;
;   1. Move left into the room with the two balloons on short pieces of rope. Hang from one
;      and jump off at the appropriate time to continue left to the leftmost room.
;   2. Navigate the balloon and ropes to get to the bow in the top left corner.
;   3. Go back to the start room, and fire the bow at the balloon above the suspended table.
;      (The table falls)
;   4. As the cat, climb over the table and into the rightmost room.
;   5. Shoot the baby/imp with the arrow, to clear the way for you to get to the spell.
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
