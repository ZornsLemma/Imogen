from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_boulder",
    0xc9: "spriteid_table",
    0xca: "spriteid_torch_object",
    0xcb: "spriteid_torch_menu_item",
    0xcc: "spriteid_cache1",
    0xcd: "spriteid_fire",
    0xce: "spriteid_cache2",
    0xcf: "spriteid_cache3",
    0xd0: "spriteid_cache4",
    0xd1: "spriteid_cache5",
    0xd2: "spriteid_cache6",
    0xd3: "spriteid_cache7",
    0xd4: "spriteid_table_burnt1",
    0xd5: "spriteid_table_burnt2",
    0xd6: "spriteid_table_burnt3",
    0xd7: "spriteid_fire_bottom",
    0xd8: "spriteid_empty_hook",
    0xd9: "spriteid_cache8",
    0xda: "spriteid_parrot1",
    0xdb: "spriteid_parrot2",
    0xdc: "spriteid_parrot_squawk",
    0xdf: "spriteid_torch_object2",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

constant(2, "objectid_torch")
constant(3, "objectid_rope_end")
constant(4, "objectid_rope_fire")
constant(5, "objectid_parrot")
constant(5, "objectid_table")
constant(6, "objectid_fire1")
constant(7, "objectid_fire2")
constant(8, "objectid_fire3")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataC.dat", "6502", "a01e65c23f40171fec1de4c5761b7511")

common_to_all()
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x4196): {
        "l0070": "room_exit_direction",
    },
    (0x4290,0x429a): {
        "l0070": "temp_player_y_high",
    },
    (0x42c1,0x42e9): {
        "l0070": "player_to_parrot_distance_x_low",
        "l0071": "player_to_parrot_distance_x_high",
    },
    (0x3bc8, 0x3be3): {
        "level_workspace": "room_0_rope_burning_progress",
    }
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

# save game variables
label(0x0a0a, "save_game_level_c_got_torch")                            # 0: not got,  1-8: lit (animation state), $ff: got
label(0x0a0b, "save_game_level_c_burning_table_progress")               # 0: not burnt: 1+: in progress, $ff: burnt
label(0x0a0c, "save_game_level_c_room_0_and_2_burning_rope_progress")   # 0: not burnt,  1: in progress, $ff: burnt
label(0x0a0d, "save_game_level_c_room_1_burning_rope_progress")         # 0: not burnt,  1: in progress, $ff: burnt

label(0x0a70, "room_1_rope_burning_progress")
label(0x0a71, "room_0_and_2_parrot_y")
label(0x0a72, "room_0_and_2_parrot_animation_index")
label(0x0a73, "room_0_and_2_parrot_animation_step")
label(0x0a74, "room_0_and_2_parrot_delay_before_chirp")

label(0x0a75, "room_3_parrot_y")
label(0x0a76, "room_3_parrot_animation_index")
label(0x0a77, "room_3_parrot_animation_step")
label(0x0a78, "room_3_parrot_delay_before_chirp")

label(0x3b02, "developer_mode_inactive")
label(0x3b0c, "return1")
label(0x3bb3, "room_0_update_handler")
expr(0x3bbd, "objectid_fire1")
expr(0x3bc4, "objectid_fire2")
expr(0x3bd5, "objectid_fire3")
comment(0x3bf3, "check for first update in room (branch if so)")
stars(0x3bea, """Update a burnable rope

On Entry:
    A: length of rope
    (X,Y): cell position of top of rope""")
