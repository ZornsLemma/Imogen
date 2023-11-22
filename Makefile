# Makefile for Imogen
#    (Introduction to writing makefiles: https://nullprogram.com/blog/2017/08/20/)

# 'make src' creates the files in the source/ directory from the original binaries
# 'make game' takes the source files and creates binary files from them in the /disk directory. It checks the newly made binaries match the originals. (TODO: create an ssd from the binaries too)
# 'make' or 'make all' does both
#
# 'make clean' removes the results of make, specifically it deletes the source, build, and disk folders
# 'make VERBOSE=1' will show the commands being executed

.POSIX:
.SUFFIXES:

ifndef VERBOSE
.SILENT:
endif

all: src game

src: directories source/g.asm source/auxcode.asm source/imogen.asm source/icodata.txt source/sprdata.txt source/levelA.txt source/levelB.txt source/levelC.txt source/levelD.txt source/levelE.txt source/levelF.txt source/levelG.txt source/levelH.txt source/levelI.txt source/levelJ.txt source/levelK.txt source/levelL.txt source/levelM.txt source/levelN.txt source/levelO.txt source/levelP.txt source/dataA.asm source/dataB.asm source/dataC.asm source/dataD.asm source/dataE.asm source/dataF.asm source/dataG.asm source/dataH.asm source/dataI.asm source/dataJ.asm source/dataK.asm source/dataL.asm source/dataM.asm source/dataN.asm source/dataO.asm source/dataP.asm source/dataQ.asm

game: directories disk/g disk/auxcode disk/icodata disk/sprdata disk/imogen disk/dataA disk/dataB disk/dataC disk/dataD disk/dataE disk/dataF disk/dataG disk/dataH disk/dataI disk/dataJ disk/dataK disk/dataL disk/dataM disk/dataN disk/dataO disk/dataP disk/dataQ check

directories: build source disk

build:
	mkdir -p build

source:
	mkdir -p source

disk:
	mkdir -p disk

source/g.asm: g.py orig/g.dat
	python3 g.py --acme > build/g_temp.asm
	cp build/g_temp.asm source/g.asm
	rm build/g_temp.asm

source/auxcode.asm: auxcode.py orig/auxcode.dat
	python3 auxcode.py --acme > build/auxcode_temp.asm
	cp build/auxcode_temp.asm source/auxcode.asm
	rm build/auxcode_temp.asm

source/imogen.asm: imogen.py orig/imogen-trailing-mc-3900.dat
	python3 imogen.py > source/imogen.asm

source/icodata.txt: decoder.py orig/icodata.dat
	python3 decoder.py -i orig/icodata.dat -o source/icodata.txt -z

source/sprdata.txt: decoder.py orig/sprdata.dat
	python3 decoder.py -i orig/sprdata.dat -o source/sprdata.txt

source/levelA.txt: decoder.py orig/dataA.dat
	python3 decoder.py -i orig/dataA.dat -o source/levelA.txt -l

source/levelB.txt: decoder.py orig/dataB.dat
	python3 decoder.py -i orig/dataB.dat -o source/levelB.txt -l

source/levelC.txt: decoder.py orig/dataC.dat
	python3 decoder.py -i orig/dataC.dat -o source/levelC.txt -l

source/levelD.txt: decoder.py orig/dataD.dat
	python3 decoder.py -i orig/dataD.dat -o source/levelD.txt -l

source/levelE.txt: decoder.py orig/dataE.dat
	python3 decoder.py -i orig/dataE.dat -o source/levelE.txt -l

source/levelF.txt: decoder.py orig/dataF.dat
	python3 decoder.py -i orig/dataF.dat -o source/levelF.txt -l

source/levelG.txt: decoder.py orig/dataG.dat
	python3 decoder.py -i orig/dataG.dat -o source/levelG.txt -l

source/levelH.txt: decoder.py orig/dataH.dat
	python3 decoder.py -i orig/dataH.dat -o source/levelH.txt -l

source/levelI.txt: decoder.py orig/dataI.dat
	python3 decoder.py -i orig/dataI.dat -o source/levelI.txt -l

source/levelJ.txt: decoder.py orig/dataJ.dat
	python3 decoder.py -i orig/dataJ.dat -o source/levelJ.txt -l

