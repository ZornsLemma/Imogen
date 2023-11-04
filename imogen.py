from commands import *

# This code is loaded at &3900 at the end of the BASIC loader, but it is relocated down to &1200.
# It's cleaner for the disassembly to pretend it's just loaded directly at &1200.
load(0x1200, "tmp/imogen-trailing-mc-3900.dat", "6502", "db128cdc10469437ae5852336e5ff818")
constant(0x3900, "init_load_address")
constant(0x1200, "init_run_address")
expr(0x1207, make_hi("init_run_address"))
expr(0x120b, make_hi("init_load_address"))
expr(0x121e, make_hi(make_add("init_load_address", make_subtract("pydis_end", "pydis_start"))))

entry(0x1200)

go()

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
