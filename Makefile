
PROJECT := soutenance

BUILD_DIR := build
RES := resources
REF := references

MAIN := main

AUXDIR_FLAGS := -auxdir="$(BUILD_DIR)" -emulate-aux-dir
LMK_FLAGS := -lualatex -interaction=batchmode -recorder -quiet
# 	-shell-escape

.PHONY: all clean $(PROJECT)

all: $(PROJECT)

$(PROJECT): $(MAIN).tex
	mkdir -p $(BUILD_DIR)
	latexmk  $(LMK_FLAGS) $(AUXDIR_FLAGS) \
		-jobname="$(PROJECT)" \
		$(MAIN).tex

clean:
	rm -rf $(BUILD_DIR)
	rm -f $(MAIN).fls
