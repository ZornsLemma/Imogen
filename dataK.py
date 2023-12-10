from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_stalk",
    0xc9: "spriteid_stalk_bottom_end",
    0xca: "spriteid_stalk_top_end",
    0xcb: "spriteid_stalk_top_end_short",
    0xcc: "spriteid_full_bottle",
    0xcd: "spriteid_leaf",
    0xce: "spriteid_leaf_grow3",
    0xcf: "spriteid_leaf_grow2",
    0xd0: "spriteid_leaf_grow1",
    0xd1: "spriteid_erase_1",
    0xd2: "spriteid_empty_bottle",
    0xd3: "spriteid_empty_bottle_held",
    0xd4: "spriteid_full_bottle_held",
    0xd5: "spriteid_emptying_bottle",
    0xd6: "spriteid_empty_bottle_menu_item",
    0xd7: "spriteid_full_bottle_menu_item",
    0xd8: "spriteid_bucket",
    0xd9: "spriteid_splash",
    0xda: "spriteid_droplet",
    0xdb: "spriteid_droplet1",
    0xdc: "spriteid_droplet2",
    0xdd: "spriteid_droplet3",
    0xde: "spriteid_droplet4",
    0xdf: "spriteid_pour",
    0xe0: "spriteid_leaf_wilt_1",
    0xe1: "spriteid_leaf_wilt_2",
    0xe2: "spriteid_leaf_wilt_3",
    0xe3: "spriteid_leaf_wilt_4",
    0xe4: "spriteid_erase_2",
    0xe5: "spriteid_shelf",
    0xe6: "spriteid_shelf_support",
    0xe7: "spriteid_erase_3",
    0xe8: "spriteid_dog_dead",
    0xe9: "spriteid_dog_body",
    0xea: "spriteid_dog_head",
    0xeb: "spriteid_dog_head_licking",
    0xec: "spriteid_dog_bowl1",
    0xed: "spriteid_dog_bowl2",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Multiple rooms
constant(2, "objectid_bottle_pour")
constant(3, "objectid_drip")
constant(0xb+3, "objectid_old_drip")

# Room 0
constant(3, "objectid_empty_bottle")
constant(4, "objectid_spell")
constant(5, "objectid_dog_body")
constant(6, "objectid_dog_head")
constant(7, "objectid_dog_bowl")

# Room 1
constant(4, "objectid_room_1_fire1")
constant(5, "objectid_room_1_fire2")

# Room 2
constant(3, "objectid_top_of_stalk")
constant(4, "objectid_leaf1")
constant(5, "objectid_leaf2")
constant(6, "objectid_room2_fire1")
constant(7, "objectid_room2_fire2")

# Room 3
constant(4, "objectid_room_3_fire")

# Debug keys
constant(0xac, "inkey_key_g")
constant(0xc8, "inkey_key_p")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataK.dat", "6502", "8cdca3e68b752622cd596db68f24d8c4")

common_to_all('K')
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x3bce): {
        "l0070": "room_exit_direction",
    },
    (0x3c38, 0x3c59): {
        "l0070": "temp_stalk_y",
    },
    (0x3cd0, 0x3d07): {
        "l0070": "stalk_cell_y_min",
    },
    (0x3db6, 0x3e1f): {
        "l0070": "temp_stalk_y",
    },
    (0x4387, 0x43a1): {
        "l0070": "room_exit_direction",
    },
    (0x4441, 0x4448): {
        "l0070": "temp_y",
    }
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

label(0x0078, "object_left_cell_x")
label(0x0079, "object_right_cell_x")

label(0x0a33, "save_game_level_k_plant_top_y")
label(0x0a34, "save_game_level_k_plant_growth_timer")
label(0x0a35, "save_game_level_k_got_bottle_flag")
label(0x0a36, "save_game_level_k_poison_in_bottle_flag")
label(0x0a37, "save_game_level_k_dog_animation")
label(0x0a38, "save_game_level_k_poison_dog_animation_step")

label(0x0a6f, "room_1_drip_timer")
label(0x0a70, "bottle_pour_x_low")
label(0x0a71, "bottle_pour_x_high")
label(0x0a72, "bottle_pour_y")
label(0x0a73, "bottle_pour_animation_step")
label(0x0a74, "bottle_pour_direction")
label(0x0a75, "room_3_drip_timer")
label(0x0a76, "dog_animation_step")

