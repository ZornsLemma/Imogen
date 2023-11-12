from commands import *
import acorn
import re
from common import *
acorn.bbc()

sprite_dict = {
    0x3b: "spriteid_ball",
    0xc8: "spriteid_mouse",
    0xd3: "spriteid_saxophone",
    0xde: "spriteid_table",
}

substitute_constants("jsr draw_sprite_a_at_cell_xy", 'a', sprite_dict, True)
substitute_constants("jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map", 'a', sprite_dict, True)
substitute_constants("jsr find_or_create_menu_slot_for_A", 'a', sprite_dict, True)
#substitute_constants("sta sprite_op_flags", 'a', sprite_op_flags_dict, True)

load(0x3ad5, "orig/dataA.dat", "6502", "df027a3ac06abfed1878eaec3d2bbe5f")
word(0x3ad7)
expr(0x3ad7, "level_init_after_load_handler")
word(0x3ad9)
expr(0x3ad9, "second_level_handler") # TODO: rename
word(0x3adb)
expr(0x3adb, "level_name") # TODO: rename
entry(get_u16_binary(0x3ad7), "level_init_after_load_handler")
entry(get_u16_binary(0x3ad9), "second_level_handler")
label(get_u16_binary(0x3adb), "level_name")

entry(0x3d21, "some_data1")
label(0x4052, "some_data2")

expr(0x3b0f, make_lo("ground_fill_2x2_top_left"))
expr(0x3b13, make_hi("ground_fill_2x2_top_left"))
label(0x4486, "ground_fill_2x2_top_left")
expr(0x3fe7, make_lo("tile_all_set_pixels"))
expr(0x3feb, make_hi("tile_all_set_pixels"))
character_bitmap(0x4486, "ground_fill_2x2_top_left")
comment(0x448e, "Note that the next three characters are all identical. I think this is done because the 'tiling' code in restore_rectangle_of_screen_memory for l0042=1 uses a 2x2 tiling arrangement.")
character_bitmap(0x448e, "ground_fill_2x2_top_right")
character_bitmap(0x4496, "ground_fill_2x2_bottom_left")
character_bitmap(0x449e, "ground_fill_2x2_bottom_right")


label(0x44A6, "sprite_data")
word(0x3ad5)
expr(0x3ad5, "sprite_data - level_data")

comment(0x3ae7, "'SAXOPHOBIA\\r' EOR-encrypted with $cb")

entry(0x3b04, "developer_mode_not_active")

comment(0x3adf, "This is a table of four words, used by code just below 'skip_adding_completion_spell_to_toolbar' where the l030-th element *plus 2* is called. TODO: Why +2? The code at c129b suggests the two bytes *at* the address in this table is used as an address of some kind.")
comment(0x3adf, "TODO: Speculation - could this be code to draw each of the screens making up the level? AFAICT saxophobia does have four screens. I assume the *number* of entries in this table is stored somewhere, but I can't see it. It is also possible that because entering rooms is handled by level specific code, the player always starts in room 0 and there is no need to have a byte of data representing the maximum room number.")
def level_header_data_table_entry(addr, s):
    word(addr)
    expr(addr, s + "_data_ptr")
    target1 = get_u16_binary(addr)
    target2 = target1 + 2
    label(target1, s + "_data_ptr")
    byte(target1)
    byte(target1 + 1)
    decimal(target1)
    decimal(target1 + 1)
    comment(target1, "initial player X cell", inline=True)
    comment(target1 + 1, "initial player Y cell", inline=True)
    target3 = get_u16_binary(target1)
    #label(target3, s + "_data")
    #expr(target1, s + "_data")
    entry(target2, s + "_code")
level_header_data_table_entry(0x3adf, "room_1")
level_header_data_table_entry(0x3ae1, "room_2")
level_header_data_table_entry(0x3ae3, "room_3")
level_header_data_table_entry(0x3ae5, "room_4")

comment(0x3f7b, "TODO: I suspect this is handling 'collection of the saxophone'")
comment(0x3b04, "reset the saxaphone collected flag. The user can choose during the course of a game to enter the password to continue playing this level having previously got the saxaphone.")
label(0xa00, "saxophone_collected_flag")

comment(0x3b35, "TODO: Setting a breakpoint in b-em shows l0042 is 0 here")
comment(0x3b35, "TODO: Setting a breakpoint in b-em shows some_data3_ptr ($40) is $4486 here")
comment(0x3b35, "TODO: Setting a breakpoint in b-em shows address1_low ($70) is $00 here")
comment(0x3b35, "TODO: Setting a breakpoint in b-em shows address1_high ($71) is $80 here")

comment(0x3b29, "TODO: I suspect this next block up to and including the jsr is drawing the 'wall' pattern on the top two rows of the opening screen")
comment(0x3b84, "TODO: I suspect we've finished drawing the ground fill and are now switching to another pattern.")

label(0xa6f, "mouse_ball_position") # TODO: guesswork but fairly convinced - I think this runs from 0-$1d inclusive with 0 being (guess) far left, $f being far right
entry(0x3bf7, "level_unchanged")
entry(0x3c77, "bump_and_wrap_mouse_ball_position")
entry(0x3c81, "no_wrap_needed")

go()

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
