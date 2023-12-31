from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_bowl",
    0xc9: "spriteid_full_bowl",
    0xca: "spriteid_bowl_menu_item",
    0xcb: "spriteid_full_bowl_menu_item",
    0xcc: "spriteid_erase1",
    0xcd: "spriteid_table",
    0xce: "spriteid_trapdoor",
    0xcf: "spriteid_erase2",
    0xd0: "spriteid_tnt",
    0xd1: "spriteid_tnt_tipping",
    0xd2: "spriteid_tnt_sideways",
    0xd3: "spriteid_tnt_powder",
    0xd4: "spriteid_stick_menu_item",
    0xd5: "spriteid_stick",
    0xd6: "spriteid_stick_held",
    0xd7: "spriteid_stick_using",
    0xd8: "spriteid_erase3",
    0xd9: "spriteid_explosion",
    0xda: "spriteid_erase4a",
    0xdb: "spriteid_erase4b",
    0xdc: "spriteid_smoke1",
    0xdd: "spriteid_smoke2",
    0xde: "spriteid_smoke3",
    0xdf: "spriteid_smoke4",
    0xe0: "spriteid_smoke5",
    0xe1: "spriteid_smoke6",
    0xe2: "spriteid_smoke7",
    0xe3: "spriteid_smoke8",
    0xe4: "spriteid_fire_bowl",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

constant(2, "objectid_bowl")
constant(3, "objectid_fire")
constant(5, "objectid_smoke")

# Room 0
constant(3, "objectid_sparkles")
constant(4, "objectid_trapdoor")
constant(6, "objectid_explosion")

# Room 1
constant(4, "objectid_fire_bowl")

# Room 2
constant(4, "objectid_stick")

# Room 3
constant(3, "objectid_tnt_barrel")
constant(4, "objectid_tnt")

set_sprite_dict(sprite_dict)

constant(0xc9, "inkey_key_o")
constant(0xa9, "inkey_key_l")

load(0x3ad5, "orig/dataO.dat", "6502", "ddadc2eb1bfb98e14b769a9851db5513")

common_to_all('O')
define_level(4)
label(0x0070, "room_exit_direction")

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
#    (0x3bd4,0x3df9): {
#        "l0070": "room_exit_direction",
#    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

label(0x0078, "object_left_cell_x")
label(0x0079, "object_right_cell_x")

label(0x0a55, "save_game_level_o_bowl_progress")
label(0x0a56, "save_game_level_o_bowl_animation_step")
label(0x0a57, "save_game_level_o_bowl_x_low")
label(0x0a58, "save_game_level_o_bowl_x_high")
label(0x0a59, "save_game_level_o_bowl_y")
label(0x0a5a, "save_game_level_o_bowl_direction_without_bounces")
label(0x0a5b, "save_game_level_o_bowl_room")
label(0x0a5c, "save_game_level_o_bowl_direction_with_bounces")
label(0x0a5d, "save_game_level_o_bowl_is_full_flag")
label(0x0a5e, "save_game_level_o_trapdoor_y")
label(0x0a5f, "save_game_level_o_tnt_barrel_animation_step")
label(0x0a60, "save_game_level_o_holding_stick")
label(0x0a61, "save_game_level_o_trapdoor_open_flag")

label(0x0a6f, "fast_forward_bowl_step_count")
label(0x0a70, "fire_bowl_animation_step")
label(0x0a71, "explosion_animation_step")

