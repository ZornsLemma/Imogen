from commands import *
import acorn
acorn.bbc()

load(0x1234, "tmp/g.dat", "6502", "ac5feeac5c32a306d4a73ba393677385")
entry(0x3c06)

go()

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
