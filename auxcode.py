from commands import *
import acorn
import re
acorn.bbc()

config.set_label_references(False)

substitute_labels = {
}

def my_label_maker(addr, context, suggestion):
    for pair in substitute_labels:
        if context in range(pair[0], pair[1]):
            dict = substitute_labels[pair]
            if suggestion[0] in dict:
                return dict[suggestion[0]]

    return suggestion

set_label_maker_hook(my_label_maker)


load(0x53c0, "orig/auxcode.dat", "6502", "4bb0d6da344653209ba062a544cf0e9c")
entry(0x53c0)

go()

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
