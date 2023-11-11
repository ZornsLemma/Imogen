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
comment(0x5407, "'Accepted\\r' EOR-encrypted with $cb")
label(0x5407, "accepted_encrypted_string")
expr(0x53f3, make_lo("accepted_encrypted_string"))
expr(0x53f5, make_hi("accepted_encrypted_string"))

fixed_eor_key = 0xcb
constant(fixed_eor_key, "fixed_eor_key")
label(0x5446, "unknown_encrypted_string")
expr(0x5438, make_lo("unknown_encrypted_string"))
expr(0x543a, make_hi("unknown_encrypted_string"))
expr(0x5416, "vdu_cr")
expr(0x5433, "vdu_lf")
expr(0x5413, "fixed_eor_key")
expr(0x542c, "fixed_eor_key")

label(0x544f, "password_ptr_table")
expr(0x53c7, make_lo("password_ptr_table"))
expr(0x53cb, make_hi("password_ptr_table"))
expr(0x53d9, "vdu_cr")
comment(0x53e3, "TODO: At this point we have the level pointer for the successfully matched password in YX")
entry(0x5410, "skip_rest_of_entry")
entry(0x5414, "this_entry_doesnt_match")
comment(0x541b, "effectively adds l0070+1 as cmp # above set Z and thus C: TODO: correct?", inline=True)
comment(0x542f, "None of the passwords in the table matched.")

comment(0x5653, "'ESC 64': Reset printer to its power up state")
comment(0x5667, "'10': Line feed")
comment(0x5671, "'ESC $6C $11': ?")
comment(0x568f, "'ESC $41 $08': Set line spacing to 8/72 inch")
comment(0x56b9, "'ESC 42 2A 05 40': Turn on graphics mode, followed by 16389 characters")
comment(0x56ad, "start of screen memory")
expr(0x55d0, "opcode_jmp")
comment(0x55d1, "For break effect: *FX 200,1")

label(0x0070, "screen_address_low")
label(0x0071, "screen_address_high")
label(0x0072, "counter")
label(0x0073, "screendump_data_byte")
comment(0x564e, "turn on printer output", inline=True)
label(0x56b9, "turn_on_graphics_mode_for_a_row_of_graphics")
label(0x56f8, "get_byte_of_screen_data_loop")
comment(0x5708, "write byte of data")
label(0x0074, "invert_screen_dump_flag")
label(0x56f4, "eight_bytes_of_screen_dump_loop")
comment(0x5717, "move screen address on by eight")
label(0x004c, "game_area_screen_address_high")
comment(0x5722, "when we reach the game area of the screen, stop inverting the output")
label(0x56f2, "screendump_character_row_loop")
label(0x5703, "skip1")
label(0x572c, "skip2")
label(0x56ef, "add_another_row_of_graphics_characters")
comment(0x5740, "'10': Line feed")
comment(0x574a, "'ESC $40': reset printer")
comment(0x575e, "twelve line feeds")
label(0x5760, "line_feed_loop")
comment(0x5777, "printer off")
comment(0x576d, "beep")

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
comment(0x552e, "TODO: Some intriguing secret passwords here. Now I see this, I have a vague recollection of The Micro User or Acorn User printing some/all of these (See https://archive.org/details/micro-user-058/page/n52/mode/1up), but still cool to find them for myself. :-)")

comment(0x5642, "A screen dump routine for Epson-compatible printers")

comment(0x53c0, "Check a password entered by the user at string_buffer against the list of EOR-encrypted paswords at password_ptr_table and invoke the corresponding handler if a match is found. Otherwise generate an error.")

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
