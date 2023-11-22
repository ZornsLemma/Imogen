#!/bin/bash
set -e
export PYTHONPATH+=$HOME/src/py8dis/py8dis

mkdir -p build

# Imogen
# TODO: Mix of acme and beebasm isn't ideal. I may just want to switch to acme later. For now I'm trying to get my head round the relocation in 'g', and py8dis's handling of this in beebasm is broken, so let's just stick with acme at least until I'm more confident I know what I want.
python3 imogen.py > imogen.asm
beebasm -o build/imogen.out -i imogen.asm -v > build/imogen.lst
cmp orig/imogen-trailing-mc-3900.dat build/imogen.out || echo imogen.asm rebuild failed

# G (main game)
python3 g.py --acme > temp.asm
cp temp.asm g.asm
rm temp.asm
acme -o build/g.out --report build/g.lst g.asm
cmp orig/g.dat build/g.out || echo g.asm rebuild failed

# Auxcode
python3 auxcode.py --acme > auxcode.asm
acme -o build/auxcode.out --report build/auxcode.lst auxcode.asm
cmp orig/auxcode.dat build/auxcode.out || echo auxcode.asm rebuild failed

# Data A
python3 dataA.py --acme > dataA.asm
acme -o build/dataA.out --report build/dataA.lst dataA.asm
cmp orig/dataA.dat build/dataA.out || echo dataA.asm rebuild failed

# Data B
python3 dataB.py --acme > dataB.asm
acme -o build/dataB.out --report build/dataB.lst dataB.asm
cmp orig/dataB.dat build/dataB.out || echo dataB.asm rebuild failed

# Data C
python3 dataC.py --acme > dataC.asm
acme -o build/dataC.out --report build/dataC.lst dataC.asm
cmp orig/dataC.dat build/dataC.out || echo dataC.asm rebuild failed



# Encode sprite data from json text to binary
python3 encoder.py -i sprdata.txt -o build/sprdata
cmp orig/sprdata.dat build/sprdata || echo sprdata rebuild failed

python3 encoder.py -i icodata.txt -o build/icodata
cmp orig/icodata.dat build/icodata || echo icodata rebuild failed

python3 encoder.py -i levelA.txt -o build/levelA
python3 encoder.py -i levelB.txt -o build/levelB
python3 encoder.py -i levelC.txt -o build/levelC
python3 encoder.py -i levelD.txt -o build/levelD
python3 encoder.py -i levelE.txt -o build/levelE
python3 encoder.py -i levelF.txt -o build/levelF
python3 encoder.py -i levelG.txt -o build/levelG
python3 encoder.py -i levelH.txt -o build/levelH
python3 encoder.py -i levelI.txt -o build/levelI
python3 encoder.py -i levelJ.txt -o build/levelJ
python3 encoder.py -i levelK.txt -o build/levelK
python3 encoder.py -i levelL.txt -o build/levelL
python3 encoder.py -i levelM.txt -o build/levelM
python3 encoder.py -i levelN.txt -o build/levelN
python3 encoder.py -i levelO.txt -o build/levelO
python3 encoder.py -i levelP.txt -o build/levelP
