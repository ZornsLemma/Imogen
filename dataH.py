from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_horizontal_rail",
    0xc9: "spriteid_rail_left_corner",
    0xca: "spriteid_rail_right_corner",
    0xcb: "spriteid_cache1",
    0xcc: "spriteid_long_rope_end",
    0xcd: "spriteid_cache2",
    0xce: "spriteid_boulder",
    0xcf: "spriteid_table",
    0xd0: "spriteid_fruit",
    0xd1: "spriteid_stalk_top",
    0xd2: "spriteid_stalk_middle",
    0xd3: "spriteid_stalk_bottom",
    0xd4: "spriteid_missing",
    0xd5: "spriteid_way_out",
    0xd6: "spriteid_leaf",
    0xd7: "spriteid_rabbit_walk_1",
    0xd8: "spriteid_rabbit_walk_2",
    0xd9: "spriteid_rabbit_walk_3",
    0xda: "spriteid_rabbit_sit",
    0xdb: "spriteid_rabbit_push",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Multiple rooms
constant(2, "objectid_fruit")

# Room 0
constant(3, "objectid_rail_rope_end")
constant(5, "objectid_spell")

# Room 2
constant(3, "objectid_rabbit")


set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataH.dat", "6502", "3d927ff3b282f49da420b7573be7935b")

