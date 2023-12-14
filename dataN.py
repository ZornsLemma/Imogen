from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_left_hook",
    0xc9: "spriteid_right_hook",
    0xca: "spriteid_horizontal_rope",
    0xcb: "spriteid_rope",
    0xcc: "spriteid_boulder",
    0xcd: "spriteid_umbrella",
    0xce: "spriteid_partition",
    0xcf: "spriteid_partition_end",
    0xd0: "spriteid_erase1",
    0xd1: "spriteid_dog_body",
    0xd2: "spriteid_erase2",
    0xd3: "spriteid_erase3",
    0xd4: "spriteid_dog_head",
    0xd5: "spriteid_dog_head_drooling",
    0xd6: "spriteid_droplet4",
    0xd7: "spriteid_droplet3",
    0xd8: "spriteid_droplet2",
    0xd9: "spriteid_droplet1",
    0xda: "spriteid_rope_end1",
    0xdb: "spriteid_tail1",
    0xdc: "spriteid_tail2",
    0xdd: "spriteid_tail3",
    0xde: "spriteid_tail4",
    0xdf: "spriteid_clanger",
    0xe0: "spriteid_clanger_menu_item",
    0xe1: "spriteid_bell",
    0xe2: "spriteid_erase4",
    0xe3: "spriteid_using_clanger",
    0xe4: "spriteid_using_clanger_end",
    0xe5: "spriteid_erase5",
    0xe6: "spriteid_holding_clanger",
    0xe7: "spriteid_clanger_end",
    0xe8: "spriteid_clanger2",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Multiple rooms
constant(2, "objectid_bell")
constant(3, "objectid_clanger_end")
constant(4, "objectid_fire1")
constant(5, "objectid_fire2")

# Room 0
constant(4, "objectid_partition_end")
constant(5, "objectid_partition")
constant(6, "objectid_sparkles")
constant(7, "objectid_drip")
constant(8, "objectid_dog_tail")
constant(9, "objectid_dog_head")
constant(10, "objectid_umbrella")

# Room 3
constant(4, "objectid_clanger")

set_sprite_dict(sprite_dict)
constant(0xc9, "inkey_key_o")

load(0x3ad5, "orig/dataN.dat", "6502", "b5b25b774079156e08f37276f6956e13")

