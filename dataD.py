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

comment(0x3af3, "check for level change (branch if not)")
label(0x3b08, "developer_mode_inactive")
expr(0x3b0e, sprite_dict)
expr(0x3b18, sprite_dict)
label(0x3b1c, "return1")
label(0x3bfc, "room_0_update_handler")
comment(0x3c0a, "check for first update in room (branch if not)")
comment(0x3c0f, "check for level change (branch if not)")
expr(0x3c16, sprite_dict)
expr(0x3c3a, "objectid_axe")
expr(0x3c40, sprite_dict)
expr(0x3c45, sprite_dict)
label(0x3c4e, "return2")
expr(0x3c5b, "objectid_old_player")
expr(0x3c69, sprite_dict)
expr(0x3c6e, sprite_dict)
expr(0x3c70, "object_spriteid + objectid_axe")
label(0x3c72, "return3")
comment(0x3c73, "check for first update in room (branch if not)")
expr(0x3c9b, sprite_dict)
expr(0x3cb7, sprite_dict)
expr(0x3cbc, sprite_dict)
expr(0x3cc6, sprite_dict)
expr(0x3cc8, "object_spriteid + objectid_sign")
expr(0x3caa, sprite_dict)
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
expr(0x3f27, sprite_dict)
expr(0x3f2c, "objectid_partition")
expr(0x3f32, sprite_dict)
expr(0x3f77, sprite_dict)
expr(0x3f80, "objectid_player_accessory")
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
ldx_ldy_jsr_define_envelope(0x40e6, "envelope2")
comment(0x40e9, "check for level change (branch if not)")
expr(0x4111, "objectid_axe")
expr(0x4117, sprite_dict)
expr(0x411c, sprite_dict)
label(0x4125, "return6")
expr(0x4132, "objectid_old_player")
expr(0x413b, sprite_dict)
expr(0x4140, sprite_dict)
expr(0x4142, "object_spriteid + objectid_axe")
expr(0x414d, sprite_dict)
label(0x415b, "return7")
label(0x417e, "baby_spriteid_table")
spriteid(0x417e, 0x41ac, True)
comment(0x41ac, "check for first update in room (branch if not)")
label(0x41ac, "update_baby")
comment(0x41b1, "check for level change (branch if not)")
expr(0x41fe, sprite_dict)
expr(0x4316, "object_spriteid + objectid_baby")
expr(0x431c, "object_x_low + objectid_baby")
expr(0x4322, "object_y_low + objectid_baby")
label(0x4366, "return8")

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