source/levelK.txt: decoder.py orig/dataK.dat
	python3 decoder.py -i orig/dataK.dat -o source/levelK.txt -l

source/levelL.txt: decoder.py orig/dataL.dat
	python3 decoder.py -i orig/dataL.dat -o source/levelL.txt -l

source/levelM.txt: decoder.py orig/dataM.dat
	python3 decoder.py -i orig/dataM.dat -o source/levelM.txt -l

source/levelN.txt: decoder.py orig/dataN.dat
	python3 decoder.py -i orig/dataN.dat -o source/levelN.txt -l

source/levelO.txt: decoder.py orig/dataO.dat
	python3 decoder.py -i orig/dataO.dat -o source/levelO.txt -l

source/levelP.txt: decoder.py orig/dataP.dat
	python3 decoder.py -i orig/dataP.dat -o source/levelP.txt -l

source/dataA.asm: dataA.py orig/dataA.dat
	python3 dataA.py --acme > build/dataA_temp.asm
	cp build/dataA_temp.asm source/dataA.asm
	rm build/dataA_temp.asm

source/dataB.asm: dataB.py orig/dataB.dat
	python3 dataB.py --acme > build/dataB_temp.asm
	cp build/dataB_temp.asm source/dataB.asm
	rm build/dataB_temp.asm

source/dataC.asm: dataC.py orig/dataC.dat
	python3 dataC.py --acme > build/dataC_temp.asm
	cp build/dataC_temp.asm source/dataC.asm
	rm build/dataC_temp.asm

source/dataD.asm: dataD.py orig/dataD.dat
	python3 dataD.py --acme > build/dataD_temp.asm
	cp build/dataD_temp.asm source/dataD.asm
	rm build/dataD_temp.asm

source/dataE.asm: dataE.py orig/dataE.dat
	python3 dataE.py --acme > build/dataE_temp.asm
	cp build/dataE_temp.asm source/dataE.asm
	rm build/dataE_temp.asm

source/dataF.asm: dataF.py orig/dataF.dat
	python3 dataF.py --acme > build/dataF_temp.asm
	cp build/dataF_temp.asm source/dataF.asm
	rm build/dataF_temp.asm

source/dataG.asm: dataG.py orig/dataG.dat
	python3 dataG.py --acme > build/dataG_temp.asm
	cp build/dataG_temp.asm source/dataG.asm
	rm build/dataG_temp.asm

source/dataH.asm: dataH.py orig/dataH.dat
	python3 dataH.py --acme > build/dataH_temp.asm
	cp build/dataH_temp.asm source/dataH.asm
	rm build/dataH_temp.asm

source/dataI.asm: dataI.py orig/dataI.dat
	python3 dataI.py --acme > build/dataI_temp.asm
	cp build/dataI_temp.asm source/dataI.asm
	rm build/dataI_temp.asm

source/dataJ.asm: dataJ.py orig/dataJ.dat
	python3 dataJ.py --acme > build/dataJ_temp.asm
	cp build/dataJ_temp.asm source/dataJ.asm
	rm build/dataJ_temp.asm

source/dataK.asm: dataK.py orig/dataK.dat
	python3 dataK.py --acme > build/dataK_temp.asm
	cp build/dataK_temp.asm source/dataK.asm
	rm build/dataK_temp.asm

source/dataL.asm: dataL.py orig/dataL.dat
	python3 dataL.py --acme > build/dataL_temp.asm
	cp build/dataL_temp.asm source/dataL.asm
	rm build/dataL_temp.asm

source/dataM.asm: dataM.py orig/dataM.dat
	python3 dataM.py --acme > build/dataM_temp.asm
	cp build/dataM_temp.asm source/dataM.asm
	rm build/dataM_temp.asm

source/dataN.asm: dataN.py orig/dataN.dat
	python3 dataN.py --acme > build/dataN_temp.asm
	cp build/dataN_temp.asm source/dataN.asm
	rm build/dataN_temp.asm

source/dataO.asm: dataO.py orig/dataO.dat
	python3 dataO.py --acme > build/dataO_temp.asm
	cp build/dataO_temp.asm source/dataO.asm
	rm build/dataO_temp.asm

source/dataP.asm: dataP.py orig/dataP.dat
	python3 dataP.py --acme > build/dataP_temp.asm
	cp build/dataP_temp.asm source/dataP.asm
	rm build/dataP_temp.asm

