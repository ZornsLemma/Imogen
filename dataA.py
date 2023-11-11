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

label(0x449a, "inverse_power_of_2_table")
hexadecimal(0x449a, 8)
byte(0x449a, 8)

entry(0x3b29, "some_code1")
entry(0x3d21, "some_data1")
entry(0x3f8b, "some_code2")
entry(0x3fd9, "some_code3")
label(0x4052, "some_data2")
entry(0x424f, "some_code4")

expr(0x3b0f, make_lo("some_data3"))
expr(0x3b13, make_hi("some_data3"))
label(0x4486, "some_data3")
expr(0x3fe7, make_lo("eight_entry_table2"))
expr(0x3feb, make_hi("eight_entry_table2"))

label(0x44A6, "sprite_data")
word(0x3ad5)
expr(0x3ad5, "sprite_data - level_data")

comment(0x3ae7, "'SAXOPHOBIA\\r' EOR-encrypted with $cb")

entry(0x3b04, "developer_mode_not_active")

comment(0x3adf, "This is a table of four words, used by code just below 'skip_adding_completion_spell_to_toolbar' where the l030-th element *plus 2* is called. TODO: Why +2? The code at c129b suggests the two bytes *at* the address in this table is used as an address of some kind.")
comment(0x3adf, "TODO: Speculation - could this be code to draw each of the screens making up the level? AFAICT saxophobia does have four screens. I assume the *number* of entries in this table is stored somewhere, but I can't see it. It is also possible that because entering rooms is handled by level specific code, the player always starts in room 0 and there is no need to have a byte of data representing the maximum room number.")
def level_header_data_table_entry(addr, s):
    word(addr)
    expr(addr, s + "_data_ptr")
    target1 = get_u16_binary(addr)
    target2 = target1 + 2
    label(target1, s + "_data_ptr")
    word(target1)
    target3 = get_u16_binary(target1)
    label(target3, s + "_data")
    expr(target1, s + "_data")
    entry(target2, s + "_code")
level_header_data_table_entry(0x3adf, "level_thing_1")
level_header_data_table_entry(0x3ae1, "level_thing_2")
level_header_data_table_entry(0x3ae3, "level_thing_3")
level_header_data_table_entry(0x3ae5, "level_thing_4")

# TODO: Possibly wire substitute_constants() in for find_or_create_menu_slot_in_A?
sprite_dict = {
    0xd3: "spriteid_saxophone",
}
substitute_constants("jsr find_or_create_menu_slot_for_A", 'a', sprite_dict, True)
#for addr, s in sprite_dict.items():
#    constant(addr, s)

comment(0x3f7b, "TODO: I suspect this is handling 'collection of the saxophone'")
comment(0x3b04, "clear_128_bytes_at_l09ef (which is called by start_game) will have zeroed saxophone_collected_flag. TODO: It's not clear to me why it would be set here under normal circumstances - what would go wrong if we just assumed l0a00==0 here?")
label(0xa00, "saxophone_collected_flag")

comment(0x3b35, "TODO: Setting a breakpoint in b-em shows l0042 is 0 here")
comment(0x3b35, "TODO: Setting a breakpoint in b-em shows some_data3_ptr ($40) is $4486 here")
comment(0x3b35, "TODO: Setting a breakpoint in b-em shows address1_low ($70) is $00 here")
comment(0x3b35, "TODO: Setting a breakpoint in b-em shows address1_high ($71) is $80 here")

comment(0x3b29, "TODO: I suspect this next block up to and including the jsr is drawing the 'wall' pattern on the top two rows of the opening screen")

go()

# vi: tw=100

# Local Variables:
# fill-column: 100
# End:
