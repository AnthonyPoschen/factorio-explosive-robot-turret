FILENAME := $(shell jq -r '.name +"_"+ .version' ./info.json)
ifeq ($(OS), Windows_NT)
	APPDATA := $(shell /mnt/c/Windows/System32/cmd.exe /C "echo %APPDATA%" | sed -e "s/\\\/\//g" -e "s/^./\L&/" -e "s/://g" -e "s/^/\/mnt\//")
	LOCATION := "$(APPDATA)/Factorio/mods/$(FILENAME)"
else
	LOCATION = ${HOME}/.factorio/mods/$(FILENAME)
endif
.PHONY: build copy

build:
	@rm zanven-drone-turret_* || true
	@rm -r build || true
	@mkdir -p build && rsync -a --exclude=.git/ --exclude=makefile --exclude=build/ --exclude=dev/ --exclude=*.zip . build/
	@cd build && zip -r ../$(FILENAME).zip ./ && cd ../ && rm -rf build

copy:
	rm -rf $(LOCATION) && mkdir -p $(LOCATION) && cp -r ./* $(LOCATION)
#	cp $(FILENAME).zip "$(APPDATA)/Factorio/mods/$(FILENAME).zip"
#	rm -rf $(FILENAME).zip

run: build copy

wsl-setup:
	apt get jq zip make

make_drone-sprite:
	montage ./dev/drone-render/*.png -tile 8x8 -geometry +0+0 -background none ./graphics/drone.png
	magick ./dev/drone-render/0027.png -resize 256x256 ./graphics/drone-icon.png
make_turret-sprite:
	montage ./dev/turret-render/*.png -tile 8x8 -geometry +0+0 -background none ./graphics/turret.png
	magick './dev/turret top.png' -resize 256x256 ./graphics/turret-icon.png
