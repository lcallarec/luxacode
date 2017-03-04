SHELL := /bin/bash

EXEC=compile

all: $(EXEC)

compile:
	-valac --pkg libusb-1.0 lib/vala-libluxafor.vapi \
		src/luxafor.vala src/option/register_stack.vala \
		src/option/color.vala src/option/option.vala \
		-X lib/libluxafor.so -X -I. \
		-o luxafor-cli

