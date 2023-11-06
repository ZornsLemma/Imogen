from commands import *
import acorn
import re
acorn.bbc()

config.set_label_references(False)

constant(10, "vdu_lf")
constant(13, "vdu_cr")

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

comment(0x5446, "'Unknown\\r' EOR-encrypted with $cb")
fixed_eor_key = 0xcb
constant(fixed_eor_key, "fixed_eor_key")
label(0x5446, "unknown_encrypted_string")
expr(0x5438, make_lo("unknown_encrypted_string"))
expr(0x543a, make_hi("unknown_encrypted_string"))
expr(0x5416, "vdu_cr")
expr(0x5433, "vdu_lf")
expr(0x5413, "fixed_eor_key")
expr(0x542c, "fixed_eor_key")

comment(0x544f, "TODO: Needs properly decoding, but this EOR-$CB encrypted data starts:\nSAXOPHOBIA\\r^\\x9e\nTIME-FLIES\\r^\\x9e\nSo it looks like this is a table of level names, probably CR-terminated with a 16-bit pointer following each. '^' is $5e. Actually I suspect the pointers should *not* be EOR-ed, just the text. Note that \\r EOR $cb is $c6, so it's easy-ish to pick the pointers out of the raw data by eye.")
label(0x544f, "level_name_ptr_table")
expr(0x53c7, make_lo("level_name_ptr_table"))
expr(0x53cb, make_hi("level_name_ptr_table"))
expr(0x53d9, "vdu_cr")
comment(0x53e3, "TODO: At this point we have the level pointer for the successfully matched password in YX")

def decode_level_name_ptr(addr):
    cr_addr = addr
    while memory[cr_addr] != (ord('\r') ^ fixed_eor_key):
        cr_addr += 1
    ptr_addr = cr_addr + 1
    byte(addr, ptr_addr - addr)
    decoded_name = "".join(chr(memory[x] ^ fixed_eor_key) for x in range(addr, cr_addr))
    comment(addr, " ; EOR-encrypted: '%s'" % decoded_name, inline=True)
    word(ptr_addr)
    return ptr_addr + 2

pc = 0x544f
for i in range(16):
    pc = decode_level_name_ptr(pc)



# TODO: Some of these labels/constants are common with g.py and might benefit from factoring out into a shared file eventually
label(0xa90, "string_input_buffer")

comment(0x53c0, "TODO: This is comparing an eor-encrypted string - probably a level 'password' - against the string buffer. Not quite clear yet how this matches against multiple correct passwords.")

go()

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
