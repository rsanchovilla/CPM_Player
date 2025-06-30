# makefile for cpmtris

all: cpmtris.com

SRC=cpmtris.z rand.z conio.z

cpmtris.com: $(SRC)
	cat $(SRC) >out.z
	zmac/zmac out.z
	mv out.bin cpmtris.com

clean:
	$(RM) *~ *.lst *.bin out.z

