from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_bird_1",
    0xc9: "spriteid_bird_2",
    0xca: "spriteid_bird_turn",
    0xcc: "spriteid_bird_transform_1",
    0xcd: "spriteid_bird_transform_2",
    0xce: "spriteid_bird_wing_1",
    0xcf: "spriteid_bird_wing_2",
    0xd0: "spriteid_bird_wing_3",
    0xd1: "spriteid_bird_toolbar",
    0xd2: "spriteid_egg",
    0xd3: "spriteid_egg_toolbar",
    0xd4: "spriteid_nest",
    0xd6: "spriteid_erase_small_egg",
    0xd7: "spriteid_small_egg_right",
    0xd8: "spriteid_small_egg_down",
    0xd9: "spriteid_small_egg_left",
    0xda: "spriteid_small_egg_upright",
    0xdb: "spriteid_large_egg_upright",
    0xdc: "spriteid_large_egg_tilted",
    0xdd: "spriteid_large_egg_sideways",
    0xde: "spriteid_erase_large_egg",
    0xdf: "spriteid_erase_bird_wings",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Multiple rooms
constant(2, "objectid_small_egg")
constant(3, "objectid_fire1")           # Room 0, 2 and 3
constant(4, "objectid_bird")
constant(5, "objectid_bird_wings")

# Room 1
constant(3, "objectid_egg")

# Room 3
constant(4, "objectid_fire2")
constant(5, "objectid_sparkles")


# When the egg is off-screen, this counts up every update cycle it is not visible (capping at &80).
# When entering the room containing the egg, the game performs (up to) this number of egg animation
# updates without modifying the screen, giving the effect that the egg starts exactly where it has
# had time to reach if it was thrown off-screen.
label(0xa6f, "level_workspace_small_egg_offscreen_time")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataE.dat", "6502", "1fd692ce17c1ae2c858ed57730c9c081")

constant(0xff, "small_egg_status_collected")

label(0x0a13, "save_game_level_e_small_egg_status")
label(0x0a14, "save_game_level_e_big_egg_animation_index")
label(0x0a15, "save_game_level_e_bird_global_x_position")

