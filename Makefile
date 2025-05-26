
MSEDIR := mseide-msegui
MSELIBDIR := $(MSEDIR)/lib/common

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
PROJECT := chessboard

ifeq ($(OS),Windows_NT)
TARGET := $(PROJECT).exe
else
TARGET := $(PROJECT)
endif

$(TARGET): $(PROJECT).pas $(SOURCES)
	@$(PC) $(PFLAGS) $<

clean:
	@rm -fv *.bak *.bak? *.log *.o *.ppu

distclean: clean
	@rm -fv *.sta $(PROJECT) $(PROJECT).dbg $(PROJECT).exe
