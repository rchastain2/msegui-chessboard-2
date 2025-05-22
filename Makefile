
SOURCES := $(wildcard *.pas)

MSELIBDIR := /home/roland/Applications/mseide-maint-2505080610/lib/common

OPT := -Mobjfpc -Sh
OPT += -Fu$(MSELIBDIR)/*
OPT += -Fu$(MSELIBDIR)/kernel/linux
OPT += -Fulibrary
OPT += -Fulibrary/chess

chessboard: chessboard.pas $(SOURCES)
	@fpc $(OPT) $<
