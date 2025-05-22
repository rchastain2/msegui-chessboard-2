
MSELIBDIR := mseide-msegui/lib/common

ifeq ($(OS),Windows_NT)
OS := windows
else
OS := linux
endif

PC = fpc

PFLAGS := -Mobjfpc -Sh
PFLAGS += -Fu$(MSELIBDIR)/*
PFLAGS += -Fu$(MSELIBDIR)/kernel/$(OS)
PFLAGS += -Fulibrary
PFLAGS += -Fulibrary/chess

SOURCES := $(wildcard *.pas)

ifeq ($(OS),Windows_NT)
TARGET := chessboard.exe
else
TARGET := chessboard
endif

$(TARGET): chessboard.pas $(SOURCES)
	@$(PC) $(PFLAGS) $<

clean:
	@rm -fv *.bak *.bak? *.log *.o *.ppu *.sta

distclean: clean
	@rm -fv chessboard chessboard.dbg chessboard.exe
