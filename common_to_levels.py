from commands import *
import acorn
from common import *
from memorymanager import get_u8_runtime, RuntimeAddr
acorn.bbc()

global sprite_dict

def set_sprite_dict(sd):
    global sprite_dict
    sprite_dict = sd

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
    comment(target1, """*************************************************************************************

Room """ + s + """ initialisation

*************************************************************************************""")
    comment(target1, "initial player X cell", inline=True)
    comment(target1 + 1, "initial player Y cell", inline=True)
    target3 = get_u16_binary(target1)
    #label(target3, room_n + "_data")
    #expr(target1, room_n + "_data")
    entry(target2, room_n + "_initialisation_code")


def define_level(num_rooms):
    start = 0x3ad5
    comment(start, """*************************************************************************************

Level header

*************************************************************************************""")
    word(start)
    expr(start, "sprite_data - level_data")
    comment(start, "offset to sprite data", inline=True)
    comment(start+2, "address of level initialisation code", inline=True)
    comment(start+4, "address of level update code", inline=True)
    comment(start+6, "address of level password", inline=True)
    comment(start+10, "table of room data/initialisation code", inline=True)

    sprite_data = start + get_u16_binary(start)
    label(sprite_data, "sprite_data")

    word(start+2)
    expr(start+2, "level_specific_initialisation")
    word(start+4)
    expr(start+4, "level_specific_update")
    word(start+6)
    expr(start+6, "level_specific_password")
    entry(get_u16_binary(start+2), "level_specific_initialisation")
    entry(get_u16_binary(start+4), "level_specific_update")
    label(get_u16_binary(start+6), "level_specific_password")

    comment(get_u16_binary(start+2), "*************************************************************************************")
    comment(get_u16_binary(start+4), """*************************************************************************************

Level update

This calls individual functions to update the logic in each room.

While updating the logic for a room, 'currently_updating_logic_for_room_index' is normally set. In practice it only actually needs to be set if it calls 'update_brazier_and_fire' or 'update_level_completion'

*************************************************************************************""")

    for room in range(num_rooms):
        level_room_data_table_entry(start + 10 + 2*room, str(room))


