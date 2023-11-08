from commands import *
import acorn
import re
from common import *
acorn.bbc()

load(0x3ad5, "orig/dataA.dat", "6502", "df027a3ac06abfed1878eaec3d2bbe5f")
word(0x3ad7, 3)
expr(0x3ad7, "level_handler") # TODO: rename - this is probably "post_load_initialisation_handler" or something like that
expr(0x3ad9, "second_level_handler") # TODO: rename
expr(0x3adb, "third_level_handler") # TODO: rename
entry(get_u16_binary(0x3ad7), "level_handler")
entry(get_u16_binary(0x3ad9), "second_level_handler")
entry(get_u16_binary(0x3adb), "third_level_handler")

go()

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
