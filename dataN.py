from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_left_hook",
    0xc9: "spriteid_right_hook",
    0xca: "spriteid_horizontal_rope",
    0xcb: "spriteid_rope",
    0xcc: "spriteid_boulder",
    0xcd: "spriteid_umbrella",
    0xce: "spriteid_partition",
    0xcf: "spriteid_partition_end",
    0xd0: "spriteid_erase1",
    0xd1: "spriteid_dog_body",
    0xd2: "spriteid_erase2",
    0xd3: "spriteid_erase3",
    0xd4: "spriteid_dog_head",
    0xd5: "spriteid_dog_head_drooling",
    0xd6: "spriteid_droplet4",
    0xd7: "spriteid_droplet3",
    0xd8: "spriteid_droplet2",
    0xd9: "spriteid_droplet1",
    0xda: "spriteid_rope_end1",
    0xdb: "spriteid_tail1",
    0xdc: "spriteid_tail2",
    0xdd: "spriteid_tail3",
    0xde: "spriteid_tail4",
    0xdf: "spriteid_clanger",
    0xe0: "spriteid_clanger_menu_item",
    0xe1: "spriteid_bell",
    0xe2: "spriteid_erase4",
    0xe3: "spriteid_using_clanger",
    0xe4: "spriteid_using_clanger_end",
    0xe5: "spriteid_erase5",
    0xe6: "spriteid_holding_clanger",
    0xe7: "spriteid_clanger_end",
    0xe8: "spriteid_clanger2",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Multiple rooms
constant(2, "objectid_bell")
constant(3, "objectid_clanger_end")
constant(4, "objectid_fire1")
constant(5, "objectid_fire2")

# Room 0
constant(4, "objectid_partition_end")
constant(5, "objectid_partition")
constant(6, "objectid_sparkles")
constant(7, "objectid_drip")
constant(8, "objectid_dog_tail")
constant(9, "objectid_dog_head")
constant(10, "objectid_umbrella")

# Room 3
constant(4, "objectid_clanger")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataN.dat", "6502", "b5b25b774079156e08f37276f6956e13")

