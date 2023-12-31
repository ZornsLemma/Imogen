from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_left_hook",
    0xc9: "spriteid_right_hook",
    0xca: "spriteid_horizontal_rope",
    0xcb: "spriteid_long_rope",
    0xcc: "spriteid_short_rope",
    0xcd: "spriteid_frayed_rope_end",
    0xce: "spriteid_tall_block",
    0xcf: "spriteid_erase1",
    0xd0: "spriteid_hamster_legs_1",
    0xd1: "spriteid_hamster_legs_2",
    0xd2: "spriteid_hamster_legs_3",
    0xd3: "spriteid_hamster_legs_4",
    0xd4: "spriteid_erase2",
    0xd5: "spriteid_flying_hamster_jam",
    0xd6: "spriteid_hamster_jam",
    0xd7: "spriteid_hamster_looking_back",
    0xd8: "spriteid_tulip_bulb_menu_item",
    0xd9: "spriteid_tulip_bulb",
    0xda: "spriteid_erase3",
    0xdb: "spriteid_sign",
    0xdc: "spriteid_tulip_head",
    0xdd: "spriteid_tulip_stalk",
    0xde: "spriteid_tulip_flower3",
    0xdf: "spriteid_tulip_flower2",
    0xe0: "spriteid_tulip_flower1",
    0xe1: "spriteid_short_rope_to_block1",
    0xe2: "spriteid_short_rope_to_block2",
    0xe3: "spriteid_long_rope_to_block",
    0xe4: "spriteid_hamster_body",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Room 0
constant(2, "objectid_sparkles")
constant(3, "objectid_fire2")

# Room 1
constant(2, "objectid_rope_end")
constant(3, "objectid_block")
constant(4, "objectid_rope_to_block")
constant(5, "objectid_hamster_feet_or_jam")
constant(6, "objectid_tulip_head")
constant(7, "objectid_hamster_body")

# Room 2
constant(6, "objectid_tulip_bulb")
constant(0xb + 6, "objectid_old_tulip_bulb")

# Room 3
constant(2, "objectid_fire1")
constant(3, "objectid_fire2")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataM.dat", "6502", "cf3544a265bf698b8aaca937fed83e14")

