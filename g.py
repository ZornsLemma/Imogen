from commands import *
import acorn
acorn.bbc()

constant(3, "vdu_printer_off")
constant(6, "vdu_enable")
constant(7, "vdu_bell")
constant(8, "vdu_left")
constant(10, "vdu_lf")
constant(13, "vdu_cr")
constant(17, "vdu_set_text_colour")
constant(18, "vdu_set_graphics_colour")
constant(22, "vdu_set_mode")
constant(23, "vdu_define_character")
constant(28, "vdu_define_text_window")
constant(31, "vdu_goto_xy")
constant(127, "vdu_delete")

constant(5, "osfile_read_catalogue_info")
constant(0xff, "osfile_load")

label(0x287, "first_byte_break_intercept")

load(0x1234, "orig/g.dat", "6502", "ac5feeac5c32a306d4a73ba393677385")
move_id = move(0x1103, 0x1234, 0x2a00)
move_id2 = move(0x400, 0x40ff, 295) # code copies 512 bytes, but we only have 295 bytes of actual data
move(0x131, 0x40d0, 0x2f)
move(0xc00, 0x3fcb, 0x402c-0x3fcb) # code copies 256 bytes, but this is what we actually care about
move(0xab7, 0x4088, 0x48)

entry(0x3c06, "execution_start")

expr(0x3c12, "vdu_enable")
comment(0x3c06, "The loader will have executed VDU 21 to disable VDU output. Record the current disable state before re-enabling it, so we can check it later as part of a copy protection scheme.")
comment(0x3d91, "Presumably as part of a copy protection scheme, we check to see if VDU output was disabled (VDU 21) when we first started to execute, before we re-enabled output (VDU 6) ourselves.")
label(0x3f6e, "initial_screen_disabled_flag")
expr(0x3d97, "vdu_set_mode")
label(0x3da3, "initial_screen_disabled_flag_ok")
comment(0x3d96, "VDU output wasn't disabled when we started to execute. Do some stuff (TODO: what?) to break things.")

comment(0x3c16, "Copy 512 bytes from &40FF to &400. TODO: I THINK?")
label(0x40ff, "some_data_high_copy_TODO")
label(0x400, "wait_for_timer_2_using_l1106_l1107")
expr(0x3c17, make_lo("some_data_high_copy_TODO"))
expr(0x3c1b, make_hi("some_data_high_copy_TODO"))
expr(0x3c1f, make_lo("wait_for_timer_2_using_l1106_l1107"))
expr(0x3c23, make_hi("wait_for_timer_2_using_l1106_l1107"))
comment(0x3c28, "TODO: branch never taken?", inline=True)
comment(0x3c4e, "TODO: branch always taken?", inline=True)
comment(0x3c58, "TODO: branch never taken?", inline=True)
comment(0x3c3a, "Copy &2A00 bytes from &1234 to &1103. TODO: I think? If this is right, label this up nicely and use constants etc later. TODO: I have a suspicion this is done more for obfuscation than any real requirement - surely we could have just loaded at &1103 in the first place? I suspect some routines - eg &16DC? - have 'real' versions and 'trap' versions to cause confusion. This is just speculation at this point.")

label(0x3eff, "drive_0_command")
label(0x3f07, "dir_dollar_command")

expr(0x3cf1, "vdu_define_character")
label(0x3f66, "character_fe_bitmap")
byte(0x3f66, 8, 1)
picture_binary(0x3f66, 8)
entry(0x3cfc, "define_character_fe_loop")

expr(0x3dba, "vdu_define_text_window")
expr(0x3dd3, "vdu_set_text_colour")
expr(0x3ddd, "vdu_set_text_colour")
expr(0x3de7, "vdu_set_graphics_colour")

entry(0x395e, "define_envelope")

constant(39, "screen_width_minus_one")
expr(0x3dc9, "screen_width_minus_one")

