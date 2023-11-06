from commands import *
import acorn
import re
acorn.bbc()

config.set_label_references(False)

constant(10, "vdu_lf")
constant(13, "vdu_cr")

# TODO: See mono_handler and colour_handler in auxcode.asm
# TODO: Copies of these in both g.py and auxcode.py
# TODO: "pending" is a guess
label(0x1765, "allow_colour_variation")
label(0x175d, "pending_toolbar_colour")
label(0x175e, "toolbar_colour")
label(0x175f, "pending_gameplay_area_colour")
label(0x1760, "gameplay_area_colour")


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
entry(0x5410, "skip_rest_of_entry")
entry(0x5414, "this_entry_doesnt_match")
comment(0x541b, "effectively adds l0070+1 as cmp # above set Z and thus C: TODO: correct?", inline=True)
comment(0x542f, "None of the passwords in the table matched.")

def decode_level_name_ptr(addr):
    cr_addr = addr
    while memory[cr_addr] != (ord('\r') ^ fixed_eor_key):
        cr_addr += 1
    ptr_addr = cr_addr + 1
    byte(addr, ptr_addr - addr)
    decoded_name = "".join(chr(memory[x] ^ fixed_eor_key) for x in range(addr, cr_addr))
    comment(addr, "EOR-encrypted string: '%s'" % decoded_name, inline=True)
    word(ptr_addr)
    ptr_value = get_u16_binary(ptr_addr)
    if ptr_value == 0x5595:
        expr(ptr_addr, "normal_level_handler")
    else:
        handler_name = decoded_name.lower().replace("-", "_") + "_handler"
        expr(ptr_addr, handler_name)
        entry(ptr_value, handler_name)
    return ptr_addr + 2

entry(0x5595, "normal_level_handler")
pc = 0x544f
while memory[pc] != fixed_eor_key:
    pc = decode_level_name_ptr(pc)
byte(pc)
comment(pc, "0 EOR $CB marks the end of the table", inline=True)
comment(0x552e, "TODO: Some intriguing secret passwords here. Now I see this, I have a vague recollection of The Micro User or Acorn User printing some/all of these, but still cool to find them for myself. :-)")

comment(0x5642, "TODO: Presumably a screen dump routine for Epson-compatible printers")

entry(0x561c, "gimme_handler")
expr(0x5592, "gimme_handler")



# TODO: Some of these labels/constants are common with g.py and might benefit from factoring out into a shared file eventually
label(0xa90, "string_input_buffer")

comment(0x53c0, "TODO: This is comparing an eor-encrypted string - probably a level 'password' - against the string buffer. Not quite clear yet how this matches against multiple correct passwords.")

go()

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