common_to_all('H')
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3df8,0x3e30): {
        "movement_low": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

label(0x0070, "movement_low")
label(0x0071, "movement_high")
label(0x0078, "object_left_cell_x")
label(0x0079, "object_right_cell_x")
label(0x007a, "object_top_cell_y")

label(0x0a1a, "save_game_level_h_rail_rope_x_cell")
label(0x0a1b, "save_game_level_h_rail_rope_current_dir")
label(0x0a1c, "save_game_level_h_current_fruit_animation")
label(0x0a1d, "save_game_level_h_fruit_animation_step")
label(0x0a1e, "save_game_level_h_fruit_x_low")
label(0x0a1f, "save_game_level_h_fruit_x_high")
label(0x0a20, "save_game_level_h_fruit_y_low")
label(0x0a21, "save_game_level_h_fruit_y_high")
label(0x0a22, "save_game_level_h_fruit_room")
label(0x0a23, "save_game_level_h_current_fruit_direction")

label(0x0a6f, "fruit_timer")
label(0x0a70, "rabbit_sprite_animation")
label(0x0a71, "rabbit_sprite_animation_step")
label(0x0a72, "rabbit_x")
label(0x0a73, "rabbit_direction")
label(0x0a74, "rabbit_speed")

label(0x38ae, "object_erase_type + objectid_fruit")
label(0x38af, "object_erase_type + objectid_rabbit")
label(0x3970, "sound_priority_per_channel_table + 1")
comment(0x3af3, "check for level change (branch if not)")
label(0x3afe, "developer_mode_inactive")
ground_fill(0x3afe)
expr(0x3b80, sprite_dict)
expr(0x3b87, sprite_dict)
expr(0x3bbd, "objectid_spell")
comment(0x3bc1, "check for first update in room (branch if so)")
comment(0x3bc9, "check for level change (branch if not)")
label(0x3bc9, "room_0_first_update")
comment(0x3bcf, "initiailise new level")
ldx_ldy_jsr_define_envelope(0x3bd3, "envelope1")
comment(0x3be2, "set rail rope to far left")
label(0x3bea, "set_rail_rope_to_far_right")
label(0x3bf2, "set_rail_rope_to_initial_position")
label(0x3bf7, "stop_rail_rope")
label(0x3bfc, "rail_rope_not_moving")
comment(0x3bfc, "check for being in room 0, and branch otherwise")
label(0x3baa, "room_0_update_handler")
comment(0x3c02, "in room 0. set rail collision")
comment(0x3c15, "draw rail itself, with corners")
expr(0x3c17, sprite_dict)
label(0x3c1e, "draw_rail_loop")
expr(0x3c27, sprite_dict)
comment(0x3c2b, "draw end of rope on the rail")
expr(0x3c2c, sprite_dict)
expr(0x3c2e, "object_spriteid + objectid_rail_rope_end")
expr(0x3c31, sprite_dict)
expr(0x3c33, "object_erase_type + objectid_rail_rope_end")
label(0x3c35, "set_rail_rope_object_position_and_collision_map_local1")
label(0x3c38, "check_if_player_is_on_room_0_rope")
expr(0x3c46, "spriteid_icodata_monkey")
expr(0x3c4a, "objectid_player")
expr(0x3c4c, "objectid_rail_rope_end")
expr(0x3c56, "monkey_climb_animation - monkey_base_animation")
expr(0x3c5a, "monkey_climb_idle_animation - monkey_base_animation")
expr(0x3c5e, "monkey_climb_down_animation - monkey_base_animation")
label(0x3c61, "player_is_on_rope")
label(0x3c64, "check_rope_direction")
comment(0x3c69, "check if player is on the rope")
comment(0x3c6e, "is the rail rope to the left? branch if not")
comment(0x3c75, "if the player is looking left, then branch")
comment(0x3c7a, "start moving the rail rope right")
comment(0x3c80, "if the player is looking right, then branch")
label(0x3c80, "rail_rope_not_left")
comment(0x3c85, "start moving the rail rope left")
label(0x3c8b, "set_rail_rope_object_position_and_collision_map_local")
comment(0x3c8e, "add direction to cell x")
label(0x3c8e, "update_rail_x_position")
comment(0x3c98, "check if the player is on the rope, branch if not")
comment(0x3c9d, "multiply the direction by eight, and sign extend using x as the high byte")
comment(0x3cac, "add to the player x position")
comment(0x3cbd, "add to the player accessory x position")
label(0x3cce, "update_rail_moving_sound")
comment(0x3cce, "branch if rail rope is at either end")
comment(0x3cd9, "branch if not in room zero")
comment(0x3cdf, "make rail movement sound")
ldx_ldy_jsr_play_sound_yx(0x3ce5, "sound1")
label(0x3ceb, "rail_at_either_end")
comment(0x3cf6, "reset sound priorities")
label(0x3caa, "sign_extended")
label(0x3d05, "end_of_move_sound")
comment(0x3d08, "the following tests are redundant. branch if player is not on rope")
ri(0x3d0d)
comment(0x3d0f, "this test is redundant. branch if player is looking right")
comment(0x3d14, "this is redundant. player is on rope and looking left")
comment(0x3d16, "branch if not in room zero")
label(0x3d16, "set_rail_rope_object_position_and_collision_map")
comment(0x3d1c, "position the rail rope")
expr(0x3d22, "objectid_rail_rope_end")
comment(0x3d26, "write to the collision map")
comment(0x3d3c, "write zero to either side of the rail rope")
label(0x3d49, "return1")
label(0x3d4a, "player_is_on_room_0_rope_flag")
expr(0x3df1, sprite_dict)
label(0x3e08, "room_1_check_left_exit")
expr(0x3e0b, "exit_room_left")
label(0x3e15, "room_1_check_right_exit")
expr(0x3e18, "exit_room_right")
label(0x3e22, "room_1_update_handler")
spriteid(0x3ec3, 0x3ed4, True)
label(0x3ec3, "rabbit_sprites_base")
label(0x3ec4, "rabbit_walk_sprites")
label(0x3ec9, "rabbit_sit_sprites")
label(0x3ecb, "rabbit_push_sprites")
label(0x3ed4, "update_rabbit_puzzle")
comment(0x3ed4, "check for first update in room (branch if not)")
comment(0x3ed9, "check for level change (branch if not)")
comment(0x3edf, "new level")
expr(0x3ee0, "rabbit_sit_sprites  - rabbit_sprites_base")
label(0x3ef9, "new_room_only1")
ldx_ldy_jsr_define_envelope(0x3efd, "envelope2")
expr(0x3f10, sprite_dict)
expr(0x3f17, "object_y_low + objectid_rabbit")
label(0x3f19, "update_rabbit_object_local")
label(0x3f1c, "update_rabbit_not_first_update")
label(0x3f2d, "got_animation_step_y")
comment(0x3f33, "in room 2")
expr(0x3f34, "objectid_rabbit")
expr(0x3f39, "objectid_player")
expr(0x3f45, "rabbit_push_sprites - rabbit_sprites_base")
expr(0x3f47, "rabbit_sit_sprites  - rabbit_sprites_base")
expr(0x3f54, "object_x_low + objectid_rabbit")
ab(0x3f62)
label(0x3f64, "player_bounces_off_the_rabbit_to_the_left")
blank(0x3f64)
label(0x3f6e, "update_rabbit_animation_step_local")
label(0x3f71, "rabbit_animation")
expr(0x3f75, "rabbit_sit_sprites  - rabbit_sprites_base")
expr(0x3f7e, "rabbit_walk_sprites - rabbit_sprites_base")
label(0x3f93, "reverse_direction")
label(0x3f9e, "rabbit_is_hopping_along")
expr(0x3fa2, "rabbit_walk_sprites - rabbit_sprites_base")
expr(0x3fa6, "fruit_fall_sideways_animation1 - fruit_animation_base")
ldx_ldy_jsr_play_sound_yx(0x3fb8, "sound2")
ldx_ldy_jsr_play_sound_yx(0x3fbf, "sound3")
ldx_ldy_jsr_play_sound_yx(0x3fc6, "sound4")
label(0x3fcc, "move_rabbit")
label(0x3fe0, "rabbit_at_end_of_walking")
expr(0x3fe1, "rabbit_sit_sprites - rabbit_sprites_base")
expr(0x3fe6, "fruit_fall_sideways_animation1 - fruit_animation_base")
label(0x3fea, "update_rabbit_animation_step")
label(0x3fed, "update_rabbit_object")
comment(0x3ff3, "in room 2. set rabbit object")
expr(0x3ffa, "object_spriteid + objectid_rabbit")
expr(0x4000, "object_x_low + objectid_rabbit")
expr(0x4006, "object_direction + objectid_rabbit")
label(0x4008, "return2")
label(0x4009, "remember_y")
expr(0x408d, sprite_dict)
comment(0x40b9, "(x,y) fruit offsets for animation")
label(0x40b9, "fruit_animation_base")
byte(0x40b9)
label(0x40ba, "fruit_initial_idle_animation")
byte(0x40ba, 2)
byte(0x40bc)
label(0x40bd, "fruit_fall_sideways_animation1")
byte(0x40bd, 2)
byte(0x40bf, 2)
byte(0x40c1, 2)
byte(0x40c3, 2)
byte(0x40c5)
label(0x40c6, "fruit_stopped_animation")
byte(0x40c6, 2)
byte(0x40c8)
label(0x40c9, "fruit_sideways_animation")
byte(0x40c9, 2)
byte(0x40cb)
label(0x40cc, "fruit_fall_sideways_animation2")
byte(0x40cc, 2)
byte(0x40ce, 2)
byte(0x40d0, 2)
byte(0x40d2)
label(0x40d3, "fruit_fall_straight_down_animation")
byte(0x40d3, 2)
byte(0x40d5)
label(0x40d6, "update_fruit_puzzle")
comment(0x40d6, "check for first update in room (branch if so)")
comment(0x40de, "check for level change (branch if not)")
label(0x40de, "update_fruit_first_update")
comment(0x40e4, "new level. initialise fruit")
ldx_ldy_jsr_define_envelope(0x40e8, "envelope3")
expr(0x40f4, "fruit_stopped_animation - fruit_animation_base")
expr(0x40f8, "fruit_initial_idle_animation - fruit_animation_base")
expr(0x411f, "fruit_initial_idle_animation - fruit_animation_base")
label(0x4126, "new_room_only2")
comment(0x412e, "draw room 3 plant")
label(0x4137, "not_room_3")
expr(0x4138, sprite_dict)
label(0x4146, "fast_forward_fruit_animation_loop")
label(0x4159, "fruit_not_done_yet")
label(0x415f, "fruit_fully_fast_forwarded")
expr(0x4160, "collision_map_solid_rock")
label(0x4167, "update_fruit_timer")
label(0x4176, "return3_local")
label(0x4179, "reset_sound_priorities")
label(0x4188, "continue_updating_fruit")
label(0x419a, "in_fruit_room")
expr(0x419e, "fruit_fall_sideways_animation2 - fruit_animation_base")
label(0x41ac, "fruit_falling_right")
label(0x41af, "fruit_falling_left")
expr(0x41b5, "objectid_fruit")
label(0x41be, "check_for_fruit_falling_sideways1")
expr(0x41c2, "fruit_fall_sideways_animation1 - fruit_animation_base")
expr(0x41c9, "fruit_sideways_animation - fruit_animation_base")
comment(0x41cc, "check for left or right fruit-wall collision")
expr(0x41d3, "objectid_fruit")
label(0x41d9, "end_of_fall_sound")
expr(0x41dc, make_lo("sound1"))
expr(0x41de, make_hi("sound1"))
label(0x41e5, "play_landing_sound_local")
label(0x41e8, "check_for_fruit_falling_straight_down")
expr(0x41e9, "fruit_fall_straight_down_animation - fruit_animation_base")
expr(0x41f2, "objectid_fruit")
comment(0x41f8, "fruit collision sound")
ldx_ldy_jsr_play_sound_yx(0x41fe, "sound5")
ldx_ldy_jsr_play_sound_yx(0x4205, "sound6")
label(0x4208, "write_solid_fruit_collision")
expr(0x4209, "collision_map_solid_rock")
label(0x420d, "return3")
label(0x420e, "update_fruit_animation")
label(0x421f, "got_fruit_animation_step_y")
expr(0x4223, "fruit_initial_idle_animation - fruit_animation_base")
expr(0x4227, "objectid_player")
expr(0x422c, "objectid_fruit")
comment(0x4233, "branch if player and fruit didn't collide")
label(0x4249, "no_player_fruit_collision")
label(0x424c, "check_for_fruit_stopped")
expr(0x4250, "fruit_stopped_animation - fruit_animation_base")
comment(0x4253, "check for first update in room (branch if so)")
expr(0x425f, "objectid_player")
expr(0x4264, "objectid_fruit")
expr(0x4284, "object_collided_right_wall")
expr(0x428d, "object_collided_left_wall")
label(0x4290, "found_fruit_wall_collision")
expr(0x4294, "collision_map_none")
expr(0x4299, "fruit_sideways_animation - fruit_animation_base")
label(0x429d, "check_for_fruit_going_sideways")
expr(0x42a1, "fruit_sideways_animation - fruit_animation_base")
expr(0x42b3, "objectid_fruit")
label(0x4324, "fruit_moving_right")
label(0x432b, "add_to_fruit_x_position")
comment(0x433a, "add offset to fruit y position")
expr(0x4350, "objectid_fruit")
comment(0x4357, "move fruit to next room")
expr(0x435b, "fruit_fall_straight_down_animation - fruit_animation_base")
expr(0x435f, "fruit_sideways_animation - fruit_animation_base")
expr(0x42d5, "fruit_fall_sideways_animation2 - fruit_animation_base")
expr(0x42e0, "fruit_fall_sideways_animation2 - fruit_animation_base")
expr(0x42e9, "fruit_fall_straight_down_animation - fruit_animation_base")
label(0x42ed, "check_for_fruit_falling_straight_down1")
expr(0x4304, "objectid_fruit")
expr(0x4310, "fruit_stopped_animation - fruit_animation_base")
label(0x4314, "update_fruit_position")
label(0x42dc, "check_for_fruit_fall_sideways2")
comment(0x43da, "we want to write a non-zero value to the collision map. check the fruit is stopped before doing so")
label(0x43e1, "valid_write")
comment(0x43e1, "check we are in the same room as the fruit (return if not)")
comment(0x43e8, "calculate the x cell coordinate to write to")
comment(0x43f9, "calculate the y cell coordinate to write to")
comment(0x440a, "fruit is 3x2 cells")
label(0x4383, "move_fruit_left_one_room")
comment(0x4387, "add 320 pixels to x position")
comment(0x436d, "subtract 320 pixels from x position")
label(0x439b, "check_for_moving_fruit_off_bottom_of_screen")
comment(0x43a1, "move fruit up 192 pixels")
comment(0x43aa, "set fruit to room 1 as this is the only possible destination room")
label(0x43af, "hide_fruit")
label(0x42af, "fruit_moving_left")
label(0x42b2, "check_fruit_rock_collision")
label(0x430a, "stop_the_fruit")
expr(0x42f1, "fruit_fall_straight_down_animation - fruit_animation_base")
expr(0x436a, "game_area_width_cells")
expr(0x439e, "game_area_height_cells")
expr(0x43b0, sprite_dict)
expr(0x43b2, "object_spriteid + objectid_fruit")
label(0x43b4, "return4")
label(0x43b5, "remember_y2")
label(0x43b6, "set_fruit_object_position")
expr(0x43ba, "object_x_low + objectid_fruit")
expr(0x43c0, "object_x_high + objectid_fruit")
expr(0x43c6, "object_y_low + objectid_fruit")
expr(0x43cc, "object_y_high + objectid_fruit")
expr(0x43cf, sprite_dict)
expr(0x43d1, "object_spriteid + objectid_fruit")
label(0x43d4, "write_fruit_collision_map")
expr(0x43de, "fruit_stopped_animation - fruit_animation_base")
label(0x441c, "return5")
label(0x441d, "draw_plant_a_at_cell_xy_and_add_to_collision_map")
expr(0x4425, sprite_dict)
expr(0x442a, "collision_map_rope")
label(0x442e, "draw_plant_loop")
expr(0x4430, sprite_dict)
expr(0x4435, "collision_map_rope")
expr(0x4440, sprite_dict)
expr(0x4445, "collision_map_rope")
expr(0x444b, "collision_map_solid_rock")
expr(0x4453, sprite_dict)
expr(0x4460, sprite_dict)
label(0x4464, "plant_height_loop_counter")

print("""; *************************************************************************************
;
; Level H: 'APPLESOURCE'
;
; Save game variables:
;
;     save_game_level_h_rail_rope_x_cell            ($0a1a):
;             $0c: left side position
;         $0d-$1a: rope is moving between left and right
;             $1b: right side position
;
;     save_game_level_h_rail_rope_current_dir       ($0a1b):
;               0: not moving
;               1: moving right
;             $ff: moving left
;
;     save_game_level_h_current_fruit_animation     ($0a1c):
;               0: not started
;               1: initial idle animation
;               4: fall sideways 1
;             $0d: stopped
;             $10: moving sideways
;             $13: fall sideways 2
;             $1a: fall straight down
;
;     save_game_level_h_fruit_animation_step        ($0a1d):
;         $00-$1c: animation index for the current fruit step
;
;     save_game_level_h_fruit_x_low                 ($0a1e):
;     save_game_level_h_fruit_x_high                ($0a1f):
;               pixel X position for fruit
;
;     save_game_level_h_fruit_y_low                 ($0a20):
;     save_game_level_h_fruit_y_high                ($0a21):
;               pixel Y position for fruit
;
;     save_game_level_h_fruit_room                  ($0a22):
;            $0-3: room the fruit is in
;
;     save_game_level_h_current_fruit_direction     ($0a23):
;         $ff/1/0: direction of fruit ($ff=left, $0,=none, $1=right)
;
; Solution:
;
;   1. move to the room on the right, climb the rope pointing left.
;   2. Jump at the point the rabbit turns away, and climb the flower.
;   3. Wait for the rabbit to go past, and continue into the room to the left.
;   4. Up the rope, knock the fruit to the right at the top center of the room
;       (The fruit falls into the room below)
;   5. Push the fruit to the right and follow it.
;       (The fruit falls)
;   6. Push the fruit to the left and follow it.
;   7. Use the cat to climb the fruit and use the monkey to climb the 'this way' rope,
;      and out of the room to the left.
;   8. Climb the leftmost rope, and jump onto (and hold) the rail rope to the other side.
;   9. Jump off the ropes to the right, then reverse direction and ride the rail back
;      to get to the spell.
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
