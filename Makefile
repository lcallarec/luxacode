SHELL := /bin/bash

EXEC=compile

all: $(EXEC)

compile: grab-so
	-valac --pkg libusb-1.0 vala-libluxafor.vapi \
		$$(find src/ -type f -name "*.vala") \
		-X libluxafor.so -X -I. \
		-o luxafor-cli
	-@chmod +x luxafor

grab-so:
	- cd ../vala-libluxafor && make so && cp libluxafor.so libluxafor.h vala-libluxafor.vapi ../luxafor-cli/
