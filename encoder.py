from pathlib import Path
import argparse
import sys
import struct
import json

def error(message):
    print("ERROR:", message, file=sys.stderr)

def write_uint(f, value, num_bytes = 4):
    if num_bytes == 4:
        f.write(struct.pack('<I', value))
        return
    if num_bytes == 2:
        f.write(struct.pack('<H', value))
        return
    if num_bytes == 1:
        f.write(struct.pack('<B', value))
        return
    raise ValueError('Trying to write {0} bytes when writing an unsigned integer, which is unsupported.'.format(num_bytes))
    return 0

def store_signed(i):
    if i < 0:
        return 256 + i
    return i

def is_rest_of_column_empty(sprite, x, y):
    for i in range(0,y+1):
        pixel = sprite['pixels'][i][x]
        if pixel != ' ':
            return False
    return True


def encode(infile, outfile):

    with open(infile) as f:
        text = f.read()

    json_data = json.loads(text)

    # Start the offset at the end of the header offset table
    offset = 2*len(json_data['sprites'])
    if 'level order data' in json_data:
        offset += 2

    data_table = []

    for entry in json_data:
        if entry == 'level order data':
            level = json_data['level order data']
            by = bytearray()
            by.append(int(level['developer_flags'], 0))
            by.append(ord(level['first level']))
            by.extend(bytes(level['level order'], 'utf-8'))
            data_table.append( {'offset': offset, 'encoded pixels': by} )
            offset += len(by)
        elif entry == 'sprites':
            # encode the pixels for each sprite
            for sprite in json_data['sprites']:
                pixels = []
                by = bytearray()
                if 'sprite width' in sprite:
                    by.append(store_signed(sprite['offset x']))
                    by.append(store_signed(sprite['offset y']))
                    by.append(sprite['sprite width'])
                    by.append(sprite['sprite height'])

                    sprite['encoded_pixels'] = []
                    for x in range(sprite['sprite width']):
                        for y in range(sprite['sprite height']-1, -1, -1):

                            if is_rest_of_column_empty(sprite, x, y):
                                pixels.append(3)
                                break
                            else:
                                pixel = sprite['pixels'][y][x]
                                if pixel == '#':
                                    pixels.append(0)
                                elif pixel == '.':
                                    pixels.append(1)
                                else:
                                    pixels.append(2)
                        # make sure we add a column terminator. We could lose this (to save 69 bytes on the SPRDATA, at the cost of another runtime check in the sprite plotting code)
                        if pixels[-1] != 3:
                            pixels.append(3)

                    while ((len(pixels) & 3) != 0):
                        pixels.append(0)

                    for i in range(len(pixels) // 4):
                        j = i*4
                        b = 64*pixels[j] + 16*pixels[j+1] + 4*pixels[j+2] + pixels[j+3];
                        by.append(b)

                data_table.append( {'offset': offset, 'encoded pixels': by} )
                offset += len(by)

    with open(outfile, "wb") as f:
        for entry in data_table:
            write_uint(f, entry['offset'], num_bytes=2)
        for entry in data_table:
            f.write(entry['encoded pixels'])

class MyParser(argparse.ArgumentParser):
    def error(self, message):
        sys.stderr.write('error: %s\n' % message)
        self.print_help()
        sys.exit(2)

    def print_help(self, venue=sys.stdout):
        print("""usage: encoder.py <options>

Converts json file containing sprite information to a binary file for Imogen.

options:
  -h   --help                 show this help message and exit
  -i   --input                input file (json file)
  -o   --output               output file (binary sprite file)
""", file=venue)

if __name__ == '__main__':
    parser = MyParser(
                    prog="encoder",
                    description="Converts binary sprite file from Imogen to text",
                    epilog="TobyLobster, 2023")

    parser.add_argument('-i', '--input',            help="input json filepath")
    parser.add_argument('-o', '--output',           help="output binary filepath")

    if len(sys.argv)==1:
        parser.print_help(sys.stderr)
        sys.exit(1)

    args = parser.parse_args()

    if (args.input != None) and (args.output != None):
        if args.input == args.output:
            error("Input and output are the same")
            exit(-2)
        encode(args.input, args.output)
        exit(0)
    else:
        error("Need input and output parameters")

    exit(-1)
