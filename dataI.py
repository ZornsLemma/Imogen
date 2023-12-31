from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_small_stone",
    0xc9: "spriteid_erase_small_stone",
    0xca: "spriteid_stone_menu_item",
    0xcb: "spriteid_big_stone",
    0xcc: "spriteid_erase_big_stone_or_rope_end",
    0xcd: "spriteid_erase_seesaw",
    0xce: "spriteid_seesaw",
    0xcf: "spriteid_erase_sword",
    0xd0: "spriteid_sword",
    0xd1: "spriteid_sword_menu_item",
    0xd2: "spriteid_sword_spinA",
    0xd3: "spriteid_sword_spinB",
    0xd4: "spriteid_sword_spinC",
    0xd5: "spriteid_sword_spinD",
    0xd6: "spriteid_left_hook",
    0xd7: "spriteid_right_hook",
    0xd8: "spriteid_horizontal_rope",
    0xd9: "spriteid_short_rope",
    0xda: "spriteid_long_rope_end1",
    0xdb: "spriteid_long_rope_end2",
    0xdc: "spriteid_rope_broken",
    0xdd: "spriteid_boulder",
    0xde: "spriteid_short_rope_end",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Multiple rooms
constant(2, "objectid_small_stone_object")
constant(2+11, "objectid_old_small_stone_object")
constant(3, "objectid_seesaw")

# Room 0
constant(4, "objectid_sword")
constant(5, "objectid_big_stone_room_0")

# Room 2
constant(4, "objectid_spell")
constant(5, "objectid_boulder_room_2")
constant(6, "objectid_short_rope_end_room_2")
constant(7, "objectid_long_rope_end_room_2")
constant(8, "objectid_rope_end_room_2")

# Room 3
constant(4, "objectid_big_stone_room_3")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataI.dat", "6502", "1e1fababdd0af0374b4e238b4aa21c77")

