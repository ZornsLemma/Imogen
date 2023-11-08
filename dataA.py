from commands import *
import acorn
import re
from common import *
acorn.bbc()

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
byte(0x3adf, 8) # TODO: ?
label(get_u16_binary(0x3adf), "fourth_level_handler")

label(0x449a, "inverse_power_of_2_table")
hexadecimal(0x449a, 8)
byte(0x449a, 8)

entry(0x3b29, "some_code1")
entry(0x3d21, "some_data1")
entry(0x3f8b, "some_code2")
entry(0x3fd9, "some_code3")
label(0x4052, "some_data2")
entry(0x424f, "some_code4")

comment(0x3ae7, "'SAXOPHOBIA\\r' EOR-encrypted with $cb")

go()

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
