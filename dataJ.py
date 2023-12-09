from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_cannonball1",
    0xc9: "spriteid_erase_cannonball",
    0xca: "spriteid_cannonball_menu_item",
    0xcb: "spriteid_collision",
    0xcc: "spriteid_babboon1",
    0xcd: "spriteid_babboon2",
    0xce: "spriteid_babboon_push",
    0xcf: "spriteid_erase_babboon1_or_partition",
    0xd0: "spriteid_cannonball2",
    0xd1: "spriteid_cannonball_and_arm",
    0xd2: "spriteid_partition_remains",
    0xd3: "spriteid_partition",
    0xd4: "spriteid_partition_falling",
    0xd5: "spriteid_partition_fallen",
    0xd6: "spriteid_erase_babboon2",
    0xd7: "spriteid_erase_babboon3",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Room 0
constant(2, "objectid_cannonball")
constant(3, "objectid_babboon1")
constant(4, "objectid_babboon2")
constant(5, "objectid_babboon3")
constant(0x0d, "objectid_old_cannonball")

# Room 3
constant(3, "objectid_spell")
constant(4, "objectid_partition")
constant(5, "objectid_fire")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataJ.dat", "6502", "c73d7e405d93cdcff53385132a68323b")

blank(0x3f73)

common_to_all('J')
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x3d37): {
        "l0070": "room_exit_direction",
    },
    (0x3db4, 0x3e04): {
        "l0070": "temp_babboon_y",
    }
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

label(0x0078, "object_left_cell_x")
label(0x0079, "object_right_cell_x")

label(0x0a30, "save_game_level_j_got_cannonball_progress")
label(0x0a31, "save_game_level_j_room_0_babboon_animation")
label(0x0a32, "save_game_level_j_partition_progress")

label(0x0a6f, "cannonball_fast_forward_steps")
label(0x0a70, "cannonball_x_low")
label(0x0a71, "cannonball_x_high")
label(0x0a72, "cannonball_y_low")
label(0x0a73, "cannonball_y_high")
label(0x0a74, "cannonball_direction")
label(0x0a75, "cannonball_room")
label(0x0a76, "cannonball_animation_step")
label(0x0a77, "room_0_babboon_animation_step")
label(0x0a78, "room_0_babboon_y_low")
label(0x0a79, "room_0_cannonball_throw_animation_step")
label(0x0a7a, "room_1_babboon_y")
label(0x0a7b, "room_1_babboon_animation")
label(0x0a7c, "room_1_babboon_animation_step")

label(0x0a7d, "delay_before_babboon_moves_up_rope")
label(0x0a7e, "delay_timer")

