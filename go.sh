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

# Decode sprite data
python3 decoder.py -i orig/sprdata.dat -o sprdata.txt
python3 decoder.py -i orig/icodata.dat -o icodata.txt -z

# Decode levels (sprites only so far)
python3 decoder.py -i orig/dataA.dat -o levelA.txt -l
python3 decoder.py -i orig/dataB.dat -o levelB.txt -l
python3 decoder.py -i orig/dataC.dat -o levelC.txt -l
python3 decoder.py -i orig/dataD.dat -o levelD.txt -l
python3 decoder.py -i orig/dataE.dat -o levelE.txt -l
python3 decoder.py -i orig/dataF.dat -o levelF.txt -l
python3 decoder.py -i orig/dataG.dat -o levelG.txt -l
python3 decoder.py -i orig/dataH.dat -o levelH.txt -l
python3 decoder.py -i orig/dataI.dat -o levelI.txt -l
python3 decoder.py -i orig/dataJ.dat -o levelJ.txt -l
python3 decoder.py -i orig/dataK.dat -o levelK.txt -l
python3 decoder.py -i orig/dataL.dat -o levelL.txt -l
python3 decoder.py -i orig/dataM.dat -o levelM.txt -l
python3 decoder.py -i orig/dataN.dat -o levelN.txt -l
python3 decoder.py -i orig/dataO.dat -o levelO.txt -l
python3 decoder.py -i orig/dataP.dat -o levelP.txt -l
python3 decoder.py -i orig/dataQ.dat -o levelQ.txt -l
