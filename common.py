from commands import *
from memorymanager import get_u8_runtime, RuntimeAddr

class SubstituteLabels():
    def __init__(self, substitute_labels):
        self.substitute_labels = substitute_labels

        # Create the substitute labels but with inverted dictionaries
        self.inverse_labels = {}
        for pair in self.substitute_labels:
            dict = self.substitute_labels[pair]
            inv_dict = {v: k for k, v in dict.items()}
            self.inverse_labels[pair] = inv_dict

            # HACK: also make labels lXXXX, which seems redundant, but changes the way the label_maker suggestions works
            for key in dict:
                m = re.match("l([0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F])", key)
                if m:
                    addr = int(m.group(1), 16)
                    label(addr, key)

    def substitute_label_maker(self, addr, context, suggestion):
        for pair in self.substitute_labels:
            if context in range(pair[0], pair[1]):
                dict = self.substitute_labels[pair]
                if suggestion[0] in dict:
                    return dict[suggestion[0]]

        # stop using the substitution if not in range
        for pair in self.inverse_labels:
            if context not in range(pair[0], pair[1]):
                dict = self.inverse_labels[pair]
                if suggestion[0] in dict:
                    return dict[suggestion[0]]

        return suggestion


def tile_bitmap(addr, s=None):
    if s is None:
        s = "character_bitmap_%04x" % addr
    label(addr, s)
    for i in range(8):
        picture_binary(addr + i)
        byte(addr + i)

def tile_bitmap2x2(addr, s=None):
    if s is None:
        s = "character_bitmap_%04x" % addr
    tile_bitmap(addr, s + "_top_left")
    tile_bitmap(addr+8, s + "_top_right")
    tile_bitmap(addr+16, s + "_bottom_left")
    tile_bitmap(addr+24, s + "_bottom_right")

def get_password(start_addr, terminator=0x0d):
    password = ""
    addr = start_addr
    while True:
        b = get_u8_runtime(RuntimeAddr(addr))
        b = b ^ 0xcb
        if (b < 32) or (b >= 127):
            password += "[{:02x}]".format(b)
        else:
            password += chr(b)
        addr += 1

        if b == terminator:
            break
    return(password)


def sound(addr, lab):
    label(addr, lab)
    word(addr, 1)
    word(addr+2, 1)
    word(addr+4, 1)
    word(addr+6, 1)
    decimal(addr+2)
    decimal(addr+4)
    decimal(addr+6)
    comment(addr, "channel", inline=True)
    comment(addr+2, "amplitude", inline=True)
    comment(addr+4, "pitch", inline=True)
    comment(addr+6, "duration", inline=True)


def envelope(addr, lab):
    label(addr, lab)
    for i in range(addr, addr+14):
        byte(i, 1)
        decimal(i)
    comment(addr, "envelope number", inline=True)
    comment(addr+1, "step length (100ths of a second)", inline=True)
    comment(addr+2, "pitch change per step in section 1", inline=True)
    comment(addr+3, "pitch change per step in section 2", inline=True)
    comment(addr+4, "pitch change per step in section 3", inline=True)
    comment(addr+5, "number of steps in section 1", inline=True)
    comment(addr+6, "number of steps in section 2", inline=True)
    comment(addr+7, "number of steps in section 3", inline=True)
    comment(addr+8, "change of amplitude per step during attack phase", inline=True)
    comment(addr+9, "change of amplitude per step during decay phase", inline=True)
    comment(addr+10, "change of amplitude per step during sustain phase", inline=True)
    comment(addr+11, "change of amplitude per step during release phase", inline=True)
    comment(addr+12, "target of level at end of attack phase", inline=True)
    comment(addr+13, "target of level at end of decay phase", inline=True)


sprite_op_flags_dict = {
    0x00: "sprite_op_flags_normal",
    0x01: "sprite_op_flags_copy_screen",
    0x02: "sprite_op_flags_erase_to_bg_colour",
    0x04: "sprite_op_flags_erase_to_fg_colour",
}

constant(0x0, "copy_mode_2x2")
constant(0x1, "copy_mode_simple")
constant(0x2, "copy_mode_random2")
constant(0x4, "copy_mode_random4")
constant(0x8, "copy_mode_random8")
constant(0x10, "copy_mode_random16")
constant(0x20, "copy_mode_random32")
constant(0x40, "copy_mode_random64")

constant(0, "objectid_player")
constant(1, "objectid_player_accessory")
constant(0xb, "objectid_old_player")    # This is the state of the player as currently drawn on the screen, before being updated in the current game tick.
constant(0xc, "objectid_old_player_accessory")

