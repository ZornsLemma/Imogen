from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_ring",
    0xc9: "spriteid_ring_menu_item",
    0xca: "spriteid_erase1",
    0xcb: "spriteid_left_hook",
    0xcc: "spriteid_rght_hook",
    0xcd: "spriteid_horizontal_rope",
    0xce: "spriteid_rope",
    0xcf: "spriteid_hook",
    0xd0: "spriteid_hook_with_ring",
    0xd1: "spriteid_short_rope",
    0xd2: "spriteid_boulder",
    0xd3: "spriteid_horizontal_bar",
    0xd4: "spriteid_left_bar",
    0xd5: "spriteid_right_bar",
    0xd6: "spriteid_rope_with_magnet",
    0xd7: "spriteid_short_bar",
    0xd8: "spriteid_sea_lion_body",
    0xd9: "spriteid_sea_lion_head1",
    0xda: "spriteid_sea_lion_head2a",
    0xdb: "spriteid_sea_lion_head2b",
    0xdc: "spriteid_table",
    0xdd: "spriteid_cane",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Multiple rooms
constant(2, "objectid_ring")
constant(0xb+2, "objectid_old_ring")

# Room 0
constant(3, "objectid_magnet")
constant(4, "objectid_short_bar")
constant(5, "objectid_sea_lion_head")

# Room 1
constant(3, "objectid_fire1")
constant(4, "objectid_fire2")
constant(5, "objectid_room1_left_hook")
constant(6, "objectid_room1_right_hook")

# Room 2
constant(3, "objectid_room2_left_hook")
constant(4, "objectid_short_left_rope")
constant(5, "objectid_room2_right_hook")
constant(6, "objectid_short_right_rope")
constant(7, "objectid_cane")

ring_constants = {
    1: "ring_on_room2_left_hook",
    2: "ring_on_room2_right_hook",
    3: "ring_on_magnet",
    4: "ring_on_room1_left_hook",
    5: "ring_on_room1_right_hook",
}

for i in ring_constants:
    constant(i, ring_constants[i])

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataP.dat", "6502", "74d7881579d26d3ec5aa7d12bb1cf39f")

common_to_all('P')
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x3d31): {
        "l0070": "room_exit_direction",
    },
    (0x412d, 0x4134): {
        "l0070": "remember_a",
    }
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

label(0x0078, "object_left_cell_x")
label(0x0079, "object_right_cell_x")

label(0x0a62, "save_game_level_p_ring_animation")
label(0x0a63, "save_game_level_p_ring_animation_step")
label(0x0a64, "save_game_level_p_ring_x_low")
label(0x0a65, "save_game_level_p_ring_x_high")
label(0x0a66, "save_game_level_p_ring_direction_without_bounces")
label(0x0a67, "save_game_level_p_ring_direction_with_bounces")
label(0x0a68, "save_game_level_p_ring_room")
label(0x0a69, "save_game_level_p_ring_y_low")
label(0x0a6a, "save_game_level_p_ring_y_high")
label(0x0a6b, "save_game_level_p_left_hook_y")          #$18 to $78
label(0x0a6c, "save_game_level_p_left_hook_speed")      #4, $fc, or 0
label(0x0a6d, "save_game_level_p_magnet_x")
label(0x0a6e, "save_game_level_p_magnet_direction")

label(0x0a6f, "fast_forward_ring_movement_steps")
label(0x0a70, "ring_bounce_cycle_animation_step")
label(0x0a71, "ring_y_position")

