from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_wood_block",
    0xc9: "spriteid_axe",
    0xca: "spriteid_axe_menu_item",
    0xcb: "spriteid_gnu_head",
    0xcc: "spriteid_rock",
    0xcd: "spriteid_gun",
    0xce: "spriteid_gun_held",
    0xcf: "spriteid_gun_menu_item",
    0xd0: "spriteid_cache1",
    0xd1: "spriteid_cache2",
    0xd2: "spriteid_sign_stand",
    0xd3: "spriteid_sign",
    0xd4: "spriteid_broken_partition_base",
    0xd5: "spriteid_partition",
    0xd6: "spriteid_falling_partition",
    0xd7: "spriteid_fallen_partition",
    0xd8: "spriteid_baby_smile",
    0xd9: "spriteid_baby_surprise",
    0xda: "spriteid_baby_dead",
    0xdb: "spriteid_baby_walk",
    0xdc: "spriteid_baby_sit",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

constant(3, "objectid_axe")

# Room 0
constant(4, "objectid_sign_stand")
constant(5, "objectid_sign")

# Room 2
constant(4, "objectid_partition")

# Room 3
constant(3, "objectid_gun")
constant(5, "objectid_baby")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataD.dat", "6502", "a6c16ebadab661f0361c36737da2526c")

