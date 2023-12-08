from common_to_levels import *

config.set_label_references(False)
config.set_hex_dump_show_ascii(False)

sprite_dict = {
    0xc8: "spriteid_stalk",
    0xc9: "spriteid_stalk_bottom_end",
    0xca: "spriteid_stalk_top_end",
    0xcb: "spriteid_stalk_top_end_short",
    0xcc: "spriteid_full_bottle",
    0xcd: "spriteid_leaf",
    0xce: "spriteid_leaf_wilting1",
    0xcf: "spriteid_leaf_wilting2",
    0xd0: "spriteid_leaf_wilted",
    0xd1: "spriteid_erase_1",
    0xd2: "spriteid_empty_bottle",
    0xd3: "spriteid_empty_bottle_held",
    0xd4: "spriteid_full_bottle_held",
    0xd5: "spriteid_emptying_bottle",
    0xd6: "spriteid_empty_bottle_menu_item",
    0xd7: "spriteid_full_bottle_menu_item",
    0xd8: "spriteid_bucket",
    0xd9: "spriteid_splash",
    0xda: "spriteid_droplet",
    0xdb: "spriteid_droplet1",
    0xdc: "spriteid_droplet2",
    0xdd: "spriteid_droplet3",
    0xde: "spriteid_droplet4",
    0xdf: "spriteid_pour",
    0xe0: "spriteid_leaf1",
    0xe1: "spriteid_leaf2",
    0xe2: "spriteid_leaf3",
    0xe3: "spriteid_leaf4",
    0xe4: "spriteid_erase_2",
    0xe5: "spriteid_shelf",
    0xe6: "spriteid_shelf_support",
    0xe7: "spriteid_erase_3",
    0xe8: "spriteid_dog_dead",
    0xe9: "spriteid_dog_body",
    0xea: "spriteid_dog_head",
    0xeb: "spriteid_dog_head_licking",
    0xec: "spriteid_dog_bowl1",
    0xed: "spriteid_dog_bowl2",
}

# Merge with common sprite dictionary
sprite_dict = {**common_sprite_dict, **sprite_dict}

# Multiple rooms
constant(2, "objectid_bottle_pour")
constant(3, "objectid_drip")

# Room 0
constant(3, "objectid_empty_bottle")
constant(4, "objectid_sparkles")
constant(5, "objectid_dog_body")
constant(6, "objectid_dog_head")
constant(7, "objectid_dog_bowl")

# Room 1
constant(4, "objectid_room_1_fire1")
constant(5, "objectid_room_1_fire2")

# Room 2
constant(3, "objectid_top_of_stalk")
constant(4, "objectid_leaf1")
constant(5, "objectid_leaf2")
constant(6, "objectid_room2_fire1")
constant(7, "objectid_room2_fire2")

# Room 3
constant(4, "objectid_room_3_fire")

# Debug keys
constant(0xac, "inkey_key_g")
constant(0xc8, "inkey_key_p")

set_sprite_dict(sprite_dict)

load(0x3ad5, "orig/dataK.dat", "6502", "8cdca3e68b752622cd596db68f24d8c4")

