MOD_NAME := $(shell jq -r '.name' ./info.json)
VERSION := $(shell jq -r '.version' ./info.json)
FILENAME := $(MOD_NAME)_$(VERSION)
UNAME_S := $(shell uname -s 2>/dev/null || echo Unknown)

ifeq ($(OS), Windows_NT)
	FACTORIO_MODS_DIR ?= $(shell cygpath -u "$$APPDATA" 2>/dev/null || printf '%s\n' "$$APPDATA")/Factorio/mods
else ifeq ($(UNAME_S), Darwin)
	FACTORIO_MODS_DIR ?= $(HOME)/Library/Application Support/factorio/mods
else
	FACTORIO_MODS_DIR ?= $(HOME)/.factorio/mods
endif

LOCATION := $(FACTORIO_MODS_DIR)/$(FILENAME)

.PHONY: build copy print-location run

build:
	@rm -f -- "$(MOD_NAME)"_*.zip
	@rm -r build || true
	@mkdir -p build/$(FILENAME) && rsync -a --exclude=.git/ --exclude=makefile --exclude=build/ --exclude=dev/ --exclude=*.zip . build/$(FILENAME)
	@cd build && zip -r ../$(FILENAME).zip ./ && cd ../ && rm -rf build

copy:
	rm -rf "$(LOCATION)" && mkdir -p "$(LOCATION)" && cp -r ./* "$(LOCATION)"
#	cp $(FILENAME).zip "$(APPDATA)/Factorio/mods/$(FILENAME).zip"
#	rm -rf $(FILENAME).zip

print-location:
	@echo "$(LOCATION)"

run: build copy

wsl-setup:
	apt get jq zip make

make_drone-sprite:
	montage ./dev/drone-render/*.png -tile 8x8 -geometry +0+0 -background none ./graphics/drone.png
	magick ./dev/drone-render/0027.png -resize 256x256 ./graphics/drone-icon.png
make_turret-sprite:
	montage ./dev/turret-render/*.png -tile 8x8 -geometry +0+0 -background none ./graphics/turret.png
	montage ./dev/turret-render-mask/*.png -tile 8x8 -geometry +0+0 -background none ./graphics/turret-mask.png
	magick ./dev/turret-top.png -resize 256x256 ./graphics/turret-icon.png