constant(1, "exit_room_left")
constant(2, "exit_room_bottom")
constant(4, "exit_room_right")
constant(8, "exit_room_top")

collision_map_dict = {
    0: "collision_map_none",
    1: "collision_map_unknown",
    2: "collision_map_rope",
    3: "collision_map_solid_rock",
    255: "collision_map_out_of_bounds",
}

constant(1, "object_collided_left_wall")
constant(2, "object_collided_floor")
constant(4, "object_collided_right_wall")
constant(8, "object_collided_ceiling")

def label_word(addr, s):
    label(addr, s)
    expr_label(addr + 1, make_add(s, "1"))

def ab(addr, message=""):
    if message != "":
        message = ". "+message
    comment(addr, "ALWAYS branch" + message, inline=True)

def ri(addr, message=""):
    if message == "":
        message = "redundant instruction"
    comment(addr, message, inline=True)

def stars(addr, message=""):
    c = "*************************************************************************************"
    if message != "":
        c = c + "\n\n" + message + "\n\n*************************************************************************************"
    comment(addr, c)

common_sprite_dict = {
    0x00: "spriteid_one_pixel_masked_out",
    0x01: "spriteid_icon_background",
    0x02: "spriteid_icodata_sound",
    0x03: "spriteid_icodata_disc",
    0x04: "spriteid_icodata_wizard",
    0x05: "spriteid_icodata_cat",
    0x06: "spriteid_icodata_monkey",
    0x07: "spriteid_icodata_info",
    0x08: "spriteid_icodata_password",
    0x09: "spriteid_icodata_box",
    0x0a: "spriteid_rope_end",
    0x0b: "spriteid_rope_hook",
    0x0c: "spriteid_cat_walk1",
    0x0d: "spriteid_cat_walk2",
    0x0e: "spriteid_cat_walk3",
    0x0f: "spriteid_cat_walk4",
    0x10: "spriteid_cat_transform1",
    0x11: "spriteid_cat_transform2",
    0x12: "spriteid_cat_tail1",
    0x13: "spriteid_cat_tail2",
    0x14: "spriteid_cat_tail3",
    0x15: "spriteid_cat_tail4",
    0x16: "spriteid_cat_tail5",
    0x17: "spriteid_cat_tail6",
    0x18: "spriteid_cat_tail7",
    0x19: "spriteid_cat_tail8",
    0x1a: "spriteid_cat_jump",
    0x1b: "spriteid_cat1",
    0x1c: "spriteid_cat2",
    0x1d: "spriteid_pointer_hand",
    0x1e: "spriteid_fingertip_tile_restoration",
    0x1f: "spriteid_one_pixel_set",
    0x20: "spriteid_circle",
    0x21: "spriteid_menu_item_completion_spell",
    0x22: "spriteid_sparkles1",
    0x23: "spriteid_sparkles2",
    0x24: "spriteid_sparkles3",
    0x25: "spriteid_sparkles4",
    0x26: "spriteid_sparkles5",
    0x27: "spriteid_diamond1",
    0x28: "spriteid_diamond2",
    0x29: "spriteid_diamond3",
    0x2a: "spriteid_diamond4",
    0x2b: "spriteid_diamond5",
    0x2c: "spriteid_corner_top_left",
    0x2d: "spriteid_corner_bottom_left",
    0x2e: "spriteid_corner_bottom_right",
    0x2f: "spriteid_corner_top_right",
    0x30: "spriteid_wizard1",
    0x31: "spriteid_wizard2",
    0x32: "spriteid_wizard3",
    0x33: "spriteid_wizard4",
    0x34: "spriteid_wizard5",
    0x35: "spriteid_wizard_using_object",
    0x36: "spriteid_wizard7",
    0x37: "spriteid_wizard_hand",        # Drawn in front of wizard accessory object
    0x38: "spriteid_wizard_transform1",
    0x39: "spriteid_wizard_transform2",
    0x3a: "spriteid_brazier",
    0x3b: "spriteid_ball",
    0x3c: "spriteid_fire1",
    0x3d: "spriteid_fire2",
    0x3e: "spriteid_fire3",
    0x3f: "spriteid_fire4",
    0x40: "spriteid_fire5",
    0x41: "spriteid_fire6",
    0x42: "spriteid_fire7",
    0x43: "spriteid_fire8",
    0x44: "spriteid_monkey_transform1",
    0x45: "spriteid_monkey_transform2",
    0x46: "spriteid_monkey_tail1",
    0x47: "spriteid_monkey_tail2",
    0x48: "spriteid_monkey_tail3",
    0x49: "spriteid_monkey_tail4",
    0x4a: "spriteid_monkey_tail5",
    0x4b: "spriteid_monkey_tail6",
    0x4c: "spriteid_monkey_tail7",
    0x4d: "spriteid_monkey_tail8",
    0x4e: "spriteid_monkey1",
    0x4f: "spriteid_monkey2",
    0x50: "spriteid_monkey3",
    0x51: "spriteid_monkey4",
    0x52: "spriteid_monkey5",
    0x53: "spriteid_monkey_climb1",
    0x54: "spriteid_monkey_climb2",
    0x55: "spriteid_rope1",
    0x56: "spriteid_rope2",
    0x57: "spriteid_rope3",
    0x58: "spriteid_rope4",
    197: "spriteid_erase_sparkles",
    198: "spriteid_erase_player_accessory",
    199: "spriteid_erase_player",
}

