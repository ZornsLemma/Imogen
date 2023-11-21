# TODO: Highly WIP, I vaguely hoped this might speed up "builds", although I suspect it's not a huge win.

# https://nullprogram.com/blog/2017/08/20/

.POSIX:
.SUFFIXES: 

all: g.out

g.out: g.py common.py

.SUFFIXES: .py .out
.py.out:
	# TODO: temp.asm is not parallelisable
	python3 $< --acme > temp.asm
	cp temp.asm $(@:.out=.asm)
	rm temp.asm
	acme -o $@ --report $(@:.out=.lst) $(@:.out=.asm)
	cmp orig/$(@:.out=.dat) $@ || echo $< rebuild failed

