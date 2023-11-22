from pathlib import Path
import argparse
import sys
import struct
import json

def error(message):
    print("ERROR:", message, file=sys.stderr)

def read_uint(f, num_bytes = 4):
    if num_bytes == 4:
        return struct.unpack('<I',f.read(4))[0]
    if num_bytes == 2:
        return struct.unpack('<H',f.read(2))[0]
    if num_bytes == 1:
        return struct.unpack('<B',f.read(1))[0]
    raise ValueError('Trying to read {0} bytes when reading an unsigned integer, which is unsupported.'.format(num_bytes))
    return 0

def sbyte(i):
    if i >= 128:
        return i - 256
    return i

def read_bit(data, start, start_bit):
    if data[start] & start_bit:
        v = 1
    else:
        v = 0

    start_bit //= 2
    if start_bit == 0:
        start_bit = 128
        start += 1
    return (start, start_bit, v)

def decode(infile, outfile, level_flag, index_zero_is_level_order_data):

    with open(infile, 'rb') as fin:
        data = fin.read()

    file_size = len(data)
    file_offset = 0
    sprite_index_offset = 0
    if level_flag:
        file_offset = data[0] + 256*data[1]
        if file_offset >= file_size:
            return
        sprite_index_offset = 200

    sprites = []
    num_sprites = (data[file_offset] + 256*data[file_offset + 1]) // 2
    for i in range(num_sprites):
        offset = file_offset + data[file_offset + i*2] + 256*data[file_offset + 1 + i*2]
        sprites.append(offset)

    sprites.append(file_size)

    spr_data = {}
    sprite_array = []
    for i in range(num_sprites):
        start = sprites[i]
        if i < (num_sprites-1):
            end = sprites[i+1]
        else:
            end = file_size

        if (i==0) and index_zero_is_level_order_data:
            spr_data["level order data"] = {
                "developer_flags": hex(data[start]),
                "first level": chr(data[start+1]),
                "level order": "".join([chr(data[x]) for x in range(start+2, start+18)])
            }
        else:
            sprite = { "sprite number": hex(sprite_index_offset + i) }
            if (start != end):
                width = int(data[start+2])
                height = 1+int(data[start+3])
                sprite["offset x"] = sbyte(data[start])
                sprite["offset y"] = sbyte(data[start+1])
                sprite["sprite width"] = width
                sprite["sprite height"] = height-1

                start += 4
                start_bit = 128
                lines = [""]*height
                for x in range(width):
                    for y in range(height):
                        start, start_bit, sprite_bit = read_bit(data, start, start_bit)
                        start, start_bit, mask_bit = read_bit(data, start, start_bit)

                        if not sprite_bit:
                            if mask_bit:
                                lines[y] += '.'
                            else:
                                lines[y] += '#'
                        else:
                            lines[y] += ' '
                            if mask_bit:
                                for y2 in range(y+1,height):
                                    lines[y2] += ' '
                                break

                lines = list(reversed(lines))
                lines = lines[1:]       # Remove first line

                # move to start of next byte
                if start_bit != 128:
                    start += 1

                # Check if there are reserved bytes, rather than a standard given set of pixel lines with a width, height
                length_of_reserved_bytes = (sprites[i+1] - start)
                if length_of_reserved_bytes > 0:
                    if len(lines) == 0:
                        # set zeros when we have reserved space
                        lines = '####' * length_of_reserved_bytes

                sprite["pixels"] = lines

            sprite_array.append(sprite)
    spr_data["sprites"] = sprite_array

    with open(outfile, 'w') as fout:
        print(json.dumps(spr_data, indent=4), file=fout)


class MyParser(argparse.ArgumentParser):
    def error(self, message):
        sys.stderr.write('error: %s\n' % message)
        self.print_help()
        sys.exit(2)

    def print_help(self, venue=sys.stdout):
        print("""usage: decoder.py <options>

Converts binary sprite file from Imogen to text.

options:
  -h   --help                 show this help message and exit
  -i   --input                input file (binary sprite file)
  -o   --output               output file (txt file)
  -z   --zero                 index zero is level order data
  -l   --level                input is a level file
""", file=venue)

if __name__ == '__main__':
    parser = MyParser(
                    prog="decoder",
                    description="Converts binary sprite file from Imogen to text",
                    epilog="TobyLobster, 2023")

    parser.add_argument('-i', '--input',            help="input binary filepath")
    parser.add_argument('-o', '--output',           help="output text filepath")
    parser.add_argument('-z', '--zero',             help="index zero is level order data", action=argparse.BooleanOptionalAction, default=False)
    parser.add_argument('-l', '--level',            help="input is a level file", action=argparse.BooleanOptionalAction, default=False)

    if len(sys.argv)==1:
        parser.print_help(sys.stderr)
        sys.exit(1)

    args = parser.parse_args()

    if (args.input != None) and (args.output != None):
        if args.input == args.output:
            error("Input and output are the same")
            exit(-2)
        decode(args.input, args.output, args.level, args.zero)
        exit(0)
    else:
        error("Need input and output parameters")

    exit(-1)
