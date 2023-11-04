from commands import *
import acorn
acorn.bbc()

constant(22, "vdu_set_mode")

# This code is loaded at &3900 at the end of the BASIC loader, but it is relocated down to &1200.
# It's cleaner for the disassembly to pretend it's just loaded directly at &1200.
load(0x1200, "tmp/imogen-trailing-mc-3900.dat", "6502", "db128cdc10469437ae5852336e5ff818")
entry(0x1200)
constant(0x3900, "load_address")
constant(0x1200, "relocate_address")
expr(0x1207, make_hi("relocate_address"))
expr(0x120b, make_hi("load_address"))
expr(0x121e, make_hi(make_add("load_address", make_subtract("pydis_end", "pydis_start"))))
label(0x1200, "relocate")
label(0x1210, "relocate_loop")
label(0x1234, "post_relocate_init")

comment(0x123d, "Redundant LDX/LDY here; drive_0_command is not actually used.")
label(0x138d, "drive_0_command")
label(0x1395, "dir_dollar_command")
expr(0x123e, make_lo("drive_0_command"))
expr(0x1240, make_hi("drive_0_command"))
expr(0x1242, make_lo("dir_dollar_command"))
expr(0x1244, make_hi("dir_dollar_command"))

expr(0x1260, "vdu_set_mode")

go()

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
