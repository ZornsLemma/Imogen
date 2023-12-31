from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_rope_hook_left",
    0xc9: "spriteid_rope_hook_right",
    0xca: "spriteid_rope_short_horizontal",
    0xcb: "spriteid_rope_short_vertical",
    0xcc: "spriteid_rope_vertical",
    0xcd: "spriteid_rope_vertical_end",
    0xce: "spriteid_rope_and_partition",
    0xcf: "spriteid_erase_partition_or_banana",
    0xd0: "spriteid_boulder",
    0xd1: "spriteid_erase_gorilla",
    0xd2: "spriteid_gorilla1",
    0xd3: "spriteid_gorilla2",
    0xd4: "spriteid_gorilla3",
    0xd5: "spriteid_gorilla4",
    0xd6: "spriteid_gorilla5",
    0xd7: "spriteid_gorilla_climb1",
    0xd8: "spriteid_gorilla_climb2",
    0xd9: "spriteid_gorilla_jump",
    0xda: "spriteid_banana",
    0xdb: "spriteid_banana_menu_item",
    0xdc: "spriteid_banana_bunch",
    0xdd: "spriteid_banana_on_ground",
    0xde: "spriteid_gorilla_pushes",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Multiple rooms
constant(5, "objectid_gorilla")

# Room 0
constant(2, "objectid_room_0_brazier")

# Room 1
constant(2, "objectid_rope_end")
constant(3, "objectid_partition")
constant(4, "objectid_connecting_rope")
constant(6, "objectid_room_1_brazier")

# Room 2
constant(3, "objectid_spell")

# Room 3
constant(2, "objectid_banana")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataF.dat", "6502", "5ae4be40f790e2c1de27b92942f3b2ed")

common_to_all('F')
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x3c49): {
        "l0070": "room_exit_direction",
    },
    (0x4010, 0x401c): {
        "l0070": "temp_x",
    }
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

label(0x0a16, "save_game_level_f_got_banana_or_banana_y_position")

label(0x0a6f, "partition_position_y")
label(0x0a70, "gorilla_animation")
label(0x0a71, "gorilla_y_position")
label(0x0a72, "gorilla_x_position")
label(0x0a73, "gorilla_direction")
label(0x0a74, "gorilla_animation_step")
label(0x0a75, "delay_before_gorilla_state_change")