common_to_all('N')
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3f18,0x403e): {
        "l0070": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

label(0x0a4a, "save_game_level_n_partition_y")
label(0x0a4b, "save_game_level_n_dog_head_animation")
label(0x0a4c, "save_game_level_n_got_clanger")
label(0x0a4d, "save_game_level_n_bell_animation")
label(0x0a4e, "save_game_level_n_bell_animation_step")
label(0x0a4f, "save_game_level_n_bell_x_low")
label(0x0a50, "save_game_level_n_bell_x_high")
label(0x0a51, "save_game_level_n_bell_y_low")
label(0x0a52, "save_game_level_n_bell_y_high")
label(0x0a53, "save_game_level_n_bell_room")
label(0x0a54, "save_game_level_n_bell_direction")

label(0x0a6f, "dog_tail_animation_step")
label(0x0a70, "dog_head_animation_step")
label(0x0a71, "drip_y_position")
label(0x0a72, "drip_final_delay")
label(0x0a73, "fast_forward_bell_counter")

comment(0x3af7, "check for level change (branch if not)")
label(0x3b07, "developer_mode_inactive1")
expr(0x3b0d, sprite_dict)
ground_fill(0x3b11)
byte(0x3bba)
label(0x3bba, "dog_head_animations")
byte(0x3bbb)
expr(0x3bbb, sprite_dict)
label(0x3bbb, "dog_head_normal_animation")
byte(0x3bbe)
byte(0x3bbf)
expr(0x3bbf, sprite_dict)
label(0x3bbf, "dog_head_drooling_animation")
byte(0x3bc2)
expr(0x3bc2, sprite_dict)
byte(0x3bc5)
expr(0x3bc5, sprite_dict)
byte(0x3bc8)
expr(0x3bc8, sprite_dict)
byte(0x3bcb)
expr(0x3bcb, sprite_dict)
byte(0x3bce)
expr(0x3bce, sprite_dict)
byte(0x3bd1)
expr(0x3bd1, sprite_dict)
byte(0x3bd4)
expr(0x3bd4, sprite_dict)
byte(0x3bd7)
expr(0x3bd7, sprite_dict)
byte(0x3bd8, 2)
expr(0x3bd8, sprite_dict)
byte(0x3bda)
expr(0x3bda, sprite_dict)
byte(0x3bdb, 2)
expr(0x3bdb, sprite_dict)
byte(0x3bdd)
expr(0x3bdd, sprite_dict)
byte(0x3bde, 2)
expr(0x3bde, sprite_dict)
byte(0x3be0)
expr(0x3be0, sprite_dict)
byte(0x3be1, 2)
expr(0x3be1, sprite_dict)
byte(0x3be3)
expr(0x3be3, sprite_dict)
byte(0x3be4, 2)
expr(0x3be4, sprite_dict)
byte(0x3be6)
expr(0x3be6, sprite_dict)
byte(0x3be7, 2)
expr(0x3be7, sprite_dict)
byte(0x3bea)
expr(0x3bea, sprite_dict)
label(0x3bea, "dog_head_drooling_held_animation")
byte(0x3beb, 2)
expr(0x3beb, sprite_dict)
byte(0x3bee)
expr(0x3bee, sprite_dict)
label(0x3bee, "dog_head_drooling_final_animation")
byte(0x3bef, 2)
label(0x3bf2, "dog_tail_animation")
label(0x3bf7, "room_0_update_handler")
comment(0x3bfc, "level completion code")
expr(0x3c01, "objectid_sparkles")
comment(0x3c05, "check for first update in room (branch if not)")
comment(0x3c0a, "check for level change (branch if not)")
expr(0x3c11, "dog_head_normal_animation - dog_head_animations")
label(0x3c1d, "room_changed_only")
comment(0x3c23, "draw dog body")
expr(0x3c28, sprite_dict)
comment(0x3c2c, "initialise dog tail object")
expr(0x3c2d, "objectid_dog_tail")
expr(0x3c34, "object_z_order + objectid_dog_tail")
comment(0x3c36, "initialise dog head object")
expr(0x3c37, "objectid_dog_head")
expr(0x3c3c, sprite_dict)
expr(0x3c3e, "object_erase_type + objectid_dog_head")
expr(0x3c43, "object_z_order + objectid_dog_head")
comment(0x3c45, "initialise drip")
expr(0x3c48, "object_x_low + objectid_drip")
expr(0x3c4b, sprite_dict)
expr(0x3c4d, "object_erase_type + objectid_drip")
expr(0x3c52, "object_z_order + objectid_drip")
label(0x3c54, "update_dog_head_and_drip_objects_local")
label(0x3c57, "room_0_not_first_update")
label(0x3c68, "got_dog_head_animation_step_in_y")
expr(0x3c6c, "dog_head_normal_animation - dog_head_animations")             #$1
expr(0x3c70, "dog_head_drooling_held_animation - dog_head_animations")      #$30
expr(0x3c74, "dog_head_drooling_final_animation - dog_head_animations")     #$34
label(0x3c77, "update_drip")
expr(0x3c8f, "dog_head_drooling_final_animation - dog_head_animations")     #$34
label(0x3cb5, "end_of_drooling")
expr(0x3cbb, "dog_head_normal_animation - dog_head_animations")             #$1
label(0x3cbf, "doing_normal_animation")
expr(0x3cd0, "inkey_key_o")
label(0x3cde, "start_dog_drooling")
expr(0x3cdf, "dog_head_drooling_animation - dog_head_animations")           #$5
expr(0x3ce1, "dog_head_drooling_held_animation - dog_head_animations")      #$30
label(0x3ce5, "developer_mode_inactive2")
label(0x3d01, "got_dog_tail_animation_step_in_y")
expr(0x3d0b, sprite_dict)
label(0x3d13, "update_dog_head_and_drip_objects")
expr(0x3d20, "object_spriteid + objectid_dog_head")
expr(0x3d27, "object_spriteid + objectid_drip")
expr(0x3d2d, "object_y_low + objectid_drip")
expr(0x3d36, "object_spriteid + objectid_dog_tail")
label(0x3d38, "return1")
label(0x3d39, "remember_y")
comment(0x3d3a, "check for first update in room (branch if so)")
label(0x3d3a, "update_dog_umbrella_puzzle")
comment(0x3d42, "check for level change (branch if not)")
label(0x3d42, "initialise_room_0")
label(0x3d51, "check_to_see_if_partition_should_be_up_or_down")
expr(0x3d57, "dog_head_normal_animation - dog_head_animations")             #$1
label(0x3d5a, "set_partition_up")
ab(0x3d5f)
label(0x3d61, "set_partition_down")
blank(0x3d61)
label(0x3d66, "initialise_rope_system")
ri(0x3d68)
expr(0x3d71, sprite_dict)
label(0x3d79, "draw_horizontal_rope_loop")
expr(0x3d83, sprite_dict)
label(0x3d96, "draw_vertical_rope1_loop")
#label(0x3d9f, "objectid_")
expr(0x3da4, sprite_dict)
expr(0x3da6, "object_spriteid + objectid_umbrella")
label(0x3db6, "draw_vertical_rope2_loop")
comment(0x3dbe, "initialise fire")
expr(0x3dbf, "objectid_fire1")
expr(0x3dc4, "objectid_fire2")
comment(0x3dc8, "initialise partition")
expr(0x3dc9, sprite_dict)
expr(0x3dcb, "object_spriteid + objectid_partition_end")
expr(0x3dd0, "object_z_order + objectid_partition_end")
expr(0x3dd3, sprite_dict)
expr(0x3dd5, "object_spriteid + objectid_partition")
expr(0x3dd8, sprite_dict)
expr(0x3dda, "object_erase_type + objectid_partition")
label(0x3ddc, "initialise_partition_up_and_umbrella_down_local")
label(0x3ddf, "update_room_0")
expr(0x3df1, sprite_dict)
expr(0x3df3, "object_spriteid_old + objectid_umbrella")
ldx_ldy_jsr_play_sound_yx(0x3dfb, "sound1")
label(0x3e01, "initialise_partition_down_and_umbrella_up")
expr(0x3e02, "object_y_low + objectid_partition_end")
expr(0x3e0a, sprite_dict)
expr(0x3e0c, "object_spriteid_old + objectid_umbrella")
label(0x3e16, "initialise_partition_up_and_umbrella_down")
expr(0x3e20, "object_y_low + objectid_partition_end")
expr(0x3e23, "object_y_low + objectid_partition")
expr(0x3e2f, "object_y_low + objectid_umbrella")
label(0x3e50, "check_for_changing_partition_collision_map")
comment(0x3e6e, "check for first update in room (branch if so)")
label(0x3e6e, "check_for_moving_partition_up")
comment(0x3e73, "if partition is fully down, then return")
comment(0x3e7a, "if partition is fully up, then return")
comment(0x3e7e, "move partition up")
label(0x3e84, "return2")
label(0x3e85, "reset_sound_priorities")
expr(0x3e90, "sound_priority_per_channel_table + 1")
label(0x3e92, "return3")
expr(0x3efe, sprite_dict)
label(0x3f28, "room_1_check_right_exit")
expr(0x3f2b, "exit_room_right")
label(0x3f35, "room_1_update_handler")
expr(0x3f3f, "objectid_fire1")
expr(0x3f46, "objectid_fire2")
label(0x3f4a, "draw_3x2_boulder_to_screen")
label(0x3f5c, "draw_bell")
expr(0x3f69, sprite_dict)
expr(0x3f6e, sprite_dict)
expr(0x3ffd, sprite_dict)
expr(0x4009, sprite_dict)
expr(0x4013, sprite_dict)
expr(0x401d, sprite_dict)
label(0x4034, "room_2_check_bottom_exit")
expr(0x4037, "exit_room_bottom")
label(0x4041, "bell_animations")
byte(0x4041)
label(0x4042, "bell_stopped_animation")
byte(0x4044)
label(0x4045, "bell_move_right_animation")
byte(0x4047)
label(0x4048, "bell_fall_right_animation")
byte(0x4054)
byte(0x4055, 2)
label(0x4055, "bell_fall_animation")
label(0x4058, "room_2_update_handler")
expr(0x4062, "objectid_fire1")
comment(0x4066, "check for first update in room (branch if not)")
ldx_ldy_jsr_define_envelope(0x406f, "envelope1")
ldx_ldy_jsr_define_envelope(0x4076, "envelope2")
comment(0x4079, "check for level change (branch if not)")
expr(0x4083, "bell_stopped_animation - bell_animations")
expr(0x40b2, sprite_dict)
expr(0x40b4, "object_erase_type + objectid_bell")
expr(0x40b9, "object_z_order + objectid_bell")
label(0x40c5, "fast_forward_bell_animation")
label(0x40f5, "return4_local")
expr(0x40aa, "bell_stopped_animation - bell_animations")
expr(0x4113, "bell_fall_right_animation - bell_animations") #7
expr(0x4135, "bell_move_right_animation - bell_animations") #4
label(0x414b, "play_landing_sound_local")
expr(0x414f, "bell_fall_animation - bell_animations")       #$14
ldx_ldy_jsr_play_sound_yx(0x4167, "sound2")
ldx_ldy_jsr_play_sound_yx(0x416e, "sound3")
label(0x4177, "return4")
label(0x417b, "update_bell")
expr(0x4190, "bell_stopped_animation - bell_animations")    #1
comment(0x4193, "check for first update in room (branch if so)")
expr(0x41c1, "object_collided_right_wall")
expr(0x41ca, "object_collided_left_wall")
label(0x41cd, "got_direction_in_x")
ldx_ldy_jsr_play_sound_yx(0x41e2, "sound4")
label(0x41ea, "set_bell_moving_sideways")
expr(0x41eb, "bell_move_right_animation - bell_animations") #4
expr(0x41f3, "bell_move_right_animation - bell_animations") #4
ri(0x4201)
expr(0x4227, "objectid_bell")
expr(0x422e, "bell_fall_right_animation - bell_animations") #7
expr(0x4239, "bell_fall_right_animation - bell_animations") #7
expr(0x4242, "bell_fall_animation - bell_animations")       #$14
expr(0x424a, "bell_fall_animation - bell_animations")       #$14
expr(0x4256, "objectid_bell")
expr(0x4262, "bell_stopped_animation - bell_animations")    #1
label(0x4276, "sign_extend_a_to_ax")
label(0x427d, "add_animation_offsets_to_position")
expr(0x42a2, "objectid_bell")
expr(0x42ad, "bell_move_right_animation - bell_animations") #4
label(0x42d1, "move_bell_left_one_room")
ri(0x42e6)
label(0x42e9, "hide_bell")
expr(0x42ea, sprite_dict)
expr(0x42ec, "object_spriteid + objectid_bell")
label(0x42ee, "return5")
label(0x42f0, "set_bell_object")
expr(0x42f4, "object_x_low + objectid_bell")
expr(0x42fa, "object_x_high + objectid_bell")
expr(0x4300, "object_y_low + objectid_bell")
expr(0x4306, "object_y_high + objectid_bell")
expr(0x4309, sprite_dict)
expr(0x430b, "object_spriteid + objectid_bell")
expr(0x4318, "bell_stopped_animation - bell_animations")    #1
label(0x4354, "return6")
expr(0x43cb, sprite_dict)
expr(0x43dc, sprite_dict)
expr(0x43e6, sprite_dict)
label(0x43fb, "room_3_update_handler")
expr(0x4405, "objectid_fire2")
comment(0x4409, "check for first update in room (branch if not)")
ldx_ldy_jsr_define_envelope(0x4412, "envelope3")
expr(0x4416, sprite_dict)
expr(0x441b, sprite_dict)
expr(0x4420, sprite_dict)
expr(0x4425, sprite_dict)
expr(0x4427, "object_erase_type + objectid_clanger_end")
expr(0x442c, "object_z_order + objectid_clanger_end")
expr(0x4443, sprite_dict)
expr(0x4445, "object_erase_type + objectid_clanger")
expr(0x4448, sprite_dict)
expr(0x444a, "object_spriteid + objectid_clanger")
expr(0x445b, "objectid_old_player")
expr(0x4469, sprite_dict)
expr(0x446b, "object_spriteid + objectid_clanger")
expr(0x446e, sprite_dict)
expr(0x4476, sprite_dict)
expr(0x4478, "object_spriteid + objectid_clanger_end")
expr(0x4482, sprite_dict)
expr(0x4499, "objectid_player_accessory")
expr(0x44a2, sprite_dict)
expr(0x44b0, "object_x_high + objectid_clanger_end")
expr(0x44b6, "object_y_low + objectid_clanger_end")
expr(0x44bc, "object_y_high + objectid_clanger_end")
expr(0x44c2, "object_direction + objectid_clanger_end")
expr(0x44c5, sprite_dict)
expr(0x44c7, "object_spriteid + objectid_clanger_end")
comment(0x44d9, "check for first update in room (branch if so)")
expr(0x44f0, make_lo("sound4"))
expr(0x44f2, make_hi("sound4"))
expr(0x44fa, sprite_dict)
expr(0x44aa, "object_x_low + objectid_clanger_end")
expr(0x4504, sprite_dict)
label(0x4508, "return7")

for i in range(0x4048, 0x4054, 2):
    byte(i, 2)

for i in range(0x3bf2, 0x3bf6):
    expr(i, sprite_dict)
    byte(i)


result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