comment(0x3af4, "check for level change (branch if not)")
label(0x3b0a, "developer_mode_inactive1")
comment(0x3b0a, "set up menu slot for bowl (empty or full)")
expr(0x3b12, sprite_dict)
label(0x3b1a, "set_menu_slot")
label(0x3b1d, "set_up_stick_menu_item_if_stick_is_held")
expr(0x3b23, sprite_dict)
ground_fill(0x3b27)
label(0x3b27, "set_rock_tiles")
expr(0x3bb7, sprite_dict)
label(0x3bcc, "room_0_update_handler")
comment(0x3bdc, "check for first update in room (branch if not)")
comment(0x3be1, "check for level change (branch if not)")
comment(0x3be7, "initialise trapdoor for new level")
label(0x3bfa, "initialise_trapdoor_down")
label(0x3bff, "initialise_trapdoor")
expr(0x3c08, "object_x_low + objectid_trapdoor")
expr(0x3c0b, sprite_dict)
expr(0x3c0d, "object_spriteid + objectid_trapdoor")
expr(0x3c10, sprite_dict)
expr(0x3c12, "object_erase_type + objectid_trapdoor")
label(0x3c14, "update_trapdoor_collision_map_local")
label(0x3c17, "update_trapdoor")
comment(0x3c2d, "pressing 'O' in developer mode opens the trapdoor")
expr(0x3c2e, "inkey_key_o")
label(0x3c34, "developer_mode_inactive2")
label(0x3c40, "update_trapdoor_y_position")
ri(0x3c4d)
ri(0x3c51)
label(0x3c58, "update_trapdoor_collision_map")
expr(0x3c62, "object_y_low + objectid_trapdoor")
label(0x3c87, "set_collision_map_for_trapdoor")
label(0x3c91, "return1")
expr(0x3d09, sprite_dict)
label(0x3d30, "room_1_check_right_exit")
expr(0x3d33, "exit_room_right")
label(0x3d3d, "bowl_animations")
byte(0x3d3e, 2)
label(0x3d3e, "bowl_fall_sideways_animation")           #1
byte(0x3d40, 2)
byte(0x3d42, 2)
byte(0x3d44, 2)
byte(0x3d46, 2)
byte(0x3d49, 2)
label(0x3d49, "bowl_fall_off_edge_animation")           #c
byte(0x3d4b, 2)
byte(0x3d4d, 2)
byte(0x3d4f, 2)
byte(0x3d52, 2)
label(0x3d52, "bowl_fall_straight_down_animation")      #15
byte(0x3d54, 2)
byte(0x3d56, 2)
byte(0x3d58, 2)
byte(0x3d5b, 2)
label(0x3d5b, "bowl_fall_down_fast_animation")          #1e
byte(0x3d5e, 2)
label(0x3d5e, "bowl_stationary_animation")              #21
label(0x3d61, "room_1_update_handler")
expr(0x3d6b, "objectid_fire")
comment(0x3d6f, "check for first update in room (branch if so)")
label(0x3d77, "initialise_room_1")
ldx_ldy_jsr_define_envelope(0x3d7b, "envelope1")
expr(0x3d7f, sprite_dict)
expr(0x3d84, sprite_dict)
expr(0x3d8c, sprite_dict)
expr(0x3d91, sprite_dict)
expr(0x3d96, "collectable_being_used_spriteids + 2")
comment(0x3d98, "check for level change (branch if not)")
label(0x3dab, "initialise_bowl")
expr(0x3dc8, "bowl_stationary_animation - bowl_animations")
label(0x3dcf, "initialise_bowl_object_if_in_current_room")
label(0x3dde, "fast_forward_bowl_loop")
expr(0x3dee, "objectid_bowl")
label(0x3df8, "hide_bowl1")
expr(0x3df9, sprite_dict)
expr(0x3dfb, "object_spriteid_old + objectid_bowl")
label(0x3dfd, "return2_local")
label(0x3e00, "room_1_not_first_update")
expr(0x3e0b, "object_spriteid_old + objectid_bowl")
label(0x3e27, "check_for_player_using_bowl")
expr(0x3e2b, sprite_dict)
expr(0x3e2f, sprite_dict)
label(0x3e32, "using_a_bowl")
comment(0x3e37, "just started using the bowl")
comment(0x3e3a, "drop bowl")
comment(0x3e5a, "start by dropping bowl sideways...")
expr(0x3e5b, "bowl_fall_sideways_animation - bowl_animations")
comment(0x3e5f, "...then drop bowl straight down")
expr(0x3e60, "bowl_fall_down_fast_animation - bowl_animations")
expr(0x3e68, "objectid_bowl")
label(0x3e70, "regular_bowl_update")
label(0x3e7f, "skip_resetting_fast_forward_for_bowl")
expr(0x3e83, "object_spriteid_old + objectid_bowl")
expr(0x3e88, sprite_dict)
expr(0x3e8c, sprite_dict)
label(0x3e99, "check_for_player_bowl_collision")
expr(0x3e9a, "objectid_old_player")
expr(0x3e9c, "objectid_bowl")
expr(0x3eaf, sprite_dict)
label(0x3eb7, "set_bowl_menu_slot")
label(0x3eba, "hide_bowl2")
expr(0x3ebb, sprite_dict)
expr(0x3ebd, "object_spriteid + objectid_bowl")
label(0x3ec7, "no_player_bowl_collision")
expr(0x3ecd, sprite_dict)
expr(0x3ed4, sprite_dict)
label(0x3ed5, "remove_from_toolbar")
expr(0x3ed9, sprite_dict)
label(0x3ee2, "if_bowl_is_moving_then_check_for_room_collision")
expr(0x3ee3, "object_x_low + objectid_bowl")
expr(0x3ee6, "object_x_low_old + objectid_bowl")
label(0x3ef5, "adjust_for_looking_left")
label(0x3ef8, "check_for_bowl_room_collision")
expr(0x3efe, "objectid_bowl")
label(0x3f07, "check_for_bowl_room_collision_again")
expr(0x3f08, "object_y_low + objectid_bowl")
expr(0x3f0b, "object_y_low_old + objectid_bowl")
label(0x3f1e, "play_bowl_collision_sound")
ldx_ldy_jsr_play_sound_yx(0x3f24, "sound1")
label(0x3f27, "return2")
label(0x3f28, "update_bowl_step")
label(0x3f39, "check_if_bowl_is_hitting_the_floor")
expr(0x3f3a, "objectid_bowl")
expr(0x3f44, "bowl_fall_down_fast_animation - bowl_animations")
expr(0x3f48, "bowl_fall_straight_down_animation - bowl_animations")
expr(0x3f4a, "bowl_fall_down_fast_animation - bowl_animations")
label(0x3f51, "bowl_is_hitting_floor")
expr(0x3f57, "bowl_fall_down_fast_animation - bowl_animations")
label(0x3f6d, "set_bowl_stationary")
expr(0x3f6e, "bowl_stationary_animation - bowl_animations")
label(0x3f77, "set_bowl_animation_step")
label(0x3f87, "sign_extend_a_to_ax")
label(0x3f8e, "add_to_bowl_x")
expr(0x3fab, "objectid_bowl")
expr(0x3fb0, "object_x_low + objectid_bowl")
expr(0x3fb6, "object_x_high + objectid_bowl")
expr(0x3fbc, "object_y_low + objectid_bowl")
expr(0x3fc2, "objectid_bowl")
comment(0x3fcb, "move bowl right one room if needed")
expr(0x3fce, "game_area_width_cells")
label(0x3fe7, "move_bowl_left_one_room_if_needed")
label(0x3ffc, "hide_bowl3")
expr(0x3ffd, sprite_dict)
expr(0x3fff, "object_spriteid + objectid_bowl")
label(0x4001, "return3")
label(0x4002, "set_bowl_object")
expr(0x4003, sprite_dict)
expr(0x4005, "object_erase_type + objectid_bowl")
expr(0x400a, "object_z_order + objectid_bowl")
expr(0x4010, "object_x_low + objectid_bowl")
expr(0x4016, "object_x_high + objectid_bowl")
expr(0x401c, "object_y_low + objectid_bowl")
expr(0x401f, sprite_dict)
expr(0x4026, sprite_dict)
label(0x4027, "set_bowl_sprite")
expr(0x4028, "object_spriteid + objectid_bowl")
expr(0x4028, "object_spriteid + objectid_bowl")
expr(0x402e, "object_direction + objectid_bowl")
expr(0x402e, "object_direction + objectid_bowl")
label(0x4031, "just_started_using_bowl_flag")
label(0x4032, "remember_sprite_held")
label(0x4033, "temp_old_bowl_sprite")
byte(0x4034)
comment(0x4034, "unused")
comment(0x4035, "check for first update in room (branch if not)")
label(0x4035, "update_fire_bowl")
expr(0x4056, sprite_dict)
expr(0x4067, "objectid_fire_bowl")
label(0x406b, "set_sprite_for_fire_bowl_local")
label(0x406e, "update_fire_bowl_animation")
label(0x4071, "set_sprite_for_fire_bowl")
comment(0x4077, "calculate sprite id")
expr(0x407e, sprite_dict)
expr(0x4080, "object_spriteid + objectid_fire_bowl")
label(0x4082, "return4")
label(0x4108, "room_2_check_right_exit")
expr(0x410b, "exit_room_right")
label(0x4115, "room_2_update_handler")
expr(0x411f, "objectid_fire")
comment(0x4123, "check for first update in room (branch if not)")
ldx_ldy_jsr_define_envelope(0x412c, "envelope2")
expr(0x4130, sprite_dict)
expr(0x4132, "toolbar_collectable_spriteids + 3")
expr(0x4135, sprite_dict)
expr(0x4137, "collectable_spriteids + 3")
expr(0x413a, sprite_dict)
expr(0x413c, "collectable_being_used_spriteids + 3")
comment(0x413e, "check for level change (branch if not)")
label(0x414e, "room_changed_only1")
comment(0x414e, "There is no object with id 5, so these instructions are redundant")
expr(0x414f, sprite_dict)
expr(0x4151, "object_erase_type + 5")
expr(0x4156, "object_z_order + 5")
expr(0x4159, sprite_dict)
expr(0x415b, "object_erase_type + objectid_explosion")
expr(0x4160, "object_z_order + objectid_explosion")
expr(0x416e, sprite_dict)
expr(0x4170, "object_erase_type + objectid_trapdoor")
expr(0x417c, sprite_dict)
expr(0x417e, "object_spriteid + objectid_stick")
label(0x4180, "initialise_explosion_local1")
label(0x4183, "room_2_not_first_update")
label(0x4191, "set_explosion_animation_step")
ab(0x419b)
blank(0x419d)
label(0x419d, "check_player_bowl_collision")
expr(0x41a4, "objectid_old_player")
expr(0x41a6, "objectid_stick")
expr(0x41ad, sprite_dict)
expr(0x41b2, sprite_dict)
expr(0x41b4, "object_spriteid + objectid_stick")
label(0x41bb, "initialise_explosion_local2")
label(0x41be, "check_for_developer_mode_shortcuts")
comment(0x41c3, "pressing 'L' in developer mode lights the stick")
expr(0x41c4, "inkey_key_l")
label(0x41ca, "developer_mode_inactive3")
expr(0x41d3, sprite_dict)
expr(0x41da, "objectid_stick")
expr(0x41dc, "objectid_player_accessory")
label(0x41e2, "light_stick")
label(0x41ea, "update_smoke_animation")
label(0x41f4, "got_smoke_animation_step")
expr(0x41f7, sprite_dict)
label(0x41fc, "set_holding_stick")
expr(0x420a, "objectid_old_player_accessory")
expr(0x420c, "objectid_bowl")
comment(0x421c, "start explosion animation")
ldx_ldy_jsr_play_sound_yx(0x4227, "sound2")
ldx_ldy_jsr_play_sound_yx(0x422e, "sound3")
expr(0x4236, "object_x_low + objectid_bowl")
expr(0x423c, "object_x_high + objectid_bowl")
label(0x4248, "set_move_left_after_collision")
label(0x424d, "check_for_bowl_stick_collision")
expr(0x4253, "objectid_bowl")
expr(0x4255, "objectid_stick")
label(0x4260, "initialise_explosion")
expr(0x4261, "object_x_low + objectid_bowl")
expr(0x4264, "object_x_low + objectid_explosion")
expr(0x4267, "object_x_high + objectid_bowl")
expr(0x426a, "object_x_high + objectid_explosion")
expr(0x426d, "object_y_low + objectid_bowl")
expr(0x4270, "object_y_low + objectid_explosion")
expr(0x4273, "object_direction + objectid_bowl")
expr(0x4276, "object_direction + objectid_explosion")
expr(0x427f, "object_spriteid + objectid_explosion")
expr(0x4282, sprite_dict)
expr(0x4284, "object_spriteid + objectid_smoke")
comment(0x4286, "set up smoke object if needed")
expr(0x428f, "spriteid_smoke1 - 1")
expr(0x4291, "object_spriteid + objectid_smoke")
expr(0x4297, "object_x_low + objectid_smoke")
expr(0x429d, "object_x_high + objectid_smoke")
expr(0x42a3, "object_y_low + objectid_smoke")
expr(0x42a9, "object_direction + objectid_smoke")
comment(0x42ab, "check if using stick (return if not)")
expr(0x42af, sprite_dict)
comment(0x42b2, "redundant instructions - adding zero to x position")
expr(0x42b3, "object_x_low + objectid_smoke")
expr(0x42b9, "object_x_low + objectid_smoke")
expr(0x42bc, "object_x_high + objectid_smoke")
expr(0x42c1, "object_x_high + objectid_smoke")
comment(0x42c3, "move smoke up a few pixels when using the stick")
expr(0x42c4, "object_y_low + objectid_smoke")
expr(0x42ca, "object_y_low + objectid_smoke")
label(0x42cc, "return5")
label(0x42cd, "explosion_animation")
byte(0x42cd)
expr(0x42ce, sprite_dict)
byte(0x42ce)
expr(0x42cf, sprite_dict)
byte(0x42cf)
blank(0x42d0)
comment(0x434e, "check for first update in room (branch if not)")
label(0x434e, "room_3_update_handler")
ldx_ldy_jsr_define_envelope(0x4357, "envelope3")
comment(0x435a, "check for level change (branch if not)")
label(0x436a, "room_changed_only2")
expr(0x4373, "object_erase_type + objectid_tnt_barrel")
expr(0x437f, "objectid_trapdoor")
expr(0x4386, "object_z_order + objectid_trapdoor")
label(0x4388, "update_tnt_barrel_local")
label(0x438b, "room_3_not_first_update")
ab(0x4394)
blank(0x4396)
label(0x4396, "barrel_still_standing")
label(0x43b5, "move_to_next_barrel_animation_step")
label(0x43c8, "update_tnt_barrel")
expr(0x43d5, "object_spriteid + objectid_tnt_barrel")
expr(0x43dc, sprite_dict)
expr(0x43de, "object_spriteid + objectid_tnt")
label(0x43e0, "write_tnt_barrel_collision_map")
comment(0x43e4, "check if the tnt barrel animation has started (branch if so)")
comment(0x43e9, "write vertical tnt barrel collision map")
label(0x4402, "write_horizontal_tnt_barrel_collision_map")
label(0x442b, "update_bowl")
expr(0x444f, "objectid_tnt")
expr(0x4451, "objectid_bowl")
comment(0x4457, "bowl and tnt have collided, so fill bowl")
expr(0x445d, sprite_dict)
expr(0x445f, "object_spriteid + objectid_bowl")
label(0x4461, "return6")
expr(0x4462, sprite_dict)
byte(0x4462)
label(0x4462, "tnt_barrel_animation")
expr(0x4463, sprite_dict)
byte(0x4463)
expr(0x4464, sprite_dict)
byte(0x4464)
label(0x4465, "play_explosion_or_barrel_overturning_sound")
ldx_ldy_jsr_play_sound_yx(0x446b, "sound4")
ldx_ldy_jsr_play_sound_yx(0x4472, "sound5")

