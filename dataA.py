from commands import *
import acorn
import re
from common import *
from memorymanager import get_u8_runtime, RuntimeAddr
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
expr(0x3ad9, "level_update_handler") # TODO: rename
word(0x3adb)
expr(0x3adb, "level_name") # TODO: rename
entry(get_u16_binary(0x3ad7), "level_init_after_load_handler")
entry(get_u16_binary(0x3ad9), "level_update_handler")
label(get_u16_binary(0x3adb), "level_name")

entry(0x3d21, "some_data1")
label(0x4052, "some_data2")
comment(0x4084, "redundant instruction", inline=True)
comment(0x4086, "redundant instruction", inline=True)
comment(0x4088, "redundant instruction", inline=True)

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
entry(0x3bec, "initialise_mouse_ball_position_if_level_changed")
entry(0x3bf7, "level_unchanged")
entry(0x3c77, "bump_and_wrap_mouse_ball_position")
entry(0x3c81, "no_wrap_needed")
entry(0x3ca8, "move_mouse_ball_if_room_0")
entry(0x3c74, "move_mouse_ball_if_room_0_local")
sound(0x447e, "mouse_ball_sound1")
sound(0x4476, "mouse_ball_sound2")
sound(0x446e, "mouse_ball_sound3")
entry(0x3c91, "play_mouse_ball_sounds")
expr(0x3c94, make_lo("mouse_ball_sound1"))
expr(0x3c96, make_hi("mouse_ball_sound1"))
expr(0x3c9b, make_lo("mouse_ball_sound2"))
expr(0x3c9d, make_hi("mouse_ball_sound2"))
expr(0x3ca2, make_lo("mouse_ball_sound3"))
expr(0x3ca4, make_hi("mouse_ball_sound3"))
entry(0x3d20, "return1")
comment(0x3c04, "Perform shared initialisation for both mice")
comment(0x3c0e, "Set up the left mouse")
comment(0x3c30, "Set up the right mouse")
comment(0x3c5b, "Set up the ball TODO: plausible guess")
comment(0x3cb7, "always branch", inline=True)
comment(0x3cdf, "always branch", inline=True)
entry(0x3cb9, "mouse_ball_position_ge_8")
entry(0x3cc3, "mouse_ball_position_lt_8")
entry(0x3cd9, "mouse_ball_position_ge_0xf") # TODO: this name kind of ignores the possibility of fall through to this label
entry(0x3ce1, "mouse_ball_position_ge_0x17")
comment(0x3cc6, "TODO: l09aa and l09ab seem to be write-only - this is presumably a false impression, are they elements of some table or something like that?")

# TODO: slight guesswork
constant(2, "objectid_left_mouse")
constant(3, "objectid_right_mouse")
constant(4, "objectid_mouse_ball")
expr(0x3c22, "objectid_left_mouse")
expr(0x3c48, "objectid_right_mouse")
expr(0x3c5c, "objectid_mouse_ball")

# TODO: Use this more?
def ldx_ldy_jsr_play_sound_yx(jsr_runtime_addr, s):
    assert get_u8_runtime(RuntimeAddr(jsr_runtime_addr - 4)) == 0xa2 # ldx #
    sound_addr_lo = get_u8_runtime(RuntimeAddr(jsr_runtime_addr - 3))
    assert get_u8_runtime(RuntimeAddr(jsr_runtime_addr - 2)) == 0xa0 # ldy #
    sound_addr_hi = get_u8_runtime(RuntimeAddr(jsr_runtime_addr - 1))
    sound_addr = (sound_addr_hi << 8) | sound_addr_lo
    sound(sound_addr, s)
    expr(jsr_runtime_addr - 3, make_lo(s))
    expr(jsr_runtime_addr - 1, make_hi(s))
ldx_ldy_jsr_play_sound_yx(0x3ef7, "some_sound1")
ldx_ldy_jsr_play_sound_yx(0x3efe, "some_sound2")
ldx_ldy_jsr_play_sound_yx(0x3f5f, "some_sound3")
ldx_ldy_jsr_play_sound_yx(0x43e0, "some_sound4")



# TODO: envelope1/2/4 share the same envelope number (6) - maybe we should adopt a convention of using labels like envelopeA6b -> level A, OS env number 6, a/b/c/d suffix indicates competing envelopes for that OS env number
entry(0x395e, "define_envelope") # TODO: duplicate of line in g.py, can't trivially put in common as it breaks imogen.py
envelope(0x4460, "envelope1")
expr(0x3bfe, make_lo("envelope1"))
expr(0x3c00, make_hi("envelope1"))
envelope(0x442c, "envelope2")
expr(0x3e18, make_lo("envelope2"))
expr(0x3e1a, make_hi("envelope2"))
expr(0x40c8, make_lo("envelope2"))
expr(0x40ca, make_hi("envelope2"))
envelope(0x4416, "envelope3")
expr(0x3f23, make_lo("envelope3"))
expr(0x3f25, make_hi("envelope3"))
envelope(0x444a, "envelope4")
expr(0x4340, make_lo("envelope4"))
expr(0x4342, make_hi("envelope4"))

label(0x38c2, "object_something_table")

go()

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
