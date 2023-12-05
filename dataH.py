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

# Room 0
constant(3, "objectid_rail_rope_end")
constant(3, "objectid_rabbit")
constant(2, "objectid_fruit")

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
        "l0070": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

label(0x0a1a, "rail_rope_x_cell")
label(0x0a1b, "rail_rope_current_dir")
label(0x0a1c, "current_fruit_animation")
label(0x0a1d, "next_fruit_animation")
label(0x0a1e, "fruit_x_low")
label(0x0a1f, "fruit_x_high")
label(0x0a20, "fruit_y_low")
label(0x0a21, "fruit_y_high")
label(0x0a22, "fruit_room")
label(0x0a23, "current_fruit_direction")

label(0x0a70, "rabbit_sprite_animation")
label(0x0a71, "rabbit_sprite_animation_step")
label(0x0a72, "rabbit_x")
label(0x0a73, "rabbit_direction")
label(0x0a74, "rabbit_speed")

label(0x3970, "sound_priority_per_channel_table + 1")
comment(0x3af3, "check for level change (branch if not)")
label(0x3afe, "developer_mode_inactive")
ground_fill(0x3afe)
expr(0x3b80, sprite_dict)
expr(0x3b87, sprite_dict)
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
label(0x3ec7, "rabbit_walk_end_sprites")
label(0x3ec9, "rabbit_sit_sprites")
label(0x3ecb, "rabbit_push_sprites")
label(0x3ed4, "update_rabbit_puzzle")
comment(0x3ed4, "check for first update in room (branch if not)")
comment(0x3ed9, "check for level change (branch if not)")
comment(0x3edf, "new level")
expr(0x3ee0, "rabbit_sit_sprites  - rabbit_sprites_base")
label(0x3ef9, "new_room_only")
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
expr(0x3fa6, "rabbit_walk_end_sprites - rabbit_sprites_base")
ldx_ldy_jsr_play_sound_yx(0x3fb8, "sound2")
ldx_ldy_jsr_play_sound_yx(0x3fbf, "sound3")
ldx_ldy_jsr_play_sound_yx(0x3fc6, "sound4")
label(0x3fcc, "move_rabbit")
label(0x3fe0, "rabbit_at_end_of_walking")
expr(0x3fe1, "rabbit_sit_sprites - rabbit_sprites_base")
expr(0x3fe6, "rabbit_walk_end_sprites - rabbit_sprites_base")
label(0x3fea, "update_rabbit_animation_step")
label(0x3fed, "update_rabbit_object")
comment(0x3ff3, "in room 2. set rabbit object")
expr(0x3ffa, "object_spriteid + objectid_rabbit")
expr(0x4000, "object_x_low + objectid_rabbit")
expr(0x4006, "object_direction + objectid_rabbit")
label(0x4008, "return2")
label(0x4009, "remember_y")
expr(0x408d, sprite_dict)
label(0x40d6, "update_fruit_puzzle")
comment(0x40d6, "check for first update in room (branch if so)")
comment(0x40de, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x40e8, "envelope3")
expr(0x4138, sprite_dict)
expr(0x41dc, make_lo("sound1"))
expr(0x41de, make_hi("sound1"))
ldx_ldy_jsr_play_sound_yx(0x41fe, "sound5")
ldx_ldy_jsr_play_sound_yx(0x4205, "sound6")
label(0x420d, "return3")
comment(0x4253, "check for first update in room (branch if so)")
expr(0x43b0, sprite_dict)
expr(0x43b2, "object_spriteid + objectid_fruit")
label(0x43b4, "return4")
label(0x43b6, "set_fruit_object_position")
expr(0x43ba, "object_x_low + objectid_fruit")
expr(0x43c0, "object_x_high + objectid_fruit")
expr(0x43c6, "object_y_low + objectid_fruit")
expr(0x43cc, "object_y_high + objectid_fruit")
expr(0x43cf, sprite_dict)
expr(0x43d1, "object_spriteid + objectid_fruit")
label(0x441c, "return5")
expr(0x4425, sprite_dict)
expr(0x4430, sprite_dict)
expr(0x4440, sprite_dict)
expr(0x4453, sprite_dict)

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