comment(0x3db9, "TODO: A lot of this code looks - I haven't checked yet - similar to initialisation code in the IMOGEN file. It should be annotated but I won't bother yet as it may be I can copy this from the IMOGEN code. Is it possible that what I thought was copy protection regarding VDU 21 status is in fact just a way to make the G file self-contained if it's run directly from the command line during development, instead of from IMOGEN?")

# TODO: This is just a guess - but the code looks as though it's doing OSFILE but wrapping in some error checking and temporary changes to BRKV
entry(0x16dc, "osfile_wrapper")

expr(0x197c, "osfile_load")
label(0x1980, "sprdata_filename")
expr(0x1970, make_lo("sprdata_filename"))
expr(0x1974, make_hi("sprdata_filename"))
stringcr(0x1980)
expr(0x3e60, make_lo("sprdata_filename"))
expr(0x3e64, make_hi("sprdata_filename"))
entry(0x196f, "load_sprdata")

comment(0x3e6c, "Load 'sprdata' file into memory so it ends just below $5bc0. TODO: use named constant")

comment(0x3e82, "Load 'icodata' file into memory at icodata")
label(0x40ff, "icodata")
expr(0x3e83, make_lo("icodata"))
expr(0x3e87, make_hi("icodata"))
label(0x3f5e, "icodata_filename")
stringcr(0x3f5e)
expr(0x3e92, make_lo("icodata_filename"))
expr(0x3e96, make_hi("icodata_filename"))

expr(0x3e68, "osfile_read_catalogue_info")
expr(0x3e9a, "osfile_load")

expr(0x172e, "vdu_bell")

entry(0x3ec9, "seek_track_a")

def do_osword_7f_block_partial(addr):
    byte(addr)
    comment(addr, "drive", inline=True)
    word(addr+1, 2)
    for i in range(memory[addr+5]+1):
        byte(addr+6+i)
    comment(addr+1, "data address", inline=True)
    comment(addr+5, "number of parameters", inline=True)

comment(0x3ef4, "TODO: I think the track and sector values in this block are logical tracks and rely on the previous step operation, but I'm not sure. I suspect this is done entirely for obfuscation and has been converted to file operations in this version, but I haven't actually checked that.")
label(0x3ef4, "osword_7f_block_read")
do_osword_7f_block_partial(0x3ef4)
expr(0x3ef5, "icodata")
comment(0x3efa, "command ($53=read data)", inline=True)
comment(0x3efb, "track", inline=True)
comment(0x3efc, "sector", inline=True)
comment(0x3efd, "size+count ($23=3 256 byte sectors)", inline=True)
label(0x3efe, "osword_7f_read_result")

label(0x3ee1, "osword_7f_block_seek") # TODO: poor name
do_osword_7f_block_partial(0x3ee1)
comment(0x3ee7, "command ($69=seek)", inline=True)
label(0x3ee8, "osword_7f_block_seek_track")
label(0x3ee9, "osword_7f_seek_result") # TODO: poor name

label(0x3eea, "osword_7f_block_write_special_register") # TODO: poor name
do_osword_7f_block_partial(0x3eea)
comment(0x3ef0, "command ($7a=write special register)", inline=True)
comment(0x3ef1, "special register ($12=track)", inline=True)
label(0x3ef2, "osword_7f_block_write_special_register_track")
label(0x3ef3, "osword_7f_write_special_register_result")

entry(0x3ed5, "set_track_special_register_to_a")
entry(0x3ea1, "read_icodata_using_osword_7f")

# TODO: Poor-ish name. I am guessing this is some kind of data
# encryption/decryption; it could potentially be an RNG, but I don't think the
# game is random.
label(0x18a6, "mix_a_with_state")

# TODO: Poor name
entry(0x132c, "set_yx_based_on_a")

label(0x1272, "data_filename")
label(0x1276, "data_filename_variable_letter")
string(0x1272, 4)
stringcr(0x1276)
expr(0x1159, make_lo("data_filename"))
expr(0x115d, make_hi("data_filename"))
expr(0x1165, "osfile_load")
comment(0x3ad5, "This initialisation code gets overwritten by level data later on.")
label(0x3ad5, "level_data")
expr_label(0x3ad6, make_add("level_data", "1"))
expr(0x1161, make_lo("level_data"))
expr(0x1163, make_hi("level_data"))
expr(0x1350, make_lo("level_data"))
expr(0x1357, make_hi("level_data"))

