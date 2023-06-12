
PROJECT := soutenance

BUILD_DIR := build
RES := resources
REF := references

MAIN := main
PRESENT_TEX := .main_presentation
HANDOUT_TEX := .main_handout

AUXDIR_FLAGS := -auxdir="$(BUILD_DIR)" -emulate-aux-dir
LMK_FLAGS := -lualatex -interaction=batchmode -recorder -quiet
# 	-shell-escape

.PHONY: all clean presentation handout

all: handout presentation

handout: $(MAIN).tex $(HANDOUT_TEX).tex
	mkdir -p $(BUILD_DIR)
	latexmk  $(LMK_FLAGS) $(AUXDIR_FLAGS) \
		-jobname="handout" $(HANDOUT_TEX).tex

presentation: $(MAIN).tex $(PRESENT_TEX).tex
	mkdir -p $(BUILD_DIR)
	latexmk  $(LMK_FLAGS) $(AUXDIR_FLAGS) \
		-jobname="presentation" $(PRESENT_TEX).tex

clean:
	rm -rf $(BUILD_DIR)
	rm -f $(MAIN).fls $(PRESENT_TEX).fls $(HANDOUT_TEX).fls