comment(0x3af4, "check for level change (branch if not)")
label(0x3b04, "developer_mode_inactive")
expr(0x3b0a, sprite_dict)
ground_fill(0x3b0e)
label(0x3b0e, "set_rock_tiles")
label(0x3b2a, "draw_rock_in_top_corner_cells")
expr(0x3b9f, "collision_map_solid_rock")
label(0x3bb6, "room_1_check_right_exit")
expr(0x3bb9, "exit_room_right")
label(0x3bc3, "room_1_update_handler")
comment(0x3bc8, "update braziers")
expr(0x3bcd, "objectid_fire1")
expr(0x3bd3, "objectid_fire2")
comment(0x3bd7, "check for first update in room (branch if not)")
expr(0x3bf7, "objectid_room1_left_hook")
expr(0x3c10, "objectid_short_right_rope")
expr(0x3c15, "objectid_cane")
expr(0x3c1a, sprite_dict)
expr(0x3c1c, "object_spriteid + objectid_cane")
expr(0x3c21, "object_z_order + objectid_cane")
label(0x3c33, "set_ring_sprites_local1")
label(0x3c36, "room_1_not_first_update")
expr(0x3c3a, ring_constants)
expr(0x3c3e, ring_constants)
expr(0x3c4d, "objectid_room1_left_hook")
expr(0x3c54, sprite_dict)
expr(0x3c56, "object_spriteid + objectid_ring")
expr(0x3c59, ring_constants)
label(0x3c60, "set_ring_sprites_local2")
comment(0x3c63, "unused code")
entry(0x3c63)
expr(0x3c64, "objectid_room1_right_hook")
expr(0x3c6b, sprite_dict)
expr(0x3c6d, "object_spriteid + objectid_ring")
expr(0x3c70, ring_constants)
label(0x3c77, "ring_is_on_room1_left_hook")
expr(0x3c78, "objectid_room1_left_hook")
ab(0x3c79)
blank(0x3c7b)
label(0x3c7b, "ring_is_on_room1_right_hook")
expr(0x3c7c, "objectid_room1_right_hook")
label(0x3c7d, "got_hook_sprite_in_x")
label(0x3c86, "set_ring_sprites")
expr(0x3c8d, sprite_dict)
expr(0x3c8f, "object_spriteid + objectid_room1_left_hook")
expr(0x3c95, ring_constants)
expr(0x3c99, sprite_dict)
expr(0x3c9b, "object_spriteid + objectid_room1_left_hook")
label(0x3c9d, "set_ring_sprite")
expr(0x3c9e, sprite_dict)
expr(0x3ca0, "object_spriteid + objectid_room1_right_hook")
expr(0x3ca6, ring_constants)
expr(0x3cac, "object_spriteid + objectid_room1_right_hook")
label(0x3cae, "return1")
expr(0x3caa, sprite_dict)
label(0x3d27, "room_2_check_right_exit")
expr(0x3d2a, "exit_room_right")
comment(0x3d34, "check for first update in room (branch if so)")
label(0x3d34, "room_2_update_handler")
comment(0x3d3c, "check for level change (branch if not)")
label(0x3d3c, "initialise_room_2")
ldx_ldy_jsr_define_envelope(0x3d46, "envelope1")
ldx_ldy_jsr_define_envelope(0x3d4d, "envelope2")
comment(0x3d5c, "set left hook low down and stopped")
label(0x3d68, "set_left_hook_y_in_up_position")
label(0x3d72, "position_room_2_hooks_and_rope")
expr(0x3d7d, "objectid_room2_left_hook")
expr(0x3d82, "objectid_short_left_rope")
expr(0x3d89, "object_z_order + objectid_short_left_rope")
expr(0x3d8e, "objectid_room2_right_hook")
expr(0x3d93, "objectid_short_right_rope")
expr(0x3d9a, "object_z_order + objectid_short_right_rope")
expr(0x3da1, sprite_dict)
expr(0x3da6, "collision_map_solid_rock")
label(0x3dae, "draw_horizontal_rope_loop")
expr(0x3db8, sprite_dict)
expr(0x3dbd, "collision_map_solid_rock")
label(0x3dd4, "set_hook_and_rope_objects_local1")
expr(0x3de2, sprite_dict)
expr(0x3de7, "collision_map_rope")
expr(0x3df5, ring_constants)
expr(0x3df9, ring_constants)
expr(0x3e0e, "ring_fall_to_side_animation - ring_animations")
comment(0x3e16, "handle left hook")
expr(0x3e17, "objectid_room2_left_hook")
expr(0x3e1e, sprite_dict)
expr(0x3e20, "object_spriteid + objectid_ring")
expr(0x3e23, ring_constants)
label(0x3e36, "handle_right_hook")
expr(0x3e37, "objectid_room2_right_hook")
expr(0x3e3e, sprite_dict)
expr(0x3e40, "object_spriteid + objectid_ring")
expr(0x3e43, ring_constants)
label(0x3e53, "set_hook_and_rope_objects_local2")
label(0x3e56, "check_for_hook_x_collision_with_ring")
expr(0x3e6b, "objectid_old_ring")
label(0x3e75, "skip_playing_hook_to_ring_collision_sound")
label(0x3e77, "ring_is_on_room_2_left_hook")
expr(0x3e78, "objectid_room2_left_hook")
ab(0x3e79)
blank(0x3e7b)
label(0x3e7b, "ring_is_on_room_2_right_hook")
expr(0x3e7c, "objectid_room2_right_hook")
label(0x3e7d, "check_for_picking_up_ring_if_in_room_2")
label(0x3e89, "check_for_picking_up_ring_from_hook_x")
expr(0x3e99, "objectid_old_player")
expr(0x3ea5, sprite_dict)
label(0x3ea9, "return2")
label(0x3ec5, "store_left_hook_y")
label(0x3ecd, "play_rope_movement_sound_if_in_room_2")
ldx_ldy_jsr_play_sound_yx(0x3ed9, "sound1")
expr(0x3edd, sprite_dict)
expr(0x3edf, "object_spriteid_old + objectid_short_left_rope")
expr(0x3ee2, "object_spriteid + objectid_short_left_rope")
expr(0x3eea, sprite_dict)
expr(0x3eec, "object_spriteid + objectid_short_left_rope")
label(0x3eee, "stop_drawing_short_right_rope")
expr(0x3eef, sprite_dict)
expr(0x3ef1, "object_spriteid_old + objectid_short_right_rope")
expr(0x3ef4, "object_spriteid + objectid_short_right_rope")
expr(0x3efc, sprite_dict)
expr(0x3efe, "object_spriteid + objectid_short_right_rope")
label(0x3eaa, "add_speed_to_left_hook_y")
label(0x3f03, "set_hook_and_rope_objects")
comment(0x3f09, "update room 2 left hook and rope")
expr(0x3f0d, "object_y_low + objectid_room2_left_hook")
expr(0x3f10, "object_y_low + objectid_short_left_rope")
expr(0x3f18, sprite_dict)
expr(0x3f1a, "object_spriteid + objectid_room2_left_hook")
expr(0x3f20, ring_constants)
expr(0x3f24, sprite_dict)
expr(0x3f26, "object_spriteid + objectid_room2_left_hook")
label(0x3f28, "update_room2_right_hook_and_rope")
expr(0x3f2f, "object_y_low + objectid_room2_right_hook")
expr(0x3f32, "object_y_low + objectid_short_right_rope")
expr(0x3f3a, sprite_dict)
expr(0x3f3c, "object_spriteid + objectid_room2_right_hook")
expr(0x3f42, ring_constants)
expr(0x3f46, sprite_dict)
expr(0x3f48, "object_spriteid + objectid_room2_right_hook")
label(0x3f4a, "return3")
label(0x3f4b, "update_rope_collision_map")
expr(0x3f54, "collision_map_rope")
expr(0x3f5a, "collision_map_none")
label(0x3f5f, "check_for_monkey_on_rope")
expr(0x3f62, "spriteid_icodata_monkey")
expr(0x3f69, "monkey_climb_animation - monkey_base_animation")
expr(0x3f6d, "monkey_climb_idle_animation - monkey_base_animation")
expr(0x3f71, "monkey_climb_down_animation - monkey_base_animation")
label(0x3f74, "player_is_monkey_on_rope")
label(0x3f91, "add_ay_to_player_y_position")
label(0x3fae, "return4")
label(0x3faf, "play_ring_sound")
ldx_ldy_jsr_play_sound_yx(0x3fb5, "sound2")
expr(0x401f, sprite_dict)
expr(0x4027, sprite_dict)
label(0x404a, "room_3_update_handler")
label(0x40d9, "ring_bounce_y_table")
comment(0x40e2, "check for first update in room (branch if not)")
label(0x40e2, "update_sea_lion_and_ring")
comment(0x40e7, "check for level change (branch if not)")
label(0x40f2, "update_room_only")
expr(0x40fd, sprite_dict)
expr(0x4102, "objectid_sea_lion_head")
label(0x4106, "update_sea_lion_local")
label(0x4109, "update_ring_bouncing")
label(0x4113, "store_ring_bounce_animation_step_y")
label(0x412d, "bounce_down")
label(0x4138, "add_a_to_ring_y_position")
label(0x413f, "update_sea_lion")
expr(0x4146, sprite_dict)
expr(0x4148, "object_spriteid + objectid_sea_lion_head")
expr(0x414e, ring_constants)
expr(0x4152, sprite_dict)
expr(0x4154, "object_spriteid + objectid_sea_lion_head")
comment(0x4164, "check for first update in room (branch if so)")
label(0x416f, "set_alternative_sea_lion_head")
expr(0x4170, sprite_dict)
expr(0x4172, "object_spriteid + objectid_sea_lion_head")
label(0x4174, "set_ring_object")
expr(0x4175, sprite_dict)
expr(0x4177, "object_spriteid + objectid_ring")
expr(0x417c, "object_x_low + objectid_ring")
expr(0x4182, "object_y_low + objectid_ring")
expr(0x4187, "object_z_order + objectid_ring")
expr(0x418f, "objectid_old_ring")
expr(0x4191, "objectid_magnet")
expr(0x4198, ring_constants)
expr(0x419d, sprite_dict)
expr(0x419f, "object_spriteid + objectid_ring")
label(0x41a4, "return5")
comment(0x41a5, "check for first update in room (branch if not)")
label(0x41a5, "update_magnet_and_rod")
expr(0x41d9, sprite_dict)
label(0x41e1, "draw_horizontal_bar_loop")
expr(0x41ea, sprite_dict)
expr(0x41ef, sprite_dict)
expr(0x41f1, "object_spriteid + objectid_magnet")
expr(0x41f6, "object_z_order + objectid_short_bar")
comment(0x41aa, "check for level change (branch if not)")
comment(0x4200, "magnet is not moving. check for player magnet collision")
expr(0x4201, "objectid_player")
expr(0x4203, "objectid_magnet")
label(0x421e, "set_magnet_going_right")
label(0x4223, "set_short_bar_object_if_in_room_0")
expr(0x422f, "objectid_short_bar")
expr(0x4234, sprite_dict)
expr(0x4236, "object_spriteid_old + objectid_short_bar")
expr(0x4239, sprite_dict)
expr(0x423b, "object_spriteid + objectid_short_bar")
label(0x423d, "move_magnet_bar")
comment(0x4255, "play magnet moving along bar sound")
expr(0x4258, make_lo("sound1"))
expr(0x425a, make_hi("sound1"))
label(0x4261, "magnet_at_end_of_bar")
expr(0x4279, "sound_priority_per_channel_table+1")
label(0x427b, "skip_reset_sound_priorities")
label(0x427e, "update_magnet")
comment(0x4284, "set magnet object position")
expr(0x428a, "objectid_magnet")
comment(0x428e, "set collision map for magnet")
label(0x42b4, "check_for_player_ring_collision")
expr(0x42b8, ring_constants)
comment(0x42bb, "collision check")
expr(0x42bc, "objectid_old_player")
expr(0x42be, "objectid_ring")
comment(0x42c4, "collided. hide ring, add to toolbar")
expr(0x42c5, sprite_dict)
expr(0x42c7, "object_spriteid + objectid_ring")
expr(0x42cf, sprite_dict)
label(0x42d6, "no_player_ring_collision1")
expr(0x42e4, "objectid_ring")
expr(0x42e9, sprite_dict)
expr(0x42eb, "object_spriteid + objectid_ring")
expr(0x42f0, "object_z_order + objectid_ring")
label(0x42f2, "return6")
byte(0x42f3)
label(0x42f3, "ring_animations")
byte(0x42f4)
byte(0x42f5, 2)
byte(0x42f7, 2)
byte(0x42f9, 2)
label(0x42f9, "ring_fall_to_side_animation")         #6
byte(0x42fb, 2)
byte(0x42fd, 2)
byte(0x42ff, 2)
byte(0x4301, 2)
byte(0x4303, 2)
byte(0x4305, 2)
byte(0x4307)
byte(0x4308, 2)
label(0x4308, "ring_fall_off_edge_animation")        #15
byte(0x430a, 2)
byte(0x430c, 2)
byte(0x430e, 2)
byte(0x4310, 2)
byte(0x4312, 2)
byte(0x4315, 2)
label(0x4315, "ring_straight_down_animation")        #22
byte(0x4318, 2)
label(0x4318, "ring_stationary_animation")           #25
byte(0x431b, 2)
label(0x431b, "ring_bounced_off_wall_animation")     #28
byte(0x431d, 2)
byte(0x431f, 2)
byte(0x4321, 2)
comment(0x4324, "check for first update in room (branch if so)")
label(0x4324, "update_ring")
label(0x432c, "initialise_ring")
expr(0x432d, sprite_dict)
expr(0x4332, sprite_dict)
comment(0x4339, "check for level change (branch if not)")
expr(0x4345, "ring_fall_to_side_animation - ring_animations")
expr(0x4349, "ring_stationary_animation - ring_animations")
label(0x434f, "initialise_ring_room_changed_only")
expr(0x435c, "ring_fall_to_side_animation - ring_animations")
label(0x4362, "fast_forward_ring_loop")
expr(0x4372, "objectid_ring")
label(0x437c, "hide_ring1")
expr(0x437d, sprite_dict)
expr(0x437f, "object_spriteid_old + objectid_ring")
label(0x4381, "return7_local")
label(0x4384, "update_ring_not_first_update")
expr(0x438f, "object_spriteid_old + objectid_ring")
expr(0x439a, "ring_fall_to_side_animation - ring_animations")
label(0x43af, "check_for_using_the_ring")
expr(0x43b0, sprite_dict)
expr(0x43e5, "ring_fall_to_side_animation - ring_animations")
expr(0x43f0, "objectid_ring")
expr(0x43f5, sprite_dict)
label(0x43f8, "update_ring_in_room")
label(0x4407, "check_player_ring_collision")
expr(0x440b, "object_spriteid_old + objectid_ring")
ri(0x440d)
ri(0x440f)
expr(0x4413, "objectid_ring")
expr(0x4415, "objectid_old_player")
expr(0x4428, sprite_dict)
label(0x442c, "taken_ring")
expr(0x442d, sprite_dict)
expr(0x442f, "object_spriteid + objectid_ring")
label(0x4439, "no_player_ring_collision2")
expr(0x443f, sprite_dict)
expr(0x4444, sprite_dict)
label(0x444d, "check_for_ring_moving")
expr(0x444e, "object_x_low + objectid_ring")
expr(0x4451, "object_x_low_old + objectid_ring")
label(0x4460, "ring_moving_left1")
label(0x4463, "check_ring_rock_collision")
expr(0x4469, "objectid_ring")
label(0x4475, "check_ring_movement_in_y")
expr(0x4476, "object_y_low + objectid_ring")
expr(0x4479, "object_y_low_old + objectid_ring")
expr(0x4486, "objectid_ring")
label(0x448f, "return7")
label(0x4490, "update_ring_animation")
label(0x44a1, "got_next_ring_animation_step_in_y")
label(0x44ac, "ring_moving_left2")
label(0x44af, "check_for_ring_rock_collision")
expr(0x44b5, "objectid_ring")
comment(0x44bb, "bounce the ring by inverting the X direction")
expr(0x44c7, "ring_fall_to_side_animation - ring_animations")
expr(0x44ce, "objectid_ring")
expr(0x44da, "ring_straight_down_animation - ring_animations")
expr(0x44df, "ring_fall_off_edge_animation - ring_animations")
expr(0x44e1, "objectid_ring")
expr(0x44e9, "ring_straight_down_animation - ring_animations")
expr(0x44f2, "ring_stationary_animation - ring_animations")
expr(0x44fc, "ring_straight_down_animation - ring_animations")
expr(0x4501, "ring_bounced_off_wall_animation - ring_animations")
label(0x4510, "store_ring_animation_step")
expr(0x4517, "ring_stationary_animation - ring_animations")
label(0x4533, "add_ax_to_ring_x_position")
label(0x454c, "add_ax_to_ring_y_position")
expr(0x455e, "objectid_ring")
expr(0x4563, "object_x_low + objectid_ring")
expr(0x4569, "object_x_high + objectid_ring")
expr(0x456f, "object_y_low + objectid_ring")
expr(0x4575, "object_y_high + objectid_ring")
expr(0x457b, "objectid_ring")
expr(0x458a, "game_area_width_cells")
comment(0x458d, "move ring right one room")
label(0x45a3, "check_if_ring_should_move_one_room_left")
label(0x45b8, "hide_ring2")
expr(0x45b9, sprite_dict)
expr(0x45bb, "object_spriteid + objectid_ring")
label(0x45bd, "return8")
label(0x45be, "update_ring_object")
expr(0x45bf, sprite_dict)
expr(0x45c1, "object_erase_type + objectid_ring")
expr(0x45c6, "object_z_order + objectid_ring")
expr(0x45cc, "object_x_low + objectid_ring")
expr(0x45d2, "object_x_high + objectid_ring")
expr(0x45d8, "object_y_low + objectid_ring")
expr(0x45de, "object_y_high + objectid_ring")
expr(0x45e1, sprite_dict)
expr(0x45e3, "object_spriteid + objectid_ring")
expr(0x45e9, "object_direction + objectid_ring")

print("""; *************************************************************************************
;
; Level P: 'TENDER-HOOKS'
;
; Save game variables:
;
;     save_game_level_p_ring_animation                           ($0a62):
;              $0: sea lion is bouncing the ring
;              $1: on left hook in room 2
;              $2: on right hook in room 2
;              $3: on magnet
;              $4: on left hook in room 1
;              $5: on right hook in room 1
;              $6: falling to one side
;             $15: falling off edge to one side
;             $22: fall straight down
;             $25: stationary
;             $28: bounced off wall
;             $ff: taken
;
; Solution:
;
;   1. Go to the leftmost room with the sea lion bouncing a ring. Climb the left rope.
;   2. Jump into the magnet to make it travel across the screen past the ring as the ring reaches
;      its highest point. (The ring sticks to the magnet)
;   3. Jump into the ring from the other rope to collect it.
;   4. In the room to the right, climb the rope with the cane attached and exit right.
;   5. Use the ring to throw it onto the left hook. (The rope descends on the left)
;   6. Collect the ring and repeat with the right hook to jump over to the right side of the room
;      at the top.
;   7. In the rightmost room, jump across the ropes to collect the spell.
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
