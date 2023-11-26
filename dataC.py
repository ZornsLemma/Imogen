from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_boulder",
    0xc9: "spriteid_table",
    0xca: "spriteid_brazier_object",
    0xcb: "spriteid_brazier_menu_item",
    0xcc: "spriteid_cache1",
    0xcd: "spriteid_fire",
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
expr(0x3ca1, sprite_dict)
expr(0x3cea, sprite_dict)
expr(0x3cea, sprite_dict)
expr(0x3d06, sprite_dict)
expr(0x3d0b, sprite_dict)
expr(0x3d1f, sprite_dict)
expr(0x3d35, sprite_dict)
label(0x3d74, "return2")
comment(0x3e74, "check for first update in room (branch if not)")
comment(0x3e79, "check for level change (branch if not)")
expr(0x3e9a, sprite_dict)
expr(0x3eb7, sprite_dict)
expr(0x3ecf, sprite_dict)
expr(0x3f21, sprite_dict)
expr(0x3f26, sprite_dict)
expr(0x3f58, sprite_dict)
expr(0x3f6c, sprite_dict)
expr(0x3f77, sprite_dict)
expr(0x3f87, sprite_dict)
expr(0x3f97, sprite_dict)
expr(0x3fab, sprite_dict)
expr(0x3fb6, sprite_dict)
expr(0x3fbb, sprite_dict)
label(0x3fe4, "return3")
comment(0x3fe5, "check for first update in room (branch if not)")
expr(0x3feb, sprite_dict)
comment(0x3ff9, "check for level change (branch if not)")
expr(0x402d, sprite_dict)
label(0x4031, "return4")
expr(0x4041, "objectid_old_player")
comment(0x4058, "check for first update in room (branch if so)")
expr(0x4061, sprite_dict)
expr(0x407d, sprite_dict)
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

expr(0x3ca3, "object_spriteid_old + 3")
expr(0x3cec, "object_spriteid + 4")
expr(0x3d08, "object_spriteid + 3")
expr(0x3d0d, "object_spriteid + 4")
expr(0x3d21, "object_spriteid + 3")
expr(0x3d24, "object_spriteid + 4")
expr(0x3d37, "object_spriteid + 3")
expr(0x3d44, "object_spriteid + 4")
expr(0x3d61, "object_y_low + 3")
expr(0x3d64, "object_y_low + 4")
expr(0x3f23, "object_spriteid + 5")
expr(0x3f28, "object_spriteid + 6")
expr(0x3f2b, "object_spriteid + 7")
expr(0x3f39, "object_spriteid + 6")
expr(0x3f46, "object_spriteid + 7")
expr(0x3f5a, "object_spriteid + 5")
expr(0x3f5f, "object_y_low + 6")
expr(0x3f62, "object_y_low + 7")
expr(0x3f6e, "object_spriteid + 6")
expr(0x3f71, "object_spriteid + 7")
expr(0x3f79, "object_spriteid + 5")
expr(0x3f7e, "object_y_low + 6")
expr(0x3f81, "object_y_low + 7")
expr(0x3f89, "object_spriteid + 5")
expr(0x3f8e, "object_y_low + 6")
expr(0x3f91, "object_y_low + 7")
expr(0x3f99, "object_spriteid + 5")
expr(0x3f9e, "object_y_low + 6")
expr(0x3fa1, "object_y_low + 7")
expr(0x3fad, "object_spriteid + 6")
expr(0x3fad, "object_spriteid + 6")
expr(0x3fb0, "object_spriteid + 7")
expr(0x3fb8, "object_spriteid + 5")
expr(0x3fbd, "object_spriteid + 6")
expr(0x3fc0, "object_spriteid + 7")
expr(0x402f, "object_spriteid + 2")
expr(0x407f, "object_spriteid + 2")
expr(0x43ed, "object_y_high + 5")
expr(0x43f1, "object_y_high + 5")
expr(0x43f4, "object_y_low + 5")
expr(0x43fa, "object_direction + 5")
expr(0x4400, "object_x_low + 5")
expr(0x4406, "object_x_high + 5")
expr(0x440f, "object_spriteid + 5")


label(0x3bb3, "room_0_update_handler")
label(0x3e45, "room_1_update_handler")
label(0x41a1, "room_2_update_handler")
label(0x44f0, "room_3_update_handler")

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