label(0x1377, "power_of_2_table")
hexadecimal(0x1377, 8)

entry(0x3814, "print_y_spaces_loop")

entry(0x36fc, "string_input") # TODO: Something like this
char(0x3475)
char(0x3479)
char(0x3505)
char(0x3509)
char(0x350d)
char(0x3511)
char(0x370d)
char(0x3711)
char(0x3715)
char(0x3719)
char(0x3721)
char(0x375a)
char(0x3813)
expr(0x3755, "vdu_left")
expr(0x375f, "vdu_left")
expr(0x3725, "'9' + 1") # TODO: not assembler independent
char(0x372b)
expr(0x372f, "'Z' + 1") # TODO: not assembler independent
label(0x387c, "inkey_0")
label(0x3acc, "negative_inkey")
label(0x362e, "wait_for_return")
expr(0x3632, "vdu_cr")
expr(0x3709, "vdu_delete")
constant(0xdf, "caps_mask")
expr(0x3473, "caps_mask")
expr(0x3729, "caps_mask")
expr(0x355b, "vdu_cr")
expr(0x3562, "vdu_lf")
expr(0x3705, "vdu_cr")

expr(0x445, "vdu_goto_xy")

entry(0x453, "something_TODO")
# TODO: DELETE? entry(0x3fbb, "something2_TODO")

entry(0x3fcb, "something3_TODO")
label(0x3fcb, "something3_high_copy_start")
comment(0x1845, "TODO: Is this code deliberately trashing the code at something3_TODO? I can't think of any genuine reason for the game to copy anything from ROM into RAM.")
comment(0x1df4, "TODO: Is this code deliberately trashing the code at something3_TODO?")
comment(0x1e80, "TODO: What's going on with the modification to something3_TODO here? Is it copy protection/obfuscation or is there something else going on?")
comment(0x1ebb, "TODO: What's going on with the modification to something3_TODO here? Is it copy protection/obfuscation or is there something else going on?")

entry(0x402c, "quit_to_basic")
for i in range(5):
    char(0x406a+i*4)
expr(0x407e, "vdu_cr")
expr(0x4040, "vdu_set_mode")
expr(0x403b, "vdu_printer_off")

entry(0x4088, "clear_128_bytes_at_l09ef") # TODO: improve name as things become clearer
label(0x4088, "clear_128_bytes_at_l09ef_high_copy_start")
label(0x4088+0x48, "clear_128_bytes_at_l09ef_high_copy_end")
expr(0x3c74, make_subtract("clear_128_bytes_at_l09ef_high_copy_end", "clear_128_bytes_at_l09ef_high_copy_start"))

entry(0x4094, "something6_TODO")
entry(0x40a5, "convert_level_number_to_letter") # TODO: guesswork but something like this - probably not right though
entry(0x40c0, "convert_level_letter_to_number") # TODO: guesswork but something like this - probably not right though