label(0x38ae, "object_erase_type + objectid_cannonball")
comment(0x3af2, "check for level change (branch if not)")
label(0x3b02, "developer_mode_inactive")
expr(0x3b0a, sprite_dict)
label(0x3b0e, "return1")
expr(0x3bad, "exit_room_right")
label(0x3bb7, "babboon_base_animation")
label(0x3bb8, "babboon_idle_animation")
label(0x3bbb, "babboon_climb_up_animation")
label(0x3bc0, "babboon_climb_down_animation")
comment(0x3bc3, "check for first update in room (branch if not)")
label(0x3bc3, "room_1_update_handler")
comment(0x3bc8, "check for level change (branch if not)")
expr(0x3bcf, "babboon_idle_animation - babboon_base_animation")
label(0x3bdb, "initialise_room")
comment(0x3be1, "initialise room 1 babboon")
expr(0x3be2, sprite_dict)
expr(0x3be4, "object_erase_type + objectid_babboon1")
expr(0x3be9, "object_z_order + objectid_babboon1")
expr(0x3bee, "object_x_low + objectid_babboon1")
expr(0x3bf3, "object_direction + objectid_babboon1")
label(0x3bf5, "update_babboon_object_if_in_room_1_local")
label(0x3bf8, "room_1_not_first_update")
label(0x3baa, "room_1_check_right_exit")
label(0x3c09, "got_babboon_animation_step_in_y")
expr(0x3c0d, "babboon_climb_down_animation - babboon_base_animation")
comment(0x3c10, "babboon climbing down")
label(0x3c1a, "babboon_not_climbing_down")
expr(0x3c1e, "babboon_climb_up_animation - babboon_base_animation")
label(0x3c26, "set_babboon_idle")
expr(0x3c27, "babboon_idle_animation - babboon_base_animation")
label(0x3c30, "check_if_babboon_idle")
expr(0x3c34, "babboon_idle_animation - babboon_base_animation")
comment(0x3c37, "check_if_babboon_should_climb_up")
label(0x3c49, "set_babboon_climbing_up")
expr(0x3c4a, "babboon_climb_up_animation - babboon_base_animation")
label(0x3c4e, "set_animation_step")
comment(0x3c51, "update room 1 babboon y")
label(0x3c65, "update_babboon_object_if_in_room_1")
comment(0x3c6b, "update babboon object")
expr(0x3c72, "object_spriteid + objectid_babboon1")
expr(0x3c78, "object_y_low + objectid_babboon1")
comment(0x3c7a, "check for first update in room (branch if so)")
comment(0x3c7f, "check for player babboon collision")
expr(0x3c80, "objectid_player")
expr(0x3c82, "objectid_babboon1")
label(0x3c8d, "check_babboon_cannonball_collision")
expr(0x3c8e, "objectid_babboon1")
expr(0x3c90, "objectid_cannonball")
comment(0x3c96, "collision found, set babboon climbing down the rope")
expr(0x3c97, "babboon_climb_down_animation - babboon_base_animation")
label(0x3ca1, "return2")
label(0x3d2d, "room_2_check_right_exit")
expr(0x3d30, "exit_room_right")
comment(0x3d3a, "check for first update in room (branch if not)")
label(0x3d3a, "room_2_update_handler")
comment(0x3d3f, "check for level change (branch if not)")
label(0x3d4a, "skip_reset_delay")
expr(0x3d51, sprite_dict)
expr(0x3d53, "object_erase_type + objectid_babboon1")
expr(0x3d56, sprite_dict)
expr(0x3d58, "object_erase_type + objectid_babboon2")
expr(0x3d5b, sprite_dict)
expr(0x3d5d, "object_erase_type + objectid_babboon3")
expr(0x3d62, "object_x_low + objectid_babboon1")
expr(0x3d67, "object_direction + objectid_babboon1")
expr(0x3d6c, "object_x_low + objectid_babboon2")
expr(0x3d71, "object_direction + objectid_babboon2")
expr(0x3d76, "object_x_low + objectid_babboon3")
expr(0x3d7b, "object_direction + objectid_babboon3")
label(0x3d7d, "update_room_2_babboons_local")
label(0x3d80, "update_delay_timer")
label(0x3d8f, "update_room_2_babboons")
expr(0x3d99, "objectid_babboon1")
expr(0x3da4, "objectid_babboon2")
expr(0x3daf, "objectid_babboon3")
label(0x3db3, "return3")
label(0x3db4, "update_room_2_babboon")
comment(0x3db4, "bring the delay timer (in A) into range 0-$3c")
label(0x3dbb, "got_delay_timer")
expr(0x3dc1, sprite_dict)
label(0x3de7, "store_y_position")
expr(0x3def, sprite_dict)
comment(0x3df3, "check for first update in room (branch if so)")
label(0x3df3, "check_babboon_player_collision")
expr(0x3df9, "objectid_player")
label(0x3e04, "return4")
expr(0x3e97, "objectid_spell")
label(0x3e89, "room_3_update_handler")
comment(0x3ea4, "check for first update in room (branch if not)")
comment(0x3ea9, "check for level change (branch if not)")
label(0x3eb9, "initialise_room_3")
ldx_ldy_jsr_define_envelope(0x3ec3, "envelope1")
expr(0x3ecb, sprite_dict)
expr(0x3ed5, sprite_dict)
expr(0x3ed7, "object_erase_type + objectid_partition")
expr(0x3edc, "object_z_order + objectid_partition")
label(0x3ede, "update_partition_local")
label(0x3ee1, "room_3_not_first_update")
comment(0x3ee8, "check we are in room 3")
comment(0x3eee, "check for cannonball partition collision (branch if none)")
expr(0x3eef, "objectid_cannonball")
expr(0x3ef1, "objectid_partition")
label(0x3ef7, "partition_animation_in_progress")
comment(0x3f02, "write to clear collision map from partition area")
entry(0x3f23)
comment(0x3f23, "unused?")
ldx_ldy_jsr_play_sound_yx(0x3f29, "sound4")
ldx_ldy_jsr_play_sound_yx(0x3f30, "sound3")
label(0x3f33, "update_partition")
label(0x3f40, "set_partition_object")
expr(0x3f44, "object_spriteid + objectid_partition")
comment(0x3f46, "write collision for partition")
label(0x3f65, "write_collision_if_needed")
label(0x3f6f, "return5")
label(0x3f70, "partition_animation")
spriteid(0x3f70, 0x3f73)
comment(0x3fef, "draw cannonballs")
expr(0x3ff6, sprite_dict)
comment(0x4001, "draw base of three cannonballs")
label(0x4003, "draw_base_loop")
comment(0x4010, "draw second row of cannonballs")
label(0x401d, "draw_second_row_loop")
comment(0x402a, "draw top cannonball")
label(0x4049, "babboon_room_0_animations")
label(0x404a, "babboon_room_0_move_up_animation")
label(0x4065, "babboon_room_0_move_down_animation")
label(0x4080, "babboon_room_0_stationary1_animation")
label(0x4083, "babboon_room_0_push_animation")
label(0x4088, "babboon_room_0_stationary2_animation")
comment(0x408b, "(dX,dY) pairs of bytes when throwing a cannonball")
label(0x408b, "cannonball_throw_animation")
comment(0x40a1, "check for first update in room (branch if not)")
label(0x40a1, "room_0_update_handler")
comment(0x40a6, "check for level change (branch if not)")
comment(0x40ac, "initialise level")
label(0x40b9, "initialise_room_0")
expr(0x40c0, sprite_dict)
expr(0x40c2, "object_erase_type + objectid_babboon1")
expr(0x40c7, "object_z_order + objectid_babboon1")
expr(0x40cc, "object_x_low + objectid_babboon1")
label(0x40ce, "update_room_0_babboon_and_cannonball_puzzle_local")
label(0x40d1, "update_babboon_animation_step")
label(0x40e2, "check_if_room_0_babboon_is_climbing_up_rope")
expr(0x40e6, "babboon_room_0_move_up_animation - babboon_room_0_animations")
expr(0x40ef, "babboon_room_0_move_down_animation - babboon_room_0_animations")
expr(0x40f1, "babboon_room_0_stationary1_animation - babboon_room_0_animations")
label(0x40fd, "check_if_room_0_babboon_is_stationary")
expr(0x4101, "babboon_room_0_stationary1_animation - babboon_room_0_animations")
expr(0x4115, "babboon_room_0_push_animation - babboon_room_0_animations")
expr(0x4117, "babboon_room_0_stationary2_animation - babboon_room_0_animations")
label(0x411e, "check_if_room_0_babboon_is_throwing_cannonball")
expr(0x413b, sprite_dict)
expr(0x413d, "object_spriteid + objectid_cannonball")
label(0x4142, "check_if_in_room_0_and_cannonball_animations_are_in_progress")
label(0x4161, "start_babboon_move_up_animation")
expr(0x4162, "babboon_room_0_move_up_animation - babboon_room_0_animations")
label(0x4166, "set_room_0_babboon_animation_step")
label(0x4177, "return6_local")
label(0x417a, "update_room_0_babboon_and_cannonball_puzzle")
expr(0x4187, "object_spriteid + objectid_babboon1")
expr(0x418d, "object_y_low + objectid_babboon1")
comment(0x418f, "check for first update in room (branch if so)")
expr(0x4195, "objectid_player")
expr(0x4197, "objectid_babboon1")
comment(0x419d, "fall straight down")
label(0x41a2, "skip_setting_collision_result")
comment(0x41a7, "set cannonball object, starting at the babboon coordinates with the cannonball and arm sprite")
expr(0x41a8, sprite_dict)
expr(0x41af, "object_z_order + objectid_cannonball")
expr(0x41b2, "object_x_low + objectid_babboon1")
expr(0x41b5, "object_x_low + objectid_cannonball")
expr(0x41ba, "object_x_high + objectid_cannonball")
expr(0x41bd, "object_y_low + objectid_babboon1")
expr(0x41c0, "object_y_low + objectid_cannonball")
expr(0x41c5, "object_y_high + objectid_cannonball")
expr(0x41ca, "object_direction + objectid_cannonball")
expr(0x41cd, sprite_dict)
expr(0x41cf, "object_spriteid + objectid_cannonball")
comment(0x41d5, "update cannonball position based on animation")
expr(0x41dc, "object_x_low + objectid_cannonball")
expr(0x41e6, "object_y_low + objectid_cannonball")
expr(0x41e9, sprite_dict)
expr(0x41eb, "object_spriteid + objectid_cannonball")
expr(0x41f6, sprite_dict)
expr(0x41f8, "object_spriteid + objectid_cannonball")
comment(0x41fa, "check for first update in room (branch if so)")
label(0x41fa, "update_player_cannonball_collision_to_collect_cannonball")
expr(0x4200, "objectid_old_player")
expr(0x4202, "objectid_old_cannonball")
comment(0x4208, "cannonball collected")
expr(0x4209, sprite_dict)
expr(0x420e, sprite_dict)
expr(0x4210, "object_spriteid + objectid_cannonball")
label(0x421d, "test_for_cannonball_end_of_life")
expr(0x421e, "object_spriteid + objectid_cannonball")
expr(0x4221, sprite_dict)
label(0x422c, "return6")
label(0x422d, "cannonball_animations")
byte(0x422e,2)
label(0x422e, "cannonball_animation1")
byte(0x4230,2)
byte(0x4232,2)
byte(0x4234,2)
byte(0x4236,2)
byte(0x4238,2)
byte(0x423b,2)
label(0x423b, "cannonball_animation2")
byte(0x423e,2)
label(0x423e, "cannonball_animation3")
comment(0x4241, "check for first update in room (branch if not)")
label(0x4241, "update_cannonball")
comment(0x4246, "initialise")
expr(0x4247, sprite_dict)
expr(0x424c, sprite_dict)
ldx_ldy_jsr_define_envelope(0x4257, "envelope2")
comment(0x425a, "check for level change (branch if not)")
comment(0x4267, "reset cannonball animation progress")
label(0x426c, "check_if_cannonball_in_current_room")
label(0x427f, "fast_forward_cannonball_loop")
expr(0x428f, "objectid_cannonball")
label(0x4299, "hide_cannonball1")
expr(0x429a, sprite_dict)
expr(0x429c, "object_spriteid_old + objectid_cannonball")
label(0x429e, "return7_local")
label(0x42a1, "update_cannonball_not_first_update")
expr(0x42a2, "object_spriteid_old + objectid_cannonball")
label(0x42c0, "check_if_player_is_using_cannonball")
expr(0x42c1, sprite_dict)
comment(0x42c7, "check if just stopped 'using' cannonball")
comment(0x42cc, "remove cannonabll from toolbar")
expr(0x42cd, sprite_dict)
comment(0x42d1, "remove accessory object")
comment(0x42db, "add cannonball to room")
comment(0x42e0, "set current and next animations")
expr(0x42e1, "cannonball_animation1 - cannonball_animations")
expr(0x42e6, "cannonball_animation2 - cannonball_animations")
comment(0x42ea, "set cannonball position to be where accessory was")
comment(0x4302, "set cannonball direction")
comment(0x430b, "cannonball was drawn as accessory object, so copy to the old state")
expr(0x430c, "objectid_cannonball")
label(0x4310, "update_cannonball_in_room")
expr(0x4317, "object_spriteid_old + objectid_cannonball")
label(0x4328, "check_cannonball_last_animation")
expr(0x432c, "cannonball_animation3 - cannonball_animations")
label(0x4332, "return7")
label(0x4333, "show_cannonball_collision")
expr(0x4334, sprite_dict)
expr(0x4336, "object_spriteid + objectid_cannonball")
expr(0x4339, "cannonball_animation3 - cannonball_animations")
ldx_ldy_jsr_play_sound_yx(0x4346, "sound1")
ldx_ldy_jsr_play_sound_yx(0x434d, "sound2")
comment(0x4350, "check player cannonball collision")
expr(0x4351, "objectid_player")
expr(0x4353, "objectid_cannonball")
comment(0x4359, "decide on reaction direction based on relative x position of the cannonball and player")
expr(0x435f, "object_x_low + objectid_cannonball")
expr(0x4366, "object_x_high + objectid_cannonball")
label(0x4372, "return8")
label(0x4373, "move_to_next_cannonball_animation_step")
label(0x4384, "check_for_final_cannonball_animation")
expr(0x4388, "cannonball_animation3 - cannonball_animations")
expr(0x4399, "object_spriteid + objectid_cannonball")
label(0x43a1, "save_cannonball_animation_step")
label(0x43b1, "sign_extend_based_on_direction")
label(0x43b8, "add_animation_with_direction_to_cannonball_x")
label(0x43d1, "add_animation_to_cannonball_y")
comment(0x43e2, "update based on collision with room")
expr(0x43e3, "objectid_cannonball")
expr(0x43e8, "object_x_low + objectid_cannonball")
expr(0x43ee, "object_x_high + objectid_cannonball")
expr(0x43f4, "object_y_low + objectid_cannonball")
expr(0x43fa, "object_y_high + objectid_cannonball")
comment(0x43ff, "check for collision with extra surround")
expr(0x440e, "objectid_cannonball")
expr(0x4415, "cannonball_animation3 - cannonball_animations")
label(0x441f, "no_collision")
expr(0x4420, "objectid_cannonball")
comment(0x442c, "cannonball move right one room if needed")
expr(0x442f, "game_area_width_cells")
label(0x4448, "cannonball_move_left_one_room_if_needed")
label(0x445d, "hide_cannonball2")
expr(0x445e, sprite_dict)
expr(0x4460, "object_spriteid + objectid_cannonball")
label(0x4462, "return9")
label(0x4463, "remember_cannonball_spriteid")
label(0x4464, "set_cannonball_object")
expr(0x4465, sprite_dict)
expr(0x446c, "object_z_order + objectid_cannonball")
expr(0x4472, "object_x_low + objectid_cannonball")
expr(0x4478, "object_x_high + objectid_cannonball")
expr(0x447e, "object_y_low + objectid_cannonball")
expr(0x4484, "object_y_high + objectid_cannonball")
expr(0x448a, "object_direction + objectid_cannonball")
expr(0x448d, sprite_dict)
expr(0x448f, "object_spriteid + objectid_cannonball")
expr(0x4495, "cannonball_animation3 - cannonball_animations")
expr(0x4499, sprite_dict)
expr(0x449b, "object_spriteid + objectid_cannonball")
label(0x449d, "return10")

