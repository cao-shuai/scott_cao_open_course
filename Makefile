#
# open course makefile
#
DEBUGMAKEFILE="TRUE"
ifdef DEBUGMAKEFILE
hide ?=@	
endif

ROOT_DIR=$(shell pwd)

##########################################################config gcc##########################################
ifdef DEBUGMAKEFILE
$(warning "build config gcc")
endif
MAKE=make
CC=gcc
DEBUG = -g -O0
AR = ar
INCLUDE = -I
DEFS = -D_GNU_SOURCE
CFLAGS = $(DEBUG) $(DEFS) -Wformat=2 -Wall -Wextra -Winline $(INCLUDE) $(ROOT_DIR)/include  -pipe -fPIC


##########################################################config output dir####################################
ifdef DEBUGMAKEFILE
$(warning "build output dir")
endif
OUT=$(ROOT_DIR)/out
OUT_SYMBOLES=$(OUT)/symbols
OUT_SYMBOLES_OBJ=$(OUT_SYMBOLES)/obj
OUT_SYMBOLES_LIBS=$(OUT_SYMBOLES)/lib
OUT_OBJ=$(OUT)/obj
OUT_LIB=$(OUT)/lib

$(shell test -d $(OUT) || mkdir -p $(OUT))
$(shell test -d $(OUT_SYMBOLES) || mkdir -p $(OUT_SYMBOLES))
$(shell test -d $(OUT_SYMBOLES_OBJ) || mkdir -p $(OUT_SYMBOLES_OBJ))
$(shell test -d $(OUT_SYMBOLES_LIBS) || mkdir -p $(OUT_SYMBOLES_LIBS))
$(shell test -d $(OUT_OBJ) || mkdir -p $(OUT_OBJ))
$(shell test -d $(OUT_LIB) || mkdir -p $(OUT_LIB))


#########################################################export para ###########################################

.PHONY: all clean
SUBDIR:=$(ROOT_DIR)/build_linkers_and_loaders

all: 
	$(hide) echo "[build all]"
	$(hide) $(MAKE) -C build_linkers_and_loaders all


clean:
	$(hide) echo "[clean]"
	$(hide) rm -rf $(OUT)
	$(hide) $(MAKE) -C build_linkers_and_loaders clean