common_to_all('N')
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3f18,0x403e): {
        "l0070": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

comment(0x3af7, "check for level change (branch if not)")
label(0x3b07, "developer_mode_inactive1")
expr(0x3b0d, sprite_dict)
ground_fill(0x3b11)
byte(0x3bba)
label(0x3bba, "dog_head_animations")
byte(0x3bbb)
expr(0x3bbb, sprite_dict)
label(0x3bbb, "dog_head_normal_animation")
byte(0x3bbe)
byte(0x3bbf)
expr(0x3bbf, sprite_dict)
label(0x3bbf, "dog_head_drooling_animation")
byte(0x3bc2)
expr(0x3bc2, sprite_dict)
byte(0x3bc5)
expr(0x3bc5, sprite_dict)
byte(0x3bc8)
expr(0x3bc8, sprite_dict)
byte(0x3bcb)
expr(0x3bcb, sprite_dict)
byte(0x3bce)
expr(0x3bce, sprite_dict)
byte(0x3bd1)
expr(0x3bd1, sprite_dict)
byte(0x3bd4)
expr(0x3bd4, sprite_dict)
byte(0x3bd7)
expr(0x3bd7, sprite_dict)
byte(0x3bd8, 2)
expr(0x3bd8, sprite_dict)
byte(0x3bda)
expr(0x3bda, sprite_dict)
byte(0x3bdb, 2)
expr(0x3bdb, sprite_dict)
byte(0x3bdd)
expr(0x3bdd, sprite_dict)
byte(0x3bde, 2)
expr(0x3bde, sprite_dict)
byte(0x3be0)
expr(0x3be0, sprite_dict)
byte(0x3be1, 2)
expr(0x3be1, sprite_dict)
byte(0x3be3)
expr(0x3be3, sprite_dict)
byte(0x3be4, 2)
expr(0x3be4, sprite_dict)
byte(0x3be6)
expr(0x3be6, sprite_dict)
byte(0x3be7, 2)
expr(0x3be7, sprite_dict)
byte(0x3bea)
expr(0x3bea, sprite_dict)
label(0x3bea, "dog_head_drooling_held_animation")
byte(0x3beb, 2)
expr(0x3beb, sprite_dict)
byte(0x3bee)
expr(0x3bee, sprite_dict)
label(0x3bee, "dog_head_drooling_final_animation")
byte(0x3bef, 2)
label(0x3bf2, "dog_tail_animation")
label(0x3bf7, "room_0_update_handler")
comment(0x3c05, "check for first update in room (branch if not)")
comment(0x3c0a, "check for level change (branch if not)")
expr(0x3c28, sprite_dict)
expr(0x3c34, "object_z_order + objectid_dog_tail")
expr(0x3c3c, sprite_dict)
expr(0x3c3e, "object_erase_type + objectid_dog_head")
expr(0x3c43, "object_z_order + objectid_dog_head")
expr(0x3c48, "object_x_low + objectid_drip")
expr(0x3c4b, sprite_dict)
expr(0x3c4d, "object_erase_type + objectid_drip")
expr(0x3c52, "object_z_order + objectid_drip")
label(0x3ce5, "developer_mode_inactive2")
expr(0x3d20, "object_spriteid + objectid_dog_head")
expr(0x3d27, "object_spriteid + objectid_drip")
expr(0x3d2d, "object_y_low + objectid_drip")
expr(0x3d36, "object_spriteid + objectid_dog_tail")
label(0x3d38, "return1")
comment(0x3d3a, "check for first update in room (branch if so)")
comment(0x3d42, "check for level change (branch if not)")
expr(0x3d71, sprite_dict)
expr(0x3d83, sprite_dict)
expr(0x3da4, sprite_dict)
expr(0x3da6, "object_spriteid + objectid_umbrella")
expr(0x3dc9, sprite_dict)
expr(0x3dcb, "object_spriteid + objectid_partition_end")
expr(0x3dd0, "object_z_order + objectid_partition_end")
expr(0x3dd3, sprite_dict)
expr(0x3dd5, "object_spriteid + objectid_partition")
expr(0x3dd8, sprite_dict)
expr(0x3dda, "object_erase_type + objectid_partition")
expr(0x3df1, sprite_dict)
expr(0x3df3, "object_spriteid_old + objectid_umbrella")
ldx_ldy_jsr_play_sound_yx(0x3dfb, "sound1")
expr(0x3e02, "object_y_low + objectid_partition_end")
expr(0x3e0a, sprite_dict)
expr(0x3e0c, "object_spriteid_old + objectid_umbrella")
expr(0x3e20, "object_y_low + objectid_partition_end")
expr(0x3e23, "object_y_low + objectid_partition")
expr(0x3e2f, "object_y_low + objectid_umbrella")
comment(0x3e6e, "check for first update in room (branch if so)")
label(0x3e84, "return2")
expr(0x3e90, "sound_priority_per_channel_table + 1")
label(0x3e92, "return3")
expr(0x3efe, sprite_dict)
label(0x3f28, "room_1_check_right_exit")
expr(0x3f2b, "exit_room_right")
label(0x3f35, "room_1_update_handler")
expr(0x3f69, sprite_dict)
expr(0x3ffd, sprite_dict)
expr(0x4009, sprite_dict)
expr(0x4013, sprite_dict)
expr(0x401d, sprite_dict)
label(0x4034, "room_2_check_bottom_exit")
expr(0x4037, "exit_room_bottom")
label(0x4058, "room_2_update_handler")
comment(0x4066, "check for first update in room (branch if not)")
ldx_ldy_jsr_define_envelope(0x406f, "envelope1")
ldx_ldy_jsr_define_envelope(0x4076, "envelope2")
comment(0x4079, "check for level change (branch if not)")
expr(0x40b2, sprite_dict)
expr(0x40b4, "object_erase_type + objectid_bell")
expr(0x40b9, "object_z_order + objectid_bell")
ldx_ldy_jsr_play_sound_yx(0x4167, "sound2")
ldx_ldy_jsr_play_sound_yx(0x416e, "sound3")
label(0x4177, "return4")
comment(0x4193, "check for first update in room (branch if so)")
ldx_ldy_jsr_play_sound_yx(0x41e2, "sound4")
expr(0x42ea, sprite_dict)
expr(0x42ec, "object_spriteid + objectid_bell")
label(0x42ee, "return5")
expr(0x42f4, "object_x_low + objectid_bell")
expr(0x42fa, "object_x_high + objectid_bell")
expr(0x4300, "object_y_low + objectid_bell")
expr(0x4306, "object_y_high + objectid_bell")
expr(0x4309, sprite_dict)
expr(0x430b, "object_spriteid + objectid_bell")
label(0x4354, "return6")
expr(0x43cb, sprite_dict)
expr(0x43dc, sprite_dict)
expr(0x43e6, sprite_dict)
label(0x43fb, "room_3_update_handler")
comment(0x4409, "check for first update in room (branch if not)")
ldx_ldy_jsr_define_envelope(0x4412, "envelope3")
expr(0x4416, sprite_dict)
expr(0x4425, sprite_dict)
expr(0x4427, "object_erase_type + objectid_clanger_end")
expr(0x442c, "object_z_order + objectid_clanger_end")
expr(0x4443, sprite_dict)
expr(0x4445, "object_erase_type + objectid_clanger")
expr(0x4448, sprite_dict)
expr(0x444a, "object_spriteid + objectid_clanger")
expr(0x445b, "objectid_old_player")
expr(0x4469, sprite_dict)
expr(0x446b, "object_spriteid + objectid_clanger")
expr(0x446e, sprite_dict)
expr(0x4476, sprite_dict)
expr(0x4478, "object_spriteid + objectid_clanger_end")
expr(0x4482, sprite_dict)
expr(0x4499, "objectid_player_accessory")
expr(0x44a2, sprite_dict)
expr(0x44b0, "object_x_high + objectid_clanger_end")
expr(0x44b6, "object_y_low + objectid_clanger_end")
expr(0x44bc, "object_y_high + objectid_clanger_end")
expr(0x44c2, "object_direction + objectid_clanger_end")
expr(0x44c5, sprite_dict)
expr(0x44c7, "object_spriteid + objectid_clanger_end")
comment(0x44d9, "check for first update in room (branch if so)")
expr(0x44f0, make_lo("sound4"))
expr(0x44f2, make_hi("sound4"))
expr(0x44aa, "object_x_low + objectid_clanger_end")
label(0x4508, "return7")

for i in range(0x3bf2, 0x3bf6):
    expr(i, sprite_dict)
    byte(i)


result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