label(0x2ef4, "collectable_being_used_spriteids + 2")

comment(0x3af6, "check for level change (branch if not)")
label(0x3b0b, "developer_mode_inactive1")
expr(0x3b15, sprite_dict)
label(0x3b1c, "add_full_bottle_to_toolbar")
expr(0x3b1d, sprite_dict)
ground_fill(0x3b21)
label(0x3b21, "set_ground_tile")
label(0x3b3a, "draw_top_and_bottom_rows")
label(0x3b4e, "draw_top_left_and_right_corners")
label(0x3bc4, "room_2_check_right_exit")
expr(0x3bc7, "exit_room_right")
byte(0x3bd1)
expr(0x3bd1, sprite_dict)
label(0x3bd1, "growing_leaf_animation")
byte(0x3bd2)
expr(0x3bd2, sprite_dict)
byte(0x3bd3)
expr(0x3bd3, sprite_dict)
expr(0x3bd4, sprite_dict)
label(0x3bd4, "full_leaf")
byte(0x3bd5)
expr(0x3bd5, sprite_dict)
label(0x3bd5, "leaf_wilt_animation")
byte(0x3bd6)
expr(0x3bd6, sprite_dict)
byte(0x3bd7)
expr(0x3bd7, sprite_dict)
expr(0x3bd8, sprite_dict)
label(0x3bd8, "leaf_start_wilting")
label(0x3bd9, "room_2_update_handler")
expr(0x3be3, "objectid_room2_fire1")
expr(0x3bea, "objectid_room2_fire2")
comment(0x3bee, "check for first update in room (branch if so)")
comment(0x3bf6, "check for level change (branch if not)")
label(0x3bf6, "initialise_room_2")
comment(0x3bfc, "initialise plant top y value")
label(0x3c0d, "check_plant_growth_timer")
comment(0x3c14, "reset timer and grow plant by 32 pixels")
label(0x3c25, "initialise_poisoned_plant")
comment(0x3c25, "poisoned plant starts at maximum height")
label(0x3c2f, "room_changed_only")
label(0x3c38, "initialise_in_room_2")
comment(0x3c3f, "calculate position of top of stalk")
label(0x3c52, "got_temp_stalk_y")
label(0x3c59, "got_top_of_stalk_in_y")
expr(0x3c6d, "collision_map_solid_rock")
expr(0x3c78, sprite_dict)
expr(0x3c7d, "objectid_top_of_stalk")
label(0x3c86, "draw_stalk_to_bottom")
comment(0x3c8e, "draw bottom of stalk")
expr(0x3c8f, sprite_dict)
label(0x3cbb, "draw_leaves")
expr(0x3cc3, "object_z_order + objectid_leaf1")
expr(0x3cc6, "object_z_order + objectid_leaf2")
expr(0x3ccb, "object_direction + objectid_leaf2")
label(0x3ccd, "plant_is_growing_local1")
label(0x3cd0, "draw_leaves_on_stalk")
label(0x3cdc, "draw_leaves_loop")
expr(0x3ce6, "objectid_leaf1")
expr(0x3cfd, "objectid_leaf2")
label(0x3d07, "return1")
label(0x3d08, "draw_leaf_sprite")
label(0x3d09, "stalk_cell_y_max")
label(0x3d0a, "plant_is_growing_local2")
label(0x3d0d, "update_room_2")
expr(0x3d1e, "inkey_key_g")
expr(0x3d25, "inkey_key_p")
label(0x3d2b, "developer_mode_inactive2")
expr(0x3d2c, "object_spriteid + objectid_bottle_pour")
expr(0x3d2f, sprite_dict)
expr(0x3d33, "objectid_bottle_pour")
label(0x3d48, "grow_plant")
label(0x3d52, "poison_plant")
label(0x3d63, "check_plant_timer")
label(0x3d73, "increment_growth")
label(0x3d7c, "finished_growing")
label(0x3d8d, "plant_is_poisoned")
label(0x3d9f, "increment_poisoning_state")
label(0x3da8, "poison_stage_increases")
label(0x3db6, "plant_is_growing_or_poisoned")
label(0x3dd6, "get_y_position_of_stalk")
label(0x3ddd, "update_stalk_top_object_and_collision_map")
expr(0x3dde, sprite_dict)
expr(0x3de0, "object_spriteid_old + objectid_top_of_stalk")
expr(0x3de3, "object_spriteid + objectid_top_of_stalk")
expr(0x3de6, "object_y_low + objectid_top_of_stalk")
expr(0x3deb, "object_y_low + objectid_top_of_stalk")
expr(0x3df5, "collision_map_rope")
expr(0x3dfb, "collision_map_solid_rock")
expr(0x3e00, sprite_dict)
expr(0x3e02, "object_spriteid + objectid_top_of_stalk")
label(0x3e07, "return2_local")
label(0x3e0a, "hide_leaf_objects_when_stalk_is_full")
expr(0x3e12, sprite_dict)
expr(0x3e14, "object_spriteid_old + objectid_leaf1")
expr(0x3e17, "object_spriteid_old + objectid_leaf2")
expr(0x3e1a, "object_spriteid + objectid_leaf1")
expr(0x3e1d, "object_spriteid + objectid_leaf2")
label(0x3e22, "set_leaf_positions")
expr(0x3e29, "object_y_low + objectid_leaf1")
expr(0x3e32, "object_y_low + objectid_leaf2")
expr(0x3e3c, sprite_dict)
expr(0x3e3e, "object_spriteid_old + objectid_leaf1")
expr(0x3e41, "object_spriteid_old + objectid_leaf2")
label(0x3e43, "plant_growing")
expr(0x3e44, sprite_dict)
expr(0x3e46, "object_spriteid + objectid_leaf1")
expr(0x3e49, "object_spriteid + objectid_leaf2")
label(0x3e5a, "set_leaf2_sprite")
expr(0x3e5e, "object_spriteid + objectid_leaf2")
label(0x3e6f, "set_leaf1_sprite")
expr(0x3e73, "object_spriteid + objectid_leaf1")
label(0x3e78, "update_plant_wilting")
comment(0x3e7c, "check for first update in room (branch if so)")
comment(0x3e81, "copy to old, so the leaves don't get erased when the objects move")
expr(0x3e82, "objectid_leaf2")
expr(0x3e87, "objectid_leaf1")
expr(0x3e8f, "object_spriteid_old + objectid_leaf1")
expr(0x3e92, "object_spriteid_old + objectid_leaf2")
label(0x3e94, "set_full_leaf")
expr(0x3e98, "object_spriteid + objectid_leaf1")
expr(0x3e9b, "object_spriteid + objectid_leaf2")
label(0x3eae, "update_leaf2")
expr(0x3eb2, "object_spriteid + objectid_leaf2")
label(0x3ec5, "update_leaf1")
expr(0x3ec9, "object_spriteid + objectid_leaf1")
label(0x3ecb, "return2")
expr(0x3f27, sprite_dict)
expr(0x3f34, sprite_dict)
expr(0x3f41, sprite_dict)
label(0x3f56, "room_3_update_handler")
expr(0x3f60, "objectid_room_3_fire")
label(0x3f86, "dog_death_sound")
ldx_ldy_jsr_play_sound_yx(0x3f8c, "sound1")
ldx_ldy_jsr_play_sound_yx(0x3f93, "sound2")
expr(0x3fe1, sprite_dict)
byte(0x4006)
label(0x4006, "dog_head_animations")
byte(0x4007, 3)
label(0x4007, "dog_head_dead_animation")
byte(0x400a)
expr(0x400b, sprite_dict)
label(0x400b, "dog_head_drinking_animation")
byte(0x400c, 2)
expr(0x400e, sprite_dict)
byte(0x400f, 2)
expr(0x4011, sprite_dict)
byte(0x4012, 2)
expr(0x4014, sprite_dict)
byte(0x4015, 2)
expr(0x4017, sprite_dict)
byte(0x4018, 2)
expr(0x401a, sprite_dict)
byte(0x401b, 2)
expr(0x401d, sprite_dict)
byte(0x401e, 2)
byte(0x4020)
expr(0x4021, sprite_dict)
label(0x4021, "dog_head_push_animation")
byte(0x4022, 2)
expr(0x4024, sprite_dict)
byte(0x4025, 2)
expr(0x4027, sprite_dict)
byte(0x4028, 2)
expr(0x402a, sprite_dict)
byte(0x402b, 2)
expr(0x402d, sprite_dict)
byte(0x402e, 2)
expr(0x4030, sprite_dict)
byte(0x4031, 2)
expr(0x4033, sprite_dict)
byte(0x4034, 2)
expr(0x4036, sprite_dict)
byte(0x4037, 2)
expr(0x4039, sprite_dict)
byte(0x403a, 2)
expr(0x403c, sprite_dict)
byte(0x403d, 2)
byte(0x403f)
expr(0x4040, sprite_dict)
label(0x4040, "dog_head_stunned_animation")
byte(0x4041, 2)
byte(0x4043)
comment(0x4044, "check for first update in room (branch if not)")
label(0x4044, "update_dog_puzzle")
comment(0x4049, "check for level change (branch if not)")
expr(0x4055, "dog_head_dead_animation - dog_head_animations")
label(0x405f, "set_dog_head_drinking_animation")
expr(0x4060, "dog_head_drinking_animation - dog_head_animations")
label(0x4067, "initialise_dog_puzzle")
ldx_ldy_jsr_define_envelope(0x4071, "envelope1")
expr(0x408a, "object_y_low + objectid_leaf2")
expr(0x408f, "object_z_order + objectid_dog_body")
expr(0x4094, "object_erase_type + objectid_dog_head")
expr(0x4099, "object_z_order + objectid_dog_head")
expr(0x409e, "object_x_low + objectid_dog_bowl")
expr(0x40a3, "object_y_low + objectid_dog_bowl")
expr(0x40a6, sprite_dict)
expr(0x40a8, "object_spriteid + objectid_dog_bowl")
label(0x40ad, "update_dog_head_animation")
label(0x40be, "got_dog_animation_step_in_y")
expr(0x40c2, "dog_head_dead_animation - dog_head_animations")
expr(0x40d1, "object_spriteid + objectid_bottle_pour")
expr(0x40d4, sprite_dict)
comment(0x40dc, "check for bottle and dog bowl collision")
expr(0x40dd, "objectid_bottle_pour")
expr(0x40e2, "objectid_dog_bowl")
label(0x40ed, "update_dog_poisoning_animation")
label(0x40f7, "check_if_dog_is_dying")
expr(0x40ff, "dog_head_stunned_animation - dog_head_animations")
label(0x40aa, "set_dog_head_object_local")
label(0x4110, "set_dog_head_dead_animation")
expr(0x4111, "dog_head_dead_animation - dog_head_animations")
label(0x4115, "set_dog_animation_step_local")
label(0x4118, "check_for_player_colliding_with_dog")
expr(0x4124, "objectid_dog_head")
expr(0x4129, "objectid_player")
expr(0x413a, "dog_head_push_animation - dog_head_animations")
label(0x413b, "set_dog_animation_step")
label(0x413e, "set_dog_head_object")
expr(0x414b, "object_spriteid + objectid_dog_head")
expr(0x4155, "object_x_low + objectid_dog_head")
expr(0x415f, "object_y_low + objectid_dog_head")
expr(0x4162, sprite_dict)
expr(0x4164, "object_spriteid + objectid_dog_body")
expr(0x4169, "object_x_low + objectid_dog_body")
expr(0x416f, "dog_head_dead_animation - dog_head_animations")
expr(0x4173, "dog_head_stunned_animation - dog_head_animations")
comment(0x4176, "set solid rock collision")
expr(0x417b, "collision_map_solid_rock")
label(0x4186, "dog_is_dead")
expr(0x418b, "collision_map_none")
expr(0x4194, sprite_dict)
expr(0x4196, "object_spriteid + objectid_dog_body")
expr(0x419b, "object_x_low + objectid_dog_body")
label(0x419d, "return3")
label(0x419e, "remember_y")
label(0x419f, "room_0_update_handler")
expr(0x41a9, "objectid_spell")
comment(0x41ad, "check for first update in room (branch if not)")
comment(0x41b2, "initialise room 0")
expr(0x41b3, sprite_dict)
expr(0x41b8, sprite_dict)
expr(0x41bd, sprite_dict)
expr(0x41c2, sprite_dict)
expr(0x41c7, sprite_dict)
expr(0x41cc, sprite_dict)
comment(0x41d0, "check for level change (branch if not)")
label(0x41db, "check_for_room_change")
label(0x41e6, "initialise_bottle")
expr(0x41e7, sprite_dict)
expr(0x41e9, "object_erase_type + objectid_bottle_pour")
expr(0x41ee, "object_z_order + objectid_bottle_pour")
comment(0x41f6, "initialise room 0")
expr(0x4209, sprite_dict)
expr(0x420b, "object_spriteid + objectid_empty_bottle")
expr(0x420e, sprite_dict)
expr(0x4210, "object_erase_type + objectid_drip")
expr(0x4215, "object_z_order + objectid_drip")
label(0x4217, "update_pouring_object_local")
label(0x421a, "room_0_not_first_update")
comment(0x4225, "update bottle in room 0")
expr(0x422b, "objectid_old_player")
expr(0x422d, "objectid_empty_bottle")
expr(0x4234, sprite_dict)
expr(0x4236, "object_spriteid + objectid_empty_bottle")
expr(0x423e, sprite_dict)
label(0x4242, "return4_local")
label(0x4245, "update_in_room_0_with_bottle")
comment(0x4245, "check if already pouring")
comment(0x424a, "check if starting to pour")
expr(0x424b, sprite_dict)
comment(0x4251, "set empty bottle")
expr(0x4252, sprite_dict)
comment(0x4258, "set empty bottle in toolbar")
comment(0x425e, "start pouring animation")
ri(0x4263)
comment(0x4268, "move player accessory in X based on player direction")
label(0x4274, "sign_extend_a_to_ax")
label(0x427b, "add_to_bottle_accessory_x")
comment(0x4289, "move accessory up four pixels. X is irrelevant.")
ri(0x4289)
ri(0x428d)
ri(0x428f)
label(0x4290, "move_bottle_accessory_up_in_y")
label(0x42a0, "pour_in_progress")
label(0x42ae, "update_pouring_object")
expr(0x42af, sprite_dict)
expr(0x42b1, "object_spriteid + objectid_bottle_pour")
expr(0x42bc, "object_x_low + objectid_bottle_pour")
expr(0x42c2, "object_x_high + objectid_bottle_pour")
expr(0x42c8, "object_direction + objectid_bottle_pour")
expr(0x42ce, "object_y_low + objectid_bottle_pour")
expr(0x42d1, sprite_dict)
expr(0x42d3, "object_spriteid + objectid_bottle_pour")
expr(0x42da, sprite_dict)
expr(0x42dc, "object_spriteid + objectid_bottle_pour")
comment(0x42e2, "start droplet")
expr(0x42e3, sprite_dict)
expr(0x42e5, "object_spriteid + objectid_bottle_pour")
comment(0x42e7, "check for first update in room (branch if so)")
expr(0x42ed, "object_spriteid_old + objectid_bottle_pour")
expr(0x4305, sprite_dict)
expr(0x4307, "object_spriteid + objectid_bottle_pour")
label(0x430c, "check_for_bottle_pouring_offscreen")
expr(0x430d, "objectid_bottle_pour")
expr(0x4314, "game_area_width_cells")
label(0x431f, "stop_bottle_pour_animation")
expr(0x4325, "object_spriteid + objectid_bottle_pour")
label(0x4327, "return4")
expr(0x4380, sprite_dict)
label(0x43a4, "room_1_update_handler")
expr(0x43ae, "objectid_room_1_fire1")
expr(0x43b5, "objectid_room_1_fire2")
expr(0x43e7, sprite_dict)
label(0x43e7, "droplet_animation")
byte(0x43e8)
expr(0x43e8, sprite_dict)
byte(0x43e9)
expr(0x43e9, sprite_dict)
byte(0x43ea)
expr(0x43ea, sprite_dict)
byte(0x43eb)
expr(0x43eb, sprite_dict)
label(0x43eb, "droplet_full")
label(0x43ec, "update_drip")
comment(0x43ef, "check for first update in room (branch if not)")
comment(0x43f4, "check for level change (branch if not)")
comment(0x43fa, "initialise drip timer for new level")
comment(0x43ff, "check_for_being_in_same_room_as_drip")
expr(0x4407, sprite_dict)
expr(0x4409, "object_erase_type + objectid_drip")
expr(0x440e, "object_z_order + objectid_drip")
expr(0x4411, "object_x_low + objectid_drip")
expr(0x4414, "object_x_high + objectid_drip")
expr(0x4437, sprite_dict)
expr(0x4439, "object_spriteid + objectid_drip")
expr(0x4459, "object_spriteid + objectid_drip")
expr(0x445f, "object_y_low + objectid_drip")
expr(0x4472, "object_y_low + objectid_drip")
expr(0x4475, sprite_dict)
expr(0x4477, "object_spriteid + objectid_drip")
comment(0x4481, "check for first update in room (branch if so)")
expr(0x4490, "object_spriteid + objectid_drip")
expr(0x4493, "object_y_low + objectid_drip")
expr(0x4499, "object_y_low + objectid_drip")
comment(0x449b, "check for first update in room (branch if so)")
expr(0x44ad, "objectid_old_player_accessory")
expr(0x44af, "objectid_old_drip")
expr(0x44b6, sprite_dict)
expr(0x44bb, sprite_dict)
expr(0x44e2, sprite_dict)
expr(0x44e4, "object_spriteid + objectid_drip")
label(0x44ea, "temp_drip_timer")
expr(0x439a, "exit_room_right")
label(0x4397, "try_right_exit")
comment(0x4390, "left from room 1 is room 0")
comment(0x439d, "right from room 1 is room 2")
label(0x43ff, "new_room")
comment(0x4406, "initialise drip")
label(0x441c, "increment_drip_timer")
label(0x44ee, "drip_timer_limit")
label(0x442f, "update_drip_animation")
label(0x4416, "update_drip_animation_local")
label(0x44e6, "return_drip_timer")
label(0x44ed, "drip_initial_y")
label(0x44eb, "drip_start_frame")
label(0x4464, "drip_is_falling")
label(0x4419, "return_drip_timer_local")
label(0x448c, "set_full_droplet")
expr(0x44a4, sprite_dict)
comment(0x44a0, "is player holding the empty bottle? (return if not)")
comment(0x44a7, "is the pouring animation happening? (return if so)")
comment(0x44ac, "check for bottle and drip collision (return if none)")
comment(0x44b5, "bottle is now full")
label(0x44ec, "drip_is_poison_flag")
comment(0x44cf, "long-winded way of saying: temp_drip_timer -= drip_timer_limit+1")
comment(0x44e1, "hide the collected drip")
comment(0x3b01, "in developer mode, we have the bottle filled with poison")
comment(0x3b10, "add full or empty bottle to taskbar")
comment(0x3bca, "right of room 2 is room 3")
comment(0x3bde, "update the two brazier fires")
comment(0x3c01, "set initial height of the plant")
ab(0x3c0b)
blank(0x3c0d)
comment(0x3d1d, "in developer mode 'G' grows the plant, and 'P' poisons it")
comment(0x43c8, "long-winded way of saying: 'lda #$1d'")

print("""; *************************************************************************************
;
; Level J: 'DRIPPING-STUFF'
;
; Save game variables:
;
;     save_game_level_k_plant_top_y                              ($0a33):
;             $70: plant starting y position
;             $50: plant grown once y position
;             $30: plant grown twice y position
;             $10: plant full y position
;
;     save_game_level_k_plant_growth_timer                       ($0a34):
;               0: not growing
;           1-$15: growing
;            $80+: being poisoned
;
;     save_game_level_k_got_bottle_flag                          ($0a35):
;               0: bottle not got
;               1: empty bottle taken
;             $ff: full bottle taken
;
;     save_game_level_k_poison_in_bottle_flag                    ($0a36):
;               0: no poison in bottle
;             $ff: poison in bottle
;
;     save_game_level_k_dog_animation:                           ($0a37):
;               1: dead
;               5: drinking
;             $1b: pushing player
;             $3a: stunned before dying
;
;     save_game_level_k_poison_dog_animation_step                ($0a38):
;               a timer for the dog's death sequence
;
; Solution:
;
;   1. Collect the bottle from the leftmost room
;   2. Hold the bottle under the drip in the initial room to fill with water
;   3. pour the water onto the stem of the plant one room to the right
;   4. repeat until plant is fully grown (reaches ceiling)
;   5. climb plant and go to room to the right
;   6. Fill bottle with poison from the drip
;   7. go to the leftmost room and climb the rope to the dog
;   8. pour the poison into the dog bowl (the dog dies) and jump over to reach the spell
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
