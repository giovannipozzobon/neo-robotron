# ***************************************************************************************
# ***************************************************************************************
#
#		Name : 		Makefile
#		Author :	Paul Robson (paul@robsons.org.uk)
#		Date : 		13th April 2024
#		Reviewed :	No
#		Purpose :	Build Graphics
#
# ***************************************************************************************
# ***************************************************************************************

include ../common.make

all:
	echo $(ROOTDIR)
	$(PYTHON) $(BINDIR)makeimg.zip
	cp graphics.gfx ../source/storage/robotron.gfx
	
run:	
	cp graphics.gfx storage
	$(PYTHON) $(BINDIR)makebasic.zip show.bsc -oshow.bas
	$(BINDIR)neo show.bas@page exec