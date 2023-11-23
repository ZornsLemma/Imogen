from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
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
    0xd9: "spriteid_rope",
    0xda: "spriteid_rope_broken1",
    0xdb: "spriteid_blob",
    0xdc: "spriteid_rope_broken2",
    0xdd: "spriteid_hourglass",
    0xde: "spriteid_hourglass_menu_item",
    0xdf: "spriteid_cache3",
}

# Room 0
#constant(2, "objectid_left_mouse")

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
#    (0x3bd4,0x3df9): {
#        "l0070": "room_exit_direction",
#    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

label(0x0070, "room_exit_direction")

label(0x0a09, "got_hourglass_flag")

label(0x2ef4, "five_byte_table_paired_with_collectable_sprite_ids+2")

label(0x3b0c, "check_got_cuckoo")
label(0x3b1b, "return1")
label(0x3c80, "return2")

comment(0x3bc4, "Draw tables")
expr(0x3bf1, "exit_room_left")
comment(0x3bf4, "exit room left, to room 1")
expr(0x3bfe, "exit_room_right")
comment(0x3c01, "exit room right, to room 2")
label(0x3beb, "game_update_loop")
label(0x3bfb, "not_exited_room_left")
comment(0x3bdf, "Draw rope")
ldx_ldy_jsr_define_envelope(0x3c17, "envelope1")
ldx_ldy_jsr_define_envelope(0x3e97, "envelope2")
ldx_ldy_jsr_play_sound_yx(0x3ee1, "sound1")
ldx_ldy_jsr_play_sound_yx(0x3ef1, "sound2")
ldx_ldy_jsr_play_sound_yx(0x3efa, "sound3")
ldx_ldy_jsr_define_envelope(0x3f43, "envelope3")
ldx_ldy_jsr_play_sound_yx(0x3f88, "sound4")
ldx_ldy_jsr_play_sound_yx(0x3f8f, "sound5")
ldx_ldy_jsr_play_sound_yx(0x41c7, "sound6")
ldx_ldy_jsr_play_sound_yx(0x41ce, "sound7")
envelope(0x44f2, "envelope_unused")
sound(0x4500, "sound_unused")

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
