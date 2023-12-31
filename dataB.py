from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0x3b: "spriteid_ball",
    0xc8: "spriteid_clock",
    0xc9: "spriteid_pendulum1",
    0xca: "spriteid_pendulum2",
    0xcb: "spriteid_pendulum3",
    0xcc: "spriteid_pendulum4",
    0xcd: "spriteid_pendulum5",
    0xce: "spriteid_vertical_rod",
    0xcf: "spriteid_cuckoo_appear_partly",
    0xd0: "spriteid_cuckoo_appear_full",
    0xd1: "spriteid_clock_workings",
    0xd2: "spriteid_table",
    0xd3: "spriteid_cuckoo",
    0xd4: "spriteid_cuckoo_menu_item",
    0xd5: "spriteid_boulder",
    0xd6: "spriteid_cuckoo_open_beak",
    0xd7: "spriteid_cache1",
    0xd8: "spriteid_cache2",
    0xd9: "spriteid_rope_end_at_object",
    0xda: "spriteid_rope_broken_falling_end",
    0xdb: "spriteid_rope_broken_bottom_end",
    0xdc: "spriteid_rope_broken_top_end",
    0xdd: "spriteid_hourglass",
    0xde: "spriteid_hourglass_menu_item",
    0xdf: "spriteid_cache3",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

constant(2, "objectid_pendulum")
constant(3, "objectid_clock_workings")
constant(4, "objectid_suspended_boulder")
constant(5, "objectid_rope_broken_top_end")
constant(5, "objectid_spell")
constant(6, "objectid_rope_broken_bottom_end")
constant(7, "objectid_hourglass")

# Room 3
constant(2, "objectid_cuckoo")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataB.dat", "6502", "879a85aaab89fe8ab2005698a0353a0b")

common_to_all('B')
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x406a): {
        "l0070": "room_exit_direction",
    },
    (0x422d, 0x4295): {
        "l0070": "previous_boulder_progress",
    }
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)


label(0x09aa, "object_spriteid + objectid_pendulum")
label(0x09ab, "object_spriteid + objectid_clock_workings")
label(0x09ac, "object_spriteid + objectid_suspended_boulder")
label(0x09ad, "object_spriteid + objectid_rope_broken_top_end")
label(0x09ae, "object_spriteid + objectid_rope_broken_bottom_end")
label(0x09af, "object_spriteid + objectid_hourglass")

# save game variables
label(0x0a05, "save_game_level_b_cuckoo_room_1_progress")             # 0: hidden in room 1 clock, 1+: cuckooing, $ff: got cuckoo (cuckoo object created)
label(0x0a06, "save_game_level_b_cuckoo_room_2_progress")             # 0: in room 2 clock or held, 1: installed in clock, 15: just launched, 16-40 (the odd numbers): animation being thrown into room3, $ff: in room 3
label(0x0a07, "save_game_level_b_room_2_falling_boulder_progress")    # 0: suspended, 1+: falling (Y coordinate), $ff: finished falling
label(0x0a08, "save_game_level_b_room_0_falling_boulder_progress")    # ditto
label(0x0a09, "save_game_level_b_got_hourglass_flag")

label(0x0a6f, "room_1_clock_repeat_counter")    # Counts up the number of repeats of the pendulum swing
label(0x0a70, "room_1_clock_repeat_limit")      # Set to $10 to play the clock animations until repeat counter reaches 16
label(0x0a71, "room_1_pendulum_swing_index")    # Animation index for the pendulum swing

label(0x3f1e, "clock_repeat_counter")    # Counts up the number of repeats of the pendulum swing
label(0x3f1f, "clock_repeat_limit")      # Set to $10 to play the clock animations until repeat counter reaches 16
label(0x3f20, "pendulum_swing_index")    # Animation index for the pendulum swing


label(0x0a72, "room_2_clock_repeat_counter")    # Counts up the number of repeats of the pendulum swing
label(0x0a73, "room_2_clock_repeat_limit")      # Set to $10 to play the clock animations until repeat counter reaches 16
label(0x0a74, "room_2_pendulum_swing_index")    # Animation index for the pendulum swing
label(0x0a75, "player_playing_cuckoo_progress") # 0: not playing, 1-3: animation step for cuckoo in player's hand singing

