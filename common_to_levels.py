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

def find_sequence(addr, length, sequence):
    for a in range(addr, addr+length):
        i = 0
        found = True
        for s in sequence:
            if get_u8_runtime(RuntimeAddr(a+i)) != s:
                found = False
                break
            i += 1
        if found:
            return a
    return None

global room
global state
global tile
global room_comments

def write_room(x, y, w, h, v):
    global room

    for j in range(y, y+h):
        if j >= 24:
            break
        for i in range(x, x + w):
            if i >= 40:
                break
            room[j] = room[j][0:i] + v + room[j][i+1:]

def get_sprite_name(spriteid, sprite_dict):
    if spriteid in sprite_dict:
        return sprite_dict[spriteid]
    return "sprite ${0}".format(hex(spriteid)[2:])

def map_room(start_tracking, end_tracking, output_descriptions, sprite_dict):
    global room
    global state
    global tile
    global room_comments

    a = start_tracking
    while a < end_tracking:
        opcode  = get_u8_runtime(RuntimeAddr(a))
        operand = get_u8_runtime(RuntimeAddr(a+1))
        operand16 = 256*get_u8_runtime(RuntimeAddr(a+2)) + operand

        jmp_or_jsr = (opcode == 0x20) or (opcode == 0x4c)

        if opcode == 0x98:  # tya
            state["A"] = state["Y"]
            a += 1
        elif opcode == 0xa8: # tay
            state["Y"] = state["A"]
            a += 1
        elif opcode == 0x18: # clc
            state["carry"] = 0
            a += 1
        elif opcode == 0x69: # adc #
            state["A"] += operand + state["carry"]
            if state["A"] > 255:
                state["A"] = state["A"] - 256
                state["carry"] = 1
            else:
                state["carry"] = 0
            a += 2
        elif opcode == 0xa9: # lda #
            state["A"] = operand
            a += 2
        elif opcode == 0xa2: # ldx #
            state["X"] = operand
            a += 2
        elif opcode == 0xa0: # ldy #
            state["Y"] = operand
            a += 2
        elif (opcode == 0x85): # sta zp
            state[operand] = state["A"]
            a += 2
            # check if set source_sprite_memory_high?
            if operand == 0x41:
                # check if set to 'tile_all_set_pixels', in which case set the tile to a space.
                # e.g.
                #    lda #<tile_all_set_pixels                                         ; 3fe6: a9 a9
                #    sta source_sprite_memory_low                                      ; 3fe8: 85 40
                #    lda #>tile_all_set_pixels                                         ; 3fea: a9 0a
                #    sta source_sprite_memory_high                                     ; 3fec: 85 41
                tile_address = state[0x41]*256 + state[0x40]
                if tile_address == 0x0aa9:
                    tile = ' '
                else:
                    tile = '#'
        elif opcode == 0x8e: # stx addr
            state[operand16] = state["X"]
            a += 3
        elif opcode == 0x8c: # sty addr
            state[operand16] = state["Y"]
            a += 3
        elif opcode == 0xae: # ldx addr
            state["X"] = state[operand16]
            a += 3
        elif opcode == 0xac: # ldy addr
            state["Y"] = state[operand16]
            a += 3
        elif (opcode == 0x86): # stx zp
            state[operand] = state["X"]
            a += 2
        elif (opcode == 0x84): # sty zp
            state[operand] = state["Y"]
            a += 2
        elif (opcode == 0xc6): # dec zp
            state[operand] -= 1
            a += 2
        elif (opcode == 0xe6): # inc zp
            state[operand] += 1
            a += 2
        elif (opcode == 0xe8): # inx
            state["X"] += 1
            a += 1
        elif (opcode == 0xc8): # iny
            state["Y"] += 1
            a += 1
        elif (opcode == 0xca): # dex
            state["X"] -= 1
            a += 1
        elif (opcode == 0x88): # dey
            state["Y"] -= 1
            a += 1
        elif jmp_or_jsr and (operand16 == 0x1abb):
            if output_descriptions:
                room_comments[start_tracking] = "draw {0}x{1} rectangle at ({2},{3})".format(state[0x3c], state[0x3d], state["X"], state["Y"])
            write_room(state["X"], state["Y"], state[0x3c], state[0x3d], tile)
            a += 3
            start_tracking = a
        elif jmp_or_jsr and (operand16 == 0x1b90):
            # skip 'jsr draw_floor_walls_and_ceiling_around_solid_rock'
            if output_descriptions:
                comment(a, "carve the floor, walls and ceiling into the rock")
            a += 3
            start_tracking = a
        elif jmp_or_jsr and (operand16 == 0x1f57):
            # 'jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map'
            x = state["X"]
            y = state["Y"]
            if output_descriptions:
                comment(start_tracking, "draw {4} at ({0},{1}) of size ({2}x{3})".format(x, y, state[0x3c], state[0x3d], get_sprite_name(state["A"], sprite_dict)))
            write_room(x, y, state[0x3c], state[0x3d], 'O')
            a += 3
            start_tracking = a
        elif jmp_or_jsr and (operand16 == 0x1db9):
            x = state["X"]
            y = state["Y"]
            length = state["A"]
            if output_descriptions:
                comment(start_tracking, "draw rope at ({0},{1}) length {2}".format(x, y, length))
            # draw_rope
            write_room(x, y, 1, length, '|')
            a += 3
            start_tracking = a
        elif jmp_or_jsr and (operand16 == 0x1f4c):
            # jsr draw_sprite_a_at_cell_xy
            x = state["X"]
            y = state["Y"]
            if output_descriptions:
                comment(start_tracking, "draw {2} at ({0},{1})".format(x, y, get_sprite_name(state["A"], sprite_dict)))
            write_room(x, y, 1, 1, 'S')
            a += 3
            start_tracking = a
        elif jmp_or_jsr and (operand16 == 0x1ebb):
            # skip jsr write_a_single_value_to_cell_in_collision_map
            a += 3
            start_tracking = a
        elif jmp_or_jsr and (operand16 == 0x1e44):
            # skip write_value_to_a_rectangle_of_cells_in_collision_map
            a += 3
            start_tracking = a
        elif jmp_or_jsr and (operand16 == 0x138d):
            # skip jsr sprite_op
            a += 3
            start_tracking = a
        elif jmp_or_jsr and (operand16 == 0x12bb):
            # jsr start_room
            break
        elif jmp_or_jsr and (operand16 == 0x42fa):
            # skip jsr in datai
            break
        elif jmp_or_jsr:
            map_room(operand16, 0xffff, False, sprite_dict)
            a += 3
            start_tracking = a
        else:
            break

        if opcode == 0x4c: # jmp
            break