common_to_all('K')
define_level(4)

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3ad5,0x3bce): {
        "l0070": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

label(0x2ef4, "collectable_being_used_spriteids + 2")

comment(0x3af6, "check for level change (branch if not)")
label(0x3b0b, "developer_mode_inactive1")
expr(0x3b15, sprite_dict)
expr(0x3b1d, sprite_dict)
ground_fill(0x3b21)
label(0x3bc4, "room_2_check_right_exit")
expr(0x3bc7, "exit_room_right")
byte(0x3bd1)
expr(0x3bd1, sprite_dict)
byte(0x3bd2)
expr(0x3bd2, sprite_dict)
byte(0x3bd3)
expr(0x3bd3, sprite_dict)
expr(0x3bd4, sprite_dict)
byte(0x3bd5)
expr(0x3bd5, sprite_dict)
byte(0x3bd6)
expr(0x3bd6, sprite_dict)
byte(0x3bd7)
expr(0x3bd7, sprite_dict)
expr(0x3bd8, sprite_dict)
label(0x3bd9, "room_2_update_handler")
expr(0x3be3, "objectid_room2_fire1")
expr(0x3bea, "objectid_room2_fire2")
comment(0x3bee, "check for first update in room (branch if so)")
comment(0x3bf6, "check for level change (branch if not)")
label(0x3bf6, "initialise_room_2")
label(0x3c2f, "room_changed_only")
expr(0x3c6d, "collision_map_solid_rock")
expr(0x3c78, sprite_dict)
expr(0x3c7d, "objectid_top_of_stalk")
label(0x3c86, "draw_stalk_to_bottom")
comment(0x3c8e, "draw bottom of stalk")
expr(0x3c8f, sprite_dict)
expr(0x3ccb, "object_direction + objectid_leaf2")
expr(0x3ce6, "objectid_leaf1")
expr(0x3cfd, "objectid_leaf2")
label(0x3d07, "return1")
expr(0x3d1e, "inkey_key_g")
expr(0x3d25, "inkey_key_p")
label(0x3d2b, "developer_mode_inactive2")
expr(0x3d2c, "object_spriteid + objectid_bottle_pour")
expr(0x3d2f, sprite_dict)
expr(0x3d33, "objectid_bottle_pour")
label(0x3d48, "g_pressed")
label(0x3d52, "p_pressed")
expr(0x3dde, sprite_dict)
expr(0x3de0, "object_spriteid_old + objectid_drip")
expr(0x3de3, "object_spriteid + objectid_drip")
expr(0x3de6, "object_y_low + objectid_drip")
expr(0x3deb, "object_y_low + objectid_drip")
expr(0x3df5, "collision_map_rope")
expr(0x3dfb, "collision_map_solid_rock")
expr(0x3e00, sprite_dict)
expr(0x3e02, "object_spriteid + objectid_drip")
label(0x3e07, "return2_local")
expr(0x3e12, sprite_dict)
expr(0x3e14, "object_spriteid_old + objectid_leaf1")
expr(0x3e17, "object_spriteid_old + objectid_leaf2")
expr(0x3e1a, "object_spriteid + objectid_leaf1")
expr(0x3e1d, "object_spriteid + objectid_leaf2")
expr(0x3e29, "object_y_low + objectid_leaf1")
expr(0x3e32, "object_y_low + objectid_leaf2")
expr(0x3e3c, sprite_dict)
expr(0x3e3e, "object_spriteid_old + objectid_leaf1")
expr(0x3e41, "object_spriteid_old + objectid_leaf2")
expr(0x3e44, sprite_dict)
expr(0x3e46, "object_spriteid + objectid_leaf1")
expr(0x3e49, "object_spriteid + objectid_leaf2")
expr(0x3e5e, "object_spriteid + objectid_leaf2")
expr(0x3e73, "object_spriteid + objectid_leaf1")
comment(0x3e7c, "check for first update in room (branch if so)")
expr(0x3e8f, "object_spriteid_old + objectid_leaf1")
expr(0x3e92, "object_spriteid_old + objectid_leaf2")
expr(0x3e98, "object_spriteid + objectid_leaf1")
expr(0x3e9b, "object_spriteid + objectid_leaf2")
expr(0x3eb2, "object_spriteid + objectid_leaf2")
expr(0x3ec9, "object_spriteid + objectid_leaf1")
label(0x3ecb, "return2")
expr(0x3f27, sprite_dict)
expr(0x3f34, sprite_dict)
expr(0x3f41, sprite_dict)
label(0x3f56, "room_3_update_handler")
expr(0x3f60, "objectid_room_3_fire")
ldx_ldy_jsr_play_sound_yx(0x3f8c, "sound1")
ldx_ldy_jsr_play_sound_yx(0x3f93, "sound2")
expr(0x3fe1, sprite_dict)
byte(0x4006)
label(0x4006, "dog_head_animations")
byte(0x4007, 3)
label(0x4007, "dog_head_animation1")
byte(0x400a)
expr(0x400b, sprite_dict)
label(0x400b, "dog_head_animation2")
byte(0x400c, 2)
expr(0x400e, sprite_dict)
byte(0x400f, 2)
expr(0x4011, sprite_dict)
byte(0x4012, 2)
expr(0x4014, sprite_dict)
byte(0x4015, 2)
expr(0x4017, sprite_dict)
byte(0x4018, 2)
expr(0x401a, sprite_dict)
byte(0x401b, 2)
expr(0x401d, sprite_dict)
byte(0x401e, 2)
byte(0x4020)
expr(0x4021, sprite_dict)
label(0x4021, "dog_head_animation3")
byte(0x4022, 2)
expr(0x4024, sprite_dict)
byte(0x4025, 2)
expr(0x4027, sprite_dict)
byte(0x4028, 2)
expr(0x402a, sprite_dict)
byte(0x402b, 2)
expr(0x402d, sprite_dict)
byte(0x402e, 2)
expr(0x4030, sprite_dict)
byte(0x4031, 2)
expr(0x4033, sprite_dict)
byte(0x4034, 2)
expr(0x4036, sprite_dict)
byte(0x4037, 2)
expr(0x4039, sprite_dict)
byte(0x403a, 2)
expr(0x403c, sprite_dict)
byte(0x403d, 2)
byte(0x403f)
expr(0x4040, sprite_dict)
label(0x4040, "dog_head_animation4")
byte(0x4041, 2)
byte(0x4043)
comment(0x4044, "check for first update in room (branch if not)")
label(0x4044, "update_dog")
comment(0x4049, "check for level change (branch if not)")
ldx_ldy_jsr_define_envelope(0x4071, "envelope1")
expr(0x408a, "object_y_low + objectid_leaf2")
expr(0x409e, "object_x_low + objectid_dog_bowl")
expr(0x40a3, "object_y_low + objectid_dog_bowl")
expr(0x40a6, sprite_dict)
expr(0x40a8, "object_spriteid + objectid_dog_bowl")
expr(0x40d1, "object_spriteid + objectid_bottle_pour")
expr(0x40d4, sprite_dict)
expr(0x414b, "object_spriteid + objectid_dog_head")
expr(0x4155, "object_x_low + objectid_dog_head")
expr(0x415f, "object_y_low + objectid_dog_head")
expr(0x4162, sprite_dict)
expr(0x4164, "object_spriteid + objectid_dog_body")
expr(0x4169, "object_x_low + objectid_dog_body")
expr(0x417b, "collision_map_solid_rock")
expr(0x418b, "collision_map_none")
expr(0x4194, sprite_dict)
expr(0x4196, "object_spriteid + objectid_dog_body")
expr(0x419b, "object_x_low + objectid_dog_body")
label(0x419d, "return3")
label(0x419f, "room_0_update_handler")
comment(0x41ad, "check for first update in room (branch if not)")
expr(0x41b3, sprite_dict)
expr(0x41b8, sprite_dict)
expr(0x41bd, sprite_dict)
expr(0x41c2, sprite_dict)
expr(0x41c7, sprite_dict)
expr(0x41cc, sprite_dict)
comment(0x41d0, "check for level change (branch if not)")
expr(0x4209, sprite_dict)
expr(0x420b, "object_spriteid + objectid_empty_bottle")
expr(0x420e, sprite_dict)
expr(0x422b, "objectid_old_player")
expr(0x4234, sprite_dict)
expr(0x4236, "object_spriteid + objectid_empty_bottle")
expr(0x423e, sprite_dict)
expr(0x424b, sprite_dict)
expr(0x4252, sprite_dict)
expr(0x42af, sprite_dict)
expr(0x42b1, "object_spriteid + objectid_bottle_pour")
expr(0x42bc, "object_x_low + objectid_bottle_pour")
expr(0x42c2, "object_x_high + objectid_bottle_pour")
expr(0x42c8, "object_direction + objectid_bottle_pour")
expr(0x42ce, "object_y_low + objectid_bottle_pour")
expr(0x42d1, sprite_dict)
expr(0x42d3, "object_spriteid + objectid_bottle_pour")
expr(0x42da, sprite_dict)
expr(0x42dc, "object_spriteid + objectid_bottle_pour")
expr(0x42e3, sprite_dict)
expr(0x42e5, "object_spriteid + objectid_bottle_pour")
comment(0x42e7, "check for first update in room (branch if so)")
expr(0x42ed, "object_spriteid_old + objectid_bottle_pour")
expr(0x4305, sprite_dict)
expr(0x4307, "object_spriteid + objectid_bottle_pour")
expr(0x4325, "object_spriteid + objectid_bottle_pour")
label(0x4327, "return4")
expr(0x4380, sprite_dict)
label(0x43a4, "room_1_update_handler")
expr(0x43ae, "objectid_room_1_fire1")
expr(0x43b5, "objectid_room_1_fire2")
expr(0x43e7, sprite_dict)
label(0x43e7, "droplet_animation")
expr(0x43e8, sprite_dict)
expr(0x43e9, sprite_dict)
expr(0x43ea, sprite_dict)
expr(0x43eb, sprite_dict)
label(0x43eb, "droplet_full")
comment(0x43ef, "check for first update in room (branch if not)")
comment(0x43f4, "check for level change (branch if not)")
expr(0x4407, sprite_dict)
expr(0x4411, "object_x_low + objectid_drip")
expr(0x4414, "object_x_high + objectid_drip")
expr(0x4437, sprite_dict)
expr(0x4439, "object_spriteid + objectid_drip")
expr(0x4459, "object_spriteid + objectid_drip")
expr(0x445f, "object_y_low + objectid_drip")
expr(0x4472, "object_y_low + objectid_drip")
expr(0x4475, sprite_dict)
expr(0x4477, "object_spriteid + objectid_drip")
comment(0x4481, "check for first update in room (branch if so)")
expr(0x4490, "object_spriteid + objectid_drip")
expr(0x4493, "object_y_low + objectid_drip")
expr(0x4499, "object_y_low + objectid_drip")
comment(0x449b, "check for first update in room (branch if so)")
expr(0x44ad, "objectid_old_player_accessory")
expr(0x44b6, sprite_dict)
expr(0x44bb, sprite_dict)
expr(0x44e2, sprite_dict)
expr(0x44e4, "object_spriteid + objectid_drip")

result = go(False)
result = remove_sprite_data(result)
print(result)

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