common_to_all()
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x3ee6): {
        "l0070": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

label(0xa0e, "save_game_level_d_got_axe")
label(0xa0f, "save_game_level_d_got_gun")
label(0xa10, "save_game_level_d_gnu_sign_position")
label(0xa11, "save_game_level_d_partition_progress")
label(0xa12, "save_game_level_d_baby_progress")

label(0x0a6f, "baby_animation_step_index")
label(0x0a70, "baby_x_position")
label(0x0a71, "baby_y_position")

comment(0x3af3, "check for level change (branch if not)")
label(0x3b08, "developer_mode_inactive")
expr(0x3b0e, sprite_dict)
label(0x3b12, "no_gun")
expr(0x3b18, sprite_dict)
label(0x3b1c, "return1")
label(0x3bfc, "room_0_update_handler")
comment(0x3c0a, "check for first update in room (branch if not)")
comment(0x3c0f, "check for level change (branch if not)")
comment(0x3c15, "new level")
expr(0x3c16, sprite_dict)
expr(0x3c1b, sprite_dict)
expr(0x3c20, "collectable_being_used_spriteids+2")
comment(0x3c22, "no_level_change, just a room change only")
label(0x3c22, "room_change_only")
comment(0x3c28, "in room 0")
comment(0x3c2d, "not got axe yet, position the axe")
expr(0x3c3a, "objectid_axe")
expr(0x3c40, sprite_dict)
expr(0x3c45, sprite_dict)
label(0x3c4e, "return2")
label(0x3c4f, "room_0_not_first_update")
comment(0x3c5a, "not got axe. check for collision with axe")
expr(0x3c5b, "objectid_old_player")
expr(0x3c5d, "objectid_axe")
comment(0x3c63, "player has collided with axe. mark axe as collected.")
comment(0x3c68, "add axe to toolbar")
expr(0x3c69, sprite_dict)
comment(0x3c6d, "mark axe object as invisible")
expr(0x3c6e, sprite_dict)
expr(0x3c70, "object_spriteid + objectid_axe")
label(0x3c72, "return3")
comment(0x3c73, "check for first update in room (branch if not)")
label(0x3c73, "update_gnu_sign_puzzle")
comment(0x3c78, "initialise sign position")
comment(0x3c7d, "initial position of the sign")
label(0x3c82, "draw_rock_and_block_passage")
comment(0x3c98, "draw rock in room 0")
expr(0x3c9b, sprite_dict)
label(0x3ca3, "draw_rock_in_room_1")
label(0x3caf, "set_up_sign_object")
expr(0x3cb7, sprite_dict)
expr(0x3cbc, sprite_dict)
expr(0x3cc6, sprite_dict)
expr(0x3cc8, "object_spriteid + objectid_sign")
label(0x3cca, "deal_with_sign_position_consequences_local")
label(0x3ccd, "update_gnu_sign_puzzle_not_first_update")
comment(0x3cd3, "check if player is currently using the gun, and branch if not")
expr(0x3cd4, sprite_dict)
comment(0x3cda, "check if player just used the gun this game tick")
comment(0x3cdf, "check the Y coordinate of theplayer to see if it at the same height as the sign")
comment(0x3ce6, "if not in room 0 then branch")
comment(0x3cea, "in room 0, make sure we are pointing right (branch if not)")
comment(0x3cef, "move the sign to the right if not already fully to the right (position $30 is fully right)")
comment(0x3cfc, "rooms other than room 0 need the player to look left for the gun to work (branch otherwise)")
label(0x3cfc, "check_for_gun_in_rooms_other_than_0")
expr(0x3caa, sprite_dict)
comment(0x3d01, "move sign left not already all the way left (position $20 is fully left)")
label(0x3d0b, "deal_with_sign_position_consequences")
comment(0x3d1a, "player in room 0. if (sign is in position >= $29) then add collision map for ropes")
expr(0x3d1b, "collision_map_rope")
label(0x3d22, "add_ropes_to_collision_map_room_0")
label(0x3d3f, "already_written_to_collision_map_room_0")
label(0x3d45, "check_if_gnu_sign_is_in_room_1")
expr(0x3d46, "collision_map_rope")
label(0x3d4d, "add_ropes_to_collision_map_room_1")
label(0x3d6a, "already_written_to_collision_map_room_1")
label(0x3d70, "set_sign_object_position")
expr(0x3d74, "objectid_sign_stand")
expr(0x3d79, "objectid_sign")
label(0x3d7d, "return4")
expr(0x3dfa, sprite_dict)
label(0x3e2c, "room_1_check_right_exit")
expr(0x3e2f, "exit_room_right")
expr(0x3eb7, sprite_dict)
label(0x3edc, "room_2_check_right_exit")
expr(0x3edf, "exit_room_right")
label(0x3ee9, "room_2_update_handler")
comment(0x3f00, "check for first update in room (branch if not)")
ldx_ldy_jsr_define_envelope(0x3f09, "envelope1")
comment(0x3f0c, "check for level change (branch if not)")
comment(0x3f12, "if partition is partly fallen over, make it fully fallen")
label(0x3f1c, "level_changed")
expr(0x3f27, sprite_dict)
expr(0x3f2c, "objectid_partition")
expr(0x3f32, sprite_dict)
label(0x3f56, "set_partition_to_solid_collision_map")
label(0x3f63, "update_partition_sprite_local")
label(0x3f66, "update_partition_puzzle")
expr(0x3f77, sprite_dict)
expr(0x3f80, "objectid_player_accessory")
label(0x3faf, "update_partition_progress")
label(0x3fbd, "redundant_branch")
label(0x3fbf, "partition_is_falling")
label(0x3fc2, "update_partition_sprite")
label(0x3fcf, "set_partition_sprite")
expr(0x3fd3, "object_spriteid + objectid_partition")
label(0x3fd5, "return5")
label(0x3fd6, "partition_spriteid_table")
spriteid(0x3fd6, 0x3fd6+3)
label(0x3fd9, "play_baby_dying_or_partition_landing_sounds")
ldx_ldy_jsr_play_sound_yx(0x3fdf, "sound1")
ldx_ldy_jsr_play_sound_yx(0x3fe6, "sound2")
label(0x3fea, "play_gunshot_sound")
ldx_ldy_jsr_play_sound_yx(0x3ff0, "sound3")
ldx_ldy_jsr_play_sound_yx(0x3ff7, "sound4")
expr(0x409f, sprite_dict)
label(0x40c2, "room_3_update_handler")
comment(0x40d0, "check for first update in room (branch if not)")
expr(0x40d6, sprite_dict)
expr(0x40db, sprite_dict)
ldx_ldy_jsr_define_envelope(0x40e6, "envelope2")
comment(0x40e9, "check for level change (branch if not)")
label(0x40f9, "initialise_gun_in_room_3")
expr(0x4111, "objectid_gun")
expr(0x4117, sprite_dict)
expr(0x411c, sprite_dict)
label(0x4125, "return6")
label(0x4126, "update_gun")
expr(0x4132, "objectid_old_player")
expr(0x4134, "objectid_gun")
expr(0x413b, sprite_dict)
expr(0x4140, sprite_dict)
expr(0x4142, "object_spriteid + objectid_gun")
label(0x414c, "update_gunshot")
expr(0x414d, sprite_dict)
label(0x415b, "return7")
label(0x415c, "baby_x_offsets")
label(0x416d, "baby_y_offsets")
label(0x417e, "baby_base_spriteids")
label(0x417e, "baby_walk_to_block_exit_animation")
spriteid(0x417e, 0x41ac, True)
label(0x4190, "baby_sit_animation")
label(0x4192, "baby_smile_animation")
label(0x4194, "baby_walk_animation")
label(0x419f, "baby_surprise_animation")
comment(0x41ac, "check for first update in room (branch if not)")
label(0x41ac, "update_baby_puzzle")
comment(0x41b1, "check for level change (branch if not)")
expr(0x41b8, "baby_sit_animation - baby_base_spriteids")
expr(0x41c5, "baby_sit_animation - baby_base_spriteids")
expr(0x41c9, "baby_dead_animation - baby_base_spriteids")
expr(0x41d4, "baby_dead_animation - baby_base_spriteids")
expr(0x41d8, "baby_surprise_animation - baby_base_spriteids")
expr(0x41dc, "baby_smile_animation - baby_base_spriteids")
label(0x41df, "set_baby_position_and_animation")
label(0x41ed, "update_baby_object_if_in_room_3")
expr(0x41f4, "objectid_baby")
expr(0x41fe, sprite_dict)
label(0x41aa, "baby_dead_animation")
label(0x4207, "copy_new_baby_state_back_to_object_local")
label(0x420a, "set_baby_animation_step_local")
label(0x420d, "update_baby_animation_step")
label(0x421c, "baby_animation_in_progress")
label(0x423d, "baby_is_not_sitting")
label(0x4260, "baby_is_not_walking_to_block_exit")
comment(0x4241, "check if we have reached the end of the 'walk to block exit' animation (branch if so)")
label(0x424c, "reached_end_of_walk_to_block_exit_animation")
label(0x425a, "start_of_walk_to_block_exit_animation")
expr(0x4220, "baby_sit_animation - baby_base_spriteids")
expr(0x4236, "baby_walk_to_block_exit_animation - baby_base_spriteids")
expr(0x423e, "baby_walk_to_block_exit_animation - baby_base_spriteids")
expr(0x4242, "baby_walk_to_block_exit_animation+16 - baby_base_spriteids")
expr(0x4246, "baby_walk_to_block_exit_animation - baby_base_spriteids")
expr(0x4256, "baby_walk_to_block_exit_animation+16 - baby_base_spriteids")
expr(0x425b, "baby_smile_animation - baby_base_spriteids")
expr(0x4261, "baby_smile_animation - baby_base_spriteids")
expr(0x426b, sprite_dict)
expr(0x428f, "baby_surprise_animation - baby_base_spriteids")
label(0x4296, "check_for_player_baby_collision")
expr(0x4297, "objectid_player")
expr(0x429c, "objectid_baby")
expr(0x42a8, "objectid_player_accessory")
expr(0x42ad, "objectid_baby")
label(0x42b8, "got_player_baby_collision")
expr(0x42be, "baby_walk_animation - baby_base_spriteids")
label(0x42c2, "baby_is_not_smiling")
comment(0x42ca, "beginning the surprise animation, clear collision map for baby")
expr(0x42c3, "baby_surprise_animation - baby_base_spriteids")
expr(0x42c7, "baby_surprise_animation - baby_base_spriteids")
label(0x42e6, "set_dead_baby_animation")
expr(0x42e7, "baby_dead_animation - baby_base_spriteids")
label(0x42eb, "set_baby_animation_step")
label(0x4309, "copy_new_baby_state_back_to_object")
expr(0x4316, "object_spriteid + objectid_baby")
expr(0x431c, "object_x_low + objectid_baby")
expr(0x4322, "object_y_low + objectid_baby")
expr(0x432c, "baby_smile_animation - baby_base_spriteids")
expr(0x4330, "baby_surprise_animation - baby_base_spriteids")
expr(0x4334, "baby_walk_to_block_exit_animation - baby_base_spriteids")
expr(0x4338, "baby_dead_animation - baby_base_spriteids")
comment(0x433b, "write sold rock values into the collision map for the dead baby")
label(0x4352, "add_baby_to_collision_map")
label(0x4366, "return8")
label(0x4367, "temp_animation_index")

for i in range(17):
    byte(0x416d + i)
    byte(0x415c + i)

print("""; *************************************************************************************
;
; Level D: 'GNU-PROBLEM'
;
; Save game variables:
;
;     save_game_level_d_got_axe ($0a03):
;               0: not got
;             $ff: got
;     save_game_level_d_got_gun ($0a0f):
;               0: not got
;             $ff: got
;     save_game_level_d_gnu_sign_position ($0a10):
;             $20-$30: X position of 'GNU CLIMBING' sign
;     save_game_level_d_partition_progress ($0a11):
;               0: normal position
;               1: falling
;             $ff: fallen
;     save_game_level_d_baby_progress ($0a12):
;               0: not started
;             $12: sleeping
;             $14: blocking exit
;             $21: surprised
;             $2c: dead
;
; Solution:
;
;   1. Get gun in the far right room
;   2. Shoot the baby to escape the room
;   3. In the far left room, shoot the gnu climbing sign until it is no longer visible
;   4. Get the axe
;   5. Move two rooms to the right, climb up the rope and move into the room to the left.
;   6. Shoot the sign until it's back offscreen to the left.
;   7. Climb up the rope, over the gnu head, then back to exit the room at the top right.
;   8. Chop down the wooden partition wall with the axe, and collect the spell.
;
; *************************************************************************************""")

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