common_to_all('M')
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x3c73): {
        "l0070": "room_exit_direction",
    },
    (0x41a9, 0x41c3): {
        "l0070": "room_exit_direction",
    },
    (0x404c, 0x405c): {
        "l0070": "temp_y",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

label(0x0078, "object_left_cell_x")
label(0x0079, "object_right_cell_x")

label(0x0a3f, "save_game_level_m_hamster_animation")
label(0x0a40, "save_game_level_m_got_tulip_bulb_progress")
label(0x0a41, "save_game_level_m_tulip_bulb_x_animation_step")
label(0x0a42, "save_game_level_m_tulip_bulb_x_low")
label(0x0a43, "save_game_level_m_tulip_bulb_x_high")
label(0x0a44, "save_game_level_m_tulip_bulb_y")
label(0x0a45, "save_game_level_m_tulip_bulb_direction1")
label(0x0a46, "save_game_level_m_tulip_bulb_room")
label(0x0a47, "save_game_level_m_tulip_bulb_direction2")
label(0x0a48, "save_game_level_m_tulip_bulb_y_animation_step")
label(0x0a49, "save_game_level_m_tulip_growth_index")

label(0x0a6f, "block_y_position")
label(0x0a70, "hamster_animation_step")
label(0x0a71, "hamster_x")
label(0x0a72, "hamster_y")
label(0x0a73, "hamster_direction")
label(0x0a74, "tulip_bulb_steps_to_catch_up_while_offscreen")

def table(a):
    expr(a, sprite_dict)
    byte(a+1, 2)

comment(0x3af3, "check for level change (branch if not)")
label(0x3afe, "developer_mode_inactive")
expr(0x3b04, sprite_dict)
ground_fill(0x3b08)
label(0x3b08, "set_rock_tiles")
label(0x3b24, "draw_top_and_bottom_rows_of_rock")
expr(0x3bbe, sprite_dict)
expr(0x3bc4, sprite_dict)
expr(0x3bd5, sprite_dict)
expr(0x3bdb, sprite_dict)
label(0x3bf0, "room_0_update_handler")
expr(0x3bfa, "objectid_fire2")
label(0x3c69, "room_1_check_right_exit")
expr(0x3c6c, "exit_room_right")
byte(0x3c76)
label(0x3c76, "hamster_animations")
table(0x3c77)
label(0x3c77, "hamster_walk_animation")
table(0x3c7a)
table(0x3c7d)
table(0x3c80)
byte(0x3c83)
table(0x3c84)
label(0x3c84, "hamster_look_back_animation")
label(0x3c87, "hamster_static_animation")
table(0x3c87)
byte(0x3c8a)
table(0x3c8b)
table(0x3c8b+3)
table(0x3c8b+6)
table(0x3c8b+9)
table(0x3c8b+12)
table(0x3c8b+15)
table(0x3c8b+18)
table(0x3c8b+21)
table(0x3c8b+24)
table(0x3c8b+27)
table(0x3c8b+30)
label(0x3c8b, "hamster_jam_flying")
byte(0x3cac)
table(0x3cad)
label(0x3cad, "hamster_jam_static_animation")
byte(0x3cb0)
table(0x3cb1)
label(0x3cb1, "hamster_jam_landed_animation")
comment(0x3cb5, "check for first update in room (branch if not)")
label(0x3cb5, "update_hamster")
comment(0x3cba, "check for level change (branch if not)")
expr(0x3cc6, "hamster_walk_animation - hamster_animations")
expr(0x3cca, "hamster_look_back_animation - hamster_animations")
label(0x3ccd, "initalise_to_hamster_walk_animation")
expr(0x3cce, "hamster_walk_animation - hamster_animations")
label(0x3ce1, "set_hamster_jam_landed")
expr(0x3ce2, "hamster_jam_landed_animation - hamster_animations")
label(0x3cf2, "set_hamster_animation")
label(0x3cf8, "room_changed_only1")
comment(0x3cfe, "initialise hamster when entering room 1")
expr(0x3cff, sprite_dict)
expr(0x3d01, "object_erase_type + objectid_hamster_feet_or_jam")
expr(0x3d06, "object_z_order + objectid_hamster_feet_or_jam")
expr(0x3d0b, "object_z_order + objectid_hamster_body")
label(0x3d0d, "set_hamster_objects_local")
label(0x3d10, "update_hamster_animation_step")
label(0x3d21, "set_hamster_static_animation")
expr(0x3d22, "hamster_static_animation - hamster_animations")
label(0x3d2d, "check_if_hamster_is_looking_back")
expr(0x3d31, "hamster_look_back_animation - hamster_animations")
expr(0x3d3a, "hamster_walk_animation - hamster_animations")
label(0x3d3e, "check_if_hamster_is_walking")
expr(0x3d42, "hamster_walk_animation - hamster_animations")
ab(0x3d51)
blank(0x3d53)
label(0x3d53, "hamster_looking_left")
label(0x3d62, "set_hamster_looking_back")
expr(0x3d63, "hamster_look_back_animation - hamster_animations")
ri(0x3d67)
label(0x3d6a, "set_hamster_animation_step")
label(0x3d7b, "hamster_looking_right")
expr(0x3d97, "hamster_jam_landed_animation - hamster_animations")
label(0x3dac, "set_hamster_objects")
expr(0x3db6, "object_x_low + objectid_hamster_feet_or_jam")
expr(0x3db9, "object_x_low + objectid_hamster_body")
expr(0x3dbf, "object_y_low + objectid_hamster_feet_or_jam")
expr(0x3dc2, "object_y_low + objectid_hamster_body")
expr(0x3dc8, "object_direction + objectid_hamster_feet_or_jam")
expr(0x3dcb, "object_direction + objectid_hamster_body")
expr(0x3dd4, sprite_dict)
expr(0x3dd6, sprite_dict)
expr(0x3dda, sprite_dict)
expr(0x3dde, sprite_dict)
label(0x3ddf, "set_hamster_sprites")
expr(0x3de0, "object_spriteid + objectid_hamster_feet_or_jam")
expr(0x3de3, "object_spriteid + objectid_hamster_body")
label(0x3de5, "return1")
comment(0x3de6, "check for first update in room (branch if so)")
label(0x3de6, "room_1_update_handler")
comment(0x3dee, "check for level change (branch if not)")
label(0x3dee, "initialise_room_1")
label(0x3df9, "room_changed_only2")
label(0x3e02, "initialise")
ldx_ldy_jsr_define_envelope(0x3e06, "envelope1")
ldx_ldy_jsr_define_envelope(0x3e0d, "envelope2")
ldx_ldy_jsr_define_envelope(0x3e14, "envelope3")
ldx_ldy_jsr_define_envelope(0x3e1b, "envelope4")
expr(0x3e23, sprite_dict)
label(0x3e2b, "draw_horizontal_rope")
expr(0x3e35, sprite_dict)
expr(0x3e3a, "collision_map_solid_rock")
label(0x3e4c, "draw_rope_loop1")
expr(0x3e4d, sprite_dict)
expr(0x3e52, "collision_map_rope")
expr(0x3e5c, "objectid_rope_end")
expr(0x3e61, sprite_dict)
expr(0x3e63, "object_spriteid + objectid_rope_end")
expr(0x3e79, sprite_dict)
label(0x3e7d, "draw_long_rope_sprites")
label(0x3e8c, "draw_rope_loop2")
label(0x3e94, "draw_block")
expr(0x3e95, "objectid_block")
expr(0x3e9c, sprite_dict)
expr(0x3e9e, "object_spriteid + objectid_block")
expr(0x3ea1, sprite_dict)
expr(0x3ea3, "object_erase_type + objectid_block")
expr(0x3ea8, "object_z_order + objectid_block")
expr(0x3eab, "objectid_rope_to_block")
expr(0x3eb4, sprite_dict)
expr(0x3eb6, "object_spriteid + objectid_rope_to_block")
expr(0x3ebb, "object_z_order + objectid_rope_to_block")
label(0x3ed0, "position_rope_and_write_to_collision_map_local")
label(0x3ed3, "update_room_1")
expr(0x3ef8, "monkey_climb_animation - monkey_base_animation")
expr(0x3efc, "monkey_climb_idle_animation - monkey_base_animation")
expr(0x3f00, "monkey_climb_down_animation - monkey_base_animation")
label(0x3f03, "player_is_a_climbing_monkey")
comment(0x3f0a, "move player and accessory up")
comment(0x3f1c, "move block down")
comment(0x3f25, "check if the player is in room 1")
comment(0x3f2b, "play rope movement sound")
comment(0x3f2e, "set end of rope sprites")
expr(0x3f2f, sprite_dict)
expr(0x3f31, "object_spriteid_old + objectid_rope_to_block")
expr(0x3f34, "object_spriteid + objectid_rope_to_block")
expr(0x3f37, sprite_dict)
expr(0x3f39, "object_spriteid_old + objectid_rope_end")
label(0x3f3e, "move_block_position_up")
expr(0x3f48, sprite_dict)
expr(0x3f52, sprite_dict)
label(0x3f55, "store_block_y_position")
comment(0x3f64, "set rope sprites")
expr(0x3f65, sprite_dict)
expr(0x3f67, "object_spriteid_old + objectid_rope_to_block")
expr(0x3f6a, sprite_dict)
expr(0x3f6c, "object_spriteid + objectid_rope_to_block")
expr(0x3f6f, sprite_dict)
expr(0x3f71, "object_spriteid_old + objectid_rope_end")
label(0x3f73, "check_if_rope_is_moving")
label(0x3f86, "rope_is_at_rest_so_check_for_hamster_being_squashed")
expr(0x3f8a, "hamster_jam_static_animation - hamster_animations")
expr(0x3f8e, "hamster_jam_landed_animation - hamster_animations")
label(0x3f9f, "hamster_looking_left1")
label(0x3fa5, "hamster_just_killed")
expr(0x3fa6, "hamster_jam_static_animation - hamster_animations")
expr(0x3fab, "hamster_jam_flying - hamster_animations")
comment(0x3fbf, "hamster death sound")
ldx_ldy_jsr_play_sound_yx(0x3fc5, "sound1")
ldx_ldy_jsr_play_sound_yx(0x3fcc, "sound2")
label(0x3fd2, "make_sound_for_block_landing_or_hamster_jam_landing")
comment(0x3fd8, "block landing sound")
ldx_ldy_jsr_play_sound_yx(0x3fde, "sound3")
ldx_ldy_jsr_play_sound_yx(0x3fe5, "sound4")
label(0x3fe8, "position_rope_and_write_to_collision_map")
expr(0x3ff8, "object_y_low + objectid_rope_end")
expr(0x4004, "collision_map_rope")
expr(0x400a, "collision_map_none")
expr(0x4012, "object_y_low + objectid_block")
expr(0x4015, "object_y_low + objectid_rope_to_block")
label(0x4017, "return2")
label(0x4018, "unused_x_value")
label(0x4019, "unused_rope_spriteid")
label(0x401a, "play_sound5")
ldx_ldy_jsr_play_sound_yx(0x4020, "sound5")
expr(0x4023, sprite_dict)
label(0x4023, "tulip_flower_animation")
byte(0x4024)
expr(0x4024, sprite_dict)
expr(0x4025, sprite_dict)
label(0x4026, "return3_local")
label(0x4029, "update_tulip_growth")
comment(0x402e, "check for first update in room (branch if not)")
comment(0x4033, "check for level change (branch if not)")
comment(0x4039, "set tulip animation to finished growing")
label(0x403e, "draw_stalk_at_corrent_position")
label(0x405d, "calculate_y_position_of_top_of_stalk")
ri(0x405e)
ri(0x405f)
ri(0x4060)
comment(0x4065, "calculate cell y for stalk by dividing by eight")
expr(0x406d, sprite_dict)
label(0x406e, "draw_tulip_stalk_loop")
label(0x4078, "tulip_stalk_is_drawn")
label(0x407e, "increment_tulip_growth_animation_local")
label(0x4081, "update_tulip_head_object")
expr(0x4084, "object_x_low + objectid_tulip_head")
expr(0x4089, "object_x_high + objectid_tulip_head")
expr(0x408c, "object_spriteid + objectid_tulip_head")
expr(0x4091, "object_direction + objectid_tulip_head")
expr(0x40a0, "object_erase_type + objectid_tulip_head")
expr(0x40a5, "object_z_order + objectid_tulip_head")
expr(0x40b6, "object_y_low + objectid_tulip_head")
expr(0x40b9, sprite_dict)
expr(0x40bb, "object_spriteid + objectid_tulip_head")
comment(0x40bd, "nothing to erase")
expr(0x40be, sprite_dict)
expr(0x40c0, "object_spriteid_old + objectid_tulip_head")
label(0x40c5, "update_tulip_flower")
expr(0x40ca, "object_spriteid + objectid_tulip_head")
expr(0x40cf, "object_y_low + objectid_tulip_head")
expr(0x40d2, "object_spriteid + objectid_tulip_head")
expr(0x40d5, "object_spriteid_old + objectid_tulip_head")
expr(0x40da, "object_y_low + objectid_tulip_head")
expr(0x40dd, "object_y_low_old + objectid_tulip_head")
label(0x40e1, "finished_animating_head_so_nothing_to_erase")
expr(0x40e2, sprite_dict)
expr(0x40e4, "object_spriteid_old + objectid_tulip_head")
label(0x40e6, "set_tulip_collision_map")
expr(0x40e7, "object_y_low + objectid_tulip_head")
label(0x4107, "set_tulip_head_collision_map")
expr(0x4108, "object_y_low + objectid_tulip_head")
expr(0x4112, "collision_map_solid_rock")
expr(0x4118, "collision_map_rope")
comment(0x411c, "check for first update in room (branch if so)")
label(0x411c, "increment_tulip_growth_animation")
label(0x412d, "return3")
expr(0x41a2, sprite_dict)
label(0x41b9, "room_2_check_right_exit")
expr(0x41bc, "exit_room_right")
label(0x41c6, "tulip_bulb_x_animations")
label(0x41c7, "tulip_bulb_x_animation0")
label(0x41cf, "tulip_bulb_x_animation1")
label(0x41d4, "tulip_bulb_x_animation2")
label(0x41d6, "tulip_bulb_y_animations")
label(0x41dd, "return4")
label(0x41de, "room_2_update_handler")
expr(0x41e8, "objectid_fire1")
expr(0x41ef, "objectid_fire2")
comment(0x41f8, "check for first update in room (branch if so)")
label(0x4200, "initialise_room_2")
expr(0x4201, sprite_dict)
expr(0x4206, sprite_dict)
comment(0x420d, "check for level change (branch if not)")
label(0x4220, "initialise_tulip_bulb")
expr(0x423d, "tulip_bulb_x_animation2 - tulip_bulb_x_animations")
label(0x4244, "room_change_only")
label(0x4253, "fast_forward_tulip_bulb")
expr(0x4263, "objectid_tulip_bulb")
label(0x426d, "hide_bulb1")
expr(0x426e, sprite_dict)
expr(0x4270, "object_spriteid_old + objectid_tulip_bulb")
label(0x4272, "return5_local")
label(0x4275, "room_2_not_first_update")
expr(0x4280, "object_spriteid_old + objectid_tulip_bulb")
label(0x429c, "player_is_holding_tulip_bulb")
expr(0x429d, sprite_dict)
comment(0x42a8, "player just used the tulip bulb")
comment(0x42ad, "set up tulip bulb object")
expr(0x42cc, "tulip_bulb_x_animation0 - tulip_bulb_x_animations")
expr(0x42dc, "objectid_tulip_bulb")
label(0x42e4, "tulip_is_in_current_room")
label(0x42f3, "check_for_tulib_bulb_player_collision")
expr(0x42f7, "object_spriteid_old + objectid_tulip_bulb")
expr(0x42fa, "objectid_old_player")
expr(0x42fc, "objectid_tulip_bulb")
expr(0x430f, sprite_dict)
label(0x4313, "take_bulb")
expr(0x4314, sprite_dict)
expr(0x4316, "object_spriteid + objectid_tulip_bulb")
label(0x4320, "check_if_bulb_just_used")
expr(0x4326, sprite_dict)
expr(0x432b, sprite_dict)
label(0x4334, "check_for_bulb_movement")
expr(0x4335, "object_x_low + objectid_tulip_bulb")
expr(0x4338, "object_x_low_old + objectid_tulip_bulb")
label(0x4347, "moving_bulb_left")
label(0x434a, "moving_bulb")
expr(0x4350, "objectid_tulip_bulb")
label(0x4356, "check_for_bulb_movement_in_y")
expr(0x4357, "object_y_low + objectid_tulip_bulb")
expr(0x435a, "object_y_low_old + objectid_tulip_bulb")
comment(0x435e, "check for room collision")
expr(0x4367, "objectid_tulip_bulb")
label(0x436d, "bulb_landed")
label(0x4370, "return5")
label(0x4371, "update_tulip")
expr(0x4379, "objectid_old_tulip_bulb")
expr(0x437b, "objectid_hamster_feet_or_jam")
comment(0x4381, "the tulip bulb is planted in the ground with hamster jam")
expr(0x4382, sprite_dict)
expr(0x4384, "object_spriteid + objectid_tulip_bulb")
comment(0x4386, "start growing")
label(0x4390, "move_bulb_x_position1")
label(0x43a1, "check_animation")
expr(0x43a5, "tulip_bulb_x_animation0 - tulip_bulb_x_animations")
expr(0x43ae, "tulip_bulb_x_animation1 - tulip_bulb_x_animations")
label(0x43b5, "check_if_tulip_bulb_x_animation1")
expr(0x43b6, "tulip_bulb_x_animation1 - tulip_bulb_x_animations")
expr(0x43ba, "tulip_bulb_x_animation2 - tulip_bulb_x_animations")
label(0x43be, "update_bulb_animation")
expr(0x43bf, "objectid_tulip_bulb")
expr(0x43cb, "tulip_bulb_x_animation1 - tulip_bulb_x_animations")
label(0x43cf, "set_bulb_animation_step")
label(0x43df, "sign_extending_a_to_ax")
label(0x43e6, "move_bulb_x_position2")
expr(0x43fd, "objectid_tulip_bulb")
expr(0x4409, "tulip_bulb_x_animation2 - tulip_bulb_x_animations")
label(0x440f, "update_bulb_y_position")
label(0x4422, "save_bulb_animation_step")
expr(0x4429, "objectid_tulip_bulb")
expr(0x442e, "object_x_low + objectid_tulip_bulb")
expr(0x4434, "object_x_high + objectid_tulip_bulb")
expr(0x443a, "object_y_low + objectid_tulip_bulb")
expr(0x4440, "objectid_tulip_bulb")
expr(0x444c, "game_area_width_cells")
comment(0x444f, "move bulb to next room to the right")
label(0x4465, "move_bulb_one_room_left")
label(0x447a, "hide_bulb")
expr(0x447b, sprite_dict)
expr(0x447d, "object_spriteid + objectid_tulip_bulb")
label(0x447f, "return6")
label(0x4480, "update_tulip_bulb_object")
expr(0x4481, sprite_dict)
expr(0x4483, "object_erase_type + objectid_tulip_bulb")
expr(0x4488, "object_z_order + objectid_tulip_bulb")
expr(0x448e, "object_x_low + objectid_tulip_bulb")
expr(0x4494, "object_x_high + objectid_tulip_bulb")
expr(0x449a, "object_y_low + objectid_tulip_bulb")
expr(0x449d, sprite_dict)
expr(0x449f, "object_spriteid + objectid_tulip_bulb")
expr(0x44a5, "object_direction + objectid_tulip_bulb")
label(0x44a8, "player_just_used_tulip_bulb_flag")
label(0x44a9, "remember_player_help_sprite")
byte(0x44ab)
comment(0x44ab, "unused", inline=True)
label(0x44aa, "remember_old_tulip_bulb_sprite")
expr(0x4503, sprite_dict)
label(0x4539, "room_3_update_handler")
expr(0x4543, "objectid_fire2")

for i in range(0x41c6,0x41dd):
    byte(i)



print("""; *************************************************************************************
;
; Level M: 'HAMSTER-JAM'
;
; Save game variables:
;
;     save_game_level_m_hamster_animation                        ($0a3f):
;               0: untouched
;              1+: animations for hamster
;             $3b: hamster jam landed
;
;     save_game_level_m_got_tulip_bulb_progress                  ($0a40):
;               0: untouched
;        1, 9, 14: tulip bulb animations
;             $ff: taken
;
;     save_game_level_m_tulip_bulb_x_animation_step              ($0a41):
;               step within animations above
;
;     save_game_level_m_tulip_bulb_x_low                         ($0a42):
;     save_game_level_m_tulip_bulb_x_high                        ($0a43):
;               position of tulip bulb (x coordinate)
;
;     save_game_level_m_tulip_bulb_y                             ($0a44):
;               position of tulip bulb (y coordinate)
;
;     save_game_level_m_tulip_bulb_direction1                    ($0a45):
;                 1: pointing right
;               $ff: pointing left
;
;     save_game_level_m_tulip_bulb_room                          ($0a46):
;               room that the tulip bulb is in
;
;     save_game_level_m_tulip_bulb_direction2                    ($0a47):
;               same as save_game_level_m_tulip_bulb_direction1
;
;     save_game_level_m_tulip_bulb_y_animation_step              ($0a48):
;               animation step for a falling tulip bulb
;
;     save_game_level_m_tulip_growth_index                       ($0a49):
;               0: not growing
;           1-$44: growing
;             $45: fully grown
;
; Solution:
;
;   1. Jump on the block to the right as the cat, and between the cat and the monkey
;      traverse the rest of the obstacles to exit the room.
;   2. Get the tulip bulb under the sign. Exit to the left using the middle exit.
;   3. Climb onto the rope and descend to the bottom. Time falling off the rope
;      to squash the hamster.
;   4. Drop the tulip bulb onto the hamster jam. (A tulip grows)
;   5. Climb the tulip to exit the room to the left.
;   6. Climb the three ropes, and turn into the cat on the final block.
;   7. Jump across to collect the spell.
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
