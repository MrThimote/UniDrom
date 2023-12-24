
SOURCEDIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))/build
SOURCES   := $(shell find $(SOURCEDIR) -name '*.cpp')

ifeq ($(COMPILER),)
COMPILER := g++
endif

all: clean compile
run: all
	./out

clean:
	mkdir -p build
	-[ -e build/out ] && rm -f build/out
	-[ -e out ] && rm -f out
	-[ -e build/unidrom ] && rm -f build/unidrom

	cp -r unidrom build

compile:
	$(COMPILER) -I./build -o build/out $(SOURCES)
	mv build/out out