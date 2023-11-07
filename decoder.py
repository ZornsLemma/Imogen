from pathlib import Path
import argparse
import sys
import struct

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
        return str(i - 256)
    return str(i)

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

def decode(infile, outfile, level_flag):

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

    with open(outfile, 'w') as fout:
        sprites = []
        num_sprites = (data[file_offset] + 256*data[file_offset + 1]) // 2
        for i in range(num_sprites):
            offset = file_offset + data[file_offset + i*2] + 256*data[file_offset + 1 + i*2]
            sprites.append(offset)

        for i in range(num_sprites):
            start = sprites[i]
            if i < (num_sprites-1):
                end = sprites[i+1]
            else:
                end = file_size

            print("Sprite " + hex(sprite_index_offset + i) + " (at file offset " + hex(start) + ")", file=fout)
            if (start != end):
                width = int(data[start+2])
                height = 1+int(data[start+3])
                print("    Offset (" + sbyte(data[start]) + "," + sbyte(data[start+1]) + "), size " + str(width) + "x" + str(height-1), file=fout)

                start += 4
                start_bit = 128
                lines = [""]*height
                for x in range(width):
                    for y in range(height):
                        start, start_bit, sprite_bit = read_bit(data, start, start_bit)
                        start, start_bit, mask_bit = read_bit(data, start, start_bit)

                        if not sprite_bit:
                            if mask_bit:
                                lines[y] += '#'
                            else:
                                lines[y] += '.'
                        else:
                            lines[y] += ' '
                            if mask_bit:
                                for y2 in range(y+1,height):
                                    lines[y2] += ' '
                                break

                lines = list(reversed(lines))
                for line in lines:
                    print(line, file=fout)
                print("", file=fout)


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
  -l   --level                input is a level file
""", file=venue)

if __name__ == '__main__':
    parser = MyParser(
                    prog="decoder",
                    description="Converts binary sprite file from Imogen to text",
                    epilog="TobyLobster, 2023")

    parser.add_argument('-i', '--input',            help="input binary filepath")
    parser.add_argument('-o', '--output',           help="output text filepath")
    parser.add_argument('-l', '--level',            help="input is a level file", action=argparse.BooleanOptionalAction, default=False)

    if len(sys.argv)==1:
        parser.print_help(sys.stderr)
        sys.exit(1)

    args = parser.parse_args()

    if (args.input != None) and (args.output != None):
        if args.input == args.output:
            error("Input and output are the same")
            exit(-2)
        decode(args.input, args.output, args.level)
        exit(0)
    else:
        error("Need input and output parameters")

    exit(-1)
