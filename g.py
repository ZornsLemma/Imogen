from commands import *
import acorn
acorn.bbc()

constant(6, "vdu_enable")
constant(7, "vdu_bell")
constant(17, "vdu_set_text_colour")
constant(18, "vdu_set_graphics_colour")
constant(22, "vdu_set_mode")
constant(23, "vdu_define_character")
constant(28, "vdu_define_text_window")

constant(5, "osfile_read_catalogue_info")
constant(0xff, "osfile_load")

load(0x1234, "tmp/g.dat", "6502", "ac5feeac5c32a306d4a73ba393677385")
move_id = move(0x1103, 0x1234, 0x2a00)

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
label(0x400, "some_data_low_TODO")
expr(0x3c17, make_lo("some_data_high_copy_TODO"))
expr(0x3c1b, make_hi("some_data_high_copy_TODO"))
expr(0x3c1f, make_lo("some_data_low_TODO"))
expr(0x3c23, make_hi("some_data_low_TODO"))
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
entry(0x196f, "load_sprdata_to_addr_at_l0054")

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

go()

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