source/dataQ.asm: dataQ.py orig/dataQ.dat
	python3 dataQ.py --acme > build/dataQ_temp.asm
	cp build/dataQ_temp.asm source/dataQ.asm
	rm build/dataQ_temp.asm


disk/g: source/g.asm
	acme -o disk/g --report build/g.lst source/g.asm
	cmp orig/g.dat disk/g || echo g.asm rebuild failed

disk/auxcode: source/auxcode.asm
	acme -o disk/auxcode --report build/auxcode.lst source/auxcode.asm
	cmp orig/auxcode.dat disk/auxcode || echo auxcode.asm rebuild failed

disk/icodata: source/icodata.txt
	python3 encoder.py -i source/icodata.txt -o disk/icodata
	cmp orig/icodata.dat disk/icodata || echo icodata rebuild failed

disk/sprdata: source/sprdata.txt
	python3 encoder.py -i source/sprdata.txt -o disk/sprdata
	cmp orig/sprdata.dat disk/sprdata || echo sprdata rebuild failed

# TODO: Make this match the original file, including the BASIC
disk/imogen: source/imogen.asm
	beebasm -o disk/imogen -i source/imogen.asm -v > build/imogen.lst
	cmp orig/imogen-trailing-mc-3900.dat disk/imogen || echo imogen.asm rebuild failed

disk/dataA: source/dataA.asm source/levelA.txt
	python3 encoder.py -i source/levelA.txt -o build/levelA				# make binary sprite data
	acme -o build/dataA --report build/dataA.lst source/dataA.asm		# assemble code
	cat build/dataA build/levelA >disk/dataA							# combine code and data

disk/dataB: source/dataB.asm source/levelB.txt
	python3 encoder.py -i source/levelB.txt -o build/levelB				# make binary sprite data
	acme -o build/dataB --report build/dataB.lst source/dataB.asm		# assemble code
	cat build/dataB build/levelB >disk/dataB							# combine code and data

disk/dataC: source/dataC.asm source/levelC.txt
	python3 encoder.py -i source/levelC.txt -o build/levelC				# make binary sprite data
	acme -o build/dataC --report build/dataC.lst source/dataC.asm		# assemble code
	cat build/dataC build/levelC >disk/dataC							# combine code and data

disk/dataD: source/dataD.asm source/levelD.txt
	python3 encoder.py -i source/levelD.txt -o build/levelD				# make binary sprite data
	acme -o build/dataD --report build/dataD.lst source/dataD.asm		# assemble code
	cat build/dataD build/levelD >disk/dataD							# combine code and data

disk/dataE: source/dataE.asm source/levelE.txt
	python3 encoder.py -i source/levelE.txt -o build/levelE				# make binary sprite data
	acme -o build/dataE --report build/dataE.lst source/dataE.asm		# assemble code
	cat build/dataE build/levelE >disk/dataE							# combine code and data

disk/dataF: source/dataF.asm source/levelF.txt
	python3 encoder.py -i source/levelF.txt -o build/levelF				# make binary sprite data
	acme -o build/dataF --report build/dataF.lst source/dataF.asm		# assemble code
	cat build/dataF build/levelF >disk/dataF							# combine code and data

disk/dataG: source/dataG.asm source/levelG.txt
	python3 encoder.py -i source/levelG.txt -o build/levelG				# make binary sprite data
	acme -o build/dataG --report build/dataG.lst source/dataG.asm		# assemble code
	cat build/dataG build/levelG >disk/dataG							# combine code and data

disk/dataH: source/dataH.asm source/levelH.txt
	python3 encoder.py -i source/levelH.txt -o build/levelH				# make binary sprite data
	acme -o build/dataH --report build/dataH.lst source/dataH.asm		# assemble code
	cat build/dataH build/levelH >disk/dataH							# combine code and data

disk/dataI: source/dataI.asm source/levelI.txt
	python3 encoder.py -i source/levelI.txt -o build/levelI				# make binary sprite data
	acme -o build/dataI --report build/dataI.lst source/dataI.asm		# assemble code
	cat build/dataI build/levelI >disk/dataI							# combine code and data

