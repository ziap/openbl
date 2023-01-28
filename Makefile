CC=clang
CFLAGS=-Wall -Wextra -pedantic -std=c99 -march=native -mtune=native
LDLIBS=-lm -lglfw -lGL -lGLEW

DEBUG_FLAGS=-Og -ggdb
BUILD_FLAGS=-O3 -s

WASM_CFLAGS=-O3 --target=wasm32 -flto -nostdlib -fvisibility=hidden -mbulk-memory -msimd128
WASM_LDFLAGS=--no-entry --strip-debug --lto-O3 --allow-undefined --export-dynamic
WASM_FLAGS=$(WASM_CFLAGS) $(foreach flag,$(WASM_LDFLAGS),-Wl,$(flag))

INPUT_DIR=src
INPUTS=$(wildcard $(INPUT_DIR)/*.c)
ENTRY=main.c
OUTPUT=app

SHADER_DIR=shaders
FRAGMENT_SHADERS=$(wildcard $(SHADER_DIR)/*.frag)
SHADER_OUTPUTS=$(patsubst %.frag, $(SHADER_DIR)/%.h, $(notdir $(FRAGMENT_SHADERS)))

.PHONY: all build debug web clean
all: build web
build: build/$(OUTPUT)
debug: debug/$(OUTPUT)
web: $(OUTPUT).wasm

build/$(OUTPUT): $(ENTRY) $(INPUTS) $(SHADER_OUTPUTS)
	@mkdir -p build
	$(CC) -o $@ $(ENTRY) $(INPUTS) $(CFLAGS) $(BUILD_FLAGS) $(LDLIBS)

debug/$(OUTPUT): $(ENTRY) $(INPUTS) $(SHADER_OUTPUTS)
	@mkdir -p debug
	$(CC) -o $@ $(ENTRY) $(INPUTS) $(CFLAGS) $(DEBUG_FLAGS) $(LDLIBS)

$(OUTPUT).wasm: $(SHADER_OUTPUTS) $(INPUTS)
	$(CC) $(WASM_FLAGS) $(CFLAGS) -o $@ $(INPUTS)

# TODO: Make a shader loader that checks for compilation error at build-time
$(SHADER_OUTPUTS): $(SHADER_DIR)/%.h: $(SHADER_DIR)/%.frag $(SHADER_DIR)/%.vert
	@echo Generating $@
	@echo "static const char* $(basename $(notdir $@))_frag = " > $@
	@sed 's/^/\"/g' $(word 1,$^) | sed 's/$$/\\n\"/g' >> $@
	@echo ";" >> $@
	@echo "static const char* $(basename $(notdir $@))_vert = " >> $@
	@sed 's/^/\"/g' $(word 2,$^) | sed 's/$$/\\n\"/g' >> $@
	@echo ";" >> $@

clean:
	rm -rf build/ debug/
