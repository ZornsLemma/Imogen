#!/bin/bash
set -e
export PYTHONPATH+=$HOME/src/py8dis/py8dis

mkdir -p build
mkdir -p source
mkdir -p disk

# Imogen
# TODO: Mix of acme and beebasm isn't ideal. I may just want to switch to acme later. For now I'm trying to get my head round the relocation in 'g', and py8dis's handling of this in beebasm is broken, so let's just stick with acme at least until I'm more confident I know what I want.
python3 imogen.py > source/imogen.asm
beebasm -o build/imogen.out -i source/imogen.asm -v > build/imogen.lst
cmp orig/imogen-trailing-mc-3900.dat build/imogen.out || echo imogen.asm rebuild failed

# G (main game)
python3 g.py --acme > build/temp.asm
cp build/temp.asm source/g.asm
rm build/temp.asm
acme -o disk/g --report build/g.lst source/g.asm
cmp orig/g.dat disk/g || echo g.asm rebuild failed

# Auxcode
python3 auxcode.py --acme > source/auxcode.asm
acme -o disk/auxcode --report build/auxcode.lst source/auxcode.asm
cmp orig/auxcode.dat disk/auxcode || echo auxcode.asm rebuild failed

# Take original sprite binaries and create text (json) versions
#python3 decoder.py -i orig/dataA.dat -o source/levelA.txt -l
#python3 decoder.py -i orig/dataB.dat -o source/levelB.txt -l
#python3 decoder.py -i orig/dataC.dat -o source/levelC.txt -l
#python3 decoder.py -i orig/dataD.dat -o source/levelD.txt -l
#python3 decoder.py -i orig/dataE.dat -o source/levelE.txt -l
#python3 decoder.py -i orig/dataF.dat -o source/levelF.txt -l
#python3 decoder.py -i orig/dataG.dat -o source/levelG.txt -l
#python3 decoder.py -i orig/dataH.dat -o source/levelH.txt -l
#python3 decoder.py -i orig/dataI.dat -o source/levelI.txt -l
#python3 decoder.py -i orig/dataJ.dat -o source/levelJ.txt -l
#python3 decoder.py -i orig/dataK.dat -o source/levelK.txt -l
#python3 decoder.py -i orig/dataL.dat -o source/levelL.txt -l
#python3 decoder.py -i orig/dataM.dat -o source/levelM.txt -l
#python3 decoder.py -i orig/dataN.dat -o source/levelN.txt -l
#python3 decoder.py -i orig/dataO.dat -o source/levelO.txt -l
#python3 decoder.py -i orig/dataP.dat -o source/levelP.txt -l

# Encode sprite data from json text to binary
python3 encoder.py -i source/sprdata.txt -o disk/sprdata
cmp orig/sprdata.dat disk/sprdata || echo sprdata rebuild failed

python3 encoder.py -i source/icodata.txt -o disk/icodata
cmp orig/icodata.dat disk/icodata || echo icodata rebuild failed

python3 encoder.py -i source/levelA.txt -o build/levelA
python3 encoder.py -i source/levelB.txt -o build/levelB
python3 encoder.py -i source/levelC.txt -o build/levelC
python3 encoder.py -i source/levelD.txt -o build/levelD
python3 encoder.py -i source/levelE.txt -o build/levelE
python3 encoder.py -i source/levelF.txt -o build/levelF
python3 encoder.py -i source/levelG.txt -o build/levelG
python3 encoder.py -i source/levelH.txt -o build/levelH
python3 encoder.py -i source/levelI.txt -o build/levelI
python3 encoder.py -i source/levelJ.txt -o build/levelJ
python3 encoder.py -i source/levelK.txt -o build/levelK
python3 encoder.py -i source/levelL.txt -o build/levelL
python3 encoder.py -i source/levelM.txt -o build/levelM
python3 encoder.py -i source/levelN.txt -o build/levelN
python3 encoder.py -i source/levelO.txt -o build/levelO
python3 encoder.py -i source/levelP.txt -o build/levelP

# Data A
python3 dataA.py --acme > source/dataA.asm
acme -o build/dataA --report build/dataA.lst source/dataA.asm
cat build/dataA build/levelA >disk/dataA
cmp orig/dataA.dat disk/dataA || echo dataA.asm rebuild failed

# Data B
python3 dataB.py --acme > source/dataB.asm
acme -o build/dataB --report build/dataB.lst source/dataB.asm
cat build/dataB build/levelB >disk/dataB
cmp orig/dataB.dat disk/dataB || echo dataB.asm rebuild failed

# Data C
python3 dataC.py --acme > source/dataC.asm
acme -o build/dataC --report build/dataC.lst source/dataC.asm
cat build/dataC build/levelC >disk/dataC
cmp orig/dataC.dat disk/dataC || echo dataC.asm rebuild failed