common_to_all('I')
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x3bdc): {
        "l0070": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

label(0x0078, "object_left_cell_x")
label(0x0079, "object_right_cell_x")
label(0x007a, "object_top_cell_y")
label(0x007b, "object_bottom_cell_y")

label(0x0a24, "save_game_level_i_room_0_seesaw_puzzle_progress")
label(0x0a25, "save_game_level_i_sword_puzzle_progress")
label(0x0a26, "save_game_level_i_spell_puzzle_progress")
label(0x0a27, "save_game_level_i_small_stone_x_low")
label(0x0a28, "save_game_level_i_small_stone_x_high")
label(0x0a29, "save_game_level_i_small_stone_y_low")
label(0x0a2a, "save_game_level_i_small_stone_y_high")
label(0x0a2b, "save_game_level_i_small_stone_direction_without_bounces")
label(0x0a2c, "save_game_level_i_small_stone_room_0_seesaw_animation_step")
label(0x0a2d, "save_game_level_i_small_stone_room")
label(0x0a2e, "save_game_level_i_small_stone_direction_including_bounces")
label(0x0a2f, "save_game_level_i_room_3_seesaw_puzzle_progress")

label(0x3970, "sound_priority_per_channel_table + 1")
comment(0x3af1, "check for level change (branch if not)")
expr(0x3b02, sprite_dict)
label(0x3b06, "developer_mode_inactive")
comment(0x3b06, "if stone got, then add to toolbar")
expr(0x3b0c, sprite_dict)
label(0x3b10, "not_got_stone")
comment(0x3b10, "if sword got, then add to toolbar")
expr(0x3b16, sprite_dict)
label(0x3b1a, "not_got_sword")
comment(0x3b20, "in room 3. Switch to room 1, and set player position")
expr(0x3b2d, "objectid_player")
ground_fill(0x3b31)
label(0x3b31, "set_ground_tiles")
label(0x3bc5, "room_1_check_left_exit")
expr(0x3bc8, "exit_room_left")
label(0x3bd2, "room_1_check_right_exit")
expr(0x3bd5, "exit_room_right")
label(0x3bdf, "room_1_update_handler")
label(0x3c51, "spell_trajectory_y_coordinates_table")
byte(0x3c51, 11)
decimal(0x3c51, 22)
byte(0x3c5c, 11)
label(0x3c67, "room_2_update_handler")
expr(0x3c75, "objectid_spell")
comment(0x3c79, "check for first update in room (branch if so)")
comment(0x3c81, "check for level change (branch if not)")
label(0x3c81, "initialise_if_room_2")
label(0x3c91, "check_for_being_in_room_2")
label(0x3c9a, "initialise_room_2_objects")
ldx_ldy_jsr_define_envelope(0x3c9e, "envelope1")
ldx_ldy_jsr_define_envelope(0x3ca5, "envelope2")
expr(0x3cab, "object_z_order + objectid_spell")
expr(0x3cae, sprite_dict)
expr(0x3cb0, "object_erase_type + objectid_seesaw")
expr(0x3cbb, "objectid_seesaw")
expr(0x3cc0, sprite_dict)
expr(0x3cc2, "object_spriteid + objectid_seesaw")
expr(0x3cd3, sprite_dict)
expr(0x3cda, sprite_dict)
label(0x3ce2, "draw_room_2_horizontal_rope_loop")
label(0x3cf3, "got_room_2_rope_position")
expr(0x3d00, "collision_map_rope")
label(0x3d05, "draw_room_2_short_rope_loop")
expr(0x3d06, sprite_dict)
expr(0x3d0b, "collision_map_rope")
expr(0x3d15, "objectid_long_rope_end_room_2")
expr(0x3d1a, "objectid_rope_end_room_2")
expr(0x3d21, sprite_dict)
expr(0x3d23, "object_erase_type + objectid_rope_end_room_2")
label(0x3d30, "draw_rope_loop")
comment(0x3d38, "initialise rope end")
expr(0x3d39, sprite_dict)
expr(0x3d3b, "object_spriteid + objectid_short_rope_end_room_2")
expr(0x3d3e, "objectid_short_rope_end_room_2")
expr(0x3d45, "object_z_order + objectid_short_rope_end_room_2")
comment(0x3d47, "initialise boulder")
expr(0x3d48, sprite_dict)
expr(0x3d4a, "object_spriteid + objectid_boulder_room_2")
expr(0x3d4d, "objectid_boulder_room_2")
expr(0x3d55, "object_z_order + objectid_boulder_room_2")
label(0x3d57, "update_rope_and_seesaw_visuals_local")
label(0x3d5a, "update_spell")
label(0x3d69, "check_for_using_sword")
expr(0x3d73, sprite_dict)
label(0x3d88, "adjust_offsets_for_looking_left")
label(0x3d92, "check_for_sword_rope_collision")
expr(0x3d93, "objectid_player_accessory")
expr(0x3d95, "objectid_rope_end_room_2")
comment(0x3d99, "sword has cut rope. Change the collision map and update the progress")
label(0x3db1, "cutting_rope_in_progress")
expr(0x3dc7, "object_spriteid + objectid_spell")
label(0x3dd1, "update_landing_sound")
label(0x3de0, "sound_priorities_updated")
label(0x3de6, "rope_moving_sound")
ldx_ldy_jsr_play_sound_yx(0x3dec, "sound1")
label(0x3df2, "return1_local")
label(0x3df5, "update_rope_and_seesaw_visuals")
label(0x3e08, "got_seesaw_direction")
expr(0x3e0c, "object_direction + objectid_seesaw")
comment(0x3e13, "show rope in initial position")
expr(0x3e14, sprite_dict)
expr(0x3e16, "object_spriteid + objectid_long_rope_end_room_2")
expr(0x3e19, sprite_dict)
expr(0x3e1b, "object_spriteid + objectid_rope_end_room_2")
label(0x3e37, "skip_writing_to_collision_map")
label(0x3e3a, "set_rope_end_sprites")
expr(0x3e45, "object_y_low + objectid_long_rope_end_room_2")
expr(0x3e48, sprite_dict)
expr(0x3e4a, "object_spriteid + objectid_long_rope_end_room_2")
expr(0x3e4d, sprite_dict)
expr(0x3e4f, "object_spriteid + objectid_rope_end_room_2")
expr(0x3e55, "collision_map_none")
label(0x3e59, "set_right_hand_rope_and_boulder_objects")
label(0x3e6c, "got_rope_y_position")
expr(0x3e6d, "object_y_low + objectid_short_rope_end_room_2")
expr(0x3e73, "object_y_low + objectid_boulder_room_2")
expr(0x3e76, "object_y_low + objectid_short_rope_end_room_2")
expr(0x3e79, "object_y_low_old + objectid_short_rope_end_room_2")
expr(0x3e7e, sprite_dict)
expr(0x3e80, "object_spriteid_old + objectid_short_rope_end_room_2")
label(0x3e82, "update_spell_object_position")
expr(0x3e98, "object_x_low + objectid_spell")
expr(0x3e9e, "object_y_low + objectid_spell")
expr(0x3ea1, "object_direction + objectid_spell")
expr(0x3ea6, "object_x_low + objectid_spell")
label(0x3ea8, "return1")
label(0x3ea9, "room_2_rope_position")
expr(0x3f49, sprite_dict)
label(0x3f6c, "big_stone_room_3_seesaw_animation")
label(0x3f78, "small_stone_room_3_seesaw_animation")
comment(0x3fa4, "check for first update in room (branch if not)")
label(0x3fa4, "update_room_3_seesaw_puzzle")
comment(0x3fa9, "check for level change (branch if not)")
comment(0x3fb8, "level has changed. set to final position if it was halfway through the animation")
label(0x3fbd, "initialise_big_stone_and_seesaw_in_room_3")
expr(0x3fc4, sprite_dict)
expr(0x3fc6, "object_erase_type + objectid_big_stone_room_3")
expr(0x3fcb, "object_z_order + objectid_big_stone_room_3")
expr(0x3fce, sprite_dict)
expr(0x3fd0, "object_spriteid + objectid_big_stone_room_3")
expr(0x3fd3, sprite_dict)
expr(0x3fd5, "object_erase_type + objectid_seesaw")
expr(0x3fdc, "objectid_seesaw")
expr(0x3fe1, sprite_dict)
expr(0x3fe3, "object_spriteid + objectid_seesaw")
label(0x3fe5, "set_seesaw_direction_in_room_3_local")
label(0x3fe8, "update_room_3_not_first_update")
label(0x4009, "big_stone_lands")
label(0x400f, "check_for_player_big_stone_collision")
expr(0x4016, "objectid_old_player")
expr(0x4018, "objectid_big_stone_room_3")
comment(0x401e, "set big stone animation going")
label(0x4024, "check_for_player_small_stone_collision")
expr(0x402b, "objectid_old_player")
expr(0x402d, "objectid_small_stone_object")
comment(0x4033, "collected small stone object, add to toolbar")
expr(0x4034, sprite_dict)
comment(0x4038, "mark small stone as being in the player's possession")
comment(0x4040, "hide small stone object")
expr(0x4041, sprite_dict)
expr(0x4043, "object_spriteid + objectid_small_stone_object")
label(0x4045, "set_seesaw_direction_in_room_3")
expr(0x404e, "object_direction + objectid_seesaw")
expr(0x405c, "object_direction + objectid_seesaw")
label(0x4068, "set_big_stone_position_in_room_3")
expr(0x4072, "object_x_low + objectid_big_stone_room_3")
expr(0x407d, "object_y_low + objectid_big_stone_room_3")
expr(0x4087, "collision_map_solid_rock")
comment(0x4095, "position small stone to be animated. Animation step Y.")
expr(0x4096, sprite_dict)
expr(0x4098, "object_erase_type + objectid_small_stone_object")
expr(0x409d, "object_z_order + objectid_small_stone_object")
expr(0x40a0, sprite_dict)
expr(0x40a2, "object_spriteid + objectid_small_stone_object")
expr(0x40ae, "object_x_low + objectid_small_stone_object")
expr(0x40b5, "object_x_high + objectid_small_stone_object")
expr(0x40bf, "object_y_low + objectid_small_stone_object")
label(0x40c1, "return2")
label(0x40c2, "draw_top_and_bottom_rows_of_solid_rock")
expr(0x4147, sprite_dict)
label(0x4164, "big_stone_animation")
byte(0x4164, 2)
byte(0x4166, 2)
byte(0x4168, 2)
byte(0x416a, 2)
byte(0x416c, 2)
byte(0x416e, 2)
byte(0x4170, 2)
label(0x4174, "sword_animation")
byte(0x4174, 2)
byte(0x4176, 2)
byte(0x4178, 2)
byte(0x417a, 2)
byte(0x417c, 2)
byte(0x417e, 2)
byte(0x4180, 2)
byte(0x4182, 2)
byte(0x4184, 2)
byte(0x4186, 2)
byte(0x4188, 2)
byte(0x418a, 2)
byte(0x418c, 2)
byte(0x418e, 2)
byte(0x4190, 2)
label(0x4194, "sword_animation_spriteids")
expr(0x4194, "spriteid_sword_spinA - spriteid_small_stone")
expr(0x4195, "256 - (spriteid_sword_spinA - spriteid_small_stone)")
expr(0x4196, "256 - (spriteid_sword_spinB - spriteid_small_stone)")
expr(0x4197, "256 - (spriteid_sword_spinC - spriteid_small_stone)")
expr(0x4198, "256 - (spriteid_sword_spinD - spriteid_small_stone)")
expr(0x4199, "spriteid_sword_spinD - spriteid_small_stone")
expr(0x419a, "spriteid_sword_spinC - spriteid_small_stone")
expr(0x419b, "spriteid_sword_spinB - spriteid_small_stone")
expr(0x419c, "spriteid_sword_spinA - spriteid_small_stone")
expr(0x419d, "256 - (spriteid_sword_spinA - spriteid_small_stone)")
expr(0x419e, "256 - (spriteid_sword_spinB - spriteid_small_stone)")
expr(0x419f, "256 - (spriteid_sword_spinC - spriteid_small_stone)")
expr(0x41a0, "256 - (spriteid_sword_spinD - spriteid_small_stone)")
expr(0x41a1, "spriteid_sword_spinD - spriteid_small_stone")
expr(0x41a2, "spriteid_sword_spinC - spriteid_small_stone")
expr(0x41a3, "spriteid_sword_spinB - spriteid_small_stone")
comment(0x41a4, "check for first update in room (branch if not)")
label(0x41a4, "update_sword_puzzle")
expr(0x41af, sprite_dict)
expr(0x41b4, "collectable_being_used_spriteids+2")
comment(0x41b6, "check for level change (branch if not)")
comment(0x41bc, "if sword animation is not in progress, branch")
comment(0x41c5, "if sword animation was partway finished, then set it to finished (sword in wall)")
label(0x41ca, "check_for_room_0")
comment(0x41d0, "initialise room 0")
ldx_ldy_jsr_define_envelope(0x41d4, "envelope3")
comment(0x41d7, "initialise big stone")
expr(0x41d8, sprite_dict)
expr(0x41da, "object_erase_type + objectid_big_stone_room_0")
expr(0x41df, "object_z_order + objectid_big_stone_room_0")
expr(0x41e2, sprite_dict)
expr(0x41e4, "object_spriteid + objectid_big_stone_room_0")
comment(0x41e6, "initialise seesaw")
expr(0x41e7, sprite_dict)
expr(0x41e9, "object_erase_type + objectid_seesaw")
expr(0x41f4, "objectid_seesaw")
expr(0x41f9, sprite_dict)
expr(0x41fb, "object_spriteid + objectid_seesaw")
comment(0x41fd, "initialise sword")
expr(0x41fe, sprite_dict)
expr(0x41aa, sprite_dict)
expr(0x4200, "object_erase_type + objectid_sword")
expr(0x4205, "object_z_order + objectid_sword")
label(0x4207, "update_room_0_seesaw_animation_if_in_room_0_local")
label(0x420a, "update_sword_puzzle_not_first_update")
label(0x422d, "check_for_sword_hitting_wall_sound")
ldx_ldy_jsr_play_sound_yx(0x4238, "sword_thud_sound")
label(0x423e, "sword_puzzle_not_started_yet")
comment(0x4244, "check for small stone big stone collision")
expr(0x4245, "objectid_old_small_stone_object")
expr(0x4247, "objectid_big_stone_room_0")
comment(0x424d, "found small stone big stone collision")
label(0x4253, "sword_in_wall")
comment(0x4259, "check for player sword collision")
expr(0x425a, "objectid_old_player")
expr(0x425c, "objectid_sword")
comment(0x4262, "found player sword collision, add sword to toolbar")
expr(0x4263, sprite_dict)
comment(0x4267, "mark sword as taken")
label(0x426c, "update_room_0_seesaw_animation_if_in_room_0")
label(0x4275, "update_room_0_seesaw_animation")
expr(0x4278, "object_direction + objectid_seesaw")
comment(0x427a, "set X to the animation step for position, and Y to the sprite index")
comment(0x4283, "flip seesaw")
expr(0x4286, "object_direction + objectid_seesaw")
label(0x4292, "update_big_stone_position_and_sprite")
expr(0x429c, "object_x_low + objectid_big_stone_room_0")
expr(0x42a7, "object_y_low + objectid_big_stone_room_0")
expr(0x42b1, sprite_dict)
expr(0x42b3, "object_spriteid + objectid_sword")
expr(0x42c3, sprite_dict)
expr(0x42c5, "object_spriteid + objectid_sword")
expr(0x42ca, "object_direction + objectid_sword")
label(0x42cf, "spin_sword_in_opposite_direction")
expr(0x42d3, sprite_dict)
expr(0x42d5, "object_spriteid + objectid_sword")
expr(0x42da, "object_direction + objectid_sword")
label(0x42dc, "update_sword_position")
expr(0x42e6, "object_x_low + objectid_sword")
expr(0x42ed, "object_x_high + objectid_sword")
expr(0x42f7, "object_y_low + objectid_sword")
label(0x42f9, "return3")
label(0x42fa, "set_or_clear_collision_map_cell_for_big_stone")
expr(0x42fb, "collision_map_solid_rock")
expr(0x4304, "collision_map_none")
label(0x4305, "write_to_collision_map_for_big_stone")
label(0x430d, "small_stone_room_0_seesaw_animations")
label(0x430e, "small_stone_rising_arc_room_0_seesaw_animation")
byte(0x430e, 2)
byte(0x4310, 2)
byte(0x4312, 2)
byte(0x4314, 2)
byte(0x4316, 2)
byte(0x4318, 2)
byte(0x431a)
label(0x431b, "small_stone_falling_arc_room_0_seesaw_animation")
byte(0x431b, 2)
byte(0x431d, 2)
byte(0x431f, 2)
byte(0x4321, 2)
byte(0x4323, 2)
byte(0x4325, 2)
byte(0x4327)
label(0x4328, "small_stone_falling_room_0_seesaw_animation")
byte(0x4328, 2)
label(0x432b, "small_stone_still_room_0_seesaw_animation")
byte(0x432b, 2)
label(0x432e, "small_stone_fall_off_edge_room_0_seesaw_animation")
byte(0x432e, 2)
byte(0x4330, 2)
byte(0x4332, 2)
byte(0x4334, 2)
comment(0x4337, "check for first update in room (branch if so)")
label(0x4337, "update_room_0_seesaw_puzzle")
label(0x433f, "update_room_0_seesaw_puzzle_first_update")
expr(0x4340, sprite_dict)
expr(0x4345, sprite_dict)
comment(0x434c, "check for level change (branch if not)")
expr(0x435f, "small_stone_still_room_0_seesaw_animation - small_stone_room_0_seesaw_animations")
label(0x4365, "no_level_change")
label(0x4376, "fast_forward_small_stone_animation_loop")
expr(0x4386, "objectid_small_stone_object")
label(0x4390, "hide_small_stone")
expr(0x4391, sprite_dict)
expr(0x4393, "object_spriteid_old + objectid_small_stone_object")
label(0x4395, "return4_local")
label(0x4398, "update_room_0_seesaw_puzzle_not_first_update")
expr(0x43a3, "object_spriteid_old + objectid_small_stone_object")
label(0x43c1, "initialise_room_0_seesaw_puzzle")
expr(0x43c2, sprite_dict)
expr(0x43f7, "small_stone_rising_arc_room_0_seesaw_animation - small_stone_room_0_seesaw_animations")
expr(0x4402, "objectid_small_stone_object")
label(0x440a, "stone_in_room")
label(0x4419, "check_for_player_small_stone_collision1")
expr(0x441d, "object_spriteid_old + objectid_small_stone_object")
expr(0x4420, "objectid_old_player")
expr(0x4422, "objectid_small_stone_object")
comment(0x4434, "add stone to toolbar")
expr(0x4435, sprite_dict)
label(0x4439, "hide_small_stone1")
expr(0x443a, sprite_dict)
expr(0x443c, "object_spriteid + objectid_small_stone_object")
comment(0x443e, "mark small stone as obtained by player")
label(0x4446, "no_player_small_stone_collision")
comment(0x444b, "remove small stone from toolbar")
expr(0x444c, sprite_dict)
comment(0x4450, "stone is no longer held or being used by player")
expr(0x4451, sprite_dict)
label(0x445a, "check_for_stone_moving_in_x")
expr(0x445b, "object_x_low + objectid_small_stone_object")
expr(0x445e, "object_x_low_old + objectid_small_stone_object")
comment(0x4462, "stone is moving in x, check for collision with walls")
comment(0x4467, "stone moving right")
label(0x446d, "stone_moving_left")
label(0x4470, "check_for_stone_bouncing")
expr(0x4476, "objectid_small_stone_object")
label(0x4482, "check_for_stone_moving_in_y")
expr(0x4483, "object_y_low + objectid_small_stone_object")
expr(0x4486, "object_y_low_old + objectid_small_stone_object")
comment(0x448a, "check for stone landing")
expr(0x4493, "objectid_small_stone_object")
label(0x449c, "return4")
label(0x449d, "move_to_next_animation_step")
label(0x44ae, "got_valid_animation_step")
label(0x44b9, "bouncing_left")
label(0x44bc, "check_for_stone_wall_collision")
expr(0x44c2, "objectid_small_stone_object")
comment(0x44c8, "reverse direction because stone bounced off wall")
label(0x44d0, "no_collision")
expr(0x44d4, "small_stone_rising_arc_room_0_seesaw_animation - small_stone_room_0_seesaw_animations")
expr(0x44db, "objectid_small_stone_object")
label(0x44e6, "start_small_stone_falling")
expr(0x44e7, "small_stone_falling_room_0_seesaw_animation - small_stone_room_0_seesaw_animations")
expr(0x44ec, "small_stone_falling_arc_room_0_seesaw_animation - small_stone_room_0_seesaw_animations")
label(0x44ed, "check_for_hitting_floor")
expr(0x44ee, "objectid_small_stone_object")
expr(0x44f6, "small_stone_falling_room_0_seesaw_animation - small_stone_room_0_seesaw_animations")
expr(0x44ff, "small_stone_still_room_0_seesaw_animation - small_stone_room_0_seesaw_animations")
label(0x4503, "check_for_stone_falling_off_edge")
expr(0x4509, "small_stone_falling_room_0_seesaw_animation - small_stone_room_0_seesaw_animations")
expr(0x450e, "small_stone_fall_off_edge_room_0_seesaw_animation - small_stone_room_0_seesaw_animations")
label(0x451d, "set_small_stone_animation_step")
expr(0x4524, "small_stone_still_room_0_seesaw_animation - small_stone_room_0_seesaw_animations")
label(0x452c, "set_small_stone_position_based_on_animation_step")
label(0x4539, "stone_travelling_right")
label(0x4540, "add_to_small_stone_x")
label(0x4559, "add_to_small_stone_y")
comment(0x456a, "collide object with world, then save the results")
expr(0x456b, "objectid_small_stone_object")
expr(0x4570, "object_x_low + objectid_small_stone_object")
expr(0x4576, "object_x_high + objectid_small_stone_object")
expr(0x457c, "object_y_low + objectid_small_stone_object")
expr(0x4582, "object_y_high + objectid_small_stone_object")
comment(0x4587, "get extents of the small stone")
expr(0x4588, "objectid_small_stone_object")
comment(0x458f, "move to the next room if needed")
expr(0x459e, "game_area_width_cells")
comment(0x45a1, "move small stone right one room")
label(0x45b7, "move_small_stone_one_room_left_if_needed")
#expr(0x45c0, "game_area_width_cells")
expr(0x45c0, "<(game_area_width_cells * 8)")
expr(0x45c5, ">(game_area_width_cells * 8)")
label(0x45cf, "move_small_stone_one_room_down_if_needed")
expr(0x45d2, "game_area_height_cells")
comment(0x45d5, "[bug - should be y coordinate?]", inline=True)
expr(0x45da, "<(game_area_height_cells * 8)")
expr(0x45e1, ">(game_area_height_cells * 8)")
label(0x45ea, "hide_stone")
expr(0x45eb, sprite_dict)
expr(0x45ed, "object_spriteid + objectid_small_stone_object")
label(0x45ef, "return5")
label(0x45f0, "set_small_stone_object")
expr(0x45f1, sprite_dict)
expr(0x45f3, "object_erase_type + objectid_small_stone_object")
expr(0x45f8, "object_z_order + objectid_small_stone_object")
expr(0x45fe, "object_x_low + objectid_small_stone_object")
expr(0x4604, "object_x_high + objectid_small_stone_object")
expr(0x460a, "object_y_low + objectid_small_stone_object")
expr(0x4610, "object_y_high + objectid_small_stone_object")
expr(0x4613, sprite_dict)
expr(0x4615, "object_spriteid + objectid_small_stone_object")
expr(0x461b, "object_direction + objectid_small_stone_object")
label(0x461e, "small_stone_just_thrown")
label(0x461f, "remember_player_held_object")
label(0x4620, "rememebr_old_small_stone_spriteid")
label(0x4621, "small_stone_animation_step")
label(0x4622, "play_boulder_landing_sound")
ldx_ldy_jsr_play_sound_yx(0x4628, "sound3")
ldx_ldy_jsr_play_sound_yx(0x462f, "sound4")

for i in range(0x3f6c, 0x3fa4, 2):
    byte(i, 2)
    decimal(i,2)


print("""; *************************************************************************************
;
; Level I: 'SEE-SWORD'
;
; Save game variables:
;
;     save_game_level_i_room_0_seesaw_puzzle_progress            ($0a24):
;               0: untouched
;              1+: stone thrown, animating
;             $ff: taken
;
;     save_game_level_i_sword_puzzle_progress                    ($0a25):
;               0: untouched
;              1+: animating
;             $15: sword in wall
;             $ff: sword taken
;
;     save_game_level_i_spell_puzzle_progress                    ($0a26):
;               0: untouched
;              1+: animating
;             $1f: spell on floor
;
;     save_game_level_i_small_stone_x_low                        ($0a27):
;     save_game_level_i_small_stone_x_high                       ($0a28):
;     save_game_level_i_small_stone_y_low                        ($0a29):
;     save_game_level_i_small_stone_y_high                       ($0a2a):
;           position of small stone in the room
;
;     save_game_level_i_small_stone_direction_without_bounces    ($0a2b):
;             1: thrown right
;           $ff: thrown left
;
;     save_game_level_i_small_stone_room_0_seesaw_animation_step ($0a2c):
;           the step (index) of the current animation step for the small stone
;
;     save_game_level_i_small_stone_room                         ($0a2d):
;           the room containing the small stone (if not held by player)
;
;     save_game_level_i_small_stone_direction_including_bounces  ($0a2e):
;             1: travelling right
;           $ff: travelling left
;
;     save_game_level_i_room_3_seesaw_puzzle_progress            ($0a2f):
;             0: untouched
;            1+: animating
;           $19: small stone on ledge
;           $ff: small stone taken
;
; Solution:
;
;   1. Climb the right hand rope to the room above and jump into the large stone.
;           (Small stone ends on ledge)
;   2. Retrieve small stone and descend to the room below.
;   3. Go to the left room (on ground floor) and from the slightly raised floor,
;      throw the small stone to the left.
;           (the sword sticks into the wall)
;   4. From the previous room, ascend the left rope and exit left to the raised section of the leftmost room.
;   5. Fall to collect the sword.
;   6. In the rightmost room, use the sword to cut the rope and get the spell.
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
