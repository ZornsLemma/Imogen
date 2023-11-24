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

common_to_all()
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

label(0x0a06, "cuckoo_thrown")
label(0x0a09, "got_hourglass_flag")

label(0x2ef4, "five_byte_table_paired_with_collectable_sprite_ids+2")
label(0x38b2, "object_sprite_mask_type + objectid_rope_broken_bottom_end")
label(0x3b02, "no_developer_top_bit_flag")
label(0x3b0c, "check_got_cuckoo")
label(0x3b1b, "return1")
expr(0x3bf1, "exit_room_left")
comment(0x3bf4, "exit room left, to room 1")
label(0x3bfb, "room_0_check_right_exit")
expr(0x3bfe, "exit_room_right")
comment(0x3c01, "exit room right, to room 2")
comment(0x3c0d, "on the first update, if we have changed levels, then define the envelope")
ldx_ldy_jsr_define_envelope(0x3c17, "envelope1")
blank(0x3c1a)
label(0x3c1a, "not_first_update")
comment(0x3c1f, "check if in room 0")
comment(0x3c25, "check the player is holding something")
comment(0x3c29, "check the player Y coordinate is less than 64")
comment(0x3c35, "check the player X coordinate is between 96 and 127")
comment(0x3c40, "with a bottom offset of 2 pixels, look if we are on the rope")
expr(0x3c4b, "collision_map_rope")
blank(0x3c51)
label(0x3c51, "after_room_0_code")
label(0x3c80, "return2")
for i in range(6):
    expr(0x3e41 + i, sprite_dict)
ldx_ldy_jsr_define_envelope(0x3e97, "envelope2")
ldx_ldy_jsr_play_sound_yx(0x3ee1, "sound1")
ldx_ldy_jsr_play_sound_yx(0x3ef1, "sound2")
ldx_ldy_jsr_play_sound_yx(0x3efa, "sound3")
ldx_ldy_jsr_define_envelope(0x3f43, "envelope3")
expr(0x3f47, sprite_dict)
expr(0x3f4c, sprite_dict)
expr(0x3f54, sprite_dict)
label(0x3f21, "swinging_pendulum_spriteids")
for addr in range(0x3f21, 0x3f21 + 14):
    expr(addr, sprite_dict)
label(0x3f2b, "cuckoo_tweeting_spriteids")
ldx_ldy_jsr_play_sound_yx(0x3f88, "sound4")
ldx_ldy_jsr_play_sound_yx(0x3f8f, "sound5")
label(0x4060, "room_2_check_right_exit")
expr(0x4063, "exit_room_right")
expr(0x40d1, sprite_dict)
expr(0x4106, sprite_dict)
expr(0x411a, sprite_dict)
expr(0x4123, common_sprite_dict)
label(0x41c1, "play_two_sounds")
ldx_ldy_jsr_play_sound_yx(0x41c7, "sound6")
ldx_ldy_jsr_play_sound_yx(0x41ce, "sound7")
expr(0x420f, sprite_dict)
expr(0x4219, sprite_dict)
expr(0x421e, sprite_dict)
expr(0x428e, sprite_dict)
expr(0x429a, sprite_dict)
expr(0x429f, sprite_dict)
expr(0x42a7, sprite_dict)
expr(0x42ac, sprite_dict)
label(0x42dc, "room_0_player_on_left_rope")
expr(0x42e3, sprite_dict)
expr(0x42e8, sprite_dict)
comment(0x42ef, "check for being in room 2")
expr(0x42ff, "objectid_hourglass")
expr(0x430a, sprite_dict)
label(0x4318, "return3")
comment(0x42f5, "room 2 update")
comment(0x43e3, "draw rope")
label(0x443d, "room_3_update_handler")
comment(0x4442, "update fire")
comment(0x4451, "position and update the spell collectable object")
expr(0x445a, "objectid_spell")
comment(0x445e, "check for room 3 (return if not)")
comment(0x4469, "first update in room 3")
expr(0x4479, "objectid_cuckoo")
comment(0x447d, "set properties of the cuckoo in room 3")
expr(0x448e, sprite_dict)
label(0x4495, "room_3_not_first_update")
label(0x44ad, "return4")
envelope(0x44f2, "envelope_unused")
sound(0x4500, "sound_unused")

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
