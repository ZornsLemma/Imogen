#!/bin/bash
set -e
export PYTHONPATH=$HOME/src/py8dis/py8dis
python3 imogen.py > imogen.asm
beebasm -o imogen.out -i imogen.asm -v > imogen.lst
cmp tmp/imogen-trailing-mc-3900.dat imogen.out || echo imogen.asm rebuild failed
