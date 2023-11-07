from commands import *
import acorn
import re
from common import *
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

comment(0x53c0, "Check a password entered by the user at string_buffer against the list of EOR-encrypted paswords at level_name_ptr_table and invoke the corresponding handler if a match is found. Otherwise generate an error.")

# TODO: DELETE? expr(0x5620, "game_state_flag_have_spell")
#
label(0x563a, "power_of_2_table")
hexadecimal(0x563a, 8)

expr(0x5597, "first_level_letter")
expr(0x559c, "last_level_letter")

entry(0x544e, "return1")

go()

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
