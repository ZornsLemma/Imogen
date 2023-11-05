from commands import *
import acorn
acorn.bbc()

constant(21, "vdu_disable")
constant(22, "vdu_set_mode")
constant(31, "vdu_goto_xy")
constant(0xffdd, "osfile")

# This code is loaded at &3900 at the end of the BASIC loader, but it is relocated down to &1200.
# It's cleaner for the disassembly to pretend it's just loaded directly at &1200.
load(0x1200, "orig/imogen-trailing-mc-3900.dat", "6502", "db128cdc10469437ae5852336e5ff818")
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

comment(0x1251, "Set up a reduced-height mode 4 screen with 24 character lines starting at address &6200, respecting the user's current vertical shift as set by *TV.")
constant(0x6200, "screen_start")
constant(24, "screen_height_characters")
expr(0x1260, "vdu_set_mode")
expr(0x128a, make_lo(make_divide("screen_start", 8)))
expr(0x1294, make_hi(make_divide("screen_start", 8)))
expr(0x129e, "screen_height_characters")

expr(0x12e0, "vdu_goto_xy")
expr(0x12ff, "vdu_goto_xy")
label(0x13a9, "written_by_string")
label(0x13c5, "copyright_string")
label(0x13e8, "TODO1")

expr(0x131e, "vdu_disable")
comment(0x1322, "Obfuscated code to load the 'G' file and transfer control to its execution address, relying on the fact that OSFILE &FF will have filled in the execution address at &76 after loading the file.")
constant(0x20, "jsr_opcode")
expr(0x1323, "jsr_opcode")
expr(0x1327, make_lo("osfile"))
expr(0x132b, make_hi("osfile"))
constant(0x6c, "jmp_indirect_opcode")
expr(0x132f, "jmp_indirect_opcode")
#entry(0x1307, "post_osfile_load")
comment(0x1342, "Set A=&FF for OSFILE to load a file. We also store this at &76, which is byte 6 of the control block, telling OSFILE to load at the file's own load address.")
label(0x13a7, "osfile_load_filename")
stringcr(0x13a7)
expr(0x133b, make_lo("osfile_load_filename"))
expr(0x133f, make_hi("osfile_load_filename"))

go()

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
