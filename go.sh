#!/bin/bash
set -e
export PYTHONPATH=$HOME/src/py8dis/py8dis
# TODO: Mix of acme and beebasm isn't ideal. I may just want to switch to acme later. For now I'm trying to get my head round the relocation in 'g', and py8dis's handling of this in beebasm is broken, so let's just stick with acme at least until I'm more confident I know what I want.
python3 imogen.py > imogen.asm
beebasm -o imogen.out -i imogen.asm -v > imogen.lst
cmp tmp/imogen-trailing-mc-3900.dat imogen.out || echo imogen.asm rebuild failed
python3 g.py --acme > g.asm
acme -o g.out --report g.lst g.asm
cmp tmp/g.dat g.out || echo g.asm rebuild failed

# TODO: Move the extracted original binaries into a non-tmp directory and check in?
