CC=clang
PKGS=glfw3 glew
CFLAGS=-Wall -Wextra -pedantic -std=c99 $$(pkg-config --cflags $(PKGS))
LDLIBS=-lm $$(pkg-config --libs $(PKGS))

DEBUG_FLAGS=-Og -ggdb
BUILD_FLAGS=-O3 -s -march=native -mtune=native 

WASM_CFLAGS=-O3 --target=wasm32 -flto -nostdlib -fvisibility=hidden -mbulk-memory -msimd128
WASM_LDFLAGS=--no-entry --strip-debug --lto-O3 --allow-undefined --export-dynamic
WASM_FLAGS=$(WASM_CFLAGS) $(foreach flag,$(WASM_LDFLAGS),-Wl,$(flag))

INPUT_DIR=src
INPUTS=$(wildcard $(INPUT_DIR)/*.c) src/resources.c
ENTRY=main.c
OUTPUT=app

.PHONY: all build debug web clean
all: build web
build: build/$(OUTPUT)
debug: debug/$(OUTPUT)
web: $(OUTPUT).wasm

build/$(OUTPUT): $(ENTRY) $(INPUTS)
	@mkdir -p build
	$(CC) $(CFLAGS) $(BUILD_FLAGS) $(LDLIBS) -o $@ $^

debug/$(OUTPUT): $(ENTRY) $(INPUTS)
	@mkdir -p debug
	$(CC) $(CFLAGS) $(DEBUG_FLAGS) $(LDLIBS) -o $@ $^

$(OUTPUT).wasm: $(INPUTS)
	$(CC) $(WASM_FLAGS) $(CFLAGS) -o $@ $^

src/resources.c: $(wildcard res/**) loader.py
	python loader.py

clean:
	rm -rf build/ debug/ src/resources.c src/resources.h