common_to_all('E')
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3fdc, 0x3fde): {
        "l0070": "object_left_low",
    },
    (0x3ad5,0x4449): {
        "l0070": "room_exit_direction",
    },
    (0x45a1, 0x45d5): {
        "l0070": "object_left_low",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

def bird_step(addr):
    expr(addr, sprite_dict)
    byte(addr)
    byte(addr+1)
    byte(addr+2)

def term(addr):
    byte(addr)
    comment(addr, "terminator", inline=True)
    blank(addr+1)

# Labels copied from 'g'
label(0x0070, "object_left_low")
label(0x0071, "object_left_high")
label(0x0072, "object_right_low")
label(0x0073, "object_right_high")
label(0x0078, "object_left_cell_x")
label(0x0079, "object_right_cell_x")
label(0x09d4, "object_current_index_in_animation")
label(0x2200, "set_player_spriteid_and_offset_from_animation_table")
label(0x2248, "update_player_accessory_object_animation")
label(0x22ed, "transform_out_animation")
label(0x22ee, "set_base_animation_address_and_handle_transform_in_out")
label(0x23c4, "update_player_hitting_floor_or_pushed")
label(0x3ac7, "jump_requested")
label(0x3ac9, "player_move_direction_requested")
label(0x3aca, "move_left_requested")
label(0x3acb, "move_right_requested")

# Regular labels
constant(0x1e, "bird_min_global_x_position")
constant(0x74, "bird_max_global_x_position")

label(0x0023, "timeout_while_bird_on_ground_stationary")

label(0x0a70, "thrown_egg_x_low")
label(0x0a71, "thrown_egg_x_high")
label(0x0a72, "thrown_egg_y_low")
label(0x0a73, "thrown_egg_direction")
label(0x0a74, "small_egg_animation_step")
label(0x0a75, "room_containing_small_egg")
label(0x0a76, "egg_animation_index")
label(0x0a77, "room_1_egg_x")
label(0x0a78, "room_1_egg_y")
label(0x0a79, "bird_object_direction")
label(0x0a7a, "bird_x_direction")
label(0x0a7b, "bird_wing_animation_index")

expr(0x3b02, "small_egg_status_collected")
expr(0x3b07, "spriteid_bird_toolbar")
entry(0x3b0b, "developer_mode_not_active")
expr(0x3b11, "spriteid_egg_toolbar")
entry(0x3b15, "dont_have_egg")
expr(0x3b1d, "spriteid_bird_toolbar")
entry(0x3b21, "bird_not_captured_yet")
expr(0x3b22, make_lo("update_bird"))
expr(0x3b24, "jmp_for_update_extra_player_character + 1")
expr(0x3b27, make_hi("update_bird"))
expr(0x3b29, "jmp_for_update_extra_player_character + 2")
ground_fill(0x3b2b)
expr(0x3b2c, make_lo("ground_fill_2x2_top_left"))
expr(0x3b30, make_hi("ground_fill_2x2_top_left"))
comment(0x3b40, "This table is 0-terminated")
label(0x3b40, "bird_wing_animation_table")
label(0x3b45, "bird_accessory_sprite_list")
comment(0x3b45, "bird doesn't have accessories")
byte(0x3b45)
label(0x3b46, "bird_base_animations")
label(0x3b46, "bird_transition_in_animation")
bird_step(0x3b46)
bird_step(0x3b4a)
bird_step(0x3b4e)
bird_step(0x3b52)
bird_step(0x3b56)
bird_step(0x3b5a)
bird_step(0x3b5e)
term(0x3b62)
label(0x3b63, "bird_transition_out_animation")      #$1d
bird_step(0x3b63)
bird_step(0x3b67)
bird_step(0x3b6b)
bird_step(0x3b6f)
bird_step(0x3b73)
bird_step(0x3b77)
term(0x3b7b)
label(0x3b7c, "bird_stationary_for_a_while_animation")
bird_step(0x3b7c)
term(0x3b80)
label(0x3b81, "bird_turn1_animation")
bird_step(0x3b81)
label(0x3b85, "bird_turn1_mid_way")
bird_step(0x3b85)
term(0x3b89)
label(0x3b8a, "bird_stationary_on_floor_animation")
bird_step(0x3b8a)
term(0x3b8e)
label(0x3b8f, "bird_animation5")
bird_step(0x3b8f)
term(0x3b93)
label(0x3b94, "bird_fly_straight_up_animation")
bird_step(0x3b94)
term(0x3b98)
label(0x3b99, "bird_flying_sideways_animation")
bird_step(0x3b99)
term(0x3b9d)
label(0x3b9e, "bird_animation8")
bird_step(0x3b9e)
term(0x3ba2)
label(0x3ba3, "bird_turn_while_flying_animation")
bird_step(0x3ba3)
label(0x3ba7, "bird_turn_while_flying_mid_way")
bird_step(0x3ba7)
term(0x3bab)
label(0x3bac, "bird_start_hop_animation")
bird_step(0x3bac)
bird_step(0x3bb0)
term(0x3bb4)
label(0x3bb5, "bird_animation11")
bird_step(0x3bb5)
bird_step(0x3bb9)
bird_step(0x3bbd)
term(0x3bc1)
label(0x3bc2, "bird_animation12")
bird_step(0x3bc2)
bird_step(0x3bc6)
bird_step(0x3bca)
term(0x3bce)
label(0x3bcf, "bird_animation13")
bird_step(0x3bcf)
bird_step(0x3bd3)
bird_step(0x3bd7)
bird_step(0x3bdb)
term(0x3bdf)
label(0x3be0, "bird_animation14")
bird_step(0x3be0)
bird_step(0x3be4)
bird_step(0x3be8)
bird_step(0x3bec)
term(0x3bf0)
label(0x3bf1, "bird_animation15")
bird_step(0x3bf1)
bird_step(0x3bf5)
bird_step(0x3bf9)
bird_step(0x3bfd)
bird_step(0x3c01)
term(0x3c05)
label(0x3c06, "bird_fall_straight_down_animation")
bird_step(0x3c06)
term(0x3c0a)
label(0x3c0b, "draw_sprite_nest_at_cell_xy_and_write_to_collision_map")
expr(0x3c14, sprite_dict)
label(0x3cd3, "room_2_check_right_exit")
expr(0x3cd6, "exit_room_right")
label(0x3ce0, "room_2_update_handler")
expr(0x3ce6, "objectid_fire1")
comment(0x3cee, "check for first update in room (branch if not)")
comment(0x3cfa, "check for level change (branch if not)")
label(0x3d12, "initialise_bird_in_room_1_or_2")
comment(0x3d1a, "initialise bird")
expr(0x3d1b, sprite_dict)
expr(0x3d1d, "object_erase_type + objectid_bird_wings")
expr(0x3d22, "object_z_order + objectid_bird_wings")
expr(0x3d27, "object_y_low + objectid_bird")
expr(0x3d2a, "object_y_low + objectid_bird_wings")
expr(0x3d2f, "object_y_high + objectid_bird")
expr(0x3d32, "object_y_high + objectid_bird_wings")
label(0x3d34, "choose_bird_sprite_if_in_room_1_or_2_local")
label(0x3d37, "return1_local")
entry(0x3d3a, "room_2_not_first_update")
expr(0x3d48, "objectid_old_player")
expr(0x3d4a, "objectid_bird")
expr(0x3d51, sprite_dict)
expr(0x3d56, sprite_dict)
expr(0x3d58, "object_spriteid + objectid_bird")
expr(0x3d5b, "object_spriteid + objectid_bird_wings")
label(0x3d64, "update_bird_animation")
label(0x3d6f, "store_bird_wind_animation_index")
comment(0x3d77, "flip bird direction")
label(0x3d85, "check_bird_x_range_limits")
expr(0x3d89, "bird_min_global_x_position")
expr(0x3d8d, "bird_max_global_x_position")
entry(0x3d90, "bird_hit_min_or_max_global_x_position")
label(0x3d95, "add_direction_to_bird_x_position")
label(0x3d9f, "choose_bird_sprite_if_in_room_1_or_2")
expr(0x3daf, sprite_dict)
expr(0x3db6, sprite_dict)
label(0x3db7, "set_bird_sprite")
expr(0x3db8, "object_spriteid + objectid_bird")
expr(0x3dc1, "object_spriteid + objectid_bird_wings")
label(0x3dcf, "set_x_to_high_byte_of_bird_x_position")
label(0x3dd6, "set_bird_object_x_and_direction")
expr(0x3dd7, "object_x_high + objectid_bird")
expr(0x3ddb, "object_x_high + objectid_bird")
expr(0x3ddf, "object_x_high + objectid_bird")
expr(0x3de2, "object_x_low + objectid_bird")
expr(0x3de5, "object_x_low + objectid_bird_wings")
expr(0x3de8, "object_x_high + objectid_bird")
expr(0x3deb, "object_x_high + objectid_bird_wings")
expr(0x3df1, "object_direction + objectid_bird")
expr(0x3df4, "object_direction + objectid_bird_wings")
label(0x3df6, "return1")
label(0x3e96, "room_3_update_handler")
expr(0x3e9c, "objectid_fire1")
expr(0x3ea5, "objectid_fire2")
expr(0x3eb4, "objectid_sparkles")
entry(0x3eb8, "update_bird")
expr(0x3eb9, "bird_transition_out_animation - bird_base_animations")
expr(0x3ebe, make_lo("bird_base_animations"))
expr(0x3ec0, make_hi("bird_base_animations"))
expr(0x3ec2, "objectid_bird")
comment(0x3ec8, "check for reversing bird direction")
expr(0x3ec9, "bird_turn1_mid_way - bird_base_animations")
expr(0x3ecd, "bird_turn_while_flying_mid_way - bird_base_animations")
label(0x3ed0, "reverse_direction_of_player")
label(0x3edb, "check_bird_wall_and_floor_collision")
label(0x3ee3, "no_floor_collision")
expr(0x3ee9, "bird_fly_straight_up_animation - bird_base_animations")
ab(0x3ef5)
label(0x3ef7, "left_or_right_requested")
blank(0x3ef7)
expr(0x3ef8, "bird_animation5 - bird_base_animations")
expr(0x3f02, "bird_turn_while_flying_animation - bird_base_animations")
expr(0x3f0c, "bird_flying_sideways_animation - bird_base_animations")
label(0x3f1e, "player_looking_left")
label(0x3f21, "check_for_player_rock_collisions")
expr(0x3f22, "objectid_player")
expr(0x3f2c, "bird_animation8 - bird_base_animations")
label(0x3f30, "left_and_right_requested")
label(0x3f3a, "set_player_animation_step_local")
label(0x3f3d, "no_flying_requested")
expr(0x3f41, "bird_start_hop_animation - bird_base_animations")
expr(0x3f48, "objectid_player")
expr(0x3f4f, "bird_start_hop_animation - bird_base_animations")
label(0x3f55, "set_falling_straight_down")
expr(0x3f56, "bird_fall_straight_down_animation - bird_base_animations")    #$c0
expr(0x3f5b, "bird_animation11 - bird_base_animations")                     #$6f
label(0x3f5c, "check_if_player_is_on_the_floor")
label(0x3f61, "bird_hit_wall_or_floor")
expr(0x3f62, "bird_fall_straight_down_animation - bird_base_animations")    #$c0
expr(0x3f6f, "bird_animation12 - bird_base_animations")                     #$7c
expr(0x3f71, "bird_flying_sideways_animation - bird_base_animations")       #$53
expr(0x3f75, "bird_animation15 - bird_base_animations")                     #$ab
label(0x3f79, "check_for_player_change_of_direction")
expr(0x3f7f, "bird_turn1_animation - bird_base_animations")                 #$3b
expr(0x3f86, "bird_start_hop_animation - bird_base_animations")             #$66
label(0x3f87, "set_next_animation_to_hop")
expr(0x3f88, "bird_start_hop_animation - bird_base_animations")             #$66
label(0x3f8f, "bird_is_stationary")
expr(0x3f93, "bird_stationary_on_floor_animation - bird_base_animations")   #$44
expr(0x3f97, "bird_stationary_for_a_while_animation - bird_base_animations")  #$36
comment(0x3f9a, "bird is staionary on the ground. set a delay before the bird changes to the 'stationary for a while' state. There seems to be no point in this extra state. Perhaps there were once idle sprites that were later dropped during development.")
expr(0x3f9f, "bird_stationary_on_floor_animation - bird_base_animations")     #$44
label(0x3fa6, "check_for_change_to_stationary_for_a_while_state")
expr(0x3fab, "bird_stationary_for_a_while_animation - bird_base_animations")  #$36
label(0x3faf, "check_for_falling_off_edge")
label(0x3fb7, "check_for_player_just_fallen_off_edge")
comment(0x3fbc, "next animation is falling straight down")
expr(0x3fbd, "bird_fall_straight_down_animation - bird_base_animations")    #$c0
expr(0x3fc2, "bird_animation13 - bird_base_animations")                     #$89
expr(0x3fc9, "bird_animation14 - bird_base_animations")                     #$9a
label(0x3fca, "set_player_animation_step")
expr(0x3fcf, make_lo("bird_base_animations"))
expr(0x3fd1, make_hi("bird_base_animations"))
expr(0x3fd6, "objectid_player")
expr(0x3fec, make_lo("bird_accessory_sprite_list"))
expr(0x3fee, make_hi("bird_accessory_sprite_list"))
comment(0x4099, "Table for the small egg animations. Each step in an animation is three bytes:\n(0) spriteid, (1) X offset, (2) Y offset.\nEach animation is terminated by an extra zero byte.")
label(0x4099, "small_egg_animations")
label(0x409a, "small_egg_stationary_animation")
expr(0x409a, sprite_dict)
label(0x409e, "small_egg_start_throwing_animation")
expr(0x409e, "spriteid_one_pixel_masked_out")
expr(0x40a1, sprite_dict)
label(0x40a5, "small_egg_thrown_right_animation")
expr(0x40a5, sprite_dict)
expr(0x40a8, sprite_dict)
expr(0x40ab, sprite_dict)
expr(0x40ae, sprite_dict)
expr(0x40b1, sprite_dict)
expr(0x40b4, sprite_dict)
expr(0x40b7, sprite_dict)
expr(0x40ba, sprite_dict)
label(0x40be, "small_egg_thrown_left_animation")
expr(0x40be, sprite_dict)
expr(0x40be, sprite_dict)
expr(0x40c1, sprite_dict)
expr(0x40c4, sprite_dict)
expr(0x40c7, sprite_dict)
label(0x40cb, "small_egg_falling_animation")
expr(0x40cb, sprite_dict)
comment(0x40cf, "The small egg starts in room 0 but it can move between rooms, either by being carried by the player or by being thrown. Its position updating is always handled by room_0_update_handler wherever it is.")
label(0x40cf, "room_0_update_handler")
expr(0x40d9, "objectid_fire1")
comment(0x40dd, "check for first update in room (branch if so)")
entry(0x40e5, "room0_first_update")
expr(0x40e6, sprite_dict)
expr(0x40eb, sprite_dict)
ldx_ldy_jsr_define_envelope(0x40f6, "envelope1")
comment(0x40f9, "check for level change (branch if not)")
comment(0x4102, "branch if have collected egg", inline=True)
expr(0x411e, "small_egg_stationary_animation - small_egg_animations")
label(0x412a, "initialise_small_egg")
expr(0x412b, sprite_dict)
expr(0x412d, "object_erase_type + objectid_small_egg")
expr(0x4132, "object_z_order + objectid_small_egg")
comment(0x413e, "branch if have collected egg", inline=True)
expr(0x414a, "object_spriteid + objectid_small_egg")
comment(0x414c, "Update the egg position repeatedly (without updating the screen) to catch up on any missed animation between it being thrown off screen and now when we are going to see it again. Note that small_egg_animation_update will set the offscreen time to 0 if there is nothing else to do, so this loop doesn't do unnecessary work.")
entry(0x414c, "small_egg_animation_catch_up_loop")
expr(0x415c, "objectid_small_egg")
entry(0x4166, "skip_small_egg_setup")
expr(0x4167, sprite_dict)
expr(0x4169, "object_spriteid_old + objectid_small_egg")
entry(0x416e, "room0_not_first_update")
expr(0x4179, "object_spriteid_old + objectid_small_egg")
comment(0x4181, "branch if have collected egg", inline=True)
comment(0x418a, "The egg is off screen for this update, so increment the offscreen time (capping at &880 so its position can be correctly updated when it next appears on screen.")
entry(0x4192, "return2_local")
entry(0x4195, "have_small_egg")
expr(0x4196, "spriteid_egg_toolbar")
expr(0x41c2, "small_egg_thrown_right_animation - small_egg_animations")
expr(0x41c7, make_subtract("small_egg_start_throwing_animation", "small_egg_animations"))
expr(0x41d2, "object_spriteid + objectid_small_egg")
expr(0x41d5, "objectid_small_egg")
entry(0x41dd, "small_egg_in_room") # TODO: true-ish I think but not 100% clear how this interacts with the code being for room0 yet we do a generic check against desired_room_index
label(0x41ec, "restore_small_egg_sprite_and_test_for_collision_with_player")
expr(0x41f0, "object_spriteid_old + objectid_small_egg")
expr(0x41f3, "objectid_old_player")
expr(0x41f5, "objectid_small_egg")
comment(0x4207, "add small egg to toolbar")
label(0x420c, "take_small_egg")
expr(0x420d, sprite_dict)
expr(0x420f, "object_spriteid + objectid_small_egg")
expr(0x4212, "small_egg_status_collected")
label(0x4219, "update_small_egg_sounds_and_check_if_just_used_egg")
expr(0x4222, sprite_dict)
expr(0x4227, sprite_dict)
label(0x4230, "return2")
entry(0x4231, "small_egg_animation_update")
label(0x4240, "got_small_egg_animation_step_in_y")
expr(0x4244, "small_egg_thrown_right_animation - small_egg_animations")
ab(0x424f)
entry(0x4251, "small_egg_thrown_left")
entry(0x4254, "small_egg_temp_left_right_offset_set")
expr(0x425a, "objectid_small_egg")
expr(0x4261, "small_egg_falling_animation - small_egg_animations")
expr(0x4266, "small_egg_thrown_left_animation - small_egg_animations")
entry(0x426a, "small_egg_not_being_thrown")
expr(0x426b, "small_egg_falling_animation - small_egg_animations")
expr(0x426f, "objectid_small_egg")
expr(0x4274, "objectid_small_egg")
ri(0x4274)
comment(0x4278, "branch if not collided with anything", inline=True)
expr(0x427b, "small_egg_stationary_animation - small_egg_animations")
entry(0x427f, "small_egg_not_falling")
label(0x4284, "set_small_egg_animation_step")
expr(0x428b, "object_spriteid + objectid_small_egg")
comment(0x428d, "get the X offset from the animation table")
comment(0x4296, "the egg has been thrown left, so negate the X offset from the animation table")
entry(0x429b, "egg_thrown_to_right")
comment(0x429b, "Set X to the high byte of the X offset")
comment(0x429d, "set flags based on A", inline=True)
entry(0x42a2, "adding_positive_value_to_x")
comment(0x42a2, "Add 16-bit offset in XA to thrown_egg_x.")
comment(0x42b0, "Get the Y offset from the animation table and add it to thrown_egg_y_low. This is an 8-bit value so no need to mess around with high byte.")
expr(0x42bf, "objectid_small_egg")
expr(0x42c4, "object_x_low + objectid_small_egg")
expr(0x42ca, "object_x_high + objectid_small_egg")
expr(0x42d0, "object_y_low + objectid_small_egg")
expr(0x42d9, "small_egg_thrown_right_animation - small_egg_animations")
expr(0x42dd, "objectid_small_egg")
comment(0x42e6, "check and move small egg one room left")
expr(0x42e9, "game_area_width_cells")
label(0x4302, "check_and_move_small_egg_one_room_right")
label(0x4317, "hide_small_egg")
expr(0x4318, sprite_dict)
expr(0x431a, "object_spriteid + objectid_small_egg")
label(0x431c, "return3")
entry(0x431d, "update_object_properties_for_small_egg")
expr(0x4321, "object_x_low + objectid_small_egg")
expr(0x4327, "object_x_high + objectid_small_egg")
expr(0x432d, "object_y_low + objectid_small_egg")
expr(0x4332, "object_y_high + objectid_small_egg")
expr(0x4338, "object_direction + objectid_small_egg")
label(0x433b, "update_small_egg_collision_sounds")
expr(0x4348, "objectid_small_egg")
expr(0x434f, "object_y_low + objectid_small_egg")
expr(0x4352, "object_y_low_old + objectid_small_egg")
label(0x4359, "check_for_delta_x_in_small_egg_movement")
expr(0x435a, "object_x_low + objectid_small_egg")
expr(0x435e, "object_x_low_old + objectid_small_egg")
expr(0x4363, "object_x_high + objectid_small_egg")
expr(0x4366, "object_x_high_old + objectid_small_egg")
label(0x4370, "small_egg_moving_right")
label(0x4373, "test_for_small_egg_collision_with_rock_and_play_sound")
expr(0x4379, "objectid_small_egg")
ldx_ldy_jsr_play_sound_yx(0x4385, "sound1")
label(0x4388, "return4")
label(0x4389, "player_just_used_small_egg_flag")
label(0x438a, "remember_object_held_sprite")
label(0x438b, "remember_small_egg_sprite")
label(0x443f, "room_1_check_right_exit")
expr(0x4442, "exit_room_right")
comment(0x444c, "Table of animations for the big egg. There are three bytes per entry. First byte is a sprite ID. Second and third bytes of each entry are signed (X,Y) position offsets, added to the egg position. Each animation is terminated with an extra zero byte.")
label(0x444c, "egg_animations_table")
blank(0x444d)
expr(0x444d, sprite_dict)
label(0x444d, "egg_normal_animation")
comment(0x4450, "terminator", inline=True)
blank(0x4451)
expr(0x4451, sprite_dict)
label(0x4451, "egg_tilted_animation")
comment(0x4454, "terminator", inline=True)
blank(0x4455)
expr(0x4455, sprite_dict)
label(0x4455, "egg_falling_off_animation")
expr(0x4458, sprite_dict)
expr(0x445b, sprite_dict)
expr(0x445e, sprite_dict)
comment(0x4461, "terminator", inline=True)
blank(0x4462)
expr(0x4462, sprite_dict)
label(0x4462, "egg_falling_straight_down_animation")
comment(0x4465, "terminator", inline=True)
blank(0x4466)
expr(0x4466, sprite_dict)
label(0x4466, "egg_stationary_animation")
comment(0x4469, "terminator", inline=True)
comment(0x446a, "check for first update in room (branch if not)")
label(0x446a, "room_1_update_handler")
comment(0x446f, "check for level change (branch if not)")
expr(0x447d, make_subtract("egg_normal_animation", "egg_animations_table"))         #1
expr(0x4481, make_subtract("egg_tilted_animation", "egg_animations_table"))         #5
comment(0x4484, "set flags based on A", inline=True)
expr(0x4489, make_subtract("egg_normal_animation", "egg_animations_table"))         #1
entry(0x448d, "egg_on_floor") # TODO: guess
expr(0x4492, make_subtract("egg_stationary_animation", "egg_animations_table"))
expr(0x4492, make_subtract("egg_stationary_animation", "egg_animations_table"))
entry(0x4493, "room_1_set_egg_animation_and_position")
entry(0x449f, "room_1_not_this_room1")
ldx_ldy_jsr_define_envelope(0x44a9, "envelope2")
expr(0x44ad, sprite_dict)
expr(0x44af, "object_erase_type + objectid_egg")
expr(0x44b4, "object_x_high + objectid_egg")
expr(0x44b7, "object_y_high + objectid_egg")
entry(0x44b9, "room_1_not_this_room2")
entry(0x44bc, "room_1_not_first_update")
entry(0x44cb, "not_end_of_egg_animation_sequence")
expr(0x44cf, make_subtract("egg_normal_animation", "egg_animations_table"))         #1
expr(0x44d8, make_subtract("egg_tilted_animation", "egg_animations_table"))
label(0x44df, "check_if_egg_is_tilted")
expr(0x44e0, make_subtract("egg_tilted_animation", "egg_animations_table"))         #5
entry(0x4501, "room_1_not_this_room3")
expr(0x4502, make_subtract("egg_falling_straight_down_animation", "egg_animations_table"))
expr(0x4507, make_subtract("egg_falling_off_animation", "egg_animations_table"))
label(0x450b, "check_if_egg_is_falling_straight_down")
expr(0x450c, make_subtract("egg_falling_straight_down_animation", "egg_animations_table"))         #$16
ldx_ldy_jsr_play_sound_yx(0x4524, "sound2")
ldx_ldy_jsr_play_sound_yx(0x452b, "sound3")
expr(0x452f, make_subtract("egg_falling_straight_down_animation", "egg_animations_table"))
label(0x4533, "set_egg_stationary")
expr(0x4534, make_subtract("egg_stationary_animation", "egg_animations_table"))
entry(0x4538, "new_egg_animation_index_in_y")
comment(0x453c, "add animation x offset to egg x position")
comment(0x4546, "add animation y offset to egg y position")
entry(0x4551, "finish_setting_up_egg")
expr(0x455e, "object_spriteid + objectid_egg")
expr(0x4564, "object_x_low + objectid_egg")
expr(0x456a, "object_y_low + objectid_egg")
expr(0x4580, make_subtract("egg_normal_animation", "egg_animations_table"))         #1
expr(0x4584, make_subtract("egg_tilted_animation", "egg_animations_table"))         #5
label(0x4596, "write_egg_to_collision_map")
label(0x45a0, "return5")
comment(0x45a1, "Preserves Y. A is $ff on exit if small egg has hit large egg, 0 otherwise. Flags reflect A on exit.")
entry(0x45a1, "test_if_small_egg_hit_large_egg")
comment(0x45ad, "Why not lda object_spriteid+2? And similarly for following lda abs,x")
expr(0x45ae, "objectid_small_egg")
entry(0x45d2, "load_a_and_return")
label(0x45d6, "return_a")
label(0x45d7, "saved_y")
blank(0x45d8)
label(0x460c, "ground_fill_2x2_top_left")
blank(0x460c)

for i in range(0x4099, 0x40cf):
    byte(i)

# TODO: Ideally this table would be formatted something like this, but the formatting of py8dis is limited atm.
#egg_animations_table
#    !byte 0
#    !byte  spriteid_large_egg_upright,  0, 0
#    !byte 0                                                ; terminator
#
#    !byte   spriteid_large_egg_tilted,  0, 0
#    !byte 0                                                ; terminator
#
#    !byte   spriteid_large_egg_tilted, -8, 0
#    !byte spriteid_large_egg_sideways, -8, 8
#    !byte spriteid_large_egg_sideways, -4, 4
#    !byte spriteid_large_egg_sideways, -4, 4
#    !byte 0                                                ; terminator
#
#    !byte spriteid_large_egg_sideways,  0, 8
#    !byte 0                                                ; terminator
#
#    !byte spriteid_large_egg_sideways,  0, 0
#    !byte 0                                                ; terminator


for i in range(0x444d, 0x4469):
    byte(i)

for i in range(0x3b40, 0x3b44):
    expr(i, sprite_dict)


print("""; *************************************************************************************
;
; Level E: 'DUCK-EGG-BLUES'
;
; Save game variables:
;
;     save_game_level_e_small_egg_status                         ($0a13):
;               0: uninitialised
;               1: stationary
;              $c: thrown right
;             $25: thrown left
;             $32: falling
;             $ff: taken
;
;     save_game_level_e_big_egg_animation_index                  ($0a14):
;               0: uninitialised
;               1: normal position
;               5: tilted position
;               9: falling off ledge
;             $16: falling straight down
;             $1a: landed
;
;     save_game_level_e_bird_global_x_position                   ($0a15):
;             X position within the bird's cross-screen flight path
;             $ff: taken
;
; Solution:
;
;   1. Move to the room to the right and climb the rope to collect the small egg
;   2. Return to the starting room and climb the rope exiting on the right to stand on nest.
;   3. As the wizard, use the small egg to tilt the big egg.
;   4. Collect the small egg and throw from the same position. (The big egg falls)
;   5. Jump onto the big egg as the cat and jump onto the left platform to exit the room left.
;   6. Climb the rope while looking right to the top then jump off to the right, timing it to
;      collide with the bird.
;   7. Change into the bird and fly up to the top room to collect the spell.
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
