from commands import *
import acorn
import re
from common import *
from memorymanager import get_u8_runtime, RuntimeAddr
acorn.bbc()

sprite_dict = {
    0x3b: "spriteid_ball",
    0xc8: "spriteid_mouse",
    0xc9: "spriteid_mouse_hands1",
    0xca: "spriteid_mouse_hands2",
    0xcb: "spriteid_small_ball",
    0xcc: "spriteid_zero_size1", # TODO:!? Used as a mask?
    0xcf: "spriteid_trapdoor_horizontal",
    0xd0: "spriteid_trapdoor_diagonal",
    0xd1: "spriteid_trapdoor_vertical",
    0xd2: "spriteid_saxophone1",
    0xd3: "spriteid_saxophone2",
    0xd4: "spriteid_mouse_hands3",
    0xd5: "spriteid_mouse_hands4",
    0xd6: "spriteid_baby0",
    0xd7: "spriteid_baby1",
    0xd8: "spriteid_baby2",
    0xd9: "spriteid_baby3",
    0xda: "spriteid_baby4",
    0xdb: "spriteid_baby5",
    0xdc: "spriteid_baby6",
    0xdd: "spriteid_baby7",
    0xde: "spriteid_table",
}

def spriteid(start_addr, end_addr=None):
    if end_addr == None:
        end_addr = start_addr+1
    for addr in range(start_addr, end_addr):
        v = get_u8_runtime(memorymanager.RuntimeAddr(addr))
        if v in sprite_dict:
            byte(addr)
            expr(addr, sprite_dict[v])

substitute_constants("jsr draw_sprite_a_at_cell_xy", 'a', sprite_dict, True)
substitute_constants("jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map", 'a', sprite_dict, True)
substitute_constants("jsr find_or_create_menu_slot_for_A", 'a', sprite_dict, True)
#substitute_constants("sta sprite_op_flags", 'a', sprite_op_flags_dict, True)

load(0x3ad5, "orig/dataA.dat", "6502", "df027a3ac06abfed1878eaec3d2bbe5f")

common_to_all()

# NOTE:
#
#   Ranges here are *binary* NOT the *runtime* addresses as used everywhere else.
#   This is weird, but makes the addresses unique.
#
substitute_labels = {
    (0x3bd4,0x3df9): {
        "l0070": "room_exit_direction",
    },
}

# (Class SubstituteLabels is defined in common.py to implement the substitute labels)
s = SubstituteLabels(substitute_labels)
set_label_maker_hook(s.substitute_label_maker)

expr(0x40de, make_add("object_sprite_mask_type", "objectid_TODO"))
expr(0x3ff3, "copy_mode_simple")

word(0x3ad7)
expr(0x3ad7, "level_init_after_load_handler")
word(0x3ad9)
expr(0x3ad9, "level_update_handler") # TODO: rename
word(0x3adb)
expr(0x3adb, "level_name") # TODO: rename
entry(get_u16_binary(0x3ad7), "level_init_after_load_handler")
entry(get_u16_binary(0x3ad9), "level_update_handler")
label(get_u16_binary(0x3adb), "level_name")

entry(0x3d21, "mouse_sprites_and_ball_movement_table")
def mouse_and_ball(addr):
    byte(addr+2,2)
    spriteid(addr)
    spriteid(addr+1)
    decimal(addr+2)
    decimal(addr+3)

mouse_and_ball(0x3d21)
mouse_and_ball(0x3d25)
mouse_and_ball(0x3d29)
mouse_and_ball(0x3d2d)
mouse_and_ball(0x3d31)
mouse_and_ball(0x3d35)
mouse_and_ball(0x3d39)

label(0x4052, "baby_spriteid_data")
spriteid(0x4052, 0x407f)
expr(0x3d09, "spriteid_small_ball")

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
entry(0x3be4, "room0_handler")
comment(0x3be4, "Room 0 has two mice throwing a ball back and forth.")
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
comment(0x3cc6, "Set the mouse sprites as a pair of values in the table")
entry(0x3ce7, "mouse_ball_position_ge_0xf_common_tail")
comment(0x3cd7, "TODO: always branch? not sure, but superficially it would seem nothing in mouse_sprites_and_ball_movement_table is -$88, i.e. $78")
entry(0x3cfb, "finish_mouse_ball_movement")
expr(0x3d06, make_add("object_y_low", "objectid_mouse_ball"))
expr(0x3cfc, make_add("object_x_low", "objectid_mouse_ball"))
expr(0x3d0b, make_add("object_spriteid", "objectid_mouse_ball"))
comment(0x3d12, "Check for player-ball collision")
expr(0x3d13, "objectid_player")
expr(0x3d15, "objectid_mouse_ball")
constant(6, "player_collision_flag_baby")
constant(0x80, "player_collision_flag_mouse_ball")
expr(0x3d1c, "player_collision_flag_mouse_ball")
expr(0x4116, "player_collision_flag_baby")

entry(0x3dfc, "room1_handler")
comment(0x3dfc, "Room 1 has a trapdoor which opens when the wizard stands on it holding the saxophone.")
entry(0x3e6c, "room1_not_first_update")
entry(0x3e11, "level_unchanged2")
label(0x9ff, "room1_trapdoor_open_flag")
label(0x3eee, "trapdoor_sprite_table") # TODO: Include "animation" in name? But not sure if this is different from "real" animations like animal tails
for i in range(3): # TODO: Add a convenience function for this? Maybe in py8dis?
    byte(0x3eee+i)
comment(0x3e99, "Remove the closed trapdoor from the collision map.")
comment(0x3eac, "Add the two open trapdoors to the collision map.")
expr(0x3f18, make_add("toolbar_collectable_spriteids", "1"))
expr(0x3f1d, make_add("collectable_spriteids", "1"))

# TODO: slight guesswork
# Room 0?
constant(2, "objectid_left_mouse")
constant(3, "objectid_right_mouse")
constant(4, "objectid_mouse_ball")
# Room 2?
constant(2, "objectid_TODO")
constant(5, "objectid_spell")
# Room???
constant(5, "objectid_brazier")
expr(0x3f08, "objectid_brazier")
entry(0x3f52, "not_first_room_update")
expr(0x3f1b, "spriteid_saxophone1")
expr(0x3c22, "objectid_left_mouse")
expr(0x3c48, "objectid_right_mouse")
expr(0x3c5c, "objectid_mouse_ball")
expr(0x3cc7, "object_spriteid + objectid_left_mouse")
expr(0x3cce, "object_spriteid + objectid_right_mouse")
expr(0x3ceb, "object_spriteid + objectid_right_mouse")
# TODO: Looks like object IDs might be re-used across rooms, so some of these below are probably
# wrong
expr(0x3cf2, "object_spriteid + objectid_left_mouse")
expr(0x3ee8, "object_spriteid + objectid_left_trapdoor")
expr(0x3eeb, "object_spriteid + objectid_right_trapdoor")
# TODO expr_label(0x9ac, "object_spriteid + objectid_mouse_ball")
entry(0x3e69, "room1_initial_setup_done")

constant(0x2, "objectid_left_trapdoor")
constant(0x3, "objectid_right_trapdoor")
expr(0x3e23, "objectid_left_trapdoor")
expr(0x3e30, "objectid_right_trapdoor")
comment(0x3e1e, "Set up the objects for the two trapdoors.")
comment(0x3e3e, "Set up the collision map for the two trapdoors.")
comment(0x3e43, "Set up the trapdoor collision map if they are closed.")
entry(0x3e55, "set_up_open_trapdoor_collision_map")
entry(0x3eed, "return2")
constant(0x4, "objectid_saxophone") # TODO: guessing a bit
expr(0x3f70, "object_spriteid + objectid_saxophone")
expr(0x3f83, "object_spriteid + objectid_saxophone")
entry(0x3ed4, "new_room1_trapdoor_open_flag_in_y")
entry(0x3ed7, "set_room1_trapdoor_sprites_if_required")
entry(0x3ee4, "adjusted_room1_trapdoor_open_flag_in_y_is_ge_0")
entry(0x3ef1, "play_some_sound1_then_some_sound2")
comment(0x3ecf, "TODO: Pretty confident this is the trapdoor opening sound, but this is called elsewhere so don't want to rename subroutine yet")
comment(0x3ee2, "Use sprite index 2 (vertical) if room1_trapdoor_open_flag is $ff")
entry(0x3ec1, "increment_trapdoor_open_flag")
entry(0x3ed2, "skip_play_sound")
# TODO: I find the constant checking of the room index in the "room handler" code strange - why isn't
# this just done once at the start of the subroutine?
# TODO: I think room1_trapdoor_open_flag can have values $ff, 0 and 1 - just possibly this
# increments to add a time delay to the trapdoor visibly opening, but that's a guess at this point.
# Looking at Colin's YT video frame by frame, I think there are states: fully closed, both open at
# an angle, right fully open while left is still at an angle and both fully open. Not entirely sure
# if both open at an angle is a single state or two states with rhs one opening first. (Timestamp in
# video ~ 17:54.) Looking at the code at 3ee4 I suspect any left-vs-right difference is just me
# stepping through the frames and in reality we are "supposed" to see symmetric movement
expr(0x3eee, "spriteid_trapdoor_horizontal")
expr(0x3eef, "spriteid_trapdoor_diagonal")
expr(0x3ef0, "spriteid_trapdoor_vertical")

entry(0x3f51, "return3")
expr(0x3f3d, "objectid_saxophone") # TODO: not entirely sure this is the right object ID 4, but the code does seem to check for desired_room_index being 1 - I am still a bit fuzzy as to what all the different room number variables mean
expr(0x3f48, "spriteid_zero_size1")
expr(0x3f4d, "spriteid_saxophone1")
expr(0x3f16, "spriteid_saxophone2")

comment(0x407f, "Room 2 has the spell, guarded by a baby. TODO: Not too sure I have the room number correct etc.")
entry(0x407f, "room2_handler") # TODO: not too sure about this
expr(0x4093, "objectid_spell")
expr(0x40d7, "objectid_TODO")
expr(0x40dc, "spriteid_zero_size1")

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

expr(0x43cc, make_add("sound_priority_per_channel_table","1"))

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

go()

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