label(0x3bea, "update_burnable_rope")
label(0x3bfb, "update_burnable_rope_first_update")
comment(0x3bfb, "check for level change (branch if not)")
label(0x3c0b, "no_level_change")
expr(0x3c15, sprite_dict)
label(0x3c3d, "burning_in_progress")
label(0x3c6b, "not_burnt_yet")
expr(0x3c79, "objectid_rope_end")
expr(0x3c7f, sprite_dict)
label(0x3c83, "check_rope_fire_starting_local")
label(0x3c86, "return2_local")
label(0x3c89, "update_burnable_rope_not_first_update")
expr(0x3c98, "objectid_torch")
expr(0x3c9a, "objectid_rope_end")
expr(0x3ca1, sprite_dict)
expr(0x3ca3, "object_spriteid_old + objectid_rope_end")
label(0x3cbf, "rope_is_burning")
comment(0x3cd3, "check for fire reaching the top of the rope")
comment(0x3cdd, "fire has reached the top of the rope")
comment(0x3ce9, "put out fire, replace with cache of what was there before")
expr(0x3cea, sprite_dict)
expr(0x3cea, sprite_dict)
expr(0x3cec, "object_spriteid + objectid_rope_fire")
label(0x3cee, "finish_rope_all_burnt")
comment(0x3cfa, "position and show the empty hook as the rope end")
expr(0x3d01, "objectid_rope_end")
expr(0x3d06, sprite_dict)
expr(0x3d08, "object_spriteid + objectid_rope_end")
expr(0x3d0b, sprite_dict)
expr(0x3d0d, "object_spriteid + objectid_rope_fire")
label(0x3d12, "finish_rope_burning_gone_off_top_of_screen")
expr(0x3d1f, sprite_dict)
expr(0x3d21, "object_spriteid + objectid_rope_end")
expr(0x3d24, "object_spriteid + objectid_rope_fire")
label(0x3d26, "check_rope_fire_starting")
comment(0x3d34, "show rope fire starting")
expr(0x3d35, sprite_dict)
expr(0x3d37, "object_spriteid + objectid_rope_end")
expr(0x3d42, sprite_dict)
expr(0x3d44, "object_spriteid + objectid_rope_fire")
expr(0x3d50, "objectid_rope_end")
expr(0x3d59, "objectid_rope_fire")
expr(0x3d61, "object_y_low + objectid_rope_end")
expr(0x3d64, "object_y_low + objectid_rope_fire")
label(0x3d74, "return2")
label(0x3d75, "burning_rope_progress")
label(0x3d76, "burning_rope_pixel_y")
label(0x3d77, "burnable_rope_cell_x")
label(0x3d78, "burnable_rope_cell_y")
label(0x3d79, "burnable_rope_length")
label(0x3e45, "room_1_update_handler")
comment(0x3e74, "check for first update in room (branch if not)")
comment(0x3e79, "check for level change (branch if not)")
label(0x3e89, "set_room_1_objects")
expr(0x3e94, "objectid_table")
expr(0x3e9a, sprite_dict)
expr(0x3eac, "objectid_fire1")
expr(0x3eb7, sprite_dict)
expr(0x3ec9, "objectid_fire2")
expr(0x3ecf, sprite_dict)
label(0x3ed8, "update_table_local")
label(0x3edb, "return3_local")
label(0x3ede, "update_table_state")
expr(0x3eec, "objectid_torch")
expr(0x3eee, "objectid_table")
expr(0x3eef, "objectid_table")
label(0x3ef4, "update_table_burning_progress")
label(0x3f04, "update_table")
label(0x3f20, "table_is_unburnt")
expr(0x3f21, sprite_dict)
expr(0x3f23, "object_spriteid + objectid_table")
expr(0x3f26, sprite_dict)
expr(0x3f28, "object_spriteid + objectid_fire1")
expr(0x3f2b, "object_spriteid + objectid_fire2")
label(0x3f30, "update_burning_table")
expr(0x3f37, sprite_dict)
expr(0x3f39, "object_spriteid + objectid_fire1")
expr(0x3f44, sprite_dict)
expr(0x3f46, "object_spriteid + objectid_fire2")
expr(0x3f58, sprite_dict)
expr(0x3f5a, "object_spriteid + objectid_table")
expr(0x3f5f, "object_y_low + objectid_fire1")
expr(0x3f62, "object_y_low + objectid_fire2")
expr(0x3f6c, sprite_dict)
expr(0x3f6e, "object_spriteid + objectid_fire1")
expr(0x3f71, "object_spriteid + objectid_fire2")
label(0x3f76, "table_at_burn_level1")
expr(0x3f77, sprite_dict)
expr(0x3f79, "object_spriteid + objectid_table")
expr(0x3f7e, "object_y_low + objectid_fire1")
expr(0x3f81, "object_y_low + objectid_fire2")
label(0x3f86, "table_at_burn_level2")
expr(0x3f87, sprite_dict)
expr(0x3f89, "object_spriteid + objectid_table")
expr(0x3f8e, "object_y_low + objectid_fire1")
expr(0x3f91, "object_y_low + objectid_fire2")
label(0x3f96, "table_at_burn_level3")
label(0x3fd3, "table_height_reduced_due_to_burning")
label(0x3fdd, "write_solid_table_collision_map")
expr(0x3f97, sprite_dict)
expr(0x3f99, "object_spriteid + objectid_table")
expr(0x3f9e, "object_y_low + objectid_fire1")
expr(0x3fa1, "object_y_low + objectid_fire2")
expr(0x3fab, sprite_dict)
expr(0x3fad, "object_spriteid + objectid_fire1")
expr(0x3fad, "object_spriteid + objectid_fire1")
expr(0x3fb0, "object_spriteid + objectid_fire2")
label(0x3fb5, "set_table_fully_burnt")
expr(0x3fb6, sprite_dict)
expr(0x3fb8, "object_spriteid + objectid_table")
expr(0x3fbb, sprite_dict)
expr(0x3fbd, "object_spriteid + objectid_fire1")
expr(0x3fc0, "object_spriteid + objectid_fire2")
label(0x3fe4, "return3")
label(0x3fe5, "update_torch")
comment(0x3fe5, "check for first update in room (branch if not)")
expr(0x3feb, sprite_dict)
expr(0x3ff0, sprite_dict)
expr(0x3ff5, sprite_dict)
comment(0x3ff9, "check for level change (branch if not)")
label(0x4009, "update_room_1_torch")
expr(0x400a, sprite_dict)
expr(0x400c, "object_erase_type + objectid_torch")
expr(0x4022, "objectid_torch")
expr(0x402a, "object_z_order + objectid_torch")
expr(0x402d, sprite_dict)
expr(0x402f, "object_spriteid + objectid_torch")
label(0x4031, "return4")
label(0x4032, "return5_local")
label(0x4035, "check_for_collecting_torch_in_room_1")
expr(0x4041, "objectid_old_player")
comment(0x4040, "check for collision with torch collectable")
expr(0x4043, "objectid_torch")
comment(0x4049, "add torch to toolbar")
label(0x4053, "check_for_player_using_torch")
comment(0x4058, "check for first update in room (branch if so)")
expr(0x4061, sprite_dict)
label(0x4068, "player_is_using_torch")
label(0x4071, "get_fire_sprite")
label(0x4079, "store_animation_state_y")
comment(0x4085, "set fire sprite for the torch object, setting the direction, position and z-order too based on the player's accessory object")