label(0x2ef4, "collectable_being_used_spriteids+2")
label(0x38b2, "object_erase_type + objectid_rope_broken_bottom_end")
label(0x38c8, "object_z_order + objectid_rope_broken_bottom_end")
label(0x3b02, "developer_mode_inactive")
label(0x3b0c, "check_got_cuckoo")
label(0x3b1b, "return1")
expr(0x3bf1, "exit_room_left")
comment(0x3bf4, "exit room left, to room 1")
label(0x3bfb, "room_0_check_right_exit")
expr(0x3bfe, "exit_room_right")
comment(0x3c01, "exit room right, to room 2")
label(0x3c08, "room_0_update_handler")
comment(0x3c0d, "on the first update, if we have changed levels, then define the envelope")
comment(0x3c13, "level changed, define the envelope")
ldx_ldy_jsr_define_envelope(0x3c17, "envelope1")
blank(0x3c1a)
label(0x3c1a, "room_0_update_suspended_boulder_puzzle")
comment(0x3c1f, "check if in room 0")
comment(0x3c25, "check the player is holding something")
comment(0x3c29, "check the player Y coordinate is less than 64")
comment(0x3c35, "check the player X coordinate is between 96 and 127")
comment(0x3c40, "with a bottom offset of 2 pixels, look if we are on the rope")
expr(0x3c4b, "collision_map_rope")
blank(0x3c51)
label(0x3c51, "room_0_update_boulder_falling_progress")
label(0x3c80, "return2")
label(0x3d66, "room_1_update_handler")
comment(0x3d74, "update room 1 clock")
comment(0x3da1, "check for first update (branch if not)")
comment(0x3da6, "check for level change (branch if not)")
comment(0x3dac, "the level has changed. If we don't actually have the cuckoo, then reset any cuckoo progress to zero")
label(0x3db6, "set_clock_workings_in_room_1")
expr(0x3dbd, "objectid_clock_workings")
label(0x3dce, "update_room_1_cuckooing_animation_local")
label(0x3dd1, "update_room_1_cuckoo")
comment(0x3dde, "check for collision in room 1 with cuckoo")
expr(0x3ddf, "objectid_old_player")
expr(0x3de1, "objectid_clock_workings")
label(0x3df3, "room_1_increment_the_clock_timers")
label(0x3e11, "update_room_1_cuckooing")
label(0x3e1b, "save_cuckooing_progress")
label(0x3e2b, "update_room_1_cuckooing_animation")
expr(0x3e37, sprite_dict)
ab(0x3e38)
blank(0x3e3a)
label(0x3e3a, "set_cuckooing_animation_to_index_y")
label(0x3e3d, "set_cuckooing_animation_spriteid")
label(0x3e40, "return9")
label(0x3e41, "cuckooing_spriteid_table")
for i in range(6):
    expr(0x3e41 + i, sprite_dict)
label(0x3e47, "update_clock")
comment(0x3e4f, "first update in room")
comment(0x3e55, "changed level, so reset clock (reset pendulum swings)")
label(0x3e60, "update_clock_first_update_same_level")
comment(0x3e67, "player is in the same room as the clock. Draw the clock.")
comment(0x3e70, "write clock to collison map")
ldx_ldy_jsr_define_envelope(0x3e97, "envelope2")
label(0x3e9a, "update_swinging_pendulum_local")
label(0x3e9d, "update_clock_not_first_update")
expr(0x3ea5, "objectid_old_player")
expr(0x3ea7, "objectid_pendulum")
comment(0x3ead, "add to clock counter")
label(0x3eb6, "update_swinging_pendulum")
label(0x3ecd, "still_mid_swing")
comment(0x3edb, "clock tick")
ldx_ldy_jsr_play_sound_yx(0x3ee1, "sound_tick")
label(0x3ee7, "check_for_clock_tock")
comment(0x3eeb, "clock tock")
ldx_ldy_jsr_play_sound_yx(0x3ef1, "sound_tock")
label(0x3ef4, "clock_bass")
ldx_ldy_jsr_play_sound_yx(0x3efa, "sound_clock_bass")
label(0x3efd, "finish_swinging_pendulum")
label(0x3f0d, "check_for_end_of_clock_ticking")
label(0x3f1d, "return10")
label(0x3f21, "swinging_pendulum_spriteids")
for addr in range(0x3f21, 0x3f21 + 14):
    byte(addr)
    expr(addr, sprite_dict)