comment(0x40d0, "Update the transformation count on screen at text position (35-37, 6). This takes care to update as few digits on screen as possible, probably to reduce flicker and to offset the relatively slow implementation of print_italic.")
label(0x9ec, "current_transformations_remaining")
expr_label(0x9ed, "current_transformations_remaining+1")
expr_label(0x9ee, "current_transformations_remaining+2")
label(0x5c, "displayed_transformations_remaining")
expr_label(0x5d, "displayed_transformations_remaining+1")
expr_label(0x5e, "displayed_transformations_remaining+2")
decimal(0x149)
# TODO: From a py8dis POV, this code feels wrong/confusing. entry() and label() behave different with how the label is placed. This works, but I am not sure it's by design. Maybe it is, it's been a while and I haven't had any coffee yet...
entry(0x40d0, "update_displayed_transformations_remaining")
label(0x40d0, "update_displayed_transformations_remaining_high_copy_start")
label(0x40d0+0x2f, "update_displayed_transformations_remaining_high_copy_end")
expr(0x3c8c, make_subtract("update_displayed_transformations_remaining_high_copy_end", "update_displayed_transformations_remaining_high_copy_start"))
expr(0x140, "vdu_goto_xy")
expr(0x3c85, "update_displayed_transformations_remaining_high_copy_start")
entry(0x136, "digit_loop")
entry(0x157, "digit_unchanged")
char(0x3d1b)
comment(0x2c8c, "Decrement current_transformations_remaining by one, unless it's already zero. Leading digits are handled specially so they turn into spaces rather than zeroes. Carry is clear on exit iff the value was zero on entry.")
entry(0x2c8c, "decrement_current_transformations_remaining")
expr(0x2c95, "' ' + '0'") # TODO: not portable
label(0x2cd5, "decrement_current_tranformations_remaining_pla_rts")
label(0x2cca, "decrement_current_tranformations_remaining_middle_digit_now_zero")
char(0x2ca0)
char(0x2ca4)
char(0x2caf)
char(0x2cb5)
char(0x2cc0)
char(0x2cce)
label(0x2cd4, "decrement_current_tranformations_remaining_no_borrow")
comment(0x2b5c, "branch if no transformations remaining before decrement", inline=True)
comment(0x2337, "Transform the player into a new form.")
entry(0x2337, "transform")

label(0x48, "current_player_character")
label(0x4d, "new_player_character")

comment(0x111a, "Initialise the number of remaining transformations to 150.")
char(0x111b)
char(0x1120)
char(0x1125)
char(0x2cc4)

entry(0x1866, "print_italic")
char(0x1867)
expr(0x186a, "vdu_delete")
expr(0x1888, "vdu_define_character")
label(0x1893, "define_character_ff_loop")
entry(0x18a3, "print_italic_rts")
# TODO: Could use a named constant for character $ff - ditto character $fe I guess

entry(0x17a0, "something10_TODO")
entry(0x1839, "something11_TODO")
entry(0x18c3, "something12_TODO")
entry(0x1988, "something13_TODO")
entry(0x1a10, "something14_TODO")
entry(0x1b8a, "something15_TODO")
# TODO: DELETE? entry(0x1d99, "something16_TODO")
entry(0x1fd7, "something16_TODO")
entry(0x2200, "something17_TODO")
entry(0x2248, "something18_TODO")
entry(0x22cd, "something19_TODO")
entry(0x2a38, "something20_TODO")
entry(0x2b87, "something21_TODO")
entry(0x2be0, "something22_TODO")
# TODO: DELETE entry(0x35f7, "something23_TODO")

label(0x31, "desired_level") # TODO: This is not right but let's go with it for now - the way this is used it clearly contains *a* level (as a letter, I think), but I am not quite sure what it's used for
label(0x37, "currently_loaded_level")
label(0x51, "maybe_current_level") # TODO: not clear yet, but looks like some kind of level indicator
label(0x1175, "level_already_loaded")

comment(0x3f78, "TODO: I suspect the following code is copy protection related - writing data to the sideways ROM region feels wrong.")

label(0x1103, "copy_protection_flag")

# TODO: There are only 16 levels which is A-P, but we have Q as well. I hadn't realised that before. I suspect Q might be used for the "game completed" message, but that is just a guess. (Note that there is a dataQ file on disc.) It's possible last_level_letter is misnamed or it would be better to express 'Q' and last_level_letter(='P')+1. Depends how it all works in the code.
constant(0x41, "first_level_letter") # TODO: would be nice to use 'A' as constant
constant(0x51, "last_level_letter") # TODO: would be nice to use 'Q' as constant
expr(0xaf0, "last_level_letter")
expr(0xaf7, "first_level_letter")
expr(0xae9, "first_level_letter")
expr(0x37c2, "first_level_letter")
expr(0x37cb, "first_level_letter")
expr(0x1226, "first_level_letter")
expr(0x124d, "first_level_letter")
expr(0x127c, "first_level_letter")
expr(0x1a4a, "first_level_letter")
expr(0x39dd, "last_level_letter")
expr(0x39e7, "last_level_letter")
expr(0x39eb, "first_level_letter")
expr(0x113b, "first_level_letter")
expr(0x112f, "last_level_letter+1")
expr(0x1a6a, "first_level_letter")