def common_to_all(level_letter):

    constant(40, "game_area_width_cells")
    constant(24, "game_area_height_cells")

    constant(0x4c, "opcode_jmp")

    # There are 16 levels which is A-P, but we have Q as well.
    # Q is used for the "epilogue", a message on game completion.
    constant(0x41, "first_level_letter") # TODO: would be nice to use 'A' as constant
    constant(0x51, "last_level_letter")  # TODO: would be nice to use 'Q' as constant

    optional_label(0x0015, "sprite_op_flags")
    label(0x0016, "sprite_id")
    label(0x0018, "sprite_x_base_low")
    label(0x0019, "sprite_x_base_high")
    label(0x001a, "sprite_y_base_low")
    label(0x001b, "sprite_y_base_high")
    label(0x001d, "sprite_reflect_flag")

    # The 'level_update_handler' function calls individual functions to update the logic in each room
    # While updating the logic for a room, 'currently_updating_logic_for_room_index' is normally set
    # It only needs to be set if it calls 'update_brazier_and_fire' or 'update_level_completion'
    #
    # A room index is within the level, 0-(n-1) if the level has n rooms
    label(0x0030, "desired_room_index")
    label(0x0031, "current_level")
    label(0x003a, "temp_sprite_x_offset")
    label(0x003b, "temp_sprite_y_offset")
    label(0x003c, "width_in_cells")
    label(0x003d, "height_in_cells")
    label(0x003e, "value_to_write_to_collision_map")
    label(0x0040, "source_sprite_memory_low")
    expr_label(0x0041, "source_sprite_memory_high")
    label(0x0042, "copy_mode")
    label(0x0048, "current_player_character")
    label(0x0050, "previous_room_index")
    label(0x0051, "level_before_latest_level_and_room_initialisation")
    label(0x0052, "player_held_object_spriteid")
    label(0x005b, "developer_mode_sideways_ram_is_set_up_flag")

    label(0x0950, "object_x_low")
    label(0x0951, "object_x_low + objectid_player_accessory")
    label(0x095b, "object_x_low_old")
    label(0x0966, "object_x_high")
    label(0x0967, "object_x_high + objectid_player_accessory")
    label(0x0971, "object_x_high_old")
    label(0x097c, "object_y_low")
    label(0x097d, "object_y_low + objectid_player_accessory")
    label(0x0987, "object_y_low_old")

    label(0x0992, "object_y_high")
    label(0x0993, "object_y_high + objectid_player_accessory")
    label(0x09a8, "object_spriteid")
    label(0x09a9, "object_spriteid + objectid_player_accessory")
    label(0x09b3, "object_spriteid_old")
    label(0x09b4, "object_spriteid_old + objectid_player_accessory")
    label(0x09be, "object_direction")
    label(0x09bf, "object_direction + objectid_player_accessory")
    label(0x09df, "current_player_animation")

    optional_label(0x0a6f, "level_workspace")
    label(0x0aa9, "tile_all_set_pixels")

    label(0x1103, "developer_flags")
    label(0x1140, "initialise_level_and_room")
    label(0x12bb, "start_room")
    label(0x12da, "game_update")
    label(0x132b, "update_room_first_update_flag")
    label(0x138d, "sprite_op")
    label(0x175e, "toolbar_colour")
    label(0x1760, "gameplay_area_colour")
    label(0x18a6, "get_random_number_up_to_a")
    label(0x1988, "update_brazier_and_fire")
    label(0x1a10, "update_level_completion")
    label(0x1aba, "currently_updating_logic_for_room_index")
    label(0x1abb, "copy_rectangle_of_memory_to_screen")
    label(0x1b90, "draw_floor_walls_and_ceiling_around_solid_rock")
    label(0x1db9, "draw_rope")
    label(0x1e44, "write_value_to_a_rectangle_of_cells_in_collision_map")
    label(0x1ebb, "write_a_single_value_to_cell_in_collision_map")
    label(0x1efa, "read_collision_map_value_for_xy")
    label(0x1f4c, "draw_sprite_a_at_cell_xy")
    label(0x1f57, "draw_sprite_a_at_cell_xy_and_write_to_collision_map")
    label(0x1f5d, "set_object_position_from_cell_xy")
    label(0x1f6d, "set_object_position_from_current_sprite_position")
    label(0x20f7, "copy_object_state_to_old")
    label(0x22dd, "jmp_for_update_extra_player_character")
    label(0x23a9, "play_landing_sound")
    label(0x2433, "player_wall_collision_reaction_speed")
    label(0x2434, "find_left_and_right_of_object")
    label(0x24d0, "temp_left_offset")
    label(0x24d1, "temp_right_offset")
    label(0x24d2, "find_top_and_bottom_of_object")
    label(0x2550, "temp_top_offset")
    label(0x2551, "temp_bottom_offset")
    label(0x25f5, "update_object_a_solid_rock_collision")
    label(0x2770, "update_object_hitting_floor")
    label(0x288f, "object_has_hit_floor_flag")
    label(0x2890, "object_just_fallen_off_edge_direction")
    label(0x2894, "get_solid_rock_collision_for_object_a")
    label(0x28e1, "temp_default_collision_map_option")
    label(0x28e2, "test_for_collision_between_objects_x_and_y")
    label(0x295c, "desired_menu_slots")
    label(0x296e, "menu_index_for_extra_items")
    label(0x2b87, "insert_character_menu_item_into_toolbar")
    label(0x2bbd, "find_or_create_menu_slot_for_A")
    label(0x2be0, "remove_item_from_toolbar_menu")
    label(0x2eb6, "player_using_object_spriteid")
    label(0x2eb7, "previous_player_using_object_spriteid")
    label(0x2ee8, "toolbar_collectable_spriteids")
    label(0x2ee9, "toolbar_collectable_spriteids+1")
    label(0x2eea, "toolbar_collectable_spriteids+2")
    label(0x2eed, "collectable_spriteids")
    label(0x2eee, "collectable_spriteids+1")
    label(0x2eef, "collectable_spriteids+2")
    label(0x2ef2, "collectable_being_used_spriteids")
    expr_label(0x2ef3, make_add("collectable_being_used_spriteids", "1"))
    label(0x30ff, "monkey_base_animation")
    label(0x3144, "monkey_climb_idle_animation")
    label(0x3148, "monkey_climb_down_animation")
    label(0x3150, "monkey_climb_animation")
    label(0x31d7, "inhibit_monkey_climb_flag")
    label(0x38ac, "object_erase_type")
    label(0x38c2, "object_z_order")
    label(0x38d8, "object_room_collision_flags")
    label(0x38f6, "play_sound_yx")
    label(0x396f, "sound_priority_per_channel_table")
    label(0x3ad5, "level_data")
    label_word(0x3ad7, "level_specific_initialisation_ptr")
    label_word(0x3ad9, "level_specific_update_ptr")
    label_word(0x3adb, "level_specific_password_ptr")
    label(0x3acc, "negative_inkey")

    # Shared between all levels except 'dataQ' (and they mess up the tidy output of Q):
    if level_letter != 'Q':
        label(0x3add, "initial_room_index")
        label(0x3ade, "initial_room_index_cheat")
        label(0x3adf, "level_room_data_table")
        expr_label(0x3ae0, make_add("level_room_data_table", "1"))

    # Shared between 'g' and 'auxcode' only:
    if level_letter == '' or level_letter == 'auxcode':
        label(0x0005, "characters_entered")
        label(0x040a, "show_dialog_box")
        label(0x0453, "remove_dialog")
        label(0x099d, "object_y_high_old")
        label(0x09c9, "object_direction_old")
        label(0x09ef, "level_progress_table")
        label(0x0a90, "string_input_buffer")
        label(0x175d, "pending_toolbar_colour")
        label(0x175f, "pending_gameplay_area_colour")
        label(0x1765, "use_colour_flag")    # See mono_handler and colour_handler in auxcode.asm
        label(0x1766, "set_toolbar_and_gameplay_area_colours")
        label(0x1966, "jmp_yx")
        label(0x37f3, "print_encrypted_string_at_yx_centred")
        label(0x388d, "wait_one_second_then_check_keys")
        label(0x3a8f, "check_menu_keys")
        label(0x53c0, "auxcode")
        label(0x53c0, "check_password")

    # Shared between 'g' and 'dataQ' only:
    if level_letter == '' or level_letter == 'Q':
        label(0x110c, "start_game")