print("""; *************************************************************************************
;
; Level O: 'DOWN-AND-OUT'
;
; Save game variables:
;
;     save_game_level_o_bowl_progress                            ($0a55):
;              $0: untouched
;              $1: stationary
;             $2+: animating
;             $ff: taken
;
;     save_game_level_o_bowl_animation_step                      ($0a56):
;             current step within bowl animations above
;
;     save_game_level_o_bowl_x_low                               ($0a57):
;     save_game_level_o_bowl_x_high                              ($0a58):
;     save_game_level_o_bowl_y                                   ($0a59):
;             position of bowl in level
;
;     save_game_level_o_bowl_direction_without_bounces           ($0a5a):
;             direction the bowl was thrown in
;
;     save_game_level_o_bowl_room                                ($0a5b):
;             which room the bowl is in
;
;     save_game_level_o_bowl_direction_with_bounces              ($0a5c):
;             direction of bowl including any bounces off walls
;
;     save_game_level_o_bowl_is_full_flag                        ($0a5d):
;              $0: empty
;             $ff: full (of TNT)
;
;     save_game_level_o_trapdoor_y                               ($0a5e):
;             Y coordinate of trapdoor
;
;     save_game_level_o_tnt_barrel_animation_step                ($0a5f):
;              $0: untouched
;              $1: falling
;              $2: fallen over
;
;     save_game_level_o_holding_stick                            ($0a60):
;              $0: not holding stick
;             $ff: holding stick
;
;     save_game_level_o_trapdoor_open_flag                       ($0a61):
;              $0: closed
;             $ff: open
;
; Solution:
;
;   1. Move into the room to the left, and get the bowl (bottom left of the screen)
;   2. Move back to the start room and climb the rope, dropping down the other side and collecting the stick.
;   3. In the room to the right, jump into the side of the barrel to tip it over.
;   4. Drop the bowl onto the spilled TNT to fill the bowl. Recollect the bowl.
;   5. Retrace your steps back to the room left of the start. Climb the rope and proceed into the leftmost room.
;   6. Drop the full bowl onto the trapdoor. Use the stick in the fire bowl (in the room to the right) to light the taper.
;   7. Use the stick on the bowl to explode the trapdoor and go 'down and out' to the spell.
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
