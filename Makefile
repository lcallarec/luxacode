SHELL := /bin/bash

EXEC=so

all: $(EXEC)

so:
	-rm -rf vala-libluxafor.vapi 
	-valac --pkg libusb-1.0 --library=vala-libluxafor -H libluxafor.h \
		src/error.vala src/luxafor.vala src/device/usb_device_finder.vala src/device/luxafor_finder.vala src/device/error.vala \
		src/effect/effect.vala src/effect/color.vala src/effect/shutdown.vala src/effect/error.vala \
		-X -fPIC -X -shared \
		-o libluxafor.so

cli : so
	-valac --pkg libusb-1.0 vala-libluxafor.vapi cli.vala -X libluxafor.so -X -I. -o luxafor-cli