label(0x38ae, "object_erase_type + objectid_banana")
label(0x38b1, "object_erase_type + objectid_gorilla")
label(0x38c4, "object_z_order + objectid_banana")
label(0x38c7, "object_z_order + objectid_gorilla")
label(0x3970, "sound_priority_per_channel_table + 1")
comment(0x3af1, "check for level change (branch if not)")
label(0x3b01, "developer_mode_inactive")
expr(0x3b09, sprite_dict)
label(0x3b0d, "set_rock")
ground_fill(0x3b0d)
label(0x3bae, "room_0_check_right_exit")
expr(0x3bb1, "exit_room_right")
label(0x3bbb, "room_0_update_handler")
expr(0x3bc1, "objectid_room_0_brazier")
label(0x3c3f, "room_1_check_right_exit")
expr(0x3c42, "exit_room_right")
label(0x3c4c, "room_1_update_handler")
expr(0x3c56, "objectid_room_1_brazier")
comment(0x3c5a, "check for first update in room (branch if so)")
comment(0x3c62, "check for level change (branch if not)")
label(0x3c62, "room_1_first_update")
label(0x3c6d, "skip_level_change")
label(0x3c76, "room_1_initialise")
ldx_ldy_jsr_define_envelope(0x3c7a, "partition_moving_envelope")
ldx_ldy_jsr_define_envelope(0x3c81, "partition_landing_envelope")
comment(0x3c84, "draw hooks, including collision map")
expr(0x3c93, sprite_dict)
expr(0x3c9a, sprite_dict)
label(0x3ca2, "draw_horizontal_rope_loop")
label(0x3cba, "draw_left_vertical_rope_loop")
expr(0x3cbb, sprite_dict)
comment(0x3cc9, "set rope end object")
expr(0x3cca, "objectid_rope_end")
expr(0x3cd0, sprite_dict)
comment(0x3cdd, "draw short end rope to hit partition")
expr(0x3ce8, sprite_dict)
label(0x3cec, "check_amount_of_vertical_rope_to_draw")
label(0x3cfd, "draw_right_vertical_rope_loop")
comment(0x3caa, "left vertical hand rope")
label(0x3d05, "skip_right_hand_rope_drawing_as_partition_already_fully_up")
comment(0x3d05, "write values to partition object")
expr(0x3d06, "objectid_partition")
expr(0x3d0b, "objectid_connecting_rope")
expr(0x3d19, "objectid_partition")
expr(0x3d1b, sprite_dict)
expr(0x3d20, sprite_dict)
label(0x3d29, "update_rope_end_position_local")
label(0x3d2c, "update_partition_puzzle")
comment(0x3d32, "update room 1 sound priorities")
label(0x3d41, "skip_reset_sound_priority")
expr(0x3d4c, "gorilla_climbing_rope_animation - gorilla_animations_table")
expr(0x3d50, "gorilla_on_rope_animation - gorilla_animations_table")
label(0x3d53, "gorilla_on_rope")
expr(0x3d6a, "object_y_low + objectid_gorilla")
label(0x3d6f, "return1_local")
label(0x3d72, "gorilla_not_on_rope")
comment(0x3d78, "update the rope position. First check player is the monkey")
expr(0x3d7b, "spriteid_icodata_monkey")
comment(0x3d7e, "check player animation")
expr(0x3d82, "monkey_climb_animation - monkey_base_animation")
expr(0x3d86, "monkey_climb_idle_animation - monkey_base_animation")
expr(0x3d8a, "monkey_climb_down_animation - monkey_base_animation")
comment(0x3d8d, "check partition position. If fully raised, then return")
label(0x3d8d, "player_is_monkey_on_rope")
comment(0x3d94, "move player down rope as it moves")
label(0x3da6, "move_partition_up")
comment(0x3daf, "check if we are in room 1")
expr(0x3db9, "objectid_connecting_rope")
comment(0x3dc3, "while partition is moving, remove the short vertical rope")
expr(0x3dc4, sprite_dict)
label(0x3dd0, "player_not_on_rope")
label(0x3dda, "calculate_connecting_rope")
expr(0x3ddd, sprite_dict)
expr(0x3de7, sprite_dict)
label(0x3dea, "remember_connecting_rope")
comment(0x3df3, "check if we are in room 1")
comment(0x3df9, "check for partition landing or moving (for playing sound)")
label(0x3e06, "play_partition_landing_sound")
ldx_ldy_jsr_play_sound_yx(0x3e0c, "partition_landing_sound1")
ldx_ldy_jsr_play_sound_yx(0x3e13, "partition_landing_sound2")
label(0x3e16, "update_connecting_rope_position")
expr(0x3e17, "objectid_connecting_rope")
comment(0x3e22, "restore the connecting rope")
label(0x3e2d, "update_rope_end_position")
expr(0x3e34, "objectid_rope_end")
comment(0x3e46, "update collision map for rope and partition")
expr(0x3e5e, "object_y_low + objectid_partition")
label(0x3e7b, "partition_is_closed")
label(0x3e85, "collision_map_written")
expr(0x3e86, "objectid_player")
expr(0x3e88, "objectid_partition")
comment(0x3e8e, "player collided with partition, get pushed left")
comment(0x3e93, "but if player is to the right of the wall, the get pushed right")
label(0x3ea6, "return1")
label(0x3ea7, "remembered_rope_y_offset")
label(0x3ea8, "remembered_connecting_rope_spriteid")
label(0x3ea9, "play_partition_moving_sound")
ldx_ldy_jsr_play_sound_yx(0x3eaf, "partition_moving_sound")
label(0x3f5a, "room_2_update_handler")
expr(0x3f60, "objectid_room_0_brazier")
expr(0x3f69, "objectid_spell")
label(0x3f72, "gorilla_animations_table")
label(0x3f72, "gorilla_push_animation")
expr(0x3f72, sprite_dict)
byte(0x3f72, 3)
expr(0x3f75, sprite_dict)
byte(0x3f75, 3)
expr(0x3f78, sprite_dict)
byte(0x3f78, 3)
expr(0x3f7b, sprite_dict)
byte(0x3f7b, 3)
expr(0x3f7e, sprite_dict)
byte(0x3f7e, 3)
expr(0x3f81, sprite_dict)
expr(0x3f84, sprite_dict)
byte(0x3f84, 3)
expr(0x3f87, sprite_dict)
byte(0x3f8a)
label(0x3f8b, "gorilla_idle_animation")
expr(0x3f8b, sprite_dict)
byte(0x3f8e)
label(0x3f8f, "gorilla_walk_cycle_animation")
expr(0x3f8f, sprite_dict)
expr(0x3f92, sprite_dict)
expr(0x3f95, sprite_dict)
expr(0x3f98, sprite_dict)
byte(0x3f9b)
label(0x3f9c, "gorilla_jump_on_rope_animation")
expr(0x3f9c, sprite_dict)
byte(0x3f9c, 3)
expr(0x3f9f, sprite_dict)
byte(0x3f9f, 3)
expr(0x3fa2, sprite_dict)
expr(0x3fa5, sprite_dict)
byte(0x3fa5, 3)
expr(0x3fa8, sprite_dict)
expr(0x3fab, sprite_dict)
byte(0x3fab, 3)
expr(0x3fae, sprite_dict)
byte(0x3fb1)
label(0x3fb2, "gorilla_jump_off_rope_animation")
expr(0x3fb2, sprite_dict)
byte(0x3fb2, 3)
expr(0x3fb5, sprite_dict)
byte(0x3fb5, 3)
expr(0x3fb8, sprite_dict)
expr(0x3fbb, sprite_dict)
byte(0x3fbb, 3)
expr(0x3fbe, sprite_dict)
expr(0x3fc1, sprite_dict)
byte(0x3fc1, 3)
expr(0x3fc4, sprite_dict)
byte(0x3fc4, 3)
byte(0x3fc7)
label(0x3fc8, "gorilla_on_rope_animation")
expr(0x3fc8, sprite_dict)
byte(0x3fcb)
label(0x3fcc, "gorilla_climbing_rope_animation")
expr(0x3fcc, sprite_dict)
expr(0x3fcf, sprite_dict)
byte(0x3fcf, 3)
byte(0x3fd2)
comment(0x3fd3, "check for first update in room (branch if not)")
label(0x3fd3, "update_gorilla_puzzle")
comment(0x3fd8, "check for level change (branch if not)")
expr(0x3fee, "gorilla_idle_animation - gorilla_animations_table")
label(0x3ff8, "initialise_room_only")
expr(0x3fff, sprite_dict)
expr(0x400b, "object_y_high + objectid_gorilla")
label(0x400d, "initialise_room_2_or_3")
label(0x4010, "update_gorilla_not_first_update")
comment(0x4010, "take the player x position, divide by four to get an x position that ranges from (0-79)")
comment(0x401d, "add 80 for room 1 and another 80 for room 2")
label(0x402b, "got_the_player_position")
label(0x4039, "got_direction_for_the_gorilla")
comment(0x403c, "set Y to next animation step")
label(0x404b, "loop_animation_if_needed")
label(0x4053, "update_gorilla_delay")
expr(0x4057, "gorilla_jump_on_rope_animation - gorilla_animations_table")
comment(0x405a, "gorilla is jumping onto a rope. Are we at the end of the animation?")
comment(0x405f, "set (loop) the animation to the on rope animation. [not technically needed, isnt it already set?]")
expr(0x4060, "gorilla_on_rope_animation - gorilla_animations_table")
comment(0x4064, "set a 4 frame delay before changing state")
expr(0x4071, "gorilla_climbing_rope_animation - gorilla_animations_table")
label(0x407a, "not_jump_on_rope")
expr(0x407e, "gorilla_climbing_rope_animation - gorilla_animations_table")
expr(0x4089, "gorilla_on_rope_animation - gorilla_animations_table")
label(0x4092, "gorilla_in_room_0_local")
label(0x4095, "gorilla_check_jumping_off_rope")
expr(0x4099, "gorilla_jump_off_rope_animation - gorilla_animations_table")
comment(0x409c, "are we at the end of the animation?")
expr(0x40a2, "gorilla_idle_animation - gorilla_animations_table")
label(0x40a9, "update_gorilla_if_banana_held")
expr(0x40ac, sprite_dict)
label(0x40d7, "check_for_gorilla_on_rope")
expr(0x40db, "gorilla_on_rope_animation - gorilla_animations_table")
label(0x40e1, "update_gorilla_jumping_off_rope")
expr(0x40ed, "gorilla_on_rope_animation - gorilla_animations_table")
expr(0x40f6, "gorilla_jump_off_rope_animation - gorilla_animations_table")
label(0x40fd, "check_gorilla_x_position")
comment(0x4102, "check gorilla x position moving right")
label(0x4118, "check_gorilla_x_position_moving_left")
label(0x412e, "gorilla_set_jump_on_rope")
expr(0x412f, "gorilla_jump_on_rope_animation - gorilla_animations_table")
label(0x4136, "update_gorilla_if_walk_cycle")
expr(0x4137, "gorilla_walk_cycle_animation - gorilla_animations_table")
label(0x4144, "update_gorilla_if_not_idle")
expr(0x4145, "gorilla_idle_animation - gorilla_animations_table")
label(0x4152, "update_gorilla_state")
label(0x4186, "set_player_reaction_speed")
comment(0x4186, "if gorilla is climbing or on rope then fall off gorilla")
comment(0x418b, "branch if climbing or on rope")
expr(0x418f, "gorilla_climbing_rope_animation - gorilla_animations_table")
expr(0x4193, "gorilla_on_rope_animation - gorilla_animations_table")
label(0x419f, "set_player_reaction_speed_bounce_off_gorilla")
expr(0x41a6, "gorilla_jump_on_rope_animation - gorilla_animations_table")
label(0x41b6, "set_gorilla_direction")
expr(0x41ba, "gorilla_idle_animation - gorilla_animations_table")
label(0x41c3, "update_gorilla_idle_delay")
expr(0x41c7, "gorilla_idle_animation - gorilla_animations_table")
label(0x41d2, "update_gorilla_state_based_on_animation_step")
label(0x41e3, "add_offset_to_x_position")
comment(0x41eb, "add offset to y position")
label(0x41f5, "update_gorilla_object")
expr(0x41aa, "gorilla_jump_off_rope_animation - gorilla_animations_table")
expr(0x4202, "object_spriteid + objectid_gorilla")
expr(0x4208, "object_direction + objectid_gorilla")
expr(0x420e, "object_y_low + objectid_gorilla")
comment(0x4213, "reduce gorilla position to room position")
label(0x421a, "reduced_to_room_0")
label(0x4221, "set_gorilla_x_position")
expr(0x4222, "object_x_high + objectid_gorilla")
expr(0x4226, "object_x_high + objectid_gorilla")
expr(0x422a, "object_x_high + objectid_gorilla")
expr(0x422d, "object_x_low + objectid_gorilla")
expr(0x4235, "object_x_low + objectid_gorilla")
expr(0x423b, "object_x_low + objectid_gorilla")
expr(0x423e, "object_x_high + objectid_gorilla")
expr(0x4243, "object_x_high + objectid_gorilla")
comment(0x4245, "check for first update in room (branch if so)")
label(0x4245, "update_gorilla_jump_off_rope")
expr(0x424e, "gorilla_jump_off_rope_animation - gorilla_animations_table")
label(0x4260, "return2")
label(0x4261, "get_random_gorilla_idle_delay")
label(0x426d, "gorilla_to_player_direction")
label(0x426e, "remember_gorilla_state")
comment(0x42f8, "check for first update in room (branch if not)")
label(0x42f8, "update_banana_puzzle")
comment(0x42fd, "initialise banana")
expr(0x42fe, sprite_dict)
expr(0x4303, sprite_dict)
comment(0x430a, "check for level change (branch if not)")
label(0x431e, "initialise_banana_new_room")
comment(0x4324, "in room 3. Draw bunch of bananas")
expr(0x432d, sprite_dict)
expr(0x4332, sprite_dict)
expr(0x433e, "object_x_low + objectid_banana")
expr(0x4343, "object_x_high + objectid_banana")
expr(0x4348, "object_y_high + objectid_banana")
label(0x434a, "banana_already_landed_or_taken_local")
label(0x434d, "update_banana_not_first_update")
comment(0x435e, "as soon as the player lands, then create a banana")
ab(0x436c)
blank(0x436e)
label(0x436e, "update_banana_in_room_3")
expr(0x4375, "objectid_old_player")
expr(0x437e, sprite_dict)
ab(0x4384)
blank(0x4386)
label(0x4386, "no_banana_collision")
label(0x43a5, "banana_on_ground")
label(0x43a7, "set_banana_y")
comment(0x43b0, "don't show the banana object if there's no banana visible yet")
expr(0x43b1, sprite_dict)
expr(0x43b3, "object_spriteid + objectid_banana")
expr(0x43b3, "object_spriteid + objectid_banana")
comment(0x43ba, "don't show the banana object if it's already taken")
comment(0x43be, "set the banana y position")
expr(0x43bf, "object_y_low + objectid_banana")
comment(0x43c1, "set the banana on the ground sprite, exit if on the ground")
expr(0x43c2, sprite_dict)
expr(0x43c4, "object_spriteid + objectid_banana")
comment(0x43ca, "set the banana in the air sprite")
expr(0x43cb, sprite_dict)
expr(0x43cd, "object_spriteid + objectid_banana")
label(0x43cf, "return3")
label(0x43aa, "banana_already_landed_or_taken")

print("""; *************************************************************************************
;
; Level F: 'FOLLOW-ME'
;
; Save game variables:
;
;     save_game_level_f_got_banana_or_banana_y_position ($0a16):
;               0: not got
;              1+: banana y position
;             $ff: got
;
; Solution:
;
;   1. Head to the left room and down the ladder
;   2. Collect the banana that's fallen on the right side of the room
;   3. Head up the rope to the right of the gorilla in the room above, and exit the room to the right
;   4. Jump on the rope and climb until the partition is raised
;   5. Jump off the rope to the right. Hold the banana as the wizard until the gorilla starts to climb the left rope.
;   6. Stop holding the banana.
;   7. Jump right as the cat to get through to the right hand room, and collect the spell.
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
