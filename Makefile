SHELL := /bin/bash

EXEC=compile

all: $(EXEC)

compile:
	-valac --pkg libusb-1.0 vala-libluxafor.vapi \
		src/luxafor.vala src/option/register_stack.vala \
		src/option/color.vala src/option/option.vala src/option/shutdown.vala src/option/random_color.vala src/option/raw.vala \
		-X libluxafor.so -X -I. \
		-o luxafor-cli
	-@chmod +x luxafor

grab-so:
	- cd ../vala-libluxafor && make so && cp libluxafor.so libluxafor.h vala-libluxafor.vapi ../luxafor-cli/