disk/dataJ: source/dataJ.asm source/levelJ.txt
	python3 encoder.py -i source/levelJ.txt -o build/levelJ				# make binary sprite data
	acme -o build/dataJ --report build/dataJ.lst source/dataJ.asm		# assemble code
	cat build/dataJ build/levelJ >disk/dataJ							# combine code and data

disk/dataK: source/dataK.asm source/levelK.txt
	python3 encoder.py -i source/levelK.txt -o build/levelK				# make binary sprite data
	acme -o build/dataK --report build/dataK.lst source/dataK.asm		# assemble code
	cat build/dataK build/levelK >disk/dataK							# combine code and data

disk/dataL: source/dataL.asm source/levelL.txt
	python3 encoder.py -i source/levelL.txt -o build/levelL				# make binary sprite data
	acme -o build/dataL --report build/dataL.lst source/dataL.asm		# assemble code
	cat build/dataL build/levelL >disk/dataL							# combine code and data

disk/dataM: source/dataM.asm source/levelM.txt
	python3 encoder.py -i source/levelM.txt -o build/levelM				# make binary sprite data
	acme -o build/dataM --report build/dataM.lst source/dataM.asm		# assemble code
	cat build/dataM build/levelM >disk/dataM							# combine code and data

disk/dataN: source/dataN.asm source/levelN.txt
	python3 encoder.py -i source/levelN.txt -o build/levelN				# make binary sprite data
	acme -o build/dataN --report build/dataN.lst source/dataN.asm		# assemble code
	cat build/dataN build/levelN >disk/dataN							# combine code and data

disk/dataO: source/dataO.asm source/levelO.txt
	python3 encoder.py -i source/levelO.txt -o build/levelO				# make binary sprite data
	acme -o build/dataO --report build/dataO.lst source/dataO.asm		# assemble code
	cat build/dataO build/levelO >disk/dataO							# combine code and data

disk/dataP: source/dataP.asm source/levelP.txt
	python3 encoder.py -i source/levelP.txt -o build/levelP				# make binary sprite data
	acme -o build/dataP --report build/dataP.lst source/dataP.asm		# assemble code
	cat build/dataP build/levelP >disk/dataP							# combine code and data

disk/dataQ: source/dataQ.asm
	python3 dataQ.py --acme > source/dataQ.asm
	acme -o disk/dataQ --report build/dataQ.lst source/dataQ.asm

check:
	cmp orig/g.dat disk/g || echo g.asm rebuild failed
	cmp orig/auxcode.dat disk/auxcode || echo auxcode.asm rebuild failed
	cmp orig/icodata.dat disk/icodata || echo icodata rebuild failed
	cmp orig/sprdata.dat disk/sprdata || echo sprdata rebuild failed
	cmp orig/imogen-trailing-mc-3900.dat disk/imogen || echo imogen.asm rebuild failed
	cmp orig/dataA.dat disk/dataA || echo dataA.asm rebuild failed
	cmp orig/dataB.dat disk/dataB || echo dataB.asm rebuild failed
	cmp orig/dataC.dat disk/dataC || echo dataC.asm rebuild failed
	cmp orig/dataD.dat disk/dataD || echo dataD.asm rebuild failed
	cmp orig/dataE.dat disk/dataE || echo dataE.asm rebuild failed
	cmp orig/dataF.dat disk/dataF || echo dataF.asm rebuild failed
	cmp orig/dataG.dat disk/dataG || echo dataG.asm rebuild failed
	cmp orig/dataH.dat disk/dataH || echo dataH.asm rebuild failed
	cmp orig/dataI.dat disk/dataI || echo dataI.asm rebuild failed
	cmp orig/dataJ.dat disk/dataJ || echo dataJ.asm rebuild failed
	cmp orig/dataK.dat disk/dataK || echo dataK.asm rebuild failed
	cmp orig/dataL.dat disk/dataL || echo dataL.asm rebuild failed
	cmp orig/dataM.dat disk/dataM || echo dataM.asm rebuild failed
	cmp orig/dataN.dat disk/dataN || echo dataN.asm rebuild failed
	cmp orig/dataO.dat disk/dataO || echo dataO.asm rebuild failed
	cmp orig/dataP.dat disk/dataP || echo dataP.asm rebuild failed
	cmp orig/dataQ.dat disk/dataQ || echo dataQ.asm rebuild failed

clean:
	rm -rf disk
	rm -rf build
	rm -rf source