def level_room_data_table_entry(addr, s, sprite_dict):
    global room
    global state
    global tile
    global room_comments

    limit = 400     # bytes to search

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
    player_x = get_u8_binary(target1)
    player_y = get_u8_binary(target1+1)
    target3 = get_u16_binary(target1)
    entry(target2, room_n + "_code")
    start_tracking = target2
    if ground_fill(target2, (s == "0")):
        start_tracking += 8

    end_tracking = None
    # look for 'jsr game_update'
    a = find_sequence(target2, limit, [0x20, 0xda, 0x12])
    if a:
        label(a, room_n + "_game_update_loop")
        end_tracking = a

    if end_tracking:
        room = [" " * 40] * 24
        tile = '#'
        state = { "A": None, "X": None, "Y": None }
        room_comments = {}
        map_room(start_tracking, end_tracking, True, sprite_dict)

        # Show player start position
        write_room(player_x, player_y-1, 1, 1, "P")

        comment(target2, "\n".join(room))

    comment(start_tracking, "Draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision map.")
    for addr in room_comments:
        comment(addr, room_comments[addr])


def define_level(num_rooms, sprite_dict):
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

    password_addr = get_u16_binary(start+6)
    password = get_password(password_addr)

    entry(get_u16_binary(start+2), "level_specific_initialisation")
    entry(get_u16_binary(start+4), "level_specific_update")
    label(password_addr, "level_specific_password")

    stars(get_u16_binary(start+2), """Level initialisation

This is called whenever a new room is entered.""")
    stars(get_u16_binary(start+4), """Level update

This generally calls individual functions to update the logic in each room.

While updating the logic for a room, 'currently_updating_logic_for_room_index' is normally set. In practice this only actually needs to be set if it calls 'update_brazier_and_fire' or 'update_level_completion'""")
    blank(get_u16_binary(start+6))
    stars(get_u16_binary(start+6))
    comment(password_addr, "'" + password + "' EOR-encrypted with $cb")

    for room in range(num_rooms):
        level_room_data_table_entry(start + 10 + 2*room, str(room), sprite_dict)

    # Other common functions
    entry(0x395e, "define_envelope") # Duplicate of line in g.py, can't trivially put in common as it breaks imogen.py

def ground_fill(addr, make_label=True):
    if get_u8_runtime(RuntimeAddr(addr)) != 0xa9: # lda #
        return False
    if get_u8_runtime(RuntimeAddr(addr + 2)) != 0x85: # sta $41
        return False
    if get_u8_runtime(RuntimeAddr(addr + 3)) != 0x40:
        return False
    if get_u8_runtime(RuntimeAddr(addr + 4)) != 0xa9: # lda #
        return False
    if get_u8_runtime(RuntimeAddr(addr + 6)) != 0x85: # sta $41
        return False
    if get_u8_runtime(RuntimeAddr(addr + 7)) != 0x41: #
        return False

    expr(addr + 1, make_lo("ground_fill_2x2_top_left"))
    expr(addr + 5, make_hi("ground_fill_2x2_top_left"))
    tile_addr = get_u8_runtime(RuntimeAddr(addr + 1))
    tile_addr += get_u8_runtime(RuntimeAddr(addr + 5)) << 8

    if make_label:
        tile_bitmap2x2(tile_addr, "ground_fill_2x2")
    return True

def ldx_ldy_jsr_play_sound_yx(jsr_runtime_addr, s):
    assert get_u8_runtime(RuntimeAddr(jsr_runtime_addr - 4)) == 0xa2 # ldx #
    sound_addr_lo = get_u8_runtime(RuntimeAddr(jsr_runtime_addr - 3))
    assert get_u8_runtime(RuntimeAddr(jsr_runtime_addr - 2)) == 0xa0 # ldy #
    sound_addr_hi = get_u8_runtime(RuntimeAddr(jsr_runtime_addr - 1))
    sound_addr = (sound_addr_hi << 8) | sound_addr_lo
    sound(sound_addr, s)
    expr(jsr_runtime_addr - 3, make_lo(s))
    expr(jsr_runtime_addr - 1, make_hi(s))

def ldx_ldy_jsr_define_envelope(jsr_runtime_addr, s):
    assert get_u8_runtime(RuntimeAddr(jsr_runtime_addr - 4)) == 0xa2 # ldx #
    envelope_addr_lo = get_u8_runtime(RuntimeAddr(jsr_runtime_addr - 3))
    assert get_u8_runtime(RuntimeAddr(jsr_runtime_addr - 2)) == 0xa0 # ldy #
    envelope_addr_hi = get_u8_runtime(RuntimeAddr(jsr_runtime_addr - 1))
    envelope_addr = (envelope_addr_hi << 8) | envelope_addr_lo
    envelope(envelope_addr, s)
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
