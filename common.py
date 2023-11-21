from commands import *


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
    0x01: "sprite_op_flags_copy_mask",
    0x02: "sprite_op_flags_erase",
    0x04: "sprite_op_flags_ignore_mask",
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

constant(1, "exit_room_left")
constant(2, "exit_room_bottom")
constant(4, "exit_room_right")
constant(8, "exit_room_top")

constant(1, "object_collided_left_wall")
constant(2, "object_collided_floor")
constant(4, "object_collided_right_wall")
constant(8, "object_collided_ceiling")

# TODO: Use this more generally or maybe just get rid of it?
def label_word(addr, s):
    label(addr, s)
    expr_label(addr + 1, make_add(s, "1"))

def ab(addr, message=""):
    if message != "":
        message = ". "+message
    comment(addr, "ALWAYS branch" + message, inline=True)

def common_to_all():
    constant(0x4c, "opcode_jmp")

    # TODO: Some of these constants are not common to *all* files which currently include common (e.g. first/last_level_letter are probably not needed by data*) - may not be worth fussing with, or may be better to have different common files for different things to minimise label noise.
    #
    label(0x0005, "characters_entered")
    label(0x001d, "sprite_reflect_flag")
    label(0x0031, "current_level")

    label(0x003a, "temp_sprite_x_offset")
    label(0x003b, "temp_sprite_y_offset")

    label(0x0042, "copy_mode")

    label(0x0050, "previous_room_index")
    label(0x0051, "level_before_latest_level_and_room_initialisation")
    label(0x0052, "player_held_object_spriteid")

    label(0x003c, "width_in_cells")
    label(0x003d, "height_in_cells")
    label(0x003e, "value_to_write_to_collision_map")

    label(0x1103, "developer_flags")
    label(0x005b, "developer_mode_sideways_ram_is_set_up_flag")
    label(0x040a, "show_dialog_box") # TODO: guesswork
    label(0x0453, "remove_dialog")
    label(0x09ef, "level_progress_table")
    label(0x1766, "set_toolbar_and_gameplay_area_colours")
    label(0x1966, "jmp_yx")
    label(0x37f3, "print_encrypted_string_at_yx_centred")
    label(0x388d, "wait_one_second_then_check_keys")
    label(0x3a8f, "check_menu_keys")

    # See mono_handler and colour_handler in auxcode.asm
    label(0x1765, "use_colour_flag")
    label(0x175d, "pending_toolbar_colour")
    label(0x175e, "toolbar_colour")
    label(0x175f, "pending_gameplay_area_colour")
    label(0x1760, "gameplay_area_colour")

    label(0xa90, "string_input_buffer")

    label(0x53c0, "auxcode")
    label(0x53c0, "check_password")

    # TODO: There are only 16 levels which is A-P, but we have Q as well. I hadn't realised that before. I suspect Q might be used for the "game completed" message, but that is just a guess. (Note that there is a dataQ file on disc.) It's possible last_level_letter is misnamed or it would be better to express 'Q' as last_level_letter(='P')+1. Depends how it all works in the code.
    constant(0x41, "first_level_letter") # TODO: would be nice to use 'A' as constant
    constant(0x51, "last_level_letter") # TODO: would be nice to use 'Q' as constant

    label(0x3ad5, "level_data")
    label_word(0x3ad7, "level_specific_initialisation_ptr")
    label_word(0x3ad9, "level_specific_update_ptr")
    label_word(0x3adb, "level_specific_password_ptr")

    label(0x12bb, "start_room")
    label(0x12da, "game_update")
    label(0x1988, "update_brazier_and_fire")
    label(0x1a10, "update_level_completion")
    label(0x1abb, "copy_rectangle_of_memory_to_screen")
    label(0x1b90, "draw_floor_walls_and_ceiling_around_solid_rock")
    label(0x1db9, "draw_rope")
    label(0x1e44, "write_value_to_a_rectangle_of_cells_in_collision_map")
    label(0x1ebb, "write_a_single_value_to_cell_in_collision_map")
    label(0x1f4c, "draw_sprite_a_at_cell_xy")
    label(0x1f57, "draw_sprite_a_at_cell_xy_and_write_to_collision_map")
    label(0x1f5d, "set_object_position_from_cell_xy")
    label(0x1f6d, "set_object_position_from_current_sprite_position")
    label(0x23a9, "play_landing_sound")
    label(0x24d0, "temp_left_offset")
    label(0x24d1, "temp_right_offset")
    label(0x2550, "temp_top_offset")
    label(0x2551, "temp_bottom_offset")
    label(0x2894, "get_solid_rock_collision_for_object_a")
    label(0x28e2, "test_for_collision_between_objects_x_and_y")
    label(0x2b87, "insert_character_menu_item_into_toolbar")
    label(0x2be0, "remove_item_from_toolbar_menu")
    label(0x2ee8, "toolbar_collectable_spriteids")
    label(0x2eed, "collectable_spriteids")

    label(0x2bbd, "find_or_create_menu_slot_for_A")


    label(0x1140, "initialise_level_and_room")

    label(0x396f, "sound_priority_per_channel_table")
    label(0x3adf, "level_room_data_table")
    expr_label(0x3ae0, make_add("level_room_data_table", "1"))

    label(0x132b, "update_room_first_update_flag")

    # The 'level_update_handler' function calls individual functions to update the logic in each room
    # While updating the logic for a room, 'currently_updating_logic_for_room_index' is normally set
    # It only needs to be set if it calls 'update_brazier_and_fire' or 'update_level_completion'
    #
    # A room index is within the level, 0-(n-1) if the level has n rooms
    label(0x1aba, "currently_updating_logic_for_room_index")
    label(0x30, "desired_room_index")

    # TODO: Speculative - but note that dataA stores an address in its data-ish section here but never reads from it (except maybe via subroutines in g)
    label(0x40, "source_sprite_memory_low")
    expr_label(0x41, "source_sprite_memory_high")

    label(0xaa9, "tile_all_set_pixels")

    constant(40, "game_area_width_cells")
    constant(24, "game_area_height_cells")

    label(0x38f6, "play_sound_yx")

    label(0x38ac, "object_sprite_mask_type")
    label(0x38d8, "object_room_collision_flags")

    label(0x950, "object_x_low")
    label(0x951, "object_x_low+1")
    label(0x95b, "object_x_low_old")
    label(0x966, "object_x_high")
    label(0x967, "object_x_high+1")
    label(0x971, "object_x_high_old")
    label(0x97c, "object_y_low")
    label(0x97d, "object_y_low+1")
    label(0x987, "object_y_low_old")

    label(0x992, "object_y_high")
    label(0x993, "object_y_high+1")
    label(0x99d, "object_y_high_old")
    label(0x9a8, "object_spriteid")
    label(0x9a9, "object_spriteid+1")
    label(0x9b3, "object_spriteid_old")
    label(0x9b4, "object_spriteid_old+1")

    label(0x9be, "object_direction")
    label(0x9bf, "object_direction+1")
    label(0x9c9, "object_direction_old")

    label(0x38c2, "object_z_order")

    label(0x2433, "player_wall_collision_flag")

    label(0x2eb6, "player_using_object_spriteid")
    label(0x2eb7, "previous_player_using_object_spriteid")

    label(0x2ef2, "five_byte_table_paired_with_collectable_sprite_ids") # TODO: size is a guess - it's at least two bytes though
    expr_label(0x2ef3, make_add("five_byte_table_paired_with_collectable_sprite_ids", "1"))
