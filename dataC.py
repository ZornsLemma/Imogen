from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_boulder",
    0xc9: "spriteid_table",
    0xca: "spriteid_brazier_object",
    0xcb: "spriteid_brazier_menu_item",
    0xcc: "spriteid_cache1",
    0xcd: "spriteid_cache2",
    0xce: "spriteid_cache3",
    0xcf: "spriteid_cache4",
    0xd0: "spriteid_cache5",
    0xd1: "spriteid_cache6",
    0xd2: "spriteid_cache7",
    0xd3: "spriteid_cache8",
    0xd4: "spriteid_table_burnt1",
    0xd5: "spriteid_table_burnt2",
    0xd6: "spriteid_table_burnt3",
    0xd7: "spriteid_blob",
    0xd8: "spriteid_empty_hook",
    0xd9: "spriteid_cache9",
    0xda: "spriteid_parrot1",
    0xdb: "spriteid_parrot2",
    0xdc: "spriteid_parrot_squawk",
    0xdd: "spriteid_brazier_object2",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Room 0
#constant(2, "objectid_left_mouse")

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
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

label(0x3b0c, "return1")
comment(0x3bf3, "check for first update in room (branch if so)")
comment(0x3bfb, "check for level change (branch if not)")
expr(0x3c15, sprite_dict)
expr(0x3c7f, sprite_dict)
label(0x3d74, "return2")
comment(0x3e74, "check for first update in room (branch if not)")
comment(0x3e79, "check for level change (branch if not)")
expr(0x3e9a, sprite_dict)
expr(0x3eb7, sprite_dict)
expr(0x3ecf, sprite_dict)
label(0x3fe4, "return3")
comment(0x3fe5, "check for first update in room (branch if not)")
expr(0x3feb, sprite_dict)
comment(0x3ff9, "check for level change (branch if not)")
label(0x4031, "return4")
expr(0x4041, "objectid_old_player")
comment(0x4058, "check for first update in room (branch if so)")
expr(0x4061, sprite_dict)
label(0x40d0, "return5")
label(0x40d1, "fire_spriteid_table")
spriteid(0x40d1, 0x40d1 + 12, True)
label(0x4187, "room_2_check_bottom_exit")
expr(0x418a, "exit_room_bottom")
label(0x4194, "room_2_check_right_exit")
expr(0x4197, "exit_room_right")
comment(0x41af, "check for first update in room (branch if not)")
label(0x421e, "parrot_spriteid_table")
spriteid(0x421e, 0x421e + 15, True)
comment(0x4242, "check for first update in room (branch if not)")
comment(0x4247, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x4251, "envelope1")
expr(0x4281, sprite_dict)
ldx_ldy_jsr_play_sound_yx(0x43c2, "sound1")
expr(0x4417, "objectid_player")
label(0x4424, "return6")

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
