SHELL := /usr/bin/env bash

THIS_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

CC=g++

CFLAGS += -std=gnu++11
CFLAGS += -I./include
CFLAGS += -Wall -Wextra -g -O3 -save-temps

ifdef NOCOLOR
CFLAGS += -fno-color-diagnostics
endif

# Dynamic libraries
LDFLAGS += -lpthread

# Static libraries
LSFLAGS += -L./lib

PROGRAM = VorTx
CPP_FILES := $(wildcard *.cpp)
OBJS := $(patsubst %.cpp, %.o, $(CPP_FILES))

DEBUG = 1

all: $(PROGRAM)

$(PROGRAM): .depend $(OBJS)
	$(CC) $(OBJS) -Wl,-Bstatic $(LSFLAGS) -Wl,-Bdynamic $(LDFLAGS) -o $(PROGRAM)

depend: .depend

.depend: cmd = $(CC) -MM -MF depend $(var); cat depend >> .depend;
.depend:
	@echo "Generating dependencies..."
	@$(foreach var, $(C_FILES), $(cmd))
	@rm -f depend

-include .depend

# These are the pattern matching rules. In addition to the automatic
# variables used here, the variable $* that matches whatever % stands for
# can be useful in special cases.
%.o: %.cpp
	$(CC) $(CFLAGS) -DDEBUG=$(DEBUG) -c $< -o $@

%: %.cpp
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -f $(PROGRAM) .depend *.o *.s *.ii

.PHONY: clean depend