def negative_constant(c, s):
    assert c < 0
    constant(c & 0xff, s)
negative_constant(-113, "inkey_key_escape")
negative_constant(-1, "inkey_key_shift")
negative_constant(-74, "inkey_key_return")
negative_constant(-98, "inkey_key_z")
negative_constant(-67, "inkey_key_x")
negative_constant(-99, "inkey_key_space")
negative_constant(-26, "inkey_key_left")
negative_constant(-122, "inkey_key_right")
expr(0x2a53, "inkey_key_escape")
expr(0x2ab1, "inkey_key_shift")
expr(0x3a13, "inkey_key_return")
expr(0x3a1c, "inkey_key_z")
expr(0x3a28, "inkey_key_x")
expr(0x3a48, "inkey_key_space")
expr(0x3a59, "inkey_key_left")
expr(0x3a61, "inkey_key_right")
# TODO: What does the shift key do in the game? Or Escape?

# TODO: Don't know what the byte means yet, but the code structure makes it clear this is indexed by level number
label(0x9ef, "byte_per_level_table1")

entry(0x1140, "initialise_level") # TODO: guessing, but seems plausible

label(0xab5, "old_irq1v")
expr_label(0xab6, "old_irq1v+1")

entry(0x178c, "wait_for_vsync")

# TODO: Why are there two copies of BRKV? These can probably be renamed once their use becomes clearer.
label(0xab1, "old_brkv1")
expr_label(0xab2, "old_brkv1+1")
label(0xab3, "old_brkv2")
expr_label(0xab4, "old_brkv2+1")

comment(0x38ac, "The envelope definitions get overwritten after initialisation - this is harmless as they will have been copied into the OS workspace when they were defined.")
label(0x38ac, "envelope_1")
byte(0x38ac, 14)
decimal(0x38ac, 14)
label(0x38ac+14, "some_data1_TODO")
label(0x38c2, "envelope_2")
byte(0x38c2, 14)
decimal(0x38c2, 14)
label(0x38c2+14, "some_data2_TODO")
label(0x38d8, "envelope_3")
byte(0x38d8, 14)
decimal(0x38d8, 14)
label(0x38d8+14, "some_data3_TODO")
expr(0x3d3e, make_lo("envelope_1"))
expr(0x3d40, make_hi("envelope_1"))
expr(0x3d45, make_lo("envelope_2"))
expr(0x3d47, make_hi("envelope_2"))
expr(0x3d4c, make_lo("envelope_3"))
expr(0x3d4e, make_hi("envelope_3"))

# TODO: Temporary names, of course
label(0xaa1, "eight_entry_table1")
label(0xaa9, "eight_entry_table2")
label(0x1104,"four_entry_table1") # TODO: might just be four bytes which share init code??
label(0x2ee9, "four_entry_table2") # TODO: write only, at least in 'g' itself?
label(0x396f, "four_entry_table3_maybe_sound") # TODO: possibly something to do with sound??
label(0xa7f, "sixteen_entry_table")
expr(0x3f1b, make_subtract("sixteen_entry_table", 1))
label(0x295c, "seventeen_entry_table1") # sub_c2980 initialises elements 9 inclusive to $11 exclusive, but elsewhere we do access lower elements
label(0x296f, "seventeen_entry_table2") # see code at c29aa which pairs this with seventeen_entry_table1
# sub_c2157 uses all of these tables in parallel, so presumably they share the same size - represented here by 'x'
label(0x9b3, "x_entry_table1")
label(0x95b, "x_entry_table2")
label(0x971, "x_entry_table3")
label(0x987, "x_entry_table4")
label(0x966, "x_entry_table5")
label(0x97c, "x_entry_table6")
label(0x992, "x_entry_table7")
label(0x99d, "x_entry_table8")
label(0x9a8, "x_entry_table9")
label(0x9be, "x_entry_table10")
label(0x9c9, "x_entry_table11")
label(0x38ac, "x_entry_table12") # TODO: Re-uses envelope_1, need to resolve label clash
label(0x950, "x_entry_table13")

