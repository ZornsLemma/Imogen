from commands import *
import acorn
acorn.bbc()

constant(6, "vdu_enable")
constant(22, "vdu_set_mode")

load(0x1234, "tmp/g.dat", "6502", "ac5feeac5c32a306d4a73ba393677385")
entry(0x3c06, "start")

expr(0x3c12, "vdu_enable")
comment(0x3c06, "The loader will have executed VDU 21 to disable VDU output. Record the current disable state before re-enabling it, so we can check it later as part of a copy protection scheme.")
comment(0x3d91, "Presumably as part of a copy protection scheme, we check to see if VDU output was disabled (VDU 21) when we first started to execute, before we re-enabled output (VDU 6) ourselves.")
label(0x3f6e, "initial_screen_disabled_flag")
expr(0x3d97, "vdu_set_mode")
label(0x3da3, "initial_screen_disabled_flag_ok")
comment(0x3d96, "VDU output wasn't disabled when we started to execute. Do some stuff (TODO: what?) to break things.")

go()

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
