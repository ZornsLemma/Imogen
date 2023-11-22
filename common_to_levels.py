from commands import *
import acorn
from common import *
from memorymanager import get_u8_runtime, RuntimeAddr
acorn.bbc()

global sprite_dict

def set_sprite_dict(sd):
    global sprite_dict
    sprite_dict = sd

    substitute_constants("jsr draw_sprite_a_at_cell_xy", 'a', sprite_dict, True)
    substitute_constants("jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map", 'a', sprite_dict, True)
    substitute_constants("jsr find_or_create_menu_slot_for_A", 'a', sprite_dict, True)
    #substitute_constants("sta sprite_op_flags", 'a', sprite_op_flags_dict, True)

def spriteid(start_addr, end_addr=None):
    global sprite_dict

    if end_addr == None:
        end_addr = start_addr+1
    for addr in range(start_addr, end_addr):
        v = get_u8_runtime(memorymanager.RuntimeAddr(addr))
        if v in sprite_dict:
            byte(addr)
            expr(addr, sprite_dict[v])


def level_room_data_table_entry(addr, s):
    room_n = "room_" + s
    word(addr)
    expr(addr, room_n + "_data")
    target1 = get_u16_binary(addr)
    target2 = target1 + 2
    label(target1, room_n + "_data")
    byte(target1)
    byte(target1 + 1)
    decimal(target1)
    decimal(target1 + 1)
    stars(target1, "Room " + s + " initialisation and game loop")
    comment(target1, "initial player X cell", inline=True)
    comment(target1 + 1, "initial player Y cell", inline=True)
    target3 = get_u16_binary(target1)
    #label(target3, room_n + "_data")
    #expr(target1, room_n + "_data")
    entry(target2, room_n + "_code")


def define_level(num_rooms):
    start = 0x3ad5
    stars(start, "Level header")
    word(start)
    expr(start, "sprite_data - level_data")
    comment(start, "offset to sprite data", inline=True)
    comment(start+2, "address of level initialisation code", inline=True)
    comment(start+4, "address of level update code", inline=True)
    comment(start+6, "address of level password", inline=True)
    comment(start+10, "table of room data/initialisation code", inline=True)

    sprite_data = start + get_u16_binary(start)
    label(sprite_data, "sprite_data")
    r = memorymanager.get_entire_load_range()
    end = r[1]
    if end > sprite_data:
        byte(sprite_data, end - sprite_data)

    word(start+2)
    expr(start+2, "level_specific_initialisation")
    word(start+4)
    expr(start+4, "level_specific_update")
    word(start+6)
    expr(start+6, "level_specific_password")
    password = ""
    start_addr = get_u16_binary(start+6)
    addr = start_addr
    while True:
        b = get_u8_runtime(RuntimeAddr(addr))
        b = b ^ 0xcb
        if (b < 32) or (b >= 127):
            password += "[{:02x}]".format(b)
        else:
            password += chr(b)
        addr += 1

        if b == 0x0d:
            break

    entry(get_u16_binary(start+2), "level_specific_initialisation")
    entry(get_u16_binary(start+4), "level_specific_update")
    label(start_addr, "level_specific_password")

    stars(get_u16_binary(start+2), """Level initialisation

This is called whenever a new room is entered.""")
    stars(get_u16_binary(start+4), """Level update

This generally calls individual functions to update the logic in each room.

While updating the logic for a room, 'currently_updating_logic_for_room_index' is normally set. In practice this only actually needs to be set if it calls 'update_brazier_and_fire' or 'update_level_completion'""")
    blank(get_u16_binary(start+6))
    stars(get_u16_binary(start+6))
    comment(start_addr, "'" + password + "' EOR-encrypted with $cb")

    for room in range(num_rooms):
        level_room_data_table_entry(start + 10 + 2*room, str(room))

    # Other common functions
    entry(0x395e, "define_envelope") # Duplicate of line in g.py, can't trivially put in common as it breaks imogen.py

def ldx_ldy_jsr_play_sound_yx(jsr_runtime_addr, s):
    assert get_u8_runtime(RuntimeAddr(jsr_runtime_addr - 4)) == 0xa2 # ldx #
    sound_addr_lo = get_u8_runtime(RuntimeAddr(jsr_runtime_addr - 3))
    assert get_u8_runtime(RuntimeAddr(jsr_runtime_addr - 2)) == 0xa0 # ldy #
    sound_addr_hi = get_u8_runtime(RuntimeAddr(jsr_runtime_addr - 1))
    sound_addr = (sound_addr_hi << 8) | sound_addr_lo
    sound(sound_addr, s)
    expr(jsr_runtime_addr - 3, make_lo(s))
    expr(jsr_runtime_addr - 1, make_hi(s))

def remove_sprite_data(result):
    m1 = re.search('^sprite_data', result, re.MULTILINE)
    m2 = re.search('^pydis_end', result, re.MULTILINE)
    if m1:
        if m2:
            start = m1.span()[1]
            end = m2.start()
            result = result[0:start] + "\n" + result[end:]
    return(result)