entry(0x3f6f, "probably_copy_protection_TODO")

label(0x29, "new_menu_index")
label(0x2e, "current_menu_index")
label(0x25, "another_menu_index")
entry(0x29de, "apply_new_menu_index")
entry(0x29ea, "apply_new_menu_index_rts")
entry(0x3a75, "menu_x_step_in_a")
comment(0x3a75, "TODO: This looks like a manual implementation of an auto-repeat delay, so if you hold down left/right a fraction of a second too long it doesn't zip all the way to the left or right.")
# TODO: Not yet clear exactly why we have two versions of these flags
label(0x2a, "space_flag")
label(0x3aa0, "space_flag2")
label(0x28, "left_right_flag")
label(0x3aa1, "left_right_flag2")
label(0x46, "return_flag")
label(0x3ac7, "return_flag2")
label(0x3ac8, "return_flag3") # TODO: write only?
label(0x2c, "z_flag")
label(0x3aca, "z_flag2")
label(0x2d, "x_flag")
label(0x3acb, "x_flag2")
label(0x3a8d, "temp_left_or_z_flag")
label(0x2b, "space_repeat_flag")
label(0x27, "left_right_repeat_flag")
label(0x20, "player_x_movement_direction")
label(0x3ac9, "player_x_movement_direction2")
entry(0x2c67, "apply_pending_menu_motion")
entry(0x2c88, "no_menu_motion")
entry(0x2c7e, "menu_left_pending")
entry(0x2c70, "menu_right_pending")
comment(0x2c7c, "always branch", inline=True)
entry(0x29eb, "unplot_menu_pointer") # TODO: plausible guess - hmm, losing faith in this
entry(0x2a17, "plot_menu_pointer") # TODO: plausible guess - ditto

# TODO: Lots of guesswork here...
# TODO: A/l0015=2 on entry for plot, A=0 on entry for unplot? (or the other way round?)
# TODO: l0016=sprite id? (this is $1d for menu pointer, maybe)
# TODO: l0014 is an input if l0015 has bit 0 set on entry - I suspect (given the two calls to set_yx_based_on_a in sprite_op) that l0014 is something like a mask or backing slot to store whatever's underneath the sprite
# TODO: This suggests that the menu pointer sprite *might* start at offset $528 in sprdata, and occupy 52 bytes (since the entry at 0x1d*2 is $528 and the next is $5c5)
entry(0x138d, "sprite_op")
comment(0x2c52, "TODO: Self-modifying code here? If so we haven't found the code that modifies it as we have no labels")
comment(0x13c1, "TODO: Self-modifying code here? If so we haven't found the code that modifies it as we have no labels")
entry(0x2c46, "something_to_do_with_incrementing_by_20_pixels_x_maybe")
comment(0x135d, "TODO: Looks like this is looking at the the 16-bit word at (&58),(2*A) and setting YX to be that value plus the address at &58, i.e. the table starts with 16-bit word offsets into the table, with &58 pointing to the base of the table")
label(0x54, "sprdata_ptr")
expr_label(0x55, make_add("sprdata_ptr", "1"))

# TODO: Possibly something to do with trying to avoid flicker as sprites update? Doesn't obviously look like palette change code.
entry(0x1791, "wait_for_timer_2_using_yx")

entry(0x385d, "turn_cursor_on")
entry(0x3863, "turn_cursor_off")

# This seems to be a 16-bit word.
label(0x3c, "some_word")
expr_label(0x3d, make_add("some_word", "1"))

go()

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
