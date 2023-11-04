from commands import *
import acorn
acorn.bbc()

constant(6, "vdu_enable")
constant(17, "vdu_set_text_colour")
constant(18, "vdu_set_graphics_colour")
constant(22, "vdu_set_mode")
constant(23, "vdu_define_character")
constant(28, "vdu_define_text_window")

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
comment(0x3c3a, "Copy &2A00 bytes from &1234 to &1103. TODO: I think? If this is right, label this up nicely and use constants etc later.")

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

go()

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