for i in range(0x408c, 0x40a0, 2):
    byte(i, 2)
    decimal(i, 2)

num_index = True
for i in range(0x4049, 0x408b):
    if (i == 0x4064) or (i == 0x407f) or (i == 0x4082) or (i == 0x4087):
        num_index = False
        continue
    if not num_index:
        spriteid(i)
        num_index = True
    else:
        num_index = False
        decimal(i)

num_index = False
for i in range(0x3bb8, 0x3bc3):
    if (i == 0x3bba) or (i == 0x3bbf):
        num_index = False
        continue
    if not num_index:
        spriteid(i)
        num_index = True
    else:
        num_index = False
        decimal(i)

print("""; *************************************************************************************
;
; Level J: 'BABBOONACY'
;
; Save game variables:
;
;     save_game_level_j_got_cannonball_progress                  ($0a30):
;               0: untouched
;              1+: cannonball thrown, animating
;             $ff: held by babboon
;
;     save_game_level_j_room_0_babboon_animation                 ($0a31):
;               0: untouched
;              1+: animating babboon
;             $37: descending with cannonball
;             $3f: cannonball thrown
;
;     save_game_level_j_partition_progress                       ($0a32):
;               0: untouched
;             1,2: partition falling over
;             $ff: partition fallen over
;
; Solution:
;
;   1. Move to left room and collect a cannonball that's thrown, then move back to room
;      to the right.
;   2. Stand next to the babboon and throw the cannonball at the babboon.
;   3. Quickly move back to the leftmost room and collect another cannonball.
;   4. Quickly move back to the initial room and jump over the babboon before they
;      reach the top of the rope.
;   5. Jump across the bottom of the three ropes, avoiding the babboons.
;   6. Throw the cannonball at the partition to knock it over, then collect the spell.
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