blank(0x3f2b)
label(0x3f2b, "cuckoo_tweeting_spriteids")
label(0x3f2f, "update_playing_cuckoo_handler")
label(0x3f3f, "initialise_cuckoo")
ldx_ldy_jsr_define_envelope(0x3f43, "envelope3")
expr(0x3f47, sprite_dict)
expr(0x3f4c, sprite_dict)
label(0x3f53, "update_playing_cuckoo_not_first_update")
expr(0x3f54, sprite_dict)
label(0x3f62, "player_using_cuckoo")
label(0x3f6d, "set_cuckoo_sprite")
label(0x3f81, "return3")
label(0x3f82, "play_cuckoo_two_sounds")
ldx_ldy_jsr_play_sound_yx(0x3f88, "sound_cuckoo1")
ldx_ldy_jsr_play_sound_yx(0x3f8f, "sound_cuckoo2")
label(0x4060, "room_2_check_right_exit")
expr(0x4063, "exit_room_right")
label(0x406d, "room_2_update_handler")
comment(0x406d, "update room 2 clock")
comment(0x409a, "check for first update")
comment(0x409f, "first update. check for level change")
comment(0x40a5, "level changed. if cuckoo in room 2 had enough progress, then set as completed.")
label(0x40b1, "room_2_draw_clock_workings")
expr(0x40c5, "objectid_clock_workings")
expr(0x40d1, sprite_dict)
label(0x40d5, "skip_draw_workings")
label(0x40d8, "room_2_update_clock_puzzle")
comment(0x40e3, "check in room 2")
comment(0x40e9, "check player is using the cuckoo on the clock (in room 2)")
expr(0x40ed, sprite_dict)
comment(0x4105, "remove cuckoo from the toolbar and player's hand, increment progress, and reset wizard animation state")
expr(0x4106, sprite_dict)
expr(0x411a, sprite_dict)
expr(0x4123, common_sprite_dict)
label(0x4127, "room_2_update_cuckoo_in_clock")
comment(0x4127, "check if clock in room 2 is running (branch if not)")
comment(0x412f, "mark the cuckoo in room 2 as launched")
comment(0x4134, "if player is in room 2 then play the cuckoo sound")
label(0x4140, "room_2_update_cuckoo_being_thrown_into_room_3")
comment(0x414d, "cuckoo finished being thrown animation, now in room 3")
blank(0x4152)
label(0x4152, "room_2_update_clock_workings")
expr(0x4170, "objectid_clock_workings")
expr(0x4175, sprite_dict)
expr(0x417e, sprite_dict)
blank(0x4182)
label(0x4182, "room_2_update_suspended_boulder_puzzle")
label(0x4191, "room_2_update_boulder_falling_progress")
label(0x41c0, "return6")
label(0x41c1, "play_boulder_landing_sounds")
ldx_ldy_jsr_play_sound_yx(0x41c7, "sound6")
ldx_ldy_jsr_play_sound_yx(0x41ce, "sound7")
label(0x41d2, "update_suspended_boulder_at_xy_in_room_a")
comment(0x41db, "branch if not the first room update")
comment(0x41e0, "check if level just changed")
comment(0x41e6, "new level, finish any falling boulder progress immediately")
label(0x41f0, "room_2_initialise_suspended_boulder")
comment(0x41f7, "draw rope above boulder")
expr(0x420f, sprite_dict)
expr(0x4214, "objectid_rope_broken_top_end")
comment(0x4218, "set boulder sprite for object")
expr(0x4219, sprite_dict)
comment(0x421d, "broken rope in front of boulder needs offscreen cache")
expr(0x421e, sprite_dict)
label(0x4227, "update_rope_sprites_and_boulder_collision_map_local")
label(0x422a, "return7_local")
label(0x422d, "update_falling_boulder")
comment(0x4234, "is the player on the boulder and holding an object?")
comment(0x4239, "start the boulder falling")
label(0x4246, "boulder_is_falling")
label(0x4258, "move_falling_boulder_down")
comment(0x425c, "check we are in the right room")
comment(0x4263, "clear collision where the boulder was")
label(0x427f, "update_rope_sprites_and_boulder_collision_map")
comment(0x4286, "check progress")
comment(0x428d, "set rope and collision when suspended")
expr(0x428e, sprite_dict)
label(0x4298, "set_rope_ends_while_boulder_falling")
expr(0x42b8, "objectid_suspended_boulder")
expr(0x42bd, "objectid_rope_broken_bottom_end")
expr(0x429a, sprite_dict)
expr(0x429f, sprite_dict)
label(0x42a6, "set_rope_ends_once_boulder_landed")
expr(0x42a7, sprite_dict)
expr(0x42ac, sprite_dict)
label(0x42b3, "write_boulder_position_to_collision_map")
label(0x42d7, "return7")
label(0x42d8, "falling_boulder_progress")
label(0x42d9, "suspended_boulder_x")
label(0x42da, "suspended_boulder_y")
label(0x42db, "fallen_boulder_y")
label(0x42dc, "player_on_suspended_boulder_holding_object")
label(0x42dd, "update_hourglass_handler")
expr(0x42e3, sprite_dict)
expr(0x42e8, sprite_dict)
comment(0x42ef, "check for being in room 2")
comment(0x42f5, "room 2 update")
expr(0x42ff, "objectid_hourglass")
expr(0x430a, sprite_dict)
expr(0x4314, sprite_dict)
label(0x4318, "return4")
label(0x4319, "room_2_update_hourglass")
expr(0x4325, "objectid_old_player")
expr(0x4327, "objectid_hourglass")
label(0x433c, "return8")
comment(0x43e3, "draw rope")
label(0x443d, "room_3_update_handler")
comment(0x4442, "update fire")
comment(0x4451, "position and update the spell collectable object")
expr(0x445a, "objectid_spell")
comment(0x445e, "check for room 3 (return if not)")
comment(0x4469, "first update in room 3")
expr(0x4479, "objectid_cuckoo")
comment(0x447d, "set properties of the cuckoo in room 3")
expr(0x4484, sprite_dict)
expr(0x448e, sprite_dict)
label(0x4495, "room_3_not_first_update")
expr(0x4496, "objectid_old_player")
expr(0x4498, "objectid_cuckoo")
label(0x44ad, "return5")
envelope(0x44f2, "envelope_unused")
sound(0x4500, "sound_unused")