label(0x40ae, "looking_left_so_adjust_x_position_of_accessory")
label(0x40bf, "move_accessory_down")
expr(0x4086, "objectid_torch")
expr(0x407d, sprite_dict)
expr(0x407f, "object_spriteid + objectid_torch")
label(0x40d0, "return5")
label(0x40d1, "fire_spriteid_table")
spriteid(0x40d1, 0x40d1 + 12, True)
label(0x4187, "room_2_check_bottom_exit")
expr(0x418a, "exit_room_bottom")
label(0x4194, "room_2_check_right_exit")
expr(0x4197, "exit_room_right")
label(0x41a1, "room_2_update_handler")
expr(0x41ab, "objectid_fire1")
comment(0x41af, "check for first update in room (branch if not)")
label(0x41d0, "room_2_draw_full_length_rope")
label(0x41d5, "update_room_0_or_2_parrot")
comment(0x41ba, "first update for room 2")
comment(0x41fc, "X,Y: the X coordinate of the rope/parrot, A: the direction of the parrot")
label(0x421e, "parrot_spriteid_table")
label(0x421e, "parrot_state_0")
label(0x4221, "parrot_state_1")
label(0x4224, "parrot_state_2")
spriteid(0x421e, 0x421e + 15, True)
label(0x4226, "parrot_state_squawk")
label(0x422d, "update_parrot_and_burnable_rope")
label(0x4242, "update_parrot_with_rope")
comment(0x4242, "check for first update in room (branch if not)")
comment(0x4247, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x4251, "envelope1")
expr(0x427f, "objectid_parrot")
expr(0x426c, "parrot_state_2 - parrot_spriteid_table")
expr(0x4333, "parrot_state_0 - parrot_spriteid_table")
expr(0x4367, "parrot_state_1 - parrot_spriteid_table")
expr(0x4378, "parrot_state_2 - parrot_spriteid_table")
expr(0x437c, "parrot_state_squawk - parrot_spriteid_table")
expr(0x4380, "parrot_state_squawk - parrot_spriteid_table")
expr(0x438f, "parrot_state_2 - parrot_spriteid_table")
expr(0x4281, sprite_dict)
label(0x428d, "return6_local")
label(0x4290, "update_parrot_not_first_update")
label(0x4278, "only_the_room_changed")
comment(0x424d, "level changed, set the envelope.")
comment(0x4254, "if the rope burning is in progress, set it done.")
label(0x4265, "rope_is_not_burned")
label(0x428a, "just_entered_room_one")
comment(0x4290, "calculate the desired parrot y position as half the player y position")
label(0x42ad, "update_parrot_not_visible_in_room_0")
label(0x42bb, "update_parrot_not_visible_in_room_2")
label(0x42be, "update_parrot_visible")
comment(0x42c1, "get difference between player and parrot x position")
comment(0x42d4, "invert $70,71")
label(0x42e5, "got_distance_from_player_to_parrot")
comment(0x42e5, "divide distance by eight to get a cell distance")
label(0x42ef, "update_parrot_animation")
comment(0x42f2, "increment parrot animation step, loop back to start of animation if at end")
label(0x42fe, "check_if_parrot_should_move_up_rope")
label(0x4314, "skip_in_room_3")
label(0x4328, "move_parrot_up_rope")
label(0x433d, "store_animation_step_y_local")
label(0x4340, "check_if_parrot_should_move_down_rope")
comment(0x435c, "move parrot down rope")
label(0x4374, "update_squawk")
label(0x4393, "parrot_in_state_2")
label(0x4383, "get_new_delay_before_chirp")
ab(0x43a3)
blank(0x43a5)
label(0x43a5, "room_0_or_2_rope")
comment(0x43b2, "room 0 rope")
ab(0x43b6)
blank(0x43b8)
label(0x43b8, "room_2_parrot")
label(0x43bc, "chirp_sound")
ldx_ldy_jsr_play_sound_yx(0x43c2, "sound1")
label(0x43c5, "reset_parrot_animation")
expr(0x43c6, "parrot_state_squawk - parrot_spriteid_table")
label(0x43ca, "store_animation_step_y")
label(0x43cd, "update_parrot_object")
comment(0x43e2, "move from room 2 to room 0, move parrot up off screen")
label(0x43ec, "store_parrot_object_y_position")
label(0x43e5, "sign_extend_parrot_y")
expr(0x43ed, "object_y_high + objectid_parrot")
expr(0x43f1, "object_y_high + objectid_parrot")
expr(0x43f4, "object_y_low + objectid_parrot")
expr(0x43fa, "object_direction + objectid_parrot")
expr(0x4400, "object_x_low + objectid_parrot")
expr(0x4406, "object_x_high + objectid_parrot")
expr(0x440f, "object_spriteid + objectid_parrot")
expr(0x4417, "objectid_player")
expr(0x4419, "objectid_parrot")
label(0x4424, "return6")
label(0x4425, "parrot_desired_y")
label(0x4426, "parrot_cell_distance_to_player_x")
label(0x4427, "parrot_direction")
label(0x4428, "parrot_x_low")
label(0x4429, "parrot_x_high")
label(0x442a, "parrot_minimum_y")
label(0x442b, "parrot_maximum_y")
label(0x442c, "parrot_y")
label(0x442d, "parrot_animation_index")
label(0x442e, "parrot_animation_step")
label(0x442f, "parrot_delay_before_chirp")
label(0x4430, "parrot_speed")
label(0x44f0, "room_3_update_handler")
comment(0x4529, "X,Y: the X coordinate of the rope/parrot, A: the direction of the parrot")

print("""; *************************************************************************************
;
; Level C: FIRE-WORKS
;
; Save game variables:
;
;     save_game_level_c_got_torch ($0a0a):
;               0: not got
;             1-8: torch lit (animation state)
;             $ff: got
;     save_game_level_c_burning_table_progress ($0a0b):
;               0: not burnt
;              1+: burn in progress
;             $ff: got
;     save_game_level_c_room_0_and_2_burning_rope_progress ($0a0c):
;               0: not burnt
;              1+: burn in progress
;             $ff: got
;     save_game_level_c_room_1_burning_rope_progress ($0a0d):
;               0: not burnt
;              1+: burn in progress
;             $ff: got
;
; Solution:
;
;   1. Climb the right hand rope up to the room above and enter the right side room.
;   2. Climb rope to get the torch object.
;   3. Use the torch to light the table in the lower left corner.
;   4. Go back down to the start room and light the left hand rope.
;   5. Climb back up the right hand rope and at the top exit to the left room.
;   6. From the top of the bottom left rock pile, climb the leftmost rope to the top.
;   7. Fall to the bottom of the rope (ahead of the parrot) and quickly jump across the
;      ropes to the spell.
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