print("""; *************************************************************************************
;
; Level B: TIME-FLIES
;
; Save game variables:
;
;     save_game_level_b_cuckoo_room_1_progress ($0a05):
;               0: hidden in room 1 clock,
;              1+: cuckooing
;             $ff: got cuckoo (cuckoo object created)
;     save_game_level_b_cuckoo_room_2_progress ($0a06):
;               0: in room 2 clock or held
;               1: installed in clock
;              15: just launched
;           16-40: animation being thrown into room3 (just the odd numbers)
;             $ff: in room 3
;     save_game_level_b_room_2_falling_boulder_progress ($0a07):
;               0: suspended
;             $ff: finished falling
;       otherwise: falling (Y coordinate)
;     save_game_level_b_room_0_falling_boulder_progress ($0a08):
;               0: suspended
;             $ff: finished falling
;       otherwise: falling (Y coordinate)
;     save_game_level_b_got_hourglass_flag ($0a09)
;
; Solution:
;
;   1. Get the hourglass collectable from room 2 (to the right of the start room 0)
;   2. Stand as the wizard on top of the suspended boulder in room 0 holding the hourglass
;           (The boulder falls)
;   3. Jump left into room 1 from the fallen boulder, and go to the far left edge
;   4. Jump into the pendulum to set it ticking for a short time
;   5. As the cat, jump back to the right of the room, up onto the ledge and as the monkey jump
;      onto the rope and into the cuckoo before the clock stops. Timing is tight here.
;      Alternatively, jump as the cat towards the rope from the right below the rope and
;      change mid-air into the monkey to grab onto the rope.
;   6. Take the cuckoo to the clock in room 2 and use it on top of the clock to fix the clock.
;   7. Set the clock ticking by jumping into the pendulum.
;           (The cuckoo is thrown into room 3, and the suspended boulder falls)
;   8. Jump to the right into room 3 from the fallen boulder
;   9. Climb the rope over to the right side of the room and jump into the spell collectable.
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